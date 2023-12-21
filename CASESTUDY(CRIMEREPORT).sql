CREATE DATABASE CRIMEREPORT;
USE CRIMEREPORT;
-- Victims Table
CREATE TABLE Victims (
    VictimID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DateOfBirth DATE,
    Gender VARCHAR(10),
    ContactInformation VARCHAR(255)
);

-- Suspects Table
CREATE TABLE Suspects (
    SuspectID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DateOfBirth DATE,
    Gender VARCHAR(10),
    ContactInformation VARCHAR(255) -- Assuming Address and Phone Number
);

-- Incidents Table
CREATE TABLE Incidents (
    IncidentID INT PRIMARY KEY,
    IncidentType VARCHAR(50),
    IncidentDate DATE,
    Location GEOGRAPHY, -- Assuming geospatial data (Latitude and Longitude)
    Description VARCHAR(255),
    Status VARCHAR(20),
    VictimID INT,
    SuspectID INT,
    FOREIGN KEY (VictimID) REFERENCES Victims(VictimID),
    FOREIGN KEY (SuspectID) REFERENCES Suspects(SuspectID)
);

-- Law Enforcement Agencies Table
CREATE TABLE LawEnforcementAgencies (
    AgencyID INT PRIMARY KEY,
    AgencyName VARCHAR(100),
    Jurisdiction VARCHAR(100),
    ContactInformation VARCHAR(255) -- Assuming Address and Phone Number
);

-- Officers Table
CREATE TABLE Officers (
    OfficerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    BadgeNumber VARCHAR(20),
    Rank VARCHAR(50),
    ContactInformation VARCHAR(255), -- Assuming Address and Phone Number
    AgencyID INT,
    FOREIGN KEY (AgencyID) REFERENCES LawEnforcementAgencies(AgencyID)
);

-- Evidence Table
CREATE TABLE Evidence (
    EvidenceID INT PRIMARY KEY,
    Description TEXT,
    LocationFound VARCHAR(255),
    IncidentID INT,
    FOREIGN KEY (IncidentID) REFERENCES Incidents(IncidentID)
);

-- Reports Table
CREATE TABLE Reports (
    ReportID INT PRIMARY KEY,
    IncidentID INT,
    ReportingOfficer INT,
    ReportDate DATE,
    ReportDetails TEXT,
    Status VARCHAR(20),
    FOREIGN KEY (IncidentID) REFERENCES Incidents(IncidentID),
    FOREIGN KEY (ReportingOfficer) REFERENCES Officers(OfficerID)
);

INSERT INTO Victims VALUES
(1, 'Alice', 'Johnson', '1990-12-05', 'Female', '123 Main St, Cityville, 9870312345'),
(2, 'Bob', 'Smith', '1988-08-18', 'Male', '456 Oak Ave, Townsville, 9873167890'),
(3, 'Catherine', 'Miller', '1975-03-22', 'Female', '789 Elm St, Villagetown, 8790745678'),
(4, 'David', 'White', '1983-07-10', 'Male', '101 Pine Ln, Countryside, 7690878901'),
(5, 'Emily', 'Clark', '1995-01-28', 'Female', '202 Cedar Rd, Natureville, 9980723456'),
(6, 'Frank', 'Taylor', '1960-09-14', 'Male', '303 Maple Dr, Urbancity, 9914534567'),
(7, 'Grace', 'Young', '2000-04-02', 'Female', '404 Birch Blvd, Digitaltown, 9003245678'),
(8, 'Henry', 'Brown', '1989-11-20', 'Male', '505 Redwood St, Classicburg, 8715656789'),
(9, 'Isabel', 'Lee', '1972-06-08', 'Female', '606 Walnut Ave, Chromacity, 86670967890'),
(10, 'Jake', 'Martin', '1993-02-15', 'Male', '707 Spruce Ln, Tomorrowtown, 9023578901');
SELECT * FROM Victims;

