-- Arrest Reports Table
CREATE TABLE IF NOT EXISTS `mdt_arrests` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `citizenid` VARCHAR(50),
  `officer` VARCHAR(100),
  `charges` TEXT,
  `details` TEXT,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Warrants Table
CREATE TABLE IF NOT EXISTS `mdt_warrants` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `citizenid` VARCHAR(50),
  `officer` VARCHAR(100),
  `charges` TEXT,
  `details` TEXT,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tickets Table
CREATE TABLE IF NOT EXISTS `mdt_tickets` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `citizenid` VARCHAR(50),
  `officer` VARCHAR(100),
  `amount` INT,
  `charges` TEXT,
  `details` TEXT,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Court Cases Table
CREATE TABLE IF NOT EXISTS `mdt_court_cases` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `case_number` VARCHAR(20),
  `title` VARCHAR(255),
  `description` TEXT,
  `judge` VARCHAR(100),
  `plaintiff` VARCHAR(100),
  `defendant` VARCHAR(100),
  `status` VARCHAR(50) DEFAULT 'Open',
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Penal Codes Table
CREATE TABLE IF NOT EXISTS `mdt_penalcodes` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `code` VARCHAR(20),
  `title` VARCHAR(100),
  `description` TEXT,
  `fine` INT,
  `time` INT
);

-- Logs Table
CREATE TABLE IF NOT EXISTS `mdt_logs` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `officer` VARCHAR(100),
  `action` VARCHAR(255),
  `details` TEXT,
  `timestamp` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- MDT Jobs Table (for dynamic MDT creation)
CREATE TABLE IF NOT EXISTS `mdt_jobs` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `job` VARCHAR(50) UNIQUE,
  `label` VARCHAR(100),
  `skin` VARCHAR(50),
  `canEditPenalCodes` BOOLEAN,
  `canManageWarrants` BOOLEAN,
  `canManageCourtCases` BOOLEAN
);
