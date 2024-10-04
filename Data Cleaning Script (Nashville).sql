-- Here is another script which is used for cleaning data.

--- DISPLAYS DATA FROM THE DATABASE FOLDER. ---

SELECT *
FROM PortfolioProject2..NashvilleHousing


--- ARRANGES DATE FORMAT. ---

SELECT SalesDateConverted, CONVERT(Date, SaleDate)
FROM PortfolioProject2..NashvilleHousing

UPDATE NashvilleHousing
SET SaleDate = CONVERT(Date, SaleDate)

ALTER TABLE NashvilleHousing
ADD SalesDateConverted DATE;

UPDATE NashvilleHousing
SET SalesDateConverted = CONVERT(Date, SaleDate)



--- FILLS PROPERTYADDRESS FIELD. ---

SELECT *
FROM PortfolioProject2..NashvilleHousing
ORDER BY ParcelID

SELECT A.ParcelID, A.PropertyAddress, B.ParcelID, B.PropertyAddress, ISNULL(A.PropertyAddress, B.PropertyAddress)
FROM PortfolioProject2..NashvilleHousing A
JOIN PortfolioProject2..NashvilleHousing B
ON A.ParcelID = B.ParcelID
AND A.[UniqueID ] <> B.[UniqueID ]
WHERE A.PropertyAddress IS NULL

UPDATE A
SET PropertyAddress = ISNULL(A.PropertyAddress, B.PropertyAddress)
FROM PortfolioProject2..NashvilleHousing A
JOIN PortfolioProject2..NashvilleHousing B
ON A.ParcelID = B.ParcelID
AND A.[UniqueID ] <> B.[UniqueID ]
WHERE A.PropertyAddress IS NULL



--- SEPARATES PROPERTYADDRESS INTO DIFFERENT COLUMNS. ---

SELECT PropertyAddress
FROM PortfolioProject2..NashvilleHousing

SELECT 
SUBSTRING(PropertyAddress, 1, CHARINDEX(',', PropertyAddress) -1) AS Address, 
SUBSTRING(PropertyAddress, CHARINDEX(',', PropertyAddress) +1, LEN(PropertyAddress)) AS Address
FROM PortfolioProject2..NashvilleHousing

ALTER TABLE NashvilleHousing
ADD PropertyAddressSplit NVARCHAR(255);

UPDATE NashvilleHousing
SET PropertyAddressSplit = SUBSTRING(PropertyAddress, 1, CHARINDEX(',', PropertyAddress) -1)

ALTER TABLE NashvilleHousing
ADD PropertyCitySplit NVARCHAR(255);

UPDATE NashvilleHousing
SET PropertyCitySplit = SUBSTRING(PropertyAddress, CHARINDEX(',', PropertyAddress) +1, LEN(PropertyAddress))





SELECT OwnerAddress
FROM PortfolioProject2..NashvilleHousing

SELECT
PARSENAME(REPLACE(OwnerAddress, ',' , '.'), 3),
PARSENAME(REPLACE(OwnerAddress, ',' , '.'), 2),
PARSENAME(REPLACE(OwnerAddress, ',' , '.'), 1)
FROM PortfolioProject2..NashvilleHousing


ALTER TABLE NashvilleHousing
ADD OwnerAddressSplit NVARCHAR(255);

UPDATE NashvilleHousing
SET OwnerAddressSplit = PARSENAME(REPLACE(OwnerAddress, ',' , '.'), 3)


ALTER TABLE NashvilleHousing
ADD OwnerCitySplit NVARCHAR(255);

UPDATE NashvilleHousing
SET OwnerCitySplit = PARSENAME(REPLACE(OwnerAddress, ',' , '.'), 2)


ALTER TABLE NashvilleHousing
ADD OwnerStateSplit NVARCHAR(255);

UPDATE NashvilleHousing
SET OwnerStateSplit = PARSENAME(REPLACE(OwnerAddress, ',' , '.'), 1)



--- CHANGES Y TO YES AND N TO NO. ---

SELECT DISTINCT(SoldAsVacant), COUNT(SoldAsVacant)
FROM PortfolioProject2..NashvilleHousing
GROUP BY SoldAsVacant
ORDER BY 2

SELECT SoldAsVacant,
CASE
	WHEN SoldAsVacant = 'Y' THEN 'Yes'
	WHEN SoldAsVacant = 'N' THEN 'No'
	ELSE SoldAsVacant
	END
FROM PortfolioProject2..NashvilleHousing

UPDATE NashvilleHousing
SET SoldAsVacant =
CASE
	WHEN SoldAsVacant = 'Y' THEN 'Yes'
	WHEN SoldAsVacant = 'N' THEN 'No'
	ELSE SoldAsVacant
	END



--- REMOVES TABLE DUPLICATES. ---

WITH RowNumCTE AS (

SELECT *,
	ROW_NUMBER() OVER (
	PARTITION BY 
		ParcelID,
		PropertyAddress,
		SalePrice,
		SaleDate,
		LegalReference
		ORDER BY UniqueID) Row_Num 
FROM PortfolioProject2..NashvilleHousing
)

DELETE
FROM RowNumCTE
WHERE Row_Num > 1



--- REMOVES UNUSED COLUMNS. ---

SELECT *
FROM PortfolioProject2..NashvilleHousing

ALTER TABLE PortfolioProject2..NashvilleHousing
DROP COLUMN PropertyAddress, OwnerAddress, TaxDistrict, SaleDate