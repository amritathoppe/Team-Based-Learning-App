-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 21, 2017 at 07:55 PM
-- Server version: 10.1.28-MariaDB
-- PHP Version: 7.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tblearning_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `actions_links`
--

CREATE TABLE `actions_links` (
  `Actions_Links_Instructor_ID` varchar(20) NOT NULL,
  `Actions_Links_Master` int(4) NOT NULL,
  `Actions_Links_Details` int(4) NOT NULL,
  `Actions_Links_LinkedTables_ID` int(10) NOT NULL,
  `Actions_Links_Deleted` int(1) DEFAULT NULL,
  `Actions_Links_Date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `answers`
--

CREATE TABLE `answers` (
  `Answer_ID` int(10) NOT NULL,
  `Answer_Desc` varchar(30) DEFAULT NULL,
  `Answer_Question_ID` int(10) DEFAULT NULL,
  `Answer_UserId` varchar(20) DEFAULT NULL,
  `Answer_Deleted` int(1) DEFAULT NULL,
  `Answer_Date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `Course_ID` int(10) NOT NULL,
  `Course_code` varchar(10) DEFAULT NULL,
  `Course_Desc` varchar(20) DEFAULT NULL,
  `Course_year` int(4) DEFAULT NULL,
  `Course_Semster` varchar(3) DEFAULT NULL,
  `Course_Time` varchar(2) DEFAULT NULL,
  `Course_Department_ID` int(10) NOT NULL,
  `Course_UserID` varchar(20) NOT NULL,
  `Course_Deleted` int(1) DEFAULT NULL,
  `Course_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `customquiz`
--

CREATE TABLE `customquiz` (
  `CustomQuiz_ID` int(10) NOT NULL,
  `CustomQuiz_Status` int(1) DEFAULT NULL,
  `CustomQuiz_QuizID` int(10) DEFAULT NULL,
  `CustomQuiz_QustionID` int(10) DEFAULT NULL,
  `CustomQuiz_UserID` varchar(20) DEFAULT NULL,
  `CustomQuiz_Deleted` int(1) DEFAULT NULL,
  `CustomQuiz_Date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `Department_ID` int(10) NOT NULL,
  `Department_Code` varchar(5) DEFAULT NULL,
  `Department_Desc` varchar(30) NOT NULL,
  `Department_UserID` varchar(20) DEFAULT NULL,
  `Department_Deleted` int(1) DEFAULT NULL,
  `Department_Date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`Department_ID`, `Department_Code`, `Department_Desc`, `Department_UserID`, `Department_Deleted`, `Department_Date`) VALUES
(1, 'HQ', 'Headquarter', '9999', 0, '2017-11-17 23:02:42');

-- --------------------------------------------------------

--
-- Table structure for table `groupanswers`
--

CREATE TABLE `groupanswers` (
  `GroupAnswers_Answer_value` int(10) NOT NULL,
  `GroupAnswers_Group_ID` int(10) NOT NULL,
  `GroupAnswers_Quiz_ID` int(10) NOT NULL,
  `GroupAnswers_Question_ID` int(10) NOT NULL,
  `GroupAnswers_Answer_Correction` int(2) DEFAULT NULL,
  `GroupAnswers_Deleted` int(1) DEFAULT NULL,
  `GroupAnswers_Date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `Group_ID` int(10) NOT NULL,
  `Group_Desc` varchar(10) DEFAULT NULL,
  `Group_UserID` varchar(20) DEFAULT NULL,
  `Group_Deleted` int(1) DEFAULT NULL,
  `Group_Date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `linkedtables`
--

CREATE TABLE `linkedtables` (
  `LinkedTables_ID` int(4) NOT NULL,
  `LinkedTables_Master` int(2) DEFAULT NULL,
  `LinkedTables_Details` int(2) DEFAULT NULL,
  `LinkedTables_UserID` varchar(20) DEFAULT NULL,
  `LinkedTables_Deleted` int(1) DEFAULT NULL,
  `LinkedTables_Date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `linkedtables`
--

INSERT INTO `linkedtables` (`LinkedTables_ID`, `LinkedTables_Master`, `LinkedTables_Details`, `LinkedTables_UserID`, `LinkedTables_Deleted`, `LinkedTables_Date`) VALUES
(100, 10, 8, '9999', NULL, '2017-11-17 23:02:41'),
(200, 10, 4, '9999', NULL, '2017-11-17 23:02:41'),
(300, 10, 3, '9999', NULL, '2017-11-17 23:02:41'),
(400, 4, 3, '9999', NULL, '2017-11-17 23:02:41'),
(500, 6, 3, '9999', NULL, '2017-11-17 23:02:41'),
(600, 3, 6, '9999', NULL, '2017-11-17 23:02:41');

-- --------------------------------------------------------

--
-- Table structure for table `passwordtracking`
--

CREATE TABLE `passwordtracking` (
  `PasswordTracking_SSO` varchar(20) NOT NULL,
  `PasswordTracking_TryNO` int(2) DEFAULT NULL,
  `PasswordTracking_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `Question_ID` int(10) NOT NULL,
  `Question_Desc` varchar(30) DEFAULT NULL,
  `Question_Type` varchar(4) DEFAULT NULL,
  `Question_Course_ID` int(10) DEFAULT NULL,
  `Question_Tobics_ID` int(10) DEFAULT NULL,
  `Question_correct_answer` int(3) DEFAULT NULL,
  `Question_UserID` varchar(20) DEFAULT NULL,
  `Question_Deleted` int(1) DEFAULT NULL,
  `Question_Date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `quizzes`
--

CREATE TABLE `quizzes` (
  `Quiz_ID` int(10) NOT NULL,
  `Quiz_Desc` varchar(30) DEFAULT NULL,
  `Quiz_Course_ID` int(10) DEFAULT NULL,
  `Quiz_UserID` varchar(20) DEFAULT NULL,
  `Quiz_Deleted` int(1) DEFAULT NULL,
  `Quiz_Time_Limit` time DEFAULT NULL,
  `Quiz_Start_Time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Quiz_End_Time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Quiz_Date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `studentanswers`
--

CREATE TABLE `studentanswers` (
  `StudentAnswers_Answer_value` int(10) NOT NULL,
  `StudentAnswers_Quiz_ID` int(10) NOT NULL,
  `StudentAnswers_Question_ID` int(10) NOT NULL,
  `StudentAnswers_Answer_Correction` int(2) DEFAULT NULL,
  `StudentAnswers_UserId` varchar(20) NOT NULL,
  `StudentAnswers_Deleted` int(1) DEFAULT NULL,
  `StudentAnswers_Date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tablesdescription`
--

CREATE TABLE `tablesdescription` (
  `Table_ID` int(2) NOT NULL,
  `Table_Name` varchar(30) DEFAULT NULL,
  `Table_UserID` varchar(20) DEFAULT NULL,
  `Table_Deleted` int(1) DEFAULT NULL,
  `Table_Date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tablesdescription`
--

INSERT INTO `tablesdescription` (`Table_ID`, `Table_Name`, `Table_UserID`, `Table_Deleted`, `Table_Date`) VALUES
(1, 'departments', '9999', NULL, '2017-11-17 23:02:40'),
(2, 'tblusertype', '9999', NULL, '2017-11-17 23:02:40'),
(3, 'tblusers', '9999', NULL, '2017-11-17 23:02:40'),
(4, 'groups', '9999', NULL, '2017-11-17 23:02:40'),
(5, 'passwordtracking', '9999', NULL, '2017-11-17 23:02:40'),
(6, 'Course', '9999', NULL, '2017-11-17 23:02:40'),
(7, 'tobics', '9999', NULL, '2017-11-17 23:02:41'),
(8, 'questions', '9999', NULL, '2017-11-17 23:02:41'),
(9, 'Answers', '9999', NULL, '2017-11-17 23:02:41'),
(10, 'QUIZZES', '9999', NULL, '2017-11-17 23:02:41'),
(11, 'Customquiz', '9999', NULL, '2017-11-17 23:02:41'),
(12, 'Tables_Description', '9999', NULL, '2017-11-17 23:02:41'),
(13, 'LinkedTables', '9999', NULL, '2017-11-17 23:02:41'),
(14, 'Actions_links', '9999', NULL, '2017-11-17 23:02:41'),
(15, 'StudentAnswers', '9999', NULL, '2017-11-17 23:02:41'),
(16, 'GroupAnswers', '9999', NULL, '2017-11-17 23:02:41');

-- --------------------------------------------------------

--
-- Table structure for table `tblusers`
--

CREATE TABLE `tblusers` (
  `TblUsers_SSO` varchar(20) NOT NULL,
  `TblUsers_UserPass` varchar(20) NOT NULL,
  `TblUsers_FirstName` varchar(20) NOT NULL,
  `TblUsers_LastName` varchar(20) NOT NULL,
  `TblUsers_UsertypeID` varchar(5) NOT NULL,
  `TblUsers_Department_ID` int(10) NOT NULL,
  `TblUsers_User_Number` int(10) NOT NULL,
  `TblUsers_Deleted` int(1) DEFAULT NULL,
  `TblUsers_UserDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `TblUsers_Email` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblusers`
--

INSERT INTO `tblusers` (`TblUsers_SSO`, `TblUsers_UserPass`, `TblUsers_FirstName`, `TblUsers_LastName`, `TblUsers_UsertypeID`, `TblUsers_Department_ID`, `TblUsers_User_Number`, `TblUsers_Deleted`, `TblUsers_UserDate`, `TblUsers_Email`) VALUES
('9999', 'Admin', 'Application', 'Admin', 'ADM', 1, 1000, 0, '2017-11-17 23:02:42', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblusertype`
--

CREATE TABLE `tblusertype` (
  `TblUserType_UsertypeID` varchar(5) NOT NULL,
  `TblUserType_UserTypeDesc` varchar(30) NOT NULL,
  `TblUserType_UserID` varchar(20) DEFAULT NULL,
  `TblUserType_Deleted` int(1) DEFAULT NULL,
  `TblUserType_Date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblusertype`
--

INSERT INTO `tblusertype` (`TblUserType_UsertypeID`, `TblUserType_UserTypeDesc`, `TblUserType_UserID`, `TblUserType_Deleted`, `TblUserType_Date`) VALUES
('ADM', 'Admin', '9999', 0, '2017-11-17 23:02:42'),
('INAD', 'Instructor and Admin', '9999', 0, '2017-11-17 23:02:42'),
('INS', 'Instructor', '9999', 0, '2017-11-17 23:02:42'),
('STD', 'Student', '9999', 0, '2017-11-17 23:02:42');

-- --------------------------------------------------------

--
-- Table structure for table `tobics`
--

CREATE TABLE `tobics` (
  `Tobics_ID` int(10) NOT NULL,
  `Tobics_Desc` varchar(20) DEFAULT NULL,
  `Tobics_Course_ID` int(10) DEFAULT NULL,
  `Tobics_UserID` varchar(20) DEFAULT NULL,
  `Tobics_Department_ID` int(10) NOT NULL,
  `Tobics_Deleted` int(1) DEFAULT NULL,
  `Tobics_Date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Tobics_deatils` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `actions_links`
--
ALTER TABLE `actions_links`
  ADD PRIMARY KEY (`Actions_Links_Instructor_ID`,`Actions_Links_Master`,`Actions_Links_Details`,`Actions_Links_LinkedTables_ID`),
  ADD KEY `Actions_Links_LinkedTables_ID` (`Actions_Links_LinkedTables_ID`);

--
-- Indexes for table `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`Answer_ID`),
  ADD KEY `Answer_UserId` (`Answer_UserId`),
  ADD KEY `Answer_Question_ID` (`Answer_Question_ID`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`Course_ID`),
  ADD UNIQUE KEY `Course_code` (`Course_code`),
  ADD KEY `Course_UserID` (`Course_UserID`),
  ADD KEY `Course_Department_ID` (`Course_Department_ID`);

--
-- Indexes for table `customquiz`
--
ALTER TABLE `customquiz`
  ADD PRIMARY KEY (`CustomQuiz_ID`),
  ADD KEY `CustomQuiz_QuizID` (`CustomQuiz_QuizID`),
  ADD KEY `CustomQuiz_UserID` (`CustomQuiz_UserID`),
  ADD KEY `CustomQuiz_QustionID` (`CustomQuiz_QustionID`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`Department_ID`);

--
-- Indexes for table `groupanswers`
--
ALTER TABLE `groupanswers`
  ADD KEY `GroupAnswers_Group_ID` (`GroupAnswers_Group_ID`),
  ADD KEY `GroupAnswers_Quiz_ID` (`GroupAnswers_Quiz_ID`),
  ADD KEY `GroupAnswers_Question_ID` (`GroupAnswers_Question_ID`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`Group_ID`),
  ADD KEY `Group_UserID` (`Group_UserID`);

--
-- Indexes for table `linkedtables`
--
ALTER TABLE `linkedtables`
  ADD PRIMARY KEY (`LinkedTables_ID`),
  ADD KEY `LinkedTables_Master` (`LinkedTables_Master`),
  ADD KEY `LinkedTables_Details` (`LinkedTables_Details`);

--
-- Indexes for table `passwordtracking`
--
ALTER TABLE `passwordtracking`
  ADD PRIMARY KEY (`PasswordTracking_SSO`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`Question_ID`),
  ADD KEY `Question_UserID` (`Question_UserID`),
  ADD KEY `Question_Course_ID` (`Question_Course_ID`),
  ADD KEY `Question_Tobics_ID` (`Question_Tobics_ID`);

--
-- Indexes for table `quizzes`
--
ALTER TABLE `quizzes`
  ADD PRIMARY KEY (`Quiz_ID`),
  ADD KEY `Quiz_UserID` (`Quiz_UserID`),
  ADD KEY `Quiz_Course_ID` (`Quiz_Course_ID`);

--
-- Indexes for table `studentanswers`
--
ALTER TABLE `studentanswers`
  ADD KEY `StudentAnswers_Quiz_ID` (`StudentAnswers_Quiz_ID`),
  ADD KEY `StudentAnswers_UserId` (`StudentAnswers_UserId`),
  ADD KEY `StudentAnswers_Question_ID` (`StudentAnswers_Question_ID`);

--
-- Indexes for table `tablesdescription`
--
ALTER TABLE `tablesdescription`
  ADD PRIMARY KEY (`Table_ID`);

--
-- Indexes for table `tblusers`
--
ALTER TABLE `tblusers`
  ADD PRIMARY KEY (`TblUsers_SSO`),
  ADD KEY `TblUsers_Department_ID` (`TblUsers_Department_ID`),
  ADD KEY `TblUsers_UsertypeID` (`TblUsers_UsertypeID`);

--
-- Indexes for table `tblusertype`
--
ALTER TABLE `tblusertype`
  ADD PRIMARY KEY (`TblUserType_UsertypeID`);

--
-- Indexes for table `tobics`
--
ALTER TABLE `tobics`
  ADD PRIMARY KEY (`Tobics_ID`),
  ADD KEY `Tobics_Course_ID` (`Tobics_Course_ID`),
  ADD KEY `Tobics_UserID` (`Tobics_UserID`),
  ADD KEY `Tobics_Department_ID` (`Tobics_Department_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `answers`
--
ALTER TABLE `answers`
  MODIFY `Answer_ID` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `Course_ID` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customquiz`
--
ALTER TABLE `customquiz`
  MODIFY `CustomQuiz_ID` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `Department_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `Group_ID` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `Question_ID` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quizzes`
--
ALTER TABLE `quizzes`
  MODIFY `Quiz_ID` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tobics`
--
ALTER TABLE `tobics`
  MODIFY `Tobics_ID` int(10) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `actions_links`
--
ALTER TABLE `actions_links`
  ADD CONSTRAINT `actions_links_ibfk_1` FOREIGN KEY (`Actions_Links_Instructor_ID`) REFERENCES `tblusers` (`TblUsers_SSO`),
  ADD CONSTRAINT `actions_links_ibfk_2` FOREIGN KEY (`Actions_Links_LinkedTables_ID`) REFERENCES `linkedtables` (`LinkedTables_ID`);

--
-- Constraints for table `answers`
--
ALTER TABLE `answers`
  ADD CONSTRAINT `answers_ibfk_1` FOREIGN KEY (`Answer_UserId`) REFERENCES `tblusers` (`TblUsers_SSO`),
  ADD CONSTRAINT `answers_ibfk_2` FOREIGN KEY (`Answer_Question_ID`) REFERENCES `questions` (`Question_ID`);

--
-- Constraints for table `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `course_ibfk_1` FOREIGN KEY (`Course_UserID`) REFERENCES `tblusers` (`TblUsers_SSO`),
  ADD CONSTRAINT `course_ibfk_2` FOREIGN KEY (`Course_Department_ID`) REFERENCES `departments` (`Department_ID`);

--
-- Constraints for table `customquiz`
--
ALTER TABLE `customquiz`
  ADD CONSTRAINT `customquiz_ibfk_1` FOREIGN KEY (`CustomQuiz_QuizID`) REFERENCES `quizzes` (`Quiz_ID`),
  ADD CONSTRAINT `customquiz_ibfk_2` FOREIGN KEY (`CustomQuiz_UserID`) REFERENCES `tblusers` (`TblUsers_SSO`),
  ADD CONSTRAINT `customquiz_ibfk_3` FOREIGN KEY (`CustomQuiz_QustionID`) REFERENCES `questions` (`Question_ID`);

--
-- Constraints for table `groupanswers`
--
ALTER TABLE `groupanswers`
  ADD CONSTRAINT `groupanswers_ibfk_1` FOREIGN KEY (`GroupAnswers_Group_ID`) REFERENCES `groups` (`Group_ID`),
  ADD CONSTRAINT `groupanswers_ibfk_2` FOREIGN KEY (`GroupAnswers_Quiz_ID`) REFERENCES `quizzes` (`Quiz_ID`),
  ADD CONSTRAINT `groupanswers_ibfk_3` FOREIGN KEY (`GroupAnswers_Question_ID`) REFERENCES `questions` (`Question_ID`);

--
-- Constraints for table `groups`
--
ALTER TABLE `groups`
  ADD CONSTRAINT `groups_ibfk_1` FOREIGN KEY (`Group_UserID`) REFERENCES `tblusers` (`TblUsers_SSO`);

--
-- Constraints for table `linkedtables`
--
ALTER TABLE `linkedtables`
  ADD CONSTRAINT `linkedtables_ibfk_1` FOREIGN KEY (`LinkedTables_Master`) REFERENCES `tablesdescription` (`Table_ID`),
  ADD CONSTRAINT `linkedtables_ibfk_2` FOREIGN KEY (`LinkedTables_Details`) REFERENCES `tablesdescription` (`Table_ID`);

--
-- Constraints for table `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`Question_UserID`) REFERENCES `tblusers` (`TblUsers_SSO`),
  ADD CONSTRAINT `questions_ibfk_2` FOREIGN KEY (`Question_Course_ID`) REFERENCES `course` (`Course_ID`),
  ADD CONSTRAINT `questions_ibfk_3` FOREIGN KEY (`Question_Tobics_ID`) REFERENCES `tobics` (`Tobics_ID`);

--
-- Constraints for table `quizzes`
--
ALTER TABLE `quizzes`
  ADD CONSTRAINT `quizzes_ibfk_1` FOREIGN KEY (`Quiz_UserID`) REFERENCES `tblusers` (`TblUsers_SSO`),
  ADD CONSTRAINT `quizzes_ibfk_2` FOREIGN KEY (`Quiz_Course_ID`) REFERENCES `course` (`Course_ID`);

--
-- Constraints for table `studentanswers`
--
ALTER TABLE `studentanswers`
  ADD CONSTRAINT `studentanswers_ibfk_1` FOREIGN KEY (`StudentAnswers_Quiz_ID`) REFERENCES `quizzes` (`Quiz_ID`),
  ADD CONSTRAINT `studentanswers_ibfk_2` FOREIGN KEY (`StudentAnswers_UserId`) REFERENCES `tblusers` (`TblUsers_SSO`),
  ADD CONSTRAINT `studentanswers_ibfk_3` FOREIGN KEY (`StudentAnswers_Question_ID`) REFERENCES `questions` (`Question_ID`);

--
-- Constraints for table `tblusers`
--
ALTER TABLE `tblusers`
  ADD CONSTRAINT `tblusers_ibfk_1` FOREIGN KEY (`TblUsers_Department_ID`) REFERENCES `departments` (`Department_ID`),
  ADD CONSTRAINT `tblusers_ibfk_2` FOREIGN KEY (`TblUsers_UsertypeID`) REFERENCES `tblusertype` (`TblUserType_UsertypeID`);

--
-- Constraints for table `tobics`
--
ALTER TABLE `tobics`
  ADD CONSTRAINT `tobics_ibfk_1` FOREIGN KEY (`Tobics_Course_ID`) REFERENCES `course` (`Course_ID`),
  ADD CONSTRAINT `tobics_ibfk_2` FOREIGN KEY (`Tobics_UserID`) REFERENCES `tblusers` (`TblUsers_SSO`),
  ADD CONSTRAINT `tobics_ibfk_3` FOREIGN KEY (`Tobics_Department_ID`) REFERENCES `departments` (`Department_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
