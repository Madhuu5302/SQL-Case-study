CREATE DATABASE ARTGALLERY;
USE ARTGALLERY;

-- Artist Table
CREATE TABLE Artist (
    ArtistID INT PRIMARY KEY,
    Name VARCHAR(255),
    Biography TEXT,
    BirthDate DATE,
    Nationality VARCHAR(50),
    Website VARCHAR(255),
    Contact_Information VARCHAR(255)
);

-- Artwork Table
CREATE TABLE Artwork (
    ArtworkID INT PRIMARY KEY,
    Title VARCHAR(255),
    Description TEXT,
    CreationDate DATE,
    Medium VARCHAR(100),
    ImageURL VARCHAR(255)
);
-- User Table
CREATE TABLE Users (
    UserID INT PRIMARY KEY,
    Username VARCHAR(50),
    Password VARCHAR(255),
    Email VARCHAR(255),
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DateOfBirth DATE,
    ProfilePicture VARCHAR(255),
    FavoriteArtworks VARCHAR(255)
);

-- Gallery Table
CREATE TABLE Gallery (
    GalleryID INT PRIMARY KEY,
    Name VARCHAR(255),
    Description TEXT,
    Location VARCHAR(255),
    Curator INT,
    OpeningHours VARCHAR(255),
    FOREIGN KEY (Curator) REFERENCES Artist(ArtistID)
);

INSERT INTO Artist VALUES
(1, 'Vincent van Gogh', 'Post-Impressionist painter', '1853-03-30', 'Dutch', 'http://www.vangogh.com', 'info@vangogh.com'),
(2, 'Leonardo da Vinci', 'Renaissance polymath', '1452-04-15', 'Italian', 'http://www.leonardodavinci.com', 'info@leonardo.com'),
(3, 'Frida Kahlo', 'Surrealist painter', '1907-07-06', 'Mexican', 'http://www.fridakahlo.com', 'info@frida.com'),
(4, 'Pablo Picasso', 'Cubist artist', '1881-10-25', 'Spanish', 'http://www.picasso.com', 'info@picasso.com'),
(5, 'Georgia Keeffe', 'Modernist painter', '1887-11-15', 'American', 'http://www.okeeffe.com', 'info@okeeffe.com'),
(6, 'Claude Monet', 'Impressionist painter', '1840-11-14', 'French', 'http://www.monet.com', 'info@monet.com'),
(7, 'Salvador Dalí', 'Surrealist artist', '1904-05-11', 'Spanish', 'http://www.dali.com', 'info@dali.com'),
(8, 'Edvard Munch', 'Symbolist painter', '1863-12-12', 'Norwegian', 'http://www.munch.com', 'info@munch.com'),
(9, 'Mary Cassatt', 'Impressionist painter', '1844-05-22', 'American', 'http://www.cassatt.com', 'info@cassatt.com'),
(10, 'Katsushika Hokusai', 'Edo period ukiyo-e painter', '1760-10-31', 'Japanese', 'http://www.hokusai.com', 'info@hokusai.com');
SELECT * FROM Artist;

INSERT INTO Artwork VALUES
(1, 'Starry Night', 'A mesmerizing night sky with swirling stars', '1889-06-30', 'Oil on canvas', 'http://imageurl.com/starrynight'),
(2, 'Mona Lisa', 'Iconic portrait with a mysterious smile', '1503-04-15', 'Oil on poplar panel', 'http://imageurl.com/monalisa'),
(3, 'The Two Fridas', 'A symbolic representation of Kahlo identity', '1939-07-06', 'Oil on canvas', 'http://imageurl.com/twofridas'),
(4, 'Guernica', 'Powerful anti-war painting', '1937-04-26', 'Oil on canvas', 'http://imageurl.com/guernica'),
(5, 'Red Poppy No. VI', 'Close-up of a vibrant red poppy flower', '1928-10-25', 'Oil on canvas', 'http://imageurl.com/redpoppy'),
(6, 'Water Lilies', 'Series of impressionist water lily paintings', '1916-11-14', 'Oil on canvas', 'http://imageurl.com/waterlilies'),
(7, 'The Persistence of Memory', 'Melting clocks in a surreal landscape', '1931-05-11', 'Oil on canvas', 'http://imageurl.com/persistenceofmemory'),
(8, 'The Scream', 'Expressionist depiction of anxiety', '1893-12-12', 'Oil, pastel, and casein on cardboard', 'http://imageurl.com/thescream'),
(9, 'The Childs Bath', 'Intimate mother-child scene', '1891-05-22', 'Oil on canvas', 'http://imageurl.com/childsbath'),
(10, 'The Great Wave off Kanagawa', 'Iconic ukiyo-e print', '1831-10-31', 'Woodblock print', 'http://imageurl.com/greatwave');
SELECT * FROM Artwork;

