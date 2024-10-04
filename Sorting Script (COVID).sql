-- Here is a sample SQL script that includes displaying and sorting data from https://ourworldindata.org/covid-deaths.


-- Selects everything from the CovidDeaths2024 Excel file imported to PortfolioProject 2 and orders them by Location and Date columns.

SELECT * 
FROM PortfolioProject2..CovidDeaths2024
WHERE Continent IS NOT NULL
ORDER BY 3, 4



-- Selects everything from the CovidVaccinations2024 Excel file imported to PortfolioProject 2 and orders them by Location and Date columns.

SELECT * 
FROM PortfolioProject2..CovidVaccinations2024
ORDER BY 3, 4



-- Selects specific fields from the CovidDeaths2024 Excel file and arranged alphabetically through Location and chronologically with Date columns.

SELECT Location, Date, Total_Cases, New_Cases, Total_Deaths, Population
FROM PortfolioProject2..CovidDeaths2024
WHERE Continent IS NOT NULL
ORDER BY 1, 2



-- Displays the death rate per country's Covid cases. In this case, returns value equivalent to "Philippines."

SELECT Location, Date, Total_Cases, Total_Deaths, (Total_Cases/Total_Deaths)*100 AS Mortality_Rate
FROM PortfolioProject2..CovidDeaths2024
WHERE Location LIKE '%Philippines%' AND Continent IS NOT NULL
ORDER BY 1, 2



-- Displays the population percentage affected by Covid.

SELECT Location, Date, Population, Total_Cases, (Total_Cases/Population)*100 AS Population_Percentage_Affected
FROM PortfolioProject2..CovidDeaths2024
ORDER BY 1, 2



-- (3) Displays countries with high infection rates along with the population.

SELECT Location, Population, MAX(Total_Cases) AS Highest_Infection_Counts, MAX((Total_Cases/Population))*100 AS Population_Percentage_Affected
FROM PortfolioProject2..CovidDeaths2024
GROUP BY Location, Population
ORDER BY Population_Percentage_Affected DESC



-- (4) 

SELECT Location, Population, Date, MAX(Total_Cases) AS Highest_Infection_Counts, MAX((Total_Cases/Population))*100 AS Population_Percentage_Affected
FROM PortfolioProject2..CovidDeaths2024
GROUP BY Location, Population, Date
ORDER BY Population_Percentage_Affected DESC



-- (2) Displays countries with high death rates per population.

SELECT Location, MAX(CAST(Total_Deaths AS FLOAT)) AS Population_Death_Rate
FROM PortfolioProject2..CovidDeaths2024
WHERE Continent IS NULL
AND Location NOT IN ('World', 'European Union', 'International', 'High Income', 'Upper Middle Income', 'Lower Middle Income', 'Low Income')
GROUP BY Location
ORDER BY Population_Death_Rate DESC



-- Displays continents with the high death counts per population.

SELECT Continent, MAX(CAST(Total_Deaths AS FLOAT)) AS Population_Death_Count
FROM PortfolioProject2..CovidDeaths2024
WHERE Continent IS NOT NULL
GROUP BY Continent
ORDER BY Population_Death_Count DESC



-- (1) Displays the total death rate for Covid worldwide.

SELECT SUM(New_Cases) AS Total_Cases, SUM(CAST(New_Deaths AS FLOAT)) AS Total_Deaths, SUM(CAST(New_Deaths AS FLOAT))/SUM(New_Cases)*100 AS Mortality_Rate
FROM PortfolioProject2..CovidDeaths2024
WHERE Continent IS NOT NULL
ORDER BY 1, 2



-- Displays total vaccinations per population.

SELECT death.Continent, death.Location, death.Date, death.Population, vaccine.New_Vaccinations, SUM(CONVERT(FLOAT, vaccine.New_Vaccinations)) OVER (PARTITION BY death.Location ORDER BY death.Location, death.Date) AS Vaccinated_Partition
FROM PortfolioProject2..CovidDeaths2024 death
JOIN PortfolioProject2..CovidVaccinations2024 vaccine
	ON death.location = vaccine.location
	AND death.date = vaccine.date
WHERE death.continent IS NOT NULL
ORDER BY 2, 3



-- We will use Common Table Expressions (CTE) to 

WITH PopulationVaccine (Continent, Location, Date, Population, New_Vaccinations, Vaccinated_Partition)
AS (SELECT death.Continent, death.Location, death.Date, death.Population, vaccine.New_Vaccinations, SUM(CONVERT(FLOAT, vaccine.New_Vaccinations)) OVER (PARTITION BY death.Location ORDER BY death.Location, death.Date) AS Vaccinated_Partition
FROM PortfolioProject2..CovidDeaths2024 death
JOIN PortfolioProject2..CovidVaccinations2024 vaccine
	ON death.location = vaccine.location
	AND death.date = vaccine.date
WHERE death.continent IS NOT NULL)

SELECT *, (Vaccinated_Partition/Population)*100 AS Population_Vaccination_Rate
FROM PopulationVaccine



-- Creates a table named #PopulationVaccinationPercentage

CREATE TABLE #PopulationVaccinationPercentage (
Continent NVARCHAR(255), 
Location NVARCHAR(255), 
Date DATETIME, 
Population NUMERIC,
New_Vaccinations NUMERIC,
Vaccinated_Partition NUMERIC
)

INSERT INTO #PopulationVaccinationPercentage
SELECT death.Continent, death.Location, death.Date, death.Population, vaccine.New_Vaccinations, SUM(CONVERT(FLOAT, vaccine.New_Vaccinations)) OVER (PARTITION BY death.Location ORDER BY death.Location, death.Date) AS Vaccinated_Partition
FROM PortfolioProject2..CovidDeaths2024 death
JOIN PortfolioProject2..CovidVaccinations2024 vaccine
	ON death.location = vaccine.location
	AND death.date = vaccine.date

SELECT *, (Vaccinated_Partition/Population)*100
FROM #PopulationVaccinationPercentage



-- Drops table to re-create it.

DROP TABLE IF EXISTS #PopulationVaccinationPercentage



-- Create a View function for data storage.

CREATE VIEW PopulationVaccinationPercentage AS 
SELECT death.Continent, death.Location, death.Date, death.Population, vaccine.New_Vaccinations, SUM(CONVERT(FLOAT, vaccine.New_Vaccinations)) OVER (PARTITION BY death.Location ORDER BY death.Location, death.Date) AS Vaccinated_Partition
FROM PortfolioProject2..CovidDeaths2024 death
JOIN PortfolioProject2..CovidVaccinations2024 vaccine
	ON death.location = vaccine.location
	AND death.date = vaccine.date
WHERE death.continent IS NOT NULL



-- Outputs the View that we created earlier.

SELECT *
FROM PopulationVaccinationPercentage