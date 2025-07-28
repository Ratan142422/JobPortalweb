-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 26, 2025 at 05:08 PM
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
-- Table structure for table `job_applications`
--

CREATE TABLE `job_applications` (
  `id` int(11) NOT NULL,
  `job_id` int(11) NOT NULL,
  `applicant_name` varchar(255) NOT NULL,
  `applicant_email` varchar(255) NOT NULL,
  `applicant_phone` varchar(50) NOT NULL,
  `resume_path` varchar(255) NOT NULL,
  `cover_letter` text DEFAULT NULL,
  `applied_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `job_applications`
--

-- INSERT INTO `job_applications` (`id`, `job_id`, `applicant_name`, `applicant_email`, `applicant_phone`, `resume_path`, `cover_letter`, `applied_at`) VALUES
-- (1, 101, 'akshay', 'karn.akshay12@gmail.com', '8235430979', 'uploads/resume_684db6ff08a25.pdf', 'ok', '2025-06-14 17:53:03'),
-- (3, 2, 'Komal Upadhyay', 'komalupad02@gmail.com', '8789280183', 'uploads/resume_684e645d45356.pdf', 'I am student of BCA at NSU', '2025-06-15 06:12:45'),
-- (7, 102, 'Shruti Sharma', 'shrutitvsjsr3128@gmail.com', '6202788149', 'uploads/resume_684e7b76b3566.docx', 'I am bca student at nsu', '2025-06-15 07:51:18'),
-- (8, 112, 'Harsh Pathak', 'pathakharsh584@gmail.com', '9229214413', 'uploads/resume_684ea2cba3889.pdf', 'i am a btech student at AJU', '2025-06-15 10:39:07'),
-- (9, 1, 'Akshay Karn', 'karn.akshay12@gmail.com', '8235430979', 'uploads/resume_68562ab9c372c.pdf', 'TEST', '2025-06-21 03:44:57'),
-- (26, 9, 'AKSHAY KARN', 'karn.akshay12@gmail.com', '08235430979', 'uploads/resume_685a45eb2349d.pdf', 'test', '2025-06-24 06:30:03'),
-- (27, 9, 'AKSHAY KARN', 'karn.akshay12@gmail.com', '08235430979', 'uploads/resume_685a46b88c8fc.pdf', 'test', '2025-06-24 06:33:28'),
-- (28, 9, 'AKSHAY KARN', 'karn.akshay12@gmail.com', '08235430979', 'uploads/resume_685ac863b62f1.pdf', 'test', '2025-06-24 15:46:43'),
-- (29, 7, 'AKSHAY KARN', 'karn.akshay12@gmail.com', '08235430979', 'uploads/resume_685aca47e27a0.pdf', 'i wanna join in as an Hr manager', '2025-06-24 15:54:47'),
-- (30, 7, 'AKSHAY KARN', 'karn.akshay12@gmail.com', '08235430979', 'uploads/resume_685acb351c227.pdf', 'i wanna join in as an Hr manager', '2025-06-24 15:58:45'),
-- (31, 16, 'AKSHAY KARN', 'karn.akshay12@gmail.com', '08235430979', 'uploads/resume_685acb6b480a5.pdf', 'i wanna join in as a Senior Frontend Developer', '2025-06-24 15:59:39');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `job_applications`
--
ALTER TABLE `job_applications`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `job_applications`
--
ALTER TABLE `job_applications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
