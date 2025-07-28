-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 26, 2025 at 05:07 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `job_portal`
--

-- --------------------------------------------------------

--
-- Table structure for table `recruiter_jobs`
--

CREATE TABLE `recruiter_jobs` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `company` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `salary` varchar(100) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `experience` varchar(100) DEFAULT NULL,
  `skills` text DEFAULT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `number_of_candidates` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
COMMIT;
--
-- Dumping data for table `recruiter_jobs`
--

INSERT INTO `recruiter_jobs` (`id`, `title`, `company`, `location`, `salary`, `type`, `experience`, `skills`, `description`, `created_at`, `number_of_candidates`) VALUES
(1, 'Human Resource Manager', 'Tata Motors', 'Jamshedpur, Jharkhand', NULL, 'Full-time', '3 yrs', 'HR Management, Screening Resume, Strong Communication, Hiring', 'We are looking for an experienced HR Manager to join our dynamic team.', '2025-06-21 13:22:23', 0),
(2, 'Human Resource Manager', 'Tata Motors', 'Jamshedpur, Jharkhand', NULL, 'Full-time', '3 yrs', 'HR Management, Screening Resume, Strong Communication, Hiring', 'We are looking for an experienced HR Manager to join our dynamic team.', '2025-06-21 13:37:04', 0),
(3, 'Human Resource Manager', 'Tata Steel', 'Jamshedpur, Jharkhand', NULL, 'Full-time', '3 yrs', 'HR Management, Screening Resume, Strong Communication, Hiring', 'We are looking for an experienced HR Manager to join our dynamic team.', '2025-06-21 13:39:35', 0),
(4, 'Human Resource Manager', 'Tata Steel', 'Jamshedpur, Jharkhand', NULL, 'Full-time', '3 yrs', 'HR Management, Screening Resume, Strong Communication, Hiring', 'We are looking for an experienced HR Manager to join our dynamic team.', '2025-06-21 13:39:42', 0),
(5, 'Frontend Developer', 'Microsoft', 'Banglore', NULL, 'Full-time', '5yrs', 'HTML, CSS, JavaScript, React , Artificial Intelligent', 'We are looking for an experienced front-end developer to join our dynamic team.', '2025-06-21 14:15:00', 0),
(6, 'Full Stack Developer', 'Google', 'Banglore', NULL, 'Full-time', '5yrs', 'Frontend development, Backend development , Artificial Intelligent', 'We are looking for an experienced full stack developer to join our dynamic team.', '2025-06-21 14:58:27', 0),
(7, 'Project Manager', 'Cognizant', 'Pune, Maharastra', NULL, 'Full-time', '2yrs', 'Leading, Communication, Team Management', 'We are looking for an experienced Project Manager to join our dynamic team.', '2025-06-21 15:38:08', 12),
(8, 'HR Manager', 'Tata Motors', 'Jamshedpur, Jharkhand', NULL, 'Full-time', '2yrs', 'HR Management, Strong Communication, Team Management, Screening Resume, Hiring', 'We are looking for an experienced HR Manager to join our dynamic team.', '2025-06-21 15:48:43', 0),
(9, 'HR Manager', 'Tata Motors', 'Jamshedpur, Jharkhand', NULL, 'Full-time', '3yrs', 'HR Management, Strong Communication, Team Management, Screening Resume, Hiring', 'We are looking for an experienced HR Manager to join our dynamic team.', '2025-06-24 05:31:46', 0),
(10, 'CHRO', 'JSPL', 'Angul, Odisha', NULL, 'Full-time', '15 yrs', 'HR Development, Leadership, Team Management, Screening Resume, Hiring', 'We are looking for an experienced CHRO to join our dynamic team.', '2025-06-24 05:33:59', 1),
(11, 'CHRO', 'JSPL', 'Angul, Odisha', NULL, 'Full-time', '15 yrs', 'HR Development, Leadership, Team Management, Screening Resume, Hiring', 'We are looking for an experienced CHRO to join our dynamic team.', '2025-06-24 05:35:05', 1),
(12, 'Software Engineer', 'Wipro', 'Bangalore, Karnataka', NULL, 'Full-time', '5 yrs', 'Software tools, technical skills', 'We are looking for an experienced HR Manager to join our dynamic team', '2025-06-24 05:43:33', 1),
(13, 'Data Analyst', 'Wipro', 'Bangalore, Karnataka', '110000', 'Full-time', '5 yrs', 'Software tools, technical skills', 'We are looking for an experienced data analyst to join our dynamic team', '2025-06-24 05:57:50', 1),
(14, 'Cloud Architect', 'Cloud Innovators', 'Remote', '2500000', 'Full-time', '5-8 yrs', 'AWS, Azure, GCP, Kubernetes', 'Design and implement cloud infrastructure solutions for enterprise clients.', '2025-06-24 06:29:14', 1),
(15, 'HR Manager', 'Tata Motors', 'Jamshedpur, Jharkhand', '500000', 'Full-time', '0-2 yrs', 'HR Management, Strong Communication, Screening Resumes, Hiring', 'We are looking for an experienced HR Manager to join our dynamic team.', '2025-06-24 06:33:16', 1),
(16, 'Senior Frontend Developer', 'Google', 'Bangalore, Karnataka', '4500000', 'Full-time', '5-8 yrs', 'HTML, CSS. JavaScript, PHP, React, Node.js', 'We are looking for an experienced Senior Frontend Developer to join our dynamic Full Stack team.', '2025-06-24 15:58:37', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `recruiter_jobs`
--
ALTER TABLE `recruiter_jobs`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `recruiter_jobs`
--
ALTER TABLE `recruiter_jobs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
