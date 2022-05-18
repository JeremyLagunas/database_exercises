USE albums_db;

SHOW tables;

DESCRIBE albums;

SELECT * FROM albums;
-- 3a. There are 31 rows in the album table. 

SELECT count(distinct(artist)) from albums;
-- 3b. There are 23 unique artists.alter

DESCRIBE albums;
-- 3c. The PRI key in albums is the id

SELECT release_date from albums WHERE release_date < 1977;
-- 3d. The oldest release date is 1967

DESCRIBE albums;
SELECT name FROM albums WHERE artist = "pink floyd";
-- 4a. The name of albums by Pink Floyd

DESCRIBE albums;
SELECT release_date, artist, name FROM albums;
-- 4b. 1967 is the year Sgt. Pepper's Lonely Hearts Club Band was released

SELECT genre FROM albums Where name = 'nevermind';
-- 4c. nevermind genre is Grunge, Alt rock

SELECT name FROM albums WHERE release_date BETWEEN 1990 and 1999;
-- 4d. Albums released in the greatest decade (90s)

DESCRIBE albums;
SELECT name FROM albums WHERE sales < 20000000;
-- 4e. Albums with less than 20 mill sales

DESCRIBE albums;
SELECT name FROM albums WHERE genre = "rock";
-- 4f. All albums with a genre of Rock. These don't include other types of rock because I didn't specifically ask to receive those kinds