INSERT INTO Suspects VALUES
(101, 'John', 'Doe', '1985-06-20', 'Male', '456 Suspicion St, Shadytown, 9065412345'),
(102, 'Jane', 'Smith', '1990-03-15', 'Female', '789 Guilty Ave, Crimetown, 86670967890'),
(103, 'Mike', 'Johnson', '1978-09-02', 'Male', '101 Fraud St, Scamville, 9807623456'),
(104, 'Sara', 'Williams', '1982-11-28', 'Female', '202 Burglar Blvd, Breakinburg, 9321434567'),
(105, 'Alex', 'Davis', '1995-07-14', 'Male', '303 Narcotics Dr, Drugsville, 9543145678'),
(106, 'Laura', 'Miller', '1988-05-06', 'Female', '404 Vandalism Ave, Smashville, 8871656789'),
(107, 'Chris', 'Brown', '1992-01-10', 'Male', '505 Kidnap Ln, Hostagetown, 9112867890'),
(108, 'Amanda', 'White', '1980-04-18', 'Female', '606 Forgery Rd, Faketown, 9223978901'),
(109, 'Tom', 'Jackson', '1976-12-22', 'Male', '707 Assault St, Violentown, 9733789012'),
(110, 'Rachel', 'Anderson', '1991-08-30', 'Female', '808 Harassment Blvd, Disturbia, 7339390123');
SELECT * FROM Suspects;

INSERT INTO Incidents VALUES
(1, 'Robbery', '2023-01-15', geography::Point(37.7749, -122.4194, 4326), 'Armed robbery at a convenience store', 'Open', 1, 102),
(2, 'Homicide', '2023-02-05', geography::Point(34.0522, -118.2437, 4326), 'Investigating a murder case in downtown', 'Under Investigation', 3, 104),
(3, 'Theft', '2023-03-10', geography::Point(40.7128, -74.0060, 4326), 'Report of stolen property from a residence', 'Closed', 5, 106),
(4, 'Assault', '2023-04-20', geography::Point(41.8781, -87.6298, 4326), 'Physical assault in a public park', 'Open', 7, 108),
(5, 'Burglary', '2023-05-12', geography::Point(51.5074, -0.1278, 4326), 'Break-in reported at a residential property', 'Open', 9, 110),
(6, 'Fraud', '2023-06-25', geography::Point(45.4215, -75.6993, 4326), 'Investigating a case of financial fraud', 'Under Investigation', 2, 103),
(7, 'Kidnapping', '2023-07-08', geography::Point(33.7490, -84.3880, 4326), 'Report of a kidnapping incident', 'Open', 4, 105),
(8, 'Vandalism', '2023-08-14', geography::Point(37.7749, -122.4194, 4326), 'Incident of property vandalism', 'Closed', 6, 107),
(9, 'Drug Offense', '2023-09-03', geography::Point(40.7128, -74.0060, 4326), 'Investigation into drug-related activities', 'Open', 8, 109),
(10, 'Domestic Violence', '2023-10-19', geography::Point(34.0522, -118.2437, 4326), 'Responding to a domestic violence case', 'Under Investigation', 10, 101);
SELECT * FROM Incidents;

INSERT INTO LawEnforcementAgencies VALUES
(11, 'Cityville Police Department', 'Cityville Jurisdiction', '123 Main St, Cityville, 1234567890'),
(12, 'Townsville Sheriff Office', 'Townsville Jurisdiction', '456 Oak Ave, Townsville, 7854367890'),
(13, 'Villagetown Police Department', 'Villagetown Jurisdiction', '789 Elm St, Villagetown, 68482845678'),
(14, 'Countryside Police Department', 'Countryside Jurisdiction', '101 Pine Ln, Countryside, 84586578901'),
(15, 'Natureville Rangers', 'Natureville Jurisdiction', '202 Cedar Rd, Natureville, 43855423456'),
(16, 'Urbancity Law Enforcement', 'Urbancity Jurisdiction', '303 Maple Dr, Urbancity, 83478534567'),
(17, 'Digitaltown Security', 'Digitaltown Jurisdiction', '404 Birch Blvd, Digitaltown, 73487545678'),
(18, 'Classicburg Police Department', 'Classicburg Jurisdiction', '505 Redwood St, Classicburg, 324768756789'),
(19, 'Chromacity Police Department', 'Chromacity Jurisdiction', '606 Walnut Ave, Chromacity, 78437867890'),
(20, 'Tomorrowtown Security', 'Tomorrowtown Jurisdiction', '707 Spruce Ln, Tomorrowtown, 723784378901');
SELECT * FROM LawEnforcementAgencies;