INSERT INTO Users VALUES
(1, 'artlover123', 'password123', 'artlover@example.com', 'Alice', 'Johnson', '1990-12-05', 'http://profilepic1.com', '1,2,3,4,5'),
(2, 'creative_soul', 'pass456', 'creativesoul@gmail.com', 'Bob', 'Smith', '1988-08-18', 'http://profilepic2.com', '6,7,8,9,10'),
(3, 'gallery_owner', 'pass789', 'galleryowner@gmail.com', 'Catherine', 'Miller', '1975-03-22', 'http://profilepic3.com', '2,5,7,9,10'),
(4, 'modern_artist', 'passArt', 'modernartist@gmail.com', 'David', 'White', '1983-07-10', 'http://profilepic4.com', '1,3,6,8,9'),
(5, 'impressionist_fan', 'passImp', 'impressionistfan@gmail.com', 'Emily', 'Clark', '1995-01-28', 'http://profilepic5.com', '2,6,7,8,10'),
(6, 'art_collector', 'passCollect', 'artcollector@gmail.com', 'Frank', 'Taylor', '1960-09-14', 'http://profilepic6.com', '1,4,5,7,10'),
(7, 'student_artist', 'passArtStudent', 'artstudent@gmail.com', 'Grace', 'Young', '2000-04-02', 'http://profilepic7.com', '3,5,6,8,9'),
(8, 'abstract_lover', 'passAbstract', 'abstractlover@gmail.com', 'Henry', 'Brown', '1989-11-20', 'http://profilepic8.com', '1,2,4,7,10'),
(9, 'classic_art_enthusiast', 'passClassic', 'classicart@gmail.com', 'Isabel', 'Lee', '1972-06-08', 'http://profilepic9.com', '3,4,6,8,9'),
(10, 'digital_artist', 'passDigital', 'digitalartist@gmail.com', 'Jake', 'Martin', '1993-02-15', 'http://profilepic10.com', '1,2,5,7,9');
SELECT * FROM Users;

INSERT INTO Gallery VALUES
(1, 'Modern Art Hub', 'Showcasing contemporary artwork', '123 Main St, Cityville', 1, 'Mon-Fri: 10 AM - 6 PM, Sat: 12 PM - 4 PM'),
(2, 'Classic Impressions Gallery', 'A collection of timeless masterpieces', '456 Art Avenue, Townsville', 2, 'Tue-Sun: 11 AM - 7 PM'),
(3, 'Abstract Expression', 'Exploring the world of abstract art', '789 Abstract Lane, Artropolis', 4, 'Wed-Sat: 1 PM - 8 PM, Sun: 11 AM - 4 PM'),
(4, 'Impressionist Delight', 'Journey through impressionist landscapes', '567 Artful Street, Paintingtown', 6, 'Thu-Fri: 12 PM - 6 PM, Sat: 10 AM - 5 PM'),
(5, 'Surreal Dreams Gallery', 'A surrealistic experience for art enthusiasts', '890 Dreamy Blvd, Visionville', 7, 'Tue-Sun: 10 AM - 5 PM'),
(6, 'Nature Canvas Gallery', 'Celebrating art inspired by nature', '234 Greenery Lane, Earthville', 9, 'Mon-Sat: 11 AM - 7 PM, Sun: 12 PM - 5 PM'),
(7, 'Digital Wonders Exhibit', 'Exploring the digital realm of artistic creations', '345 Tech Street, Digicity', 10, 'Wed-Fri: 2 PM - 9 PM, Sat-Sun: 10 AM - 6 PM'),
(8, 'Timeless Classics Gallery', 'Rediscover the beauty of classical art', '678 Elegance Avenue, Classicburg', 3, 'Thu-Sun: 12 PM - 8 PM'),
(9, 'Gallery of Colors', 'Vibrant showcase of colorful masterpieces', '901 Rainbow Road, Chromacity', 5, 'Tue-Sat: 11 AM - 6 PM, Sun: 1 PM - 5 PM'),
(10, 'Future Visions Gallery', 'Dive into the future through visionary art', '432 Futuristic Lane, Tomorrowtown', 8, 'Mon-Fri: 1 PM - 7 PM, Sat: 11 AM - 4 PM');
SELECT * FROM Gallery;