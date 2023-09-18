-- Insert data into Artists table
INSERT INTO Artists (Name, Surname, Country)
VALUES
    ('John', 'Smith', 'USA'),
    ('Sarah', 'Jones', 'UK'),
    ('Michael', 'Brown', 'Canada'),
    ('Emma', 'Davis', 'France'),
    ('William', 'Wilson', 'Germany'),
    ('Olivia', 'Johnson', 'Italy'),
    ('James', 'Anderson', 'Spain'),
    ('Sophia', 'Lee', 'Sweden'),
    ('Liam', 'Harris', 'Netherlands'),
    ('Ava', 'Clark', 'Ukraine'),
    ('Mason', 'Taylor', 'Ukraine'),
    ('Amelia', 'White', 'Ukraine'),
    ('Ethan', 'Martinez', 'Ukraine'),
    ('Oliver', 'Lopez', 'Ukraine'),
    ('Harper', 'Garcia', 'Ukraine'),
    ('Noah', 'Rodriguez', 'Ukraine'),
    ('Isabella', 'Perez', 'Ukraine'),
    ('Lucas', 'Gonzalez', 'Ukraine'),
    ('Mia', 'Ramirez', 'Ukraine'),
    ('Evelyn', 'Sanchez', 'Ukraine');

-- Insert data into Albums table
INSERT INTO Albums (Name, Year)
VALUES
    ('Summer Vibes', 2015),
    ('Electric Dreams', 2018),
    ('Midnight Serenade', 2020),
    ('Lost in Paradise', 2017),
    ('Harmony', 2019),
    ('Ocean Blue', 2016),
    ('Eternal Love', 2021),
    ('Wildfire', 2014),
    ('Moonlight Sonata', 2013),
    ('Under the Stars', 2018),
    ('Rainbow Dreams', 2020),
    ('Heavenly Melodies', 2016),
    ('Whispering Winds', 2019),
    ('Celestial Harmony', 2017),
    ('Serenade in Dusk', 2022),
    ('Dancing Shadows', 2015),
    ('Innocence', 2013),
    ('Golden Moments', 2018),
    ('Aurora Borealis', 2014),
    ('Mystical Journeys', 2021);

-- Insert data into AlbumArtists table
-- Associate artists with albums (randomly)
INSERT INTO AlbumArtists (AlbumID, ArtistID)
SELECT AlbumID, ArtistID
FROM Albums, Artists
ORDER BY random()
LIMIT 20;

-- Insert data into Tracks table
INSERT INTO Tracks (Name, Duration, Text, AlbumID)
VALUES
    ('Sunrise Serenade', '04:30:00', 'Lyrics for Sunrise Serenade', 1),
    ('Electric Dreams', '03:45:00', 'Lyrics for Electric Dreams', 2),
    ('Midnight Magic', '05:15:00', 'Lyrics for Midnight Magic', 3),
    ('Lost in Paradise', '04:10:00', 'Lyrics for Lost in Paradise', 4),
    ('Harmony in E', '03:30:00', 'Lyrics for Harmony in E', 5),
    ('Ocean Blue', '04:55:00', 'Lyrics for Ocean Blue', 6),
    ('Eternal Love', '03:20:00', 'Lyrics for Eternal Love', 7),
    ('Wildfire', '04:40:00', 'Lyrics for Wildfire', 8),
    ('Moonlight Sonata', '06:10:00', 'Lyrics for Moonlight Sonata', 9),
    ('Under the Stars', '03:55:00', 'Lyrics for Under the Stars', 10),
    ('Rainbow Dreams', '04:25:00', 'Lyrics for Rainbow Dreams', 11),
    ('Heavenly Melodies', '03:45:00', 'Lyrics for Heavenly Melodies', 12),
    ('Whispering Winds', '05:30:00', 'Lyrics for Whispering Winds', 13),
    ('Celestial Harmony', '04:00:00', 'Lyrics for Celestial Harmony', 14),
    ('Serenade in Dusk', '06:45:00', 'Lyrics for Serenade in Dusk', 15),
    ('Dancing Shadows', '04:15:00', 'Lyrics for Dancing Shadows', 16),
    ('Innocence', '03:40:00', 'Lyrics for Innocence', 17),
    ('Golden Moments', '05:00:00', 'Lyrics for Golden Moments', 18),
    ('Aurora Borealis', '04:20:00', 'Lyrics for Aurora Borealis', 19),
    ('Mystical Journeys', '05:55:00', 'Lyrics for Mystical Journeys', 20);

-- Insert data into Genres table
INSERT INTO Genres (Name)
VALUES
    ('Pop'),
    ('Rock'),
    ('Electronic'),
    ('Jazz'),
    ('Classical'),
    ('Hip-Hop'),
    ('Country'),
    ('R&B'),
    ('Reggae'),
    ('Alternative');

-- Insert data into AlbumGenres table
-- Associate genres with albums (randomly)
INSERT INTO AlbumGenres (AlbumID, GenreID)
SELECT AlbumID, GenreID
FROM Albums, Genres
ORDER BY random()
LIMIT 20;

-- Insert data into TrackGenres table
-- Associate genres with tracks (randomly)
INSERT INTO TrackGenres (TrackID, GenreID)
SELECT TrackID, GenreID
FROM Tracks, Genres
ORDER BY random()
LIMIT 20;