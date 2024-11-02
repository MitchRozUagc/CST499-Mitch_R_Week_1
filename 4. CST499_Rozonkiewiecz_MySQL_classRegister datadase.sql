-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 28, 2024 at 07:08 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `classRegister`
--

-- --------------------------------------------------------

--
-- Table structure for table `tblCourse`
--

CREATE TABLE `tblCourse` (
  `courseId` varchar(7) NOT NULL,
  `courseName` varchar(512) NOT NULL,
  `courseDesc` varchar(1024) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblCourse`
--

INSERT INTO `tblCourse` (`courseId`, `courseName`, `courseDesc`) VALUES
('CST307', 'Software Architecture and Design', 'This course introduces basic concepts and principles about software architecture and design. It starts with \r\ndiscussion on architectural structures and styles, followed by coverage on design issues and design \r\npatterns. The emphasis is on the interaction between software design and quality attributes such as \r\navailability, performance, security, interoperability, and modifiability.'),
('CST310', 'Software Development', 'This course introduces students to modern software development principles and practices. It provides the \r\nnecessary grounding on the different technologies associated with developing a business websites. \r\nStudents in this course will learn client-side web development; as well as server-side web development \r\nusing PHP programing language. '),
('CST499', 'Capstone for Computer Software Technology ', 'See who paid attention in class');

-- --------------------------------------------------------

--
-- Table structure for table `tblCoursesOffered`
--

CREATE TABLE `tblCoursesOffered` (
  `uniqueKeyId` int(11) NOT NULL,
  `tblCOcourseId` varchar(7) NOT NULL,
  `tblCOteacherId` int(11) NOT NULL,
  `semester` varchar(24) NOT NULL,
  `preReq` varchar(7) DEFAULT NULL,
  `maxStudent` int(11) NOT NULL DEFAULT 21,
  `creditHours` int(11) NOT NULL DEFAULT 3,
  `onlineOrClassroom` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblCoursesOffered`
--

INSERT INTO `tblCoursesOffered` (`uniqueKeyId`, `tblCOcourseId`, `tblCOteacherId`, `semester`, `preReq`, `maxStudent`, `creditHours`, `onlineOrClassroom`) VALUES
(1, 'CST307', 3, 'Spring 2024', 'CST304', 21, 3, 1),
(2, 'CST310', 1, 'Summer 2024', 'CST307', 21, 3, 1),
(3, 'CST499', 2, 'Fall 2024', 'CST310', 21, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tblTeacher`
--

CREATE TABLE `tblTeacher` (
  `teacherId` int(11) NOT NULL,
  `teacherName` varchar(512) NOT NULL,
  `teacherEmailAddr` varchar(512) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblTeacher`
--

INSERT INTO `tblTeacher` (`teacherId`, `teacherName`, `teacherEmailAddr`) VALUES
(1, 'Dr. Joseph Issa', 'Joseph.issa@faculty.uagc.edu'),
(2, 'Dr. Charmelia Butler', 'charmelia.butler@faculty.uagc.edu'),
(3, 'Professor Joe Rangitsch', 'joseph.rangitsch@faculty.uagc.edu');

-- --------------------------------------------------------

--
-- Table structure for table `tblUser`
--

CREATE TABLE `tblUser` (
  `id` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `firstName` varchar(100) NOT NULL,
  `lastName` varchar(100) NOT NULL,
  `address` varchar(200) NOT NULL,
  `phone` varchar(12) NOT NULL,
  `SSN` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblUser`
--

INSERT INTO `tblUser` (`id`, `email`, `password`, `firstName`, `lastName`, `address`, `phone`, `SSN`) VALUES
('mitch', 'roz@uagc.edu', 'pass', 'First', 'Last', '123123', '123123', '234'),
('test499', 'me@yahoo.com', 'qwerty', 'Test', 'CST499', '423 Bluff', '630.123.4567', '123678905'),
('userid1', 'mitch@uagc.edu', 'pass1', 'Mitch', 'Smith', '423 Bluff Point', '630.841.1234', '123-45-6789'),
('userid2', 'patti@aol.com', 'pass2', 'Patti', 'Smith', '423 Bluff Point', '630.148.1234', '987-65-4321'),
('video', 'video@uagc.edu', 'video', 'video', 'video', 'video', '630-841-1234', '123-45-6789'),
('wert', 'ewrt', 'ewrt', 'ewrt', 'ewrt', 'ert', '123', '123');

-- --------------------------------------------------------

--
-- Table structure for table `tblUserRegisteredClasses`
--

CREATE TABLE `tblUserRegisteredClasses` (
  `tblUserId` varchar(50) NOT NULL,
  `tblClassesOfferedUniqueKeyId` int(11) NOT NULL,
  `registeredOrWaitListed` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tblCourse`
--
ALTER TABLE `tblCourse`
  ADD PRIMARY KEY (`courseId`);

--
-- Indexes for table `tblCoursesOffered`
--
ALTER TABLE `tblCoursesOffered`
  ADD PRIMARY KEY (`uniqueKeyId`),
  ADD KEY `tblCOcourseId` (`tblCOcourseId`),
  ADD KEY `tblCOteacherId` (`tblCOteacherId`),
  ADD KEY `uniqueKeyId` (`uniqueKeyId`);

--
-- Indexes for table `tblTeacher`
--
ALTER TABLE `tblTeacher`
  ADD PRIMARY KEY (`teacherId`);

--
-- Indexes for table `tblUser`
--
ALTER TABLE `tblUser`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblUserRegisteredClasses`
--
ALTER TABLE `tblUserRegisteredClasses`
  ADD PRIMARY KEY (`tblUserId`,`tblClassesOfferedUniqueKeyId`),
  ADD KEY `tblUserId` (`tblUserId`),
  ADD KEY `tblClassesOfferedUniqueKeyId` (`tblClassesOfferedUniqueKeyId`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tblCoursesOffered`
--
ALTER TABLE `tblCoursesOffered`
  ADD CONSTRAINT `fk_C_cid` FOREIGN KEY (`tblCOcourseId`) REFERENCES `tblCourse` (`courseId`) ON DELETE NO ACTION,
  ADD CONSTRAINT `fk_T_cid` FOREIGN KEY (`tblCOteacherId`) REFERENCES `tblTeacher` (`teacherId`) ON DELETE NO ACTION;

--
-- Constraints for table `tblUserRegisteredClasses`
--
ALTER TABLE `tblUserRegisteredClasses`
  ADD CONSTRAINT `fk_tblCOukeyid` FOREIGN KEY (`tblClassesOfferedUniqueKeyId`) REFERENCES `tblCoursesOffered` (`uniqueKeyId`) ON DELETE NO ACTION,
  ADD CONSTRAINT `fk_tblUser_id` FOREIGN KEY (`tblUserId`) REFERENCES `tblUser` (`id`) ON DELETE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
