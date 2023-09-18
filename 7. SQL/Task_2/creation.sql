-- Creates the Artists table
CREATE TABLE Artists (
    ArtistID SERIAL PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Surname VARCHAR(255),
    Country VARCHAR(255)
);

-- Creates the Albums table
CREATE TABLE Albums (
    AlbumID SERIAL PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Year INT
);

-- Creates a table to represent the many-to-many relationship between Albums and Artists
CREATE TABLE AlbumArtists (
    AlbumID INT,
    ArtistID INT,
    PRIMARY KEY (AlbumID, ArtistID),
    FOREIGN KEY (AlbumID) REFERENCES Albums(AlbumID),
    FOREIGN KEY (ArtistID) REFERENCES Artists(ArtistID)
);

-- Creates the Tracks table
CREATE TABLE Tracks (
    TrackID SERIAL PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Duration INTERVAL,
    Text TEXT,
    AlbumID INT
);

-- Creates a table to represent the many-to-many relationship between Tracks and Artists
CREATE TABLE TrackArtists (
    TrackID INT,
    ArtistID INT,
    PRIMARY KEY (TrackID, ArtistID),
    FOREIGN KEY (TrackID) REFERENCES Tracks(TrackID),
    FOREIGN KEY (ArtistID) REFERENCES Artists(ArtistID)
);

-- Creates the Genres table
CREATE TABLE Genres (
    GenreID SERIAL PRIMARY KEY,
    Name VARCHAR(255) NOT NULL
);

-- Creates a table to represent the many-to-many relationship between Albums and Genres
CREATE TABLE AlbumGenres (
    AlbumID INT,
    GenreID INT,
    PRIMARY KEY (AlbumID, GenreID),
    FOREIGN KEY (AlbumID) REFERENCES Albums(AlbumID),
    FOREIGN KEY (GenreID) REFERENCES Genres(GenreID)
);

-- Creates a table to represent the many-to-many relationship between Tracks and Genres
CREATE TABLE TrackGenres (
    TrackID INT,
    GenreID INT,
    PRIMARY KEY (TrackID, GenreID),
    FOREIGN KEY (TrackID) REFERENCES Tracks(TrackID),
    FOREIGN KEY (GenreID) REFERENCES Genres(GenreID)
);