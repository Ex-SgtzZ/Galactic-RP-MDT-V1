CREATE TABLE IF NOT EXISTS mdt_warrants (
  id INT AUTO_INCREMENT PRIMARY KEY,
  citizenid VARCHAR(50) NOT NULL,
  
ame VARCHAR(100) NOT NULL,
  charges TEXT NOT NULL,
  details TEXT,
  officer VARCHAR(100) NOT NULL,
  date_issued TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  date_expires DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS mdt_bolos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  citizenid VARCHAR(50),
  
ame VARCHAR(100),
  description TEXT,
  last_seen VARCHAR(255),
  officer VARCHAR(100),
  date_issued TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  date_expires DATE NOT NULL
);
