/* We create a Database named LexLeagueofLegends, where we'll add details about my champion pool. */
CREATE DATABASE LexLeagueofLegends;

/* Next, we add a column of specific typings of Support heroes that I use. */
CREATE TABLE Supports (
	MasteryID INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    ChampName VARCHAR(50) NOT NULL,
    ChampCateg VARCHAR(50) NOT NULL,
    ChampTitle VARCHAR(100) NOT NULL,
    ChampPlace VARCHAR(50) NOT NULL,
    ChampRelYear DATE
);

/* Now, we display the Database named Supports, containing information of my Support heroes. */
SELECT MasteryID AS Mastery_Ranking, ChampName AS Name, ChampCateg AS Category, ChampTitle AS Title, ChampPlace AS Location, ChampRelYear AS Date_Released
FROM Supports;

/* Here is a drop table command for rolling back committed changes, for ease. */
DROP TABLE Supports;

/* Here, we insert the information about the Support heroes I play, starting from my mostly used or highest mastery ranking, to the lowest. */
INSERT INTO Supports (ChampName, ChampCateg, ChampTitle, ChampPlace, ChampRelYear)
VALUES ('Pyke', 'Assassin', 'The Bloodharbor Ripper', 'Bilgewater', '2018-05-31');
INSERT INTO Supports (ChampName, ChampCateg, ChampTitle, ChampPlace, ChampRelYear)
VALUES ('Brand', 'Mage', 'The Burning Vengeance', 'Frejlord', '2011-04-12');
INSERT INTO Supports (ChampName, ChampCateg, ChampTitle, ChampPlace, ChampRelYear)
VALUES ('Lux', 'Mage', 'The Lady of Luminosity', 'Demacia', '2010-10-19');
INSERT INTO Supports (ChampName, ChampCateg, ChampTitle, ChampPlace, ChampRelYear)
VALUES ('Blitzcrank', 'Tank', 'The Great Steam Golem', 'Zaun', '2009-09-02');
INSERT INTO Supports (ChampName, ChampCateg, ChampTitle, ChampPlace, ChampRelYear)
VALUES ('Janna', 'Enchanter', 'The Storm\'s Fury', 'Zaun', '2009-09-02');
INSERT INTO Supports (ChampName, ChampCateg, ChampTitle, ChampPlace, ChampRelYear)
VALUES ('Leona', 'Tank', 'The Radiant Dawn', 'Targon', '2011-07-13');
INSERT INTO Supports (ChampName, ChampCateg, ChampTitle, ChampPlace, ChampRelYear)
VALUES ('Zyra', 'Mage', 'Rise of the Thorns', 'Shurima', '2012-07-24');
INSERT INTO Supports (ChampName, ChampCateg, ChampTitle, ChampPlace, ChampRelYear)
VALUES ('Sona', 'Enchanter', 'Maven of the Strings', 'Demacia', '2010-09-21');
INSERT INTO Supports (ChampName, ChampCateg, ChampTitle, ChampPlace, ChampRelYear)
VALUES ('Alistar', 'Tank', 'The Minotaur', 'Noxus', '2009-09-02');
INSERT INTO Supports (ChampName, ChampCateg, ChampTitle, ChampPlace, ChampRelYear)
VALUES ('Maokai', 'Tank', 'The Twisted Treant', 'Shadow Isles', '2011-02-16');
INSERT INTO Supports (ChampName, ChampCateg, ChampTitle, ChampPlace, ChampRelYear)
VALUES ('Nautilus', 'Tank', 'The Titan of the Depths', 'Bilgewater', '2012-02-14');
INSERT INTO Supports (ChampName, ChampCateg, ChampTitle, ChampPlace, ChampRelYear)
VALUES ('Morgana', 'Mage', 'The Fallen', 'Targon', '2009-02-21');
INSERT INTO Supports (ChampName, ChampCateg, ChampTitle, ChampPlace, ChampRelYear)
VALUES ('Soraka', 'Enchanter', 'The Starchild', 'Targon', '2009-02-21');
INSERT INTO Supports (ChampName, ChampCateg, ChampTitle, ChampPlace, ChampRelYear)
VALUES ('Braum', 'Tank', 'The Heart of the Freljord', 'Freljord', '2014-05-12');
INSERT INTO Supports (ChampName, ChampCateg, ChampTitle, ChampPlace, ChampRelYear)
VALUES ('Seraphine', 'Enchanter', 'The Starry-Eyed Songstress', 'Piltover', '2020-10-29');
INSERT INTO Supports (ChampName, ChampCateg, ChampTitle, ChampPlace, ChampRelYear)
VALUES ('Thresh', 'Tank', 'The Chain Warden', 'Shadow Isles', '2013-01-23');
INSERT INTO Supports (ChampName, ChampCateg, ChampTitle, ChampPlace, ChampRelYear)
VALUES ('Karma', 'Enchanter', 'The Enlightened One', 'Ionia', '2011-02-01');
INSERT INTO Supports (ChampName, ChampCateg, ChampTitle, ChampPlace, ChampRelYear)
VALUES ('Vel\'Koz', 'Mage', 'The Eye of the Void', 'The Void', '2014-02-27');
INSERT INTO Supports (ChampName, ChampCateg, ChampTitle, ChampPlace, ChampRelYear)
VALUES ('Bard', 'Enchanter', 'The Wandering Caretaker', 'Beyond the Stars', '2015-03-12');
INSERT INTO Supports (ChampName, ChampCateg, ChampTitle, ChampPlace, ChampRelYear)
VALUES ('Swain', 'Mage', 'The Noxian Grand General', 'Noxus', '2010-10-05');
INSERT INTO Supports (ChampName, ChampCateg, ChampTitle, ChampPlace, ChampRelYear)
VALUES ('Rakan', 'Enchanter', 'The Charmer', 'Ionia', '2017-04-19');
INSERT INTO Supports (ChampName, ChampCateg, ChampTitle, ChampPlace, ChampRelYear)
VALUES ('Zilean', 'Mage', 'The Chronokeeper', 'Icathia', '2009-04-18');
INSERT INTO Supports (ChampName, ChampCateg, ChampTitle, ChampPlace, ChampRelYear)
VALUES ('Renata Glasc', 'Enchanter', 'The Chem-Baroness', 'Zaun', '2022-02-17');
INSERT INTO Supports (ChampName, ChampCateg, ChampTitle, ChampPlace, ChampRelYear)
VALUES ('Senna', 'Marksman', 'The Redeemer', 'Demacia', '2019-11-10');
INSERT INTO Supports (ChampName, ChampCateg, ChampTitle, ChampPlace, ChampRelYear)
VALUES ('Taric', 'Enchanter', 'The Shield of Valoran', 'Targon', '2009-08-19');
INSERT INTO Supports (ChampName, ChampCateg, ChampTitle, ChampPlace, ChampRelYear)
VALUES ('Lulu', 'Enchanter', 'The Fae Sorceress', 'Bandle City', '2012-03-20');
INSERT INTO Supports (ChampName, ChampCateg, ChampTitle, ChampPlace, ChampRelYear)
VALUES ('Nami', 'Enchanter', 'The Tidecaller', 'Targon', '2012-12-07');
INSERT INTO Supports (ChampName, ChampCateg, ChampTitle, ChampPlace, ChampRelYear)
VALUES ('Yuumi', 'Enchanter', 'The Magical Cat', 'Bandle City', '2019-05-14');
INSERT INTO Supports (ChampName, ChampCateg, ChampTitle, ChampPlace, ChampRelYear)
VALUES ('Milio', 'Enchanter', 'The Gentle Flame', 'Ixtal', '2023-03-23');
