-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 05, 2017 at 01:59 AM
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

--
-- Dumping data for table `answers`
--

INSERT INTO `answers` (`Answer_ID`, `Answer_Desc`, `Answer_Question_ID`, `Answer_UserId`, `Answer_Deleted`, `Answer_Date`) VALUES
(1, 'An event is an object that des', 9, '9999', 0, '2017-12-03 23:57:20'),
(2, 'An event is an object that des', 9, 'sami88', 0, '2017-12-03 23:57:39'),
(3, 'An event is an object that des', 9, 'Ahmd101', 0, '2017-12-03 23:58:01'),
(4, 'An event is a class used for d', 9, 'sami88', 0, '2017-12-03 23:58:44'),
(5, 'A group of objects', 14, 'noad01', 0, '2017-12-04 00:00:10'),
(6, 'A group of classes', 14, 'sami88', 0, '2017-12-04 00:00:26'),
(7, 'A group of interfaces', 14, 'ret42i', 0, '2017-12-04 00:01:14'),
(8, 'None of the mentioned', 14, 'wjou92', 0, '2017-12-04 00:01:40'),
(9, '-128 to 127', 5, 'Ahmd101', 0, '2017-12-04 00:02:59'),
(10, '-32768 to 32767', 5, 'sami88', 0, '2017-12-04 00:03:34'),
(11, '-2147483648 to 2147483647', 5, 'wjou92', 0, '2017-12-04 00:04:17'),
(12, 'abs()', 11, 'xla87k', 0, '2017-12-04 00:15:26'),
(13, 'absolute()', 11, 'ret42i', 0, '2017-12-04 00:15:47'),
(14, 'absolutevariable()', 11, 'Ahmd101', 0, '2017-12-04 00:16:17'),
(15, 'Box obj = new Box();', 19, '9999', 0, '2017-12-04 00:20:41'),
(16, 'Box obj = new Box;', 19, 'jkv2c9', 0, '2017-12-04 00:21:02'),
(17, 'obj = new Box();', 19, 'frd39m', 0, '2017-12-04 00:21:21'),
(18, 'new Box obj;', 19, 'ret42i', 0, '2017-12-04 00:21:42'),
(19, 'None of the mentioned', 5, 'Afa85g', 0, '2017-12-04 00:23:22'),
(20, 'None of the mentioned', 11, 'Afa85g', 0, '2017-12-04 00:23:42'),
(21, 'Math', 10, 'jkv2c9', 0, '2017-12-04 00:28:16'),
(22, 'Process', 10, 'frd39m', 0, '2017-12-04 00:28:34'),
(23, 'System', 10, 'noad01', 0, '2017-12-04 00:28:54'),
(24, 'Object', 10, 'jkv2c9', 0, '2017-12-04 00:29:15'),
(25, 'Serialization', 15, 'jkv2c9', 0, '2017-12-04 00:31:01'),
(26, 'Externalization', 15, 'jkv2c9', 0, '2017-12-04 00:31:22'),
(27, 'File Filtering', 15, 'jkv2c9', 0, '2017-12-04 00:31:49'),
(28, 'All of the mentioned', 15, 'jkv2c9', 0, '2017-12-04 00:32:10'),
(29, 'pkg', 17, 'frd39m', 0, '2017-12-04 00:34:46'),
(30, 'Pkg', 17, 'frd39m', 0, '2017-12-04 00:35:04'),
(31, 'package', 17, 'noad01', 0, '2017-12-04 00:35:24'),
(32, 'Package', 17, 'noad01', 0, '2017-12-04 00:35:36'),
(33, 'malloc', 20, 'jkv2c9', 0, '2017-12-04 00:37:36'),
(34, 'alloc', 20, 'jkv2c9', 0, '2017-12-04 00:37:47'),
(35, 'new', 20, 'noad01', 0, '2017-12-04 00:38:03'),
(36, 'give', 20, 'frd39m', 0, '2017-12-04 00:38:33'),
(37, 'java.lang', 13, 'jkv2c9', 0, '2017-12-04 00:39:59'),
(38, 'java.util', 13, 'jkv2c9', 0, '2017-12-04 00:40:17'),
(39, 'java.net', 13, 'jkv2c9', 0, '2017-12-04 00:40:34'),
(40, 'java.awt', 13, 'jkv2c9', 0, '2017-12-04 00:40:58'),
(41, 'java.applet', 8, 'jkv2c9', 0, '2017-12-04 00:42:37'),
(42, 'java.awt', 8, 'jkv2c9', 0, '2017-12-04 00:42:57'),
(43, 'java.event', 8, 'jkv2c9', 0, '2017-12-04 00:43:37'),
(44, 'java.awt.event', 8, 'jkv2c9', 0, '2017-12-04 00:44:01'),
(45, 'Serialization', 16, 'jkv2c9', 0, '2017-12-04 00:45:37'),
(46, 'Garbage collection', 16, 'jkv2c9', 0, '2017-12-04 00:46:11'),
(47, 'File Filtering', 16, 'noad01', 0, '2017-12-04 00:46:31'),
(48, 'All of the mentioned', 16, 'jkv2c9', 0, '2017-12-04 00:46:55'),
(49, '-128 to 127', 4, 'jkv2c9', 0, '2017-12-04 00:48:36'),
(50, '-32768 to 32767', 4, 'jkv2c9', 0, '2017-12-04 00:48:54'),
(51, '-2147483648 to 2147483647', 4, 'jkv2c9', 0, '2017-12-04 00:49:21'),
(52, 'None of the mentioned', 4, 'jkv2c9', 0, '2017-12-04 00:49:39'),
(53, 'Public', 18, 'wjou92', 0, '2017-12-04 00:50:52'),
(54, 'Protected', 18, 'jkv2c9', 0, '2017-12-04 00:51:10'),
(55, 'No Modifier', 18, 'jkv2c9', 0, '2017-12-04 00:51:34'),
(56, 'All of the mentioned', 18, 'jkv2c9', 0, '2017-12-04 00:51:55');

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `Course_ID` int(10) NOT NULL,
  `Course_code` varchar(20) DEFAULT NULL,
  `Course_Desc` varchar(40) DEFAULT NULL,
  `Course_year` int(4) DEFAULT NULL,
  `Course_Semster` varchar(3) DEFAULT NULL,
  `Course_Time` varchar(2) DEFAULT NULL,
  `Course_Department_ID` int(10) NOT NULL,
  `Course_UserID` varchar(20) NOT NULL,
  `Course_Deleted` int(1) DEFAULT NULL,
  `Course_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`Course_ID`, `Course_code`, `Course_Desc`, `Course_year`, `Course_Semster`, `Course_Time`, `Course_Department_ID`, `Course_UserID`, `Course_Deleted`, `Course_date`) VALUES
(1, 'CMP SCI 5012', 'Enterprise Web Development', 2017, 'FS', 'E', 3, '9999', 0, '2017-11-22 01:16:13'),
(2, 'CMP SCI 4010', 'Advanced Web Development with Java', 2017, 'SP', 'E', 3, '9999', 0, '2017-12-03 17:06:49'),
(3, 'CMP SCI 4250', 'Programming Languages', 2018, 'FS', 'D', 3, '9999', 0, '2017-12-03 17:26:10'),
(4, 'CMP SCI 5700', 'Computer Systems', 2018, 'FS', 'DE', 3, '9999', 0, '2017-12-03 17:33:11'),
(5, 'CMP SCI 6320', 'Advances in Evolutionary Computation', 2018, 'MS', 'DE', 3, '9999', 0, '2017-12-03 17:39:54'),
(6, 'CMP SCI 5320', 'Introduction to Evolutionary Computation', 2018, 'SP', 'D', 3, '9999', 0, '2017-12-03 17:41:44'),
(7, 'CMP SCI 5500', 'Software Engineering', 2017, 'MS', 'E', 3, '9999', 0, '2017-12-03 17:42:54');

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
(1, 'HQ', 'Headquarter', '9999', 0, '2017-11-17 23:02:42'),
(2, 'ADMN', 'Administration', '9999', 0, '2017-11-22 01:14:33'),
(3, 'CS', 'Computer Science', '9999', 0, '2017-11-22 01:14:34'),
(4, 'MTS', 'Math and Statistics', '9999', 0, '2017-11-22 01:14:34'),
(5, 'PHY', 'Pharmacy', '9999', 0, '2017-11-22 01:14:34'),
(6, 'EDU', 'Education', '9999', 0, '2017-11-22 01:14:34');

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
  `Group_Desc` varchar(50) DEFAULT NULL,
  `Group_UserID` varchar(20) DEFAULT NULL,
  `Group_CourseID` int(10) DEFAULT NULL,
  `Group_Deleted` int(1) DEFAULT NULL,
  `Group_Date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`Group_ID`, `Group_Desc`, `Group_UserID`, `Group_CourseID`, `Group_Deleted`, `Group_Date`) VALUES