INSERT INTO Officers VALUES
(201, 'Mark', 'Johnson', '12345', 'Chief', '123 Main St, Cityville, 12345', 11),
(202, 'Linda', 'Smith', '67890', 'Sheriff', '456 Oak Ave, Townsville, 67890', 12),
(203, 'Robert', 'White', '45678', 'Chief', '789 Elm St, Villagetown, 45678', 13),
(204, 'Sarah', 'Davis', '78901', 'Chief', '101 Pine Ln, Countryside, 78901', 14),
(205, 'Alex', 'Green', '23456', 'Ranger', '202 Cedar Rd, Natureville, 23456', 15),
(206, 'Laura', 'Miller', '34567', 'Commissioner', '303 Maple Dr, Urbancity, 34567', 16),
(207, 'Sam', 'White', '45678', 'Director', '404 Birch Blvd, Digitaltown, 45678', 17),
(208, 'Monica', 'Brown', '56789', 'Chief', '505 Redwood St, Classicburg, 56789', 18),
(209, 'Andrew', 'Jackson', '67890', 'Chief', '606 Walnut Ave, Chromacity, 67890', 19),
(210, 'Jessica', 'Anderson', '78901', 'Director', '707 Spruce Ln, Tomorrowtown, 78901', 20);
SELECT * FROM Officers;

INSERT INTO Evidence VALUES
(301, 'Security footage from convenience store', '123 Main St, Cityville', 1),
(302, 'DNA samples found at crime scene', '456 Oak Ave, Townsville', 2),
(303, 'Stolen items recovered from suspect', '789 Elm St, Villagetown', 3),
(304, 'Witness statements and sketches', '101 Pine Ln, Countryside', 4),
(305, 'Fingerprints on broken window', '202 Cedar Rd, Natureville', 5),
(306, 'Financial transaction records', '303 Maple Dr, Urbancity', 6),
(307, 'Video evidence from security cameras', '404 Birch Blvd, Digitaltown', 7),
(308, 'Vandalized property photographs', '505 Redwood St, Classicburg', 8),
(309, 'Drug paraphernalia and substances', '606 Walnut Ave, Chromacity', 9),
(310, 'Domestic violence incident report', '707 Spruce Ln, Tomorrowtown', 10);
SELECT * FROM Evidence;

INSERT INTO Reports VALUES
(401, 1, 201, '2023-01-16', 'Initial incident report for robbery', 'Draft'),
(402, 2, 202, '2023-02-06', 'Ongoing investigation report for homicide', 'Draft'),
(403, 3, 203, '2023-03-11', 'Finalized report for theft case', 'Finalized'),
(404, 4, 204, '2023-04-21', 'Incident report for assault in public park', 'Draft'),
(405, 5, 205, '2023-05-13', 'Progress report for burglary investigation', 'Draft'),
(406, 6, 206, '2023-06-26', 'Financial fraud case report', 'Draft'),
(407, 7, 207, '2023-07-09', 'Kidnapping incident report', 'Draft'),
(408, 8, 208, '2023-08-15', 'Finalized report for vandalism case', 'Finalized'),
(409, 9, 209, '2023-09-04', 'Drug offense investigation report', 'Draft'),
(410, 10, 210, '2023-10-20', 'Domestic violence incident report', 'Draft');
SELECT * FROM Reports;