
--  PetOwners (고객 테이블)
CREATE TABLE PetOwners (
    ownerID INT AUTO_INCREMENT PRIMARY KEY,   
    name VARCHAR(100) NOT NULL,              
    contact VARCHAR(100)                       
);

--  Pets (반려동물 테이블)
CREATE TABLE Pets (
    petID INT AUTO_INCREMENT PRIMARY KEY,    
    ownerID INT NOT NULL,                    
    name VARCHAR(100) NOT NULL,              
    species VARCHAR(50),                    
    breed VARCHAR(50),                        
    FOREIGN KEY (ownerID) REFERENCES PetOwners(ownerID)
);

--  Rooms (객실 테이블)
CREATE TABLE Rooms (
    roomID INT AUTO_INCREMENT PRIMARY KEY,    
    roomNumber VARCHAR(20) NOT NULL UNIQUE,   
    roomType VARCHAR(50),                     
    pricePerNight DECIMAL(10,2) NOT NULL      
);

--  Reservations (예약 테이블)
CREATE TABLE Reservations (
    reservationID INT AUTO_INCREMENT PRIMARY KEY, 
    petID INT NOT NULL,                          
    roomID INT NOT NULL,                       
    startDate DATE NOT NULL,                      
    endDate DATE NOT NULL,                        
    FOREIGN KEY (petID) REFERENCES Pets(petID),
    FOREIGN KEY (roomID) REFERENCES Rooms(roomID)
);

--  Services (서비스 테이블)
CREATE TABLE Services (
    serviceID INT AUTO_INCREMENT PRIMARY KEY,     
    reservationID INT NOT NULL,                  
    serviceName VARCHAR(100) NOT NULL,             
    servicePrice DECIMAL(10,2) NOT NULL,         
    FOREIGN KEY (reservationID) REFERENCES Reservations(reservationID)
);