(1, 'First Group', 'Afa85g', 2, 0, '2017-12-03 23:32:04'),
(2, 'Second Group', 'Afa85g', 1, 0, '2017-12-03 23:32:26'),
(3, 'First Group', 'jkv2c9', 3, 0, '2017-12-03 23:32:56'),
(4, 'Second Group', 'sami88', 6, 0, '2017-12-03 23:33:50'),
(5, 'Third Group', 'sami88', 7, 0, '2017-12-03 23:34:20'),
(6, 'Group # 1', 'jkv2c9', 4, 0, '2017-12-03 23:34:57'),
(7, 'Group # 2', 'jkv2c9', 5, 0, '2017-12-03 23:35:03'),
(8, 'Group # 3', 'jkv2c9', 2, 0, '2017-12-03 23:35:18'),
(9, 'Group # 4', 'jkv2c9', 3, 0, '2017-12-03 23:35:26');

-- --------------------------------------------------------

--
-- Table structure for table `keywords`
--

CREATE TABLE `keywords` (
  `KeyWords_ID` int(10) NOT NULL,
  `KeyWords_QuestionID` int(10) DEFAULT NULL,
  `KeyWords_Desc` varchar(10) DEFAULT NULL,
  `KeyWords_UserID` varchar(20) DEFAULT NULL,
  `KeyWords_Deleted` int(1) DEFAULT NULL,
  `KeyWords_Date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `keywords`
--

INSERT INTO `keywords` (`KeyWords_ID`, `KeyWords_QuestionID`, `KeyWords_Desc`, `KeyWords_UserID`, `KeyWords_Deleted`, `KeyWords_Date`) VALUES
(2, 9, 'event', 'afa85g', 0, '2017-12-03 23:24:36'),
(3, 9, 'delegation', 'afa85g', 0, '2017-12-03 23:24:51'),
(4, 14, 'collection', 'afa85g', 0, '2017-12-03 23:25:00'),
(5, 14, 'java', 'afa85g', 0, '2017-12-03 23:25:10'),
(6, 5, 'byte', 'afa85g', 0, '2017-12-03 23:25:17'),
(7, 5, 'range', 'afa85g', 0, '2017-12-03 23:25:28'),
(8, 4, 'range', 'afa85g', 0, '2017-12-03 23:25:35'),
(9, 4, 'short', 'afa85g', 0, '2017-12-03 23:25:46'),
(10, 11, 'absolute', 'afa85g', 0, '2017-12-03 23:25:55'),
(11, 11, 'return', 'afa85g', 0, '2017-12-03 23:26:16'),
(12, 18, 'access', 'afa85g', 0, '2017-12-03 23:39:53'),
(13, 18, 'specifies', 'afa85g', 0, '2017-12-03 23:40:08'),
(14, 8, 'packages', 'afa85g', 0, '2017-12-03 23:40:18'),
(15, 8, 'classes', 'afa85g', 0, '2017-12-03 23:40:25'),
(16, 13, 'packages', 'afa85g', 0, '2017-12-03 23:40:34'),
(17, 17, 'packages', 'afa85g', 0, '2017-12-03 23:40:46'),
(18, 10, 'class', 'afa85g', 0, '2017-12-03 23:40:54'),
(19, 10, 'rounding', 'afa85g', 0, '2017-12-03 23:41:02');

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
(0, 3, 7, '9999', 0, '2017-12-04 16:15:22'),
(100, 10, 8, '9999', 0, '2017-11-17 23:02:41'),
(200, 10, 4, '9999', 0, '2017-11-17 23:02:41'),
(300, 10, 3, '9999', 0, '2017-11-17 23:02:41'),
(400, 4, 3, '9999', 0, '2017-11-17 23:02:41'),
(500, 3, 6, '9999', 0, '2017-11-17 23:02:41'),
(600, 6, 7, '9999', 0, '2017-12-04 01:52:04');

-- --------------------------------------------------------

--
-- Table structure for table `passwordtracking`
--

CREATE TABLE `passwordtracking` (
  `PasswordTracking_SSO` varchar(20) NOT NULL,
  `PasswordTracking_TryNO` int(2) DEFAULT NULL,
  `PasswordTracking_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `passwordtracking`
--

INSERT INTO `passwordtracking` (`PasswordTracking_SSO`, `PasswordTracking_TryNO`, `PasswordTracking_DATE`) VALUES
('9999', 0, '2017-12-03 19:51:35'),
('Afa85g', 0, '2017-12-03 19:51:35'),
('Ahmd101', 0, '2017-12-03 19:51:35'),
('frd39m', 0, '2017-12-03 19:51:35'),
('jkv2c9', 0, '2017-12-03 19:51:35'),
('noad01', 0, '2017-12-03 19:51:35'),
('ret42i', 0, '2017-12-03 19:51:35'),
('sami88', 0, '2017-12-03 19:51:35'),
('wjou92', 0, '2017-12-03 19:51:35'),
('xla87k', 0, '2017-12-03 19:51:35');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `Question_ID` int(10) NOT NULL,
  `Question_Desc` varchar(255) DEFAULT NULL,
  `Question_Course_ID` int(10) DEFAULT NULL,
  `Question_Tobics_ID` int(10) DEFAULT NULL,
  `Question_correct_answer` int(3) DEFAULT NULL,
  `Question_UserID` varchar(20) DEFAULT NULL,
  `Question_Deleted` int(1) DEFAULT NULL,
  `Question_Date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`Question_ID`, `Question_Desc`, `Question_Course_ID`, `Question_Tobics_ID`, `Question_correct_answer`, `Question_UserID`, `Question_Deleted`, `Question_Date`) VALUES
(4, 'What is the range of short data type in Java?', 1, 2, 2, 'jkv2c9', 0, '2017-12-03 22:59:04'),
(5, 'What is the range of byte data type in Java?', 1, 2, 1, 'jkv2c9', 0, '2017-12-03 23:00:08'),
(8, 'Which of these packages contains all the classes and methods required for even handling in Java?', 2, 2, 4, '9999', 0, '2017-12-03 23:02:29'),
(9, 'What is an event in delegation event model used by Java programming language?', 2, 2, 1, '9999', 0, '2017-12-03 23:05:39'),
(10, 'Which of these class provides various types of rounding functions?', 2, 3, 1, 'sami88', 0, '2017-12-03 23:07:10'),
(11, 'Which of function return absolute value of a variable?', 2, 3, 1, 'sami88', 0, '2017-12-03 23:07:44'),
(13, 'Which of these packages contain all the collection classes?', 3, 2, 2, 'Afa85g', 0, '2017-12-03 23:08:54'),
(14, 'What is Collection in Java?', 3, 2, 1, 'Afa85g', 0, '2017-12-03 23:09:32'),
(15, 'Which of these is a process of writing the state of an object to a byte stream?', 3, 15, 1, 'jkv2c9', 0, '2017-12-03 23:18:33'),
(16, 'Which of these process occur automatically by java run time system?', 3, 16, 1, 'jkv2c9', 0, '2017-12-03 23:19:09'),
(17, 'Which of these keywords is used to define packages in Java?', 1, 7, 3, 'jkv2c9', 0, '2017-12-03 23:20:58'),
(18, 'Which of this access specifies can be used for a class so that its members can be accessed by a different class in the same package?', 1, 6, 4, 'jkv2c9', 0, '2017-12-03 23:21:37'),
(19, 'Which of the following is a valid declaration of an object of class Box?', 2, 11, 1, 'Afa85g', 0, '2017-12-03 23:23:00'),
(20, 'Which of these operators is used to allocate memory for an object?', 2, 12, 3, 'Afa85g', 0, '2017-12-03 23:23:38');

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

--
-- Dumping data for table `quizzes`
--

INSERT INTO `quizzes` (`Quiz_ID`, `Quiz_Desc`, `Quiz_Course_ID`, `Quiz_UserID`, `Quiz_Deleted`, `Quiz_Time_Limit`, `Quiz_Start_Time`, `Quiz_End_Time`, `Quiz_Date`) VALUES
(1, 'Topic 1 quize', 1, 'Afa85g', 0, '00:15:00', '2017-12-04 23:30:00', '2017-12-03 23:45:00', '2017-12-03 23:38:51'),
(2, 'Topic 2 quize', 1, 'Afa85g', 0, '00:15:00', '2017-12-06 23:30:00', '2017-12-06 23:45:00', '2017-12-03 23:39:36'),
(3, 'Topic 2 quize', 2, 'jkv2c9', 0, '00:15:00', '2017-12-13 00:00:00', '2017-12-13 00:10:00', '2017-12-03 23:45:27'),
(4, 'Topic 3 quize', 3, 'jkv2c9', 0, '00:15:00', '2017-12-13 00:00:00', '2017-12-13 00:10:00', '2017-12-03 23:45:49');

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
(1, 'departments', '9999', 0, '2017-11-17 23:02:40'),
(2, 'tblusertype', '9999', 0, '2017-11-17 23:02:40'),
(3, 'tblusers', '9999', 0, '2017-11-17 23:02:40'),
(4, 'groups', '9999', 0, '2017-11-17 23:02:40'),
(5, 'passwordtracking', '9999', 0, '2017-11-17 23:02:40'),
(6, 'Course', '9999', 0, '2017-11-17 23:02:40'),
(7, 'tobics', '9999', 0, '2017-11-17 23:02:41'),
(8, 'questions', '9999', 0, '2017-11-17 23:02:41'),
(9, 'Answers', '9999', 0, '2017-11-17 23:02:41'),
(10, 'QUIZZES', '9999', 0, '2017-11-17 23:02:41'),
(11, 'Customquiz', '9999', 0, '2017-11-17 23:02:41'),
(12, 'Tables_Description', '9999', 0, '2017-11-17 23:02:41'),
(13, 'LinkedTables', '9999', 0, '2017-11-17 23:02:41'),
(14, 'Actions_links', '9999', 0, '2017-11-17 23:02:41'),
(15, 'StudentAnswers', '9999', 0, '2017-11-17 23:02:41'),
(16, 'GroupAnswers', '9999', 0, '2017-11-17 23:02:41'),
(17, 'keywords', '9999', 0, '2017-12-03 23:20:39');

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
('9999', 'Admin', 'Application', 'Admin', 'ADM', 1, 1000, 0, '2017-11-17 23:02:42', NULL),
('Afa85g', '123456', 'Aladdin', 'Alakhras', 'INAD', 3, 1111, 0, '2017-12-03 17:49:59', 'afa85g@mail.umsl.edu'),
('Ahmd101', '123456', 'Ahmed', 'Alakhras', 'STD', 3, 20020, 0, '2017-12-03 18:24:35', 'lawranc@hotmail.com'),
('frd39m', '123456', 'Fernando', 'Gomeze', 'STD', 3, 44083, 0, '2017-12-03 19:31:25', 'lawranc@hotmail.com'),
('jkv2c9', 'ins', 'josh', 'veal', 'INS', 1, 18114709, 0, '2017-11-22 02:13:18', 'kingdomhearts227@yahoo.com'),
('noad01', '123456', 'Novano', 'Ghadeer', 'STD', 3, 56789, 0, '2017-12-03 18:41:14', 'lawranc@hotmail.com'),
('ret42i', '123456', 'rateb', 'kabalo', 'STD', 3, 90112, 0, '2017-12-03 18:28:45', 'lawranc@hotmail.com'),
('sami88', '1234', 'Sami', 'saloom', 'INS', 3, 2002, 0, '2017-12-03 17:54:33', 'lawranc@hotmail.com'),
('wjou92', '123456', 'Kevin', 'Sarmado', 'STD', 3, 2345, 0, '2017-12-03 18:26:17', 'lawranc@hotmail.com'),
('xla87k', '123456', 'Alex', 'Hakano', 'STD', 3, 4531, 0, '2017-12-03 18:42:18', 'lawranc@hotmail.com');

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
  `Tobics_Desc` varchar(40) DEFAULT NULL,
  `Tobics_Course_ID` int(10) DEFAULT NULL,
  `Tobics_UserID` varchar(20) DEFAULT NULL,
  `Tobics_Department_ID` int(10) NOT NULL,
  `Tobics_Deleted` int(1) DEFAULT NULL,
  `Tobics_Date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Tobics_Details` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tobics`
--

INSERT INTO `tobics` (`Tobics_ID`, `Tobics_Desc`, `Tobics_Course_ID`, `Tobics_UserID`, `Tobics_Department_ID`, `Tobics_Deleted`, `Tobics_Date`, `Tobics_Details`) VALUES
(2, 'Introduction', 1, 'Afa85g', 3, 0, '2017-12-03 20:16:06', 0),
(3, 'Introduction', 2, 'jkv2c9', 3, 0, '2017-12-03 20:17:01', 1),
(4, 'Introduction', 3, 'sami88', 3, 0, '2017-12-03 20:24:35', 2),
(5, 'Servlets', 1, 'Afa85g', 3, 0, '2017-12-03 20:55:07', 1),
(6, 'Beans', 1, 'Afa85g', 3, 0, '2017-12-03 20:55:21', 1),
(7, 'TSL', 1, 'jkv2c9', 3, 0, '2017-12-03 21:01:48', 1),
(8, 'JDBConnection', 1, 'jkv2c9', 3, 0, '2017-12-03 21:02:31', 1),
(9, 'Ajax', 1, 'sami88', 3, 0, '2017-12-03 21:03:43', 1),
(10, 'HTML,CSS', 2, 'jkv2c9', 3, 0, '2017-12-03 21:26:17', 1),
(11, 'Java servlet pages JSP', 2, 'Afa85g', 3, 0, '2017-12-03 21:28:04', 1),
(12, 'Wep Project', 2, 'Afa85g', 3, 0, '2017-12-03 21:28:29', 1),
(13, 'Java  standard edition ', 2, 'sami88', 3, 0, '2017-12-03 21:30:09', 1),
(14, 'Java Enterprise Edition', 2, 'sami88', 3, 0, '2017-12-03 21:31:38', 1),
(15, 'Object Orinted', 3, 'jkv2c9', 3, 0, '2017-12-03 21:40:42', 1),
(16, 'C++', 3, 'jkv2c9', 3, 0, '2017-12-03 21:40:55', 1);

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
  ADD KEY `Group_UserID` (`Group_UserID`),
  ADD KEY `Group_CourseID` (`Group_CourseID`);

--
-- Indexes for table `keywords`
--
ALTER TABLE `keywords`
  ADD PRIMARY KEY (`KeyWords_ID`),
  ADD KEY `KeyWords_QuestionID` (`KeyWords_QuestionID`),
  ADD KEY `KeyWords_UserID` (`KeyWords_UserID`);

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
  MODIFY `Answer_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `Course_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `customquiz`
--
ALTER TABLE `customquiz`
  MODIFY `CustomQuiz_ID` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `Department_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `Group_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `keywords`
--
ALTER TABLE `keywords`
  MODIFY `KeyWords_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `Question_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `quizzes`
--
ALTER TABLE `quizzes`
  MODIFY `Quiz_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tobics`
--
ALTER TABLE `tobics`
  MODIFY `Tobics_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

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
  ADD CONSTRAINT `groups_ibfk_1` FOREIGN KEY (`Group_UserID`) REFERENCES `tblusers` (`TblUsers_SSO`),
  ADD CONSTRAINT `groups_ibfk_2` FOREIGN KEY (`Group_CourseID`) REFERENCES `course` (`Course_ID`);

--
-- Constraints for table `keywords`
--
ALTER TABLE `keywords`
  ADD CONSTRAINT `keywords_ibfk_1` FOREIGN KEY (`KeyWords_UserID`) REFERENCES `tblusers` (`TblUsers_SSO`);

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
