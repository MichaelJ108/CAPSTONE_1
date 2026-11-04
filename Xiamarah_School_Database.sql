-- UPDATED VERSION: grade_details now references transmutation_table through transmutation_id.
-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 14, 2026 at 04:15 AM
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
-- Database: `xiamarah_school_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `achievements`
--

CREATE TABLE `achievements` (
  `achievement_id` int(11) NOT NULL,
  `achievement_name` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `activities`
--

CREATE TABLE `activities` (
  `activity_id` int(11) NOT NULL,
  `activity_type_id` int(11) NOT NULL,
  `quarter_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `title` varchar(150) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `total_points` decimal(6,2) DEFAULT NULL,
  `status` enum('Active','Closed') DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `activity_types`
--

CREATE TABLE `activity_types` (
  `activity_type_id` int(11) NOT NULL,
  `type_name` varchar(50) NOT NULL,
  `weight` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `announcements`
--

CREATE TABLE `announcements` (
  `announcement_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `audience_id` int(11) NOT NULL,
  `content` text DEFAULT NULL,
  `title` varchar(150) DEFAULT NULL,
  `publish_date` datetime DEFAULT NULL,
  `status` enum('Draft','Scheduled','Published') DEFAULT 'Draft'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attendances`
--

CREATE TABLE `attendances` (
  `attendance_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `quarter_id` int(11) NOT NULL,
  `attendance_status_id` int(11) NOT NULL,
  `attendance_date` date NOT NULL,
  `remarks` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attendance_statuses`
--

CREATE TABLE `attendance_statuses` (
  `attendance_status_id` int(11) NOT NULL,
  `status_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `attendance_statuses`
--

INSERT INTO `attendance_statuses` (`attendance_status_id`, `status_name`) VALUES
(2, 'Absent'),
(4, 'Excused'),
(3, 'Late'),
(1, 'Present');

-- --------------------------------------------------------

--
-- Table structure for table `audience`
--

CREATE TABLE `audience` (
  `audience_id` int(11) NOT NULL,
  `audience_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `audience`
--

INSERT INTO `audience` (`audience_id`, `audience_name`) VALUES
(1, 'All'),
(2, 'Parents'),
(4, 'Staff'),
(3, 'Teachers');

-- --------------------------------------------------------

--
-- Table structure for table `behavior_records`
--

CREATE TABLE `behavior_records` (
  `behavior_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `school_year_id` int(11) NOT NULL,
  `quarter_id` int(11) NOT NULL,
  `record_date` date NOT NULL,
  `behavior_type` enum('Positive','Needs Improvement') NOT NULL,
  `remarks` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `billing`
--

CREATE TABLE `billing` (
  `billing_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `school_year_id` int(11) NOT NULL,
  `amount_due` decimal(10,2) DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `status` enum('Paid','Partial','Unpaid') DEFAULT 'Unpaid'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `class_schedules`
--

CREATE TABLE `class_schedules` (
  `schedule_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `day_id` int(11) NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `days`
--

CREATE TABLE `days` (
  `day_id` int(11) NOT NULL,
  `day_name` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `days`
--

INSERT INTO `days` (`day_id`, `day_name`) VALUES
(5, 'Friday'),
(1, 'Monday'),
(4, 'Thursday'),
(2, 'Tuesday'),
(3, 'Wednesday');

-- --------------------------------------------------------

--
-- Table structure for table `document_type`
--

CREATE TABLE `document_type` (
  `document_type_id` int(11) NOT NULL,
  `document_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `enrollments`
--

CREATE TABLE `enrollments` (
  `enrollment_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `grade_level_id` int(11) NOT NULL,
  `school_year_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `enrollment_type_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `enrollment_type`
--

CREATE TABLE `enrollment_type` (
  `enrollment_type_id` int(11) NOT NULL,
  `enrollment_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `event_id` int(11) NOT NULL,
  `school_year_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(150) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `event_type` enum('Exam Week','School Event','Deadline','Enrollment') DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `genders`
--

CREATE TABLE `genders` (
  `gender_id` int(11) NOT NULL,
  `gender_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `genders`
--

INSERT INTO `genders` (`gender_id`, `gender_name`) VALUES
(2, 'Female'),
(1, 'Male');

-- --------------------------------------------------------

--
-- Table structure for table `grades`
--

CREATE TABLE `grades` (
  `grade_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `school_year_id` int(11) NOT NULL,
  `quarter_id` int(11) NOT NULL,
  `remarks` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `grade_details`
--

CREATE TABLE `grade_details` (
  `grade_detail_id` int(11) NOT NULL,
  `grade_id` int(11) NOT NULL,
  `activity_type_id` int(11) NOT NULL,
  `transmutation_id` int(11) DEFAULT NULL,
  `raw_grade` decimal(5,2) DEFAULT NULL,
  `transmuted_grade` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `grade_levels`
--

CREATE TABLE `grade_levels` (
  `grade_level_id` int(11) NOT NULL,
  `grade_name` varchar(30) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `grade_levels`
--

INSERT INTO `grade_levels` (`grade_level_id`, `grade_name`, `description`) VALUES
(1, 'Grade 1', NULL),
(2, 'Grade 2', NULL),
(3, 'Grade 3', NULL),
(4, 'Grade 4', NULL),
(5, 'Grade 5', NULL),
(6, 'Grade 6', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `guardians`
--

CREATE TABLE `guardians` (
  `guardian_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `gender_id` int(11) NOT NULL,
  `marital_status_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `middle_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) NOT NULL,
  `contact_number` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `guardian_relationship`
--

CREATE TABLE `guardian_relationship` (
  `relationship_id` int(11) NOT NULL,
  `relationship_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `holidays`
--

CREATE TABLE `holidays` (
  `holiday_id` int(11) NOT NULL,
  `school_year_id` int(11) NOT NULL,
  `holiday_name` varchar(100) DEFAULT NULL,
  `holiday_date` date DEFAULT NULL,
  `holiday_type` varchar(30) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `marital_statuses`
--

CREATE TABLE `marital_statuses` (
  `marital_status_id` int(11) NOT NULL,
  `status_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `online_classes`
--

CREATE TABLE `online_classes` (
  `online_class_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `title` varchar(150) DEFAULT NULL,
  `platform` varchar(50) DEFAULT NULL,
  `meeting_link` varchar(255) DEFAULT NULL,
  `scheduled_at` datetime DEFAULT NULL,
  `status` enum('Scheduled','Ongoing','Completed','Cancelled') DEFAULT 'Scheduled'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL,
  `billing_id` int(11) NOT NULL,
  `payment_method_id` int(11) NOT NULL,
  `amount_paid` decimal(10,2) DEFAULT NULL,
  `payment_date` date DEFAULT NULL,
  `receipt_number` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_method`
--

CREATE TABLE `payment_method` (
  `payment_method_id` int(11) NOT NULL,
  `method_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment_method`
--

INSERT INTO `payment_method` (`payment_method_id`, `method_name`) VALUES
(1, 'Cash'),
(2, 'GCash'),
(3, 'Other');

-- --------------------------------------------------------

--
-- Table structure for table `quarters`
--

CREATE TABLE `quarters` (
  `quarter_id` int(11) NOT NULL,
  `quarter_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `quarters`
--

INSERT INTO `quarters` (`quarter_id`, `quarter_name`) VALUES
(1, 'Q1'),
(2, 'Q2'),
(3, 'Q3'),
(4, 'Q4');

-- --------------------------------------------------------

--
-- Table structure for table `question_options`
--

CREATE TABLE `question_options` (
  `option_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `option_text` varchar(255) DEFAULT NULL,
  `is_correct` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quizzes`
--

CREATE TABLE `quizzes` (
  `quiz_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `grade_level_id` int(11) NOT NULL,
  `topic` varchar(150) DEFAULT NULL,
  `title` varchar(150) DEFAULT NULL,
  `material_type` enum('Quiz','Worksheet') DEFAULT NULL,
  `status` enum('Draft','Final') DEFAULT 'Draft',
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quiz_answers`
--

CREATE TABLE `quiz_answers` (
  `answer_id` int(11) NOT NULL,
  `attempt_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `answer_given` text DEFAULT NULL,
  `is_correct` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quiz_attempts`
--

CREATE TABLE `quiz_attempts` (
  `attempt_id` int(11) NOT NULL,
  `quiz_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `score` decimal(6,2) DEFAULT NULL,
  `taken_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quiz_items`
--

CREATE TABLE `quiz_items` (
  `quiz_item_id` int(11) NOT NULL,
  `quiz_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `item_order` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quiz_questions`
--

CREATE TABLE `quiz_questions` (
  `question_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `grade_level_id` int(11) NOT NULL,
  `topic` varchar(150) DEFAULT NULL,
  `difficulty` enum('Easy','Medium','Hard') NOT NULL DEFAULT 'Medium',
  `question_type` enum('Multiple Choice','True or False','Identification','Fill in the Blank') DEFAULT NULL,
  `question_text` text DEFAULT NULL,
  `correct_answer` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `report_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `school_year_id` int(11) NOT NULL,
  `report_type_id` int(11) NOT NULL,
  `title` varchar(150) DEFAULT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `generated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `report_type`
--

CREATE TABLE `report_type` (
  `report_type_id` int(11) NOT NULL,
  `report_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(50) NOT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `school_years`
--

CREATE TABLE `school_years` (
  `school_year_id` int(11) NOT NULL,
  `school_year` varchar(20) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `status` enum('Active','Inactive','Completed') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `section_id` int(11) NOT NULL,
  `grade_level_id` int(11) NOT NULL,
  `school_year_id` int(11) NOT NULL,
  `section_name` varchar(50) DEFAULT NULL,
  `room_number` varchar(20) DEFAULT NULL,
  `capacity` int(11) DEFAULT NULL,
  `status` enum('Active','Inactive') DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `student_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `lrn` varchar(12) NOT NULL,
  `gender_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `middle_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) NOT NULL,
  `birth_date` date DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `contact_number` varchar(20) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_achievements`
--

CREATE TABLE `student_achievements` (
  `student_achievement_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `achievement_id` int(11) NOT NULL,
  `school_year_id` int(11) NOT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `date_awarded` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_documents`
--

CREATE TABLE `student_documents` (
  `document_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `document_type_id` int(11) NOT NULL,
  `status` enum('Submitted','Pending') DEFAULT NULL,
  `submitted_date` date DEFAULT NULL,
  `remarks` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_follow_ups`
--

CREATE TABLE `student_follow_ups` (
  `follow_up_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `follow_up_date` date NOT NULL,
  `risk_type` enum('Absences','Missing Activities','Low Grades','Other') NOT NULL,
  `action_taken` text DEFAULT NULL,
  `parent_contacted` tinyint(1) NOT NULL DEFAULT 0,
  `status` enum('Open','Monitoring','Resolved') NOT NULL DEFAULT 'Open',
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_guardians`
--

CREATE TABLE `student_guardians` (
  `student_guardian_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `guardian_id` int(11) NOT NULL,
  `relationship_id` int(11) NOT NULL,
  `is_emergency_contact` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `subject_id` int(11) NOT NULL,
  `subject_code` varchar(20) NOT NULL,
  `subject_name` varchar(100) DEFAULT NULL,
  `grade_level_id` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `submissions`
--

CREATE TABLE `submissions` (
  `submission_id` int(11) NOT NULL,
  `activity_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `submitted_at` datetime DEFAULT NULL,
  `score` decimal(6,2) DEFAULT NULL,
  `feedback` text DEFAULT NULL,
  `status` enum('Submitted','Late','Graded','Missing') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

CREATE TABLE `teachers` (
  `teacher_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `employee_number` varchar(20) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `middle_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) NOT NULL,
  `contact_number` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `specialization` varchar(100) DEFAULT NULL,
  `status` enum('Active','On Leave','Transferred','Resigned') DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transmutation_table`
--

CREATE TABLE `transmutation_table` (
  `transmutation_id` int(11) NOT NULL,
  `min_grade` decimal(5,2) DEFAULT NULL,
  `max_grade` decimal(5,2) DEFAULT NULL,
  `transmuted_grade` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` enum('Active','Inactive') DEFAULT 'Active',
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `achievements`
--
ALTER TABLE `achievements`
  ADD PRIMARY KEY (`achievement_id`),
  ADD UNIQUE KEY `uq_achievements_achievement_name` (`achievement_name`);

--
-- Indexes for table `activities`
--
ALTER TABLE `activities`
  ADD PRIMARY KEY (`activity_id`),
  ADD KEY `fk_activities_activity_type_id` (`activity_type_id`),
  ADD KEY `fk_activities_quarter_id` (`quarter_id`),
  ADD KEY `fk_activities_subject_id` (`subject_id`),
  ADD KEY `fk_activities_teacher_id` (`teacher_id`),
  ADD KEY `fk_activities_section_id` (`section_id`);

--
-- Indexes for table `activity_types`
--
ALTER TABLE `activity_types`
  ADD PRIMARY KEY (`activity_type_id`),
  ADD UNIQUE KEY `uq_activity_types_type_name` (`type_name`);

--
-- Indexes for table `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`announcement_id`),
  ADD KEY `fk_announcements_user_id` (`user_id`),
  ADD KEY `fk_announcements_audience_id` (`audience_id`);

--
-- Indexes for table `attendances`
--
ALTER TABLE `attendances`
  ADD PRIMARY KEY (`attendance_id`),
  ADD UNIQUE KEY `uq_attendance_student_date` (`student_id`,`attendance_date`),
  ADD KEY `fk_attendances_section_id` (`section_id`),
  ADD KEY `fk_attendances_quarter_id` (`quarter_id`),
  ADD KEY `fk_attendances_attendance_status_id` (`attendance_status_id`);

--
-- Indexes for table `attendance_statuses`
--
ALTER TABLE `attendance_statuses`
  ADD PRIMARY KEY (`attendance_status_id`),
  ADD UNIQUE KEY `uq_attendance_statuses_status_name` (`status_name`);

--
-- Indexes for table `audience`
--
ALTER TABLE `audience`
  ADD PRIMARY KEY (`audience_id`),
  ADD UNIQUE KEY `uq_audience_audience_name` (`audience_name`);

--
-- Indexes for table `behavior_records`
--
ALTER TABLE `behavior_records`
  ADD PRIMARY KEY (`behavior_id`),
  ADD KEY `fk_behavior_records_student_id` (`student_id`),
  ADD KEY `fk_behavior_records_teacher_id` (`teacher_id`),
  ADD KEY `fk_behavior_records_school_year_id` (`school_year_id`),
  ADD KEY `fk_behavior_records_quarter_id` (`quarter_id`);

--
-- Indexes for table `billing`
--
ALTER TABLE `billing`
  ADD PRIMARY KEY (`billing_id`),
  ADD KEY `fk_billing_student_id` (`student_id`),
  ADD KEY `fk_billing_school_year_id` (`school_year_id`);

--
-- Indexes for table `class_schedules`
--
ALTER TABLE `class_schedules`
  ADD PRIMARY KEY (`schedule_id`),
  ADD UNIQUE KEY `uq_schedule_section_slot` (`section_id`,`day_id`,`start_time`),
  ADD UNIQUE KEY `uq_schedule_teacher_slot` (`teacher_id`,`day_id`,`start_time`),
  ADD KEY `fk_class_schedules_subject_id` (`subject_id`),
  ADD KEY `fk_class_schedules_day_id` (`day_id`);

--
-- Indexes for table `days`
--
ALTER TABLE `days`
  ADD PRIMARY KEY (`day_id`),
  ADD UNIQUE KEY `uq_days_day_name` (`day_name`);

--
-- Indexes for table `document_type`
--
ALTER TABLE `document_type`
  ADD PRIMARY KEY (`document_type_id`),
  ADD UNIQUE KEY `uq_document_type_document_name` (`document_name`);

--
-- Indexes for table `enrollments`
--
ALTER TABLE `enrollments`
  ADD PRIMARY KEY (`enrollment_id`),
  ADD UNIQUE KEY `uq_enrollment_student_year` (`student_id`,`school_year_id`),
  ADD KEY `fk_enrollments_grade_level_id` (`grade_level_id`),
  ADD KEY `fk_enrollments_school_year_id` (`school_year_id`),
  ADD KEY `fk_enrollments_section_id` (`section_id`),
  ADD KEY `fk_enrollments_enrollment_type_id` (`enrollment_type_id`);

--
-- Indexes for table `enrollment_type`
--
ALTER TABLE `enrollment_type`
  ADD PRIMARY KEY (`enrollment_type_id`),
  ADD UNIQUE KEY `uq_enrollment_type_enrollment_name` (`enrollment_name`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`event_id`),
  ADD KEY `fk_events_school_year_id` (`school_year_id`),
  ADD KEY `fk_events_user_id` (`user_id`);

--
-- Indexes for table `genders`
--
ALTER TABLE `genders`
  ADD PRIMARY KEY (`gender_id`),
  ADD UNIQUE KEY `uq_genders_gender_name` (`gender_name`);

--
-- Indexes for table `grades`
--
ALTER TABLE `grades`
  ADD PRIMARY KEY (`grade_id`),
  ADD KEY `fk_grades_student_id` (`student_id`),
  ADD KEY `fk_grades_subject_id` (`subject_id`),
  ADD KEY `fk_grades_teacher_id` (`teacher_id`),
  ADD KEY `fk_grades_school_year_id` (`school_year_id`),
  ADD KEY `fk_grades_quarter_id` (`quarter_id`);

--
-- Indexes for table `grade_details`
--
ALTER TABLE `grade_details`
  ADD PRIMARY KEY (`grade_detail_id`),
  ADD KEY `fk_grade_details_grade_id` (`grade_id`),
  ADD KEY `fk_grade_details_activity_type_id` (`activity_type_id`),
  ADD KEY `fk_grade_details_transmutation_id` (`transmutation_id`);

--
-- Indexes for table `grade_levels`
--
ALTER TABLE `grade_levels`
  ADD PRIMARY KEY (`grade_level_id`);

--
-- Indexes for table `guardians`
--
ALTER TABLE `guardians`
  ADD PRIMARY KEY (`guardian_id`),
  ADD KEY `fk_guardians_user_id` (`user_id`),
  ADD KEY `fk_guardians_gender_id` (`gender_id`),
  ADD KEY `fk_guardians_marital_status_id` (`marital_status_id`);

--
-- Indexes for table `guardian_relationship`
--
ALTER TABLE `guardian_relationship`
  ADD PRIMARY KEY (`relationship_id`);

--
-- Indexes for table `holidays`
--
ALTER TABLE `holidays`
  ADD PRIMARY KEY (`holiday_id`),
  ADD KEY `fk_holidays_school_year_id` (`school_year_id`);

--
-- Indexes for table `marital_statuses`
--
ALTER TABLE `marital_statuses`
  ADD PRIMARY KEY (`marital_status_id`),
  ADD UNIQUE KEY `uq_marital_statuses_status_name` (`status_name`);

--
-- Indexes for table `online_classes`
--
ALTER TABLE `online_classes`
  ADD PRIMARY KEY (`online_class_id`),
  ADD KEY `fk_online_classes_section_id` (`section_id`),
  ADD KEY `fk_online_classes_subject_id` (`subject_id`),
  ADD KEY `fk_online_classes_teacher_id` (`teacher_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`),
  ADD UNIQUE KEY `uq_payments_receipt_number` (`receipt_number`),
  ADD KEY `fk_payments_billing_id` (`billing_id`),
  ADD KEY `fk_payments_payment_method_id` (`payment_method_id`);

--
-- Indexes for table `payment_method`
--
ALTER TABLE `payment_method`
  ADD PRIMARY KEY (`payment_method_id`),
  ADD UNIQUE KEY `uq_payment_method_method_name` (`method_name`);

--
-- Indexes for table `quarters`
--
ALTER TABLE `quarters`
  ADD PRIMARY KEY (`quarter_id`),
  ADD UNIQUE KEY `uq_quarters_quarter_name` (`quarter_name`);

--
-- Indexes for table `question_options`
--
ALTER TABLE `question_options`
  ADD PRIMARY KEY (`option_id`),
  ADD KEY `fk_question_options_question_id` (`question_id`);

--
-- Indexes for table `quizzes`
--
ALTER TABLE `quizzes`
  ADD PRIMARY KEY (`quiz_id`),
  ADD KEY `fk_quizzes_teacher_id` (`teacher_id`),
  ADD KEY `fk_quizzes_subject_id` (`subject_id`),
  ADD KEY `fk_quizzes_grade_level_id` (`grade_level_id`);

--
-- Indexes for table `quiz_answers`
--
ALTER TABLE `quiz_answers`
  ADD PRIMARY KEY (`answer_id`),
  ADD UNIQUE KEY `uq_quiz_answers_attempt_question` (`attempt_id`,`question_id`),
  ADD KEY `fk_quiz_answers_question_id` (`question_id`);

--
-- Indexes for table `quiz_attempts`
--
ALTER TABLE `quiz_attempts`
  ADD PRIMARY KEY (`attempt_id`),
  ADD KEY `fk_quiz_attempts_quiz_id` (`quiz_id`),
  ADD KEY `fk_quiz_attempts_student_id` (`student_id`);

--
-- Indexes for table `quiz_items`
--
ALTER TABLE `quiz_items`
  ADD PRIMARY KEY (`quiz_item_id`),
  ADD UNIQUE KEY `uq_quiz_items_quiz_question` (`quiz_id`,`question_id`),
  ADD KEY `fk_quiz_items_question_id` (`question_id`);

--
-- Indexes for table `quiz_questions`
--
ALTER TABLE `quiz_questions`
  ADD PRIMARY KEY (`question_id`),
  ADD KEY `fk_quiz_questions_teacher_id` (`teacher_id`),
  ADD KEY `fk_quiz_questions_subject_id` (`subject_id`),
  ADD KEY `fk_quiz_questions_grade_level_id` (`grade_level_id`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`report_id`),
  ADD KEY `fk_reports_user_id` (`user_id`),
  ADD KEY `fk_reports_school_year_id` (`school_year_id`),
  ADD KEY `fk_reports_report_type_id` (`report_type_id`);

--
-- Indexes for table `report_type`
--
ALTER TABLE `report_type`
  ADD PRIMARY KEY (`report_type_id`),
  ADD UNIQUE KEY `uq_report_type_report_name` (`report_name`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`role_id`),
  ADD UNIQUE KEY `uq_roles_role_name` (`role_name`);

--
-- Indexes for table `school_years`
--
ALTER TABLE `school_years`
  ADD PRIMARY KEY (`school_year_id`),
  ADD UNIQUE KEY `uq_school_years_school_year` (`school_year`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`section_id`),
  ADD KEY `fk_sections_grade_level_id` (`grade_level_id`),
  ADD KEY `fk_sections_school_year_id` (`school_year_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`student_id`),
  ADD UNIQUE KEY `uq_students_lrn` (`lrn`),
  ADD KEY `fk_students_user_id` (`user_id`),
  ADD KEY `fk_students_gender_id` (`gender_id`);

--
-- Indexes for table `student_achievements`
--
ALTER TABLE `student_achievements`
  ADD PRIMARY KEY (`student_achievement_id`),
  ADD KEY `fk_student_achievements_student_id` (`student_id`),
  ADD KEY `fk_student_achievements_achievement_id` (`achievement_id`),
  ADD KEY `fk_student_achievements_school_year_id` (`school_year_id`),
  ADD KEY `fk_student_achievements_teacher_id` (`teacher_id`);

--
-- Indexes for table `student_documents`
--
ALTER TABLE `student_documents`
  ADD PRIMARY KEY (`document_id`),
  ADD KEY `fk_student_documents_student_id` (`student_id`),
  ADD KEY `fk_student_documents_document_type_id` (`document_type_id`);

--
-- Indexes for table `student_follow_ups`
--
ALTER TABLE `student_follow_ups`
  ADD PRIMARY KEY (`follow_up_id`),
  ADD KEY `fk_student_follow_ups_student_id` (`student_id`),
  ADD KEY `fk_student_follow_ups_teacher_id` (`teacher_id`);

--
-- Indexes for table `student_guardians`
--
ALTER TABLE `student_guardians`
  ADD PRIMARY KEY (`student_guardian_id`),
  ADD UNIQUE KEY `uq_student_guardian` (`student_id`,`guardian_id`),
  ADD KEY `fk_student_guardians_guardian_id` (`guardian_id`),
  ADD KEY `fk_student_guardians_relationship_id` (`relationship_id`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`subject_id`),
  ADD UNIQUE KEY `uq_subjects_subject_code` (`subject_code`),
  ADD KEY `fk_subjects_grade_level_id` (`grade_level_id`);

--
-- Indexes for table `submissions`
--
ALTER TABLE `submissions`
  ADD PRIMARY KEY (`submission_id`),
  ADD KEY `fk_submissions_activity_id` (`activity_id`),
  ADD KEY `fk_submissions_student_id` (`student_id`);

--
-- Indexes for table `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`teacher_id`),
  ADD UNIQUE KEY `uq_teachers_employee_number` (`employee_number`),
  ADD KEY `fk_teachers_user_id` (`user_id`);

--
-- Indexes for table `transmutation_table`
--
ALTER TABLE `transmutation_table`
  ADD PRIMARY KEY (`transmutation_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `uq_users_username` (`username`),
  ADD KEY `fk_users_role_id` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `achievements`
--
ALTER TABLE `achievements`
  MODIFY `achievement_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `activities`
--
ALTER TABLE `activities`
  MODIFY `activity_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `activity_types`
--
ALTER TABLE `activity_types`
  MODIFY `activity_type_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `announcements`
--
ALTER TABLE `announcements`
  MODIFY `announcement_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attendances`
--
ALTER TABLE `attendances`
  MODIFY `attendance_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attendance_statuses`
--
ALTER TABLE `attendance_statuses`
  MODIFY `attendance_status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `audience`
--
ALTER TABLE `audience`
  MODIFY `audience_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `behavior_records`
--
ALTER TABLE `behavior_records`
  MODIFY `behavior_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `billing`
--
ALTER TABLE `billing`
  MODIFY `billing_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `class_schedules`
--
ALTER TABLE `class_schedules`
  MODIFY `schedule_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `days`
--
ALTER TABLE `days`
  MODIFY `day_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `document_type`
--
ALTER TABLE `document_type`
  MODIFY `document_type_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `enrollments`
--
ALTER TABLE `enrollments`
  MODIFY `enrollment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `enrollment_type`
--
ALTER TABLE `enrollment_type`
  MODIFY `enrollment_type_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `event_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `genders`
--
ALTER TABLE `genders`
  MODIFY `gender_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `grades`
--
ALTER TABLE `grades`
  MODIFY `grade_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `grade_details`
--
ALTER TABLE `grade_details`
  MODIFY `grade_detail_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `grade_levels`
--
ALTER TABLE `grade_levels`
  MODIFY `grade_level_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `guardians`
--
ALTER TABLE `guardians`
  MODIFY `guardian_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `guardian_relationship`
--
ALTER TABLE `guardian_relationship`
  MODIFY `relationship_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `holidays`
--
ALTER TABLE `holidays`
  MODIFY `holiday_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `marital_statuses`
--
ALTER TABLE `marital_statuses`
  MODIFY `marital_status_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `online_classes`
--
ALTER TABLE `online_classes`
  MODIFY `online_class_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_method`
--
ALTER TABLE `payment_method`
  MODIFY `payment_method_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `quarters`
--
ALTER TABLE `quarters`
  MODIFY `quarter_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `question_options`
--
ALTER TABLE `question_options`
  MODIFY `option_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quizzes`
--
ALTER TABLE `quizzes`
  MODIFY `quiz_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quiz_answers`
--
ALTER TABLE `quiz_answers`
  MODIFY `answer_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quiz_attempts`
--
ALTER TABLE `quiz_attempts`
  MODIFY `attempt_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quiz_items`
--
ALTER TABLE `quiz_items`
  MODIFY `quiz_item_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quiz_questions`
--
ALTER TABLE `quiz_questions`
  MODIFY `question_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `report_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `report_type`
--
ALTER TABLE `report_type`
  MODIFY `report_type_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `school_years`
--
ALTER TABLE `school_years`
  MODIFY `school_year_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `section_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_achievements`
--
ALTER TABLE `student_achievements`
  MODIFY `student_achievement_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_documents`
--
ALTER TABLE `student_documents`
  MODIFY `document_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_follow_ups`
--
ALTER TABLE `student_follow_ups`
  MODIFY `follow_up_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_guardians`
--
ALTER TABLE `student_guardians`
  MODIFY `student_guardian_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `subject_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `submissions`
--
ALTER TABLE `submissions`
  MODIFY `submission_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `teachers`
--
ALTER TABLE `teachers`
  MODIFY `teacher_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transmutation_table`
--
ALTER TABLE `transmutation_table`
  MODIFY `transmutation_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `activities`
--
ALTER TABLE `activities`
  ADD CONSTRAINT `fk_activities_activity_type_id` FOREIGN KEY (`activity_type_id`) REFERENCES `activity_types` (`activity_type_id`),
  ADD CONSTRAINT `fk_activities_quarter_id` FOREIGN KEY (`quarter_id`) REFERENCES `quarters` (`quarter_id`),
  ADD CONSTRAINT `fk_activities_section_id` FOREIGN KEY (`section_id`) REFERENCES `sections` (`section_id`),
  ADD CONSTRAINT `fk_activities_subject_id` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`subject_id`),
  ADD CONSTRAINT `fk_activities_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`teacher_id`);

--
-- Constraints for table `announcements`
--
ALTER TABLE `announcements`
  ADD CONSTRAINT `fk_announcements_audience_id` FOREIGN KEY (`audience_id`) REFERENCES `audience` (`audience_id`),
  ADD CONSTRAINT `fk_announcements_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `attendances`
--
ALTER TABLE `attendances`
  ADD CONSTRAINT `fk_attendances_attendance_status_id` FOREIGN KEY (`attendance_status_id`) REFERENCES `attendance_statuses` (`attendance_status_id`),
  ADD CONSTRAINT `fk_attendances_quarter_id` FOREIGN KEY (`quarter_id`) REFERENCES `quarters` (`quarter_id`),
  ADD CONSTRAINT `fk_attendances_section_id` FOREIGN KEY (`section_id`) REFERENCES `sections` (`section_id`),
  ADD CONSTRAINT `fk_attendances_student_id` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`);

--
-- Constraints for table `behavior_records`
--
ALTER TABLE `behavior_records`
  ADD CONSTRAINT `fk_behavior_records_quarter_id` FOREIGN KEY (`quarter_id`) REFERENCES `quarters` (`quarter_id`),
  ADD CONSTRAINT `fk_behavior_records_school_year_id` FOREIGN KEY (`school_year_id`) REFERENCES `school_years` (`school_year_id`),
  ADD CONSTRAINT `fk_behavior_records_student_id` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`),
  ADD CONSTRAINT `fk_behavior_records_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`teacher_id`);

--
-- Constraints for table `billing`
--
ALTER TABLE `billing`
  ADD CONSTRAINT `fk_billing_school_year_id` FOREIGN KEY (`school_year_id`) REFERENCES `school_years` (`school_year_id`),
  ADD CONSTRAINT `fk_billing_student_id` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`);

--
-- Constraints for table `class_schedules`
--
ALTER TABLE `class_schedules`
  ADD CONSTRAINT `fk_class_schedules_day_id` FOREIGN KEY (`day_id`) REFERENCES `days` (`day_id`),
  ADD CONSTRAINT `fk_class_schedules_section_id` FOREIGN KEY (`section_id`) REFERENCES `sections` (`section_id`),
  ADD CONSTRAINT `fk_class_schedules_subject_id` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`subject_id`),
  ADD CONSTRAINT `fk_class_schedules_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`teacher_id`);

--
-- Constraints for table `enrollments`
--
ALTER TABLE `enrollments`
  ADD CONSTRAINT `fk_enrollments_enrollment_type_id` FOREIGN KEY (`enrollment_type_id`) REFERENCES `enrollment_type` (`enrollment_type_id`),
  ADD CONSTRAINT `fk_enrollments_grade_level_id` FOREIGN KEY (`grade_level_id`) REFERENCES `grade_levels` (`grade_level_id`),
  ADD CONSTRAINT `fk_enrollments_school_year_id` FOREIGN KEY (`school_year_id`) REFERENCES `school_years` (`school_year_id`),
  ADD CONSTRAINT `fk_enrollments_section_id` FOREIGN KEY (`section_id`) REFERENCES `sections` (`section_id`),
  ADD CONSTRAINT `fk_enrollments_student_id` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`);

--
-- Constraints for table `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `fk_events_school_year_id` FOREIGN KEY (`school_year_id`) REFERENCES `school_years` (`school_year_id`),
  ADD CONSTRAINT `fk_events_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `grades`
--
ALTER TABLE `grades`
  ADD CONSTRAINT `fk_grades_quarter_id` FOREIGN KEY (`quarter_id`) REFERENCES `quarters` (`quarter_id`),
  ADD CONSTRAINT `fk_grades_school_year_id` FOREIGN KEY (`school_year_id`) REFERENCES `school_years` (`school_year_id`),
  ADD CONSTRAINT `fk_grades_student_id` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`),
  ADD CONSTRAINT `fk_grades_subject_id` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`subject_id`),
  ADD CONSTRAINT `fk_grades_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`teacher_id`);

--
-- Constraints for table `grade_details`
--
ALTER TABLE `grade_details`
  ADD CONSTRAINT `fk_grade_details_activity_type_id` FOREIGN KEY (`activity_type_id`) REFERENCES `activity_types` (`activity_type_id`),
  ADD CONSTRAINT `fk_grade_details_grade_id` FOREIGN KEY (`grade_id`) REFERENCES `grades` (`grade_id`),
  ADD CONSTRAINT `fk_grade_details_transmutation_id` FOREIGN KEY (`transmutation_id`) REFERENCES `transmutation_table` (`transmutation_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `guardians`
--
ALTER TABLE `guardians`
  ADD CONSTRAINT `fk_guardians_gender_id` FOREIGN KEY (`gender_id`) REFERENCES `genders` (`gender_id`),
  ADD CONSTRAINT `fk_guardians_marital_status_id` FOREIGN KEY (`marital_status_id`) REFERENCES `marital_statuses` (`marital_status_id`),
  ADD CONSTRAINT `fk_guardians_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `holidays`
--
ALTER TABLE `holidays`
  ADD CONSTRAINT `fk_holidays_school_year_id` FOREIGN KEY (`school_year_id`) REFERENCES `school_years` (`school_year_id`);

--
-- Constraints for table `online_classes`
--
ALTER TABLE `online_classes`
  ADD CONSTRAINT `fk_online_classes_section_id` FOREIGN KEY (`section_id`) REFERENCES `sections` (`section_id`),
  ADD CONSTRAINT `fk_online_classes_subject_id` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`subject_id`),
  ADD CONSTRAINT `fk_online_classes_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`teacher_id`);

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `fk_payments_billing_id` FOREIGN KEY (`billing_id`) REFERENCES `billing` (`billing_id`),
  ADD CONSTRAINT `fk_payments_payment_method_id` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_method` (`payment_method_id`);

--
-- Constraints for table `question_options`
--
ALTER TABLE `question_options`
  ADD CONSTRAINT `fk_question_options_question_id` FOREIGN KEY (`question_id`) REFERENCES `quiz_questions` (`question_id`);

--
-- Constraints for table `quizzes`
--
ALTER TABLE `quizzes`
  ADD CONSTRAINT `fk_quizzes_grade_level_id` FOREIGN KEY (`grade_level_id`) REFERENCES `grade_levels` (`grade_level_id`),
  ADD CONSTRAINT `fk_quizzes_subject_id` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`subject_id`),
  ADD CONSTRAINT `fk_quizzes_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`teacher_id`);

--
-- Constraints for table `quiz_answers`
--
ALTER TABLE `quiz_answers`
  ADD CONSTRAINT `fk_quiz_answers_attempt_id` FOREIGN KEY (`attempt_id`) REFERENCES `quiz_attempts` (`attempt_id`),
  ADD CONSTRAINT `fk_quiz_answers_question_id` FOREIGN KEY (`question_id`) REFERENCES `quiz_questions` (`question_id`);

--
-- Constraints for table `quiz_attempts`
--
ALTER TABLE `quiz_attempts`
  ADD CONSTRAINT `fk_quiz_attempts_quiz_id` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`quiz_id`),
  ADD CONSTRAINT `fk_quiz_attempts_student_id` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`);

--
-- Constraints for table `quiz_items`
--
ALTER TABLE `quiz_items`
  ADD CONSTRAINT `fk_quiz_items_question_id` FOREIGN KEY (`question_id`) REFERENCES `quiz_questions` (`question_id`),
  ADD CONSTRAINT `fk_quiz_items_quiz_id` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`quiz_id`);

--
-- Constraints for table `quiz_questions`
--
ALTER TABLE `quiz_questions`
  ADD CONSTRAINT `fk_quiz_questions_grade_level_id` FOREIGN KEY (`grade_level_id`) REFERENCES `grade_levels` (`grade_level_id`),
  ADD CONSTRAINT `fk_quiz_questions_subject_id` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`subject_id`),
  ADD CONSTRAINT `fk_quiz_questions_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`teacher_id`);

--
-- Constraints for table `reports`
--
ALTER TABLE `reports`
  ADD CONSTRAINT `fk_reports_report_type_id` FOREIGN KEY (`report_type_id`) REFERENCES `report_type` (`report_type_id`),
  ADD CONSTRAINT `fk_reports_school_year_id` FOREIGN KEY (`school_year_id`) REFERENCES `school_years` (`school_year_id`),
  ADD CONSTRAINT `fk_reports_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `sections`
--
ALTER TABLE `sections`
  ADD CONSTRAINT `fk_sections_grade_level_id` FOREIGN KEY (`grade_level_id`) REFERENCES `grade_levels` (`grade_level_id`),
  ADD CONSTRAINT `fk_sections_school_year_id` FOREIGN KEY (`school_year_id`) REFERENCES `school_years` (`school_year_id`);

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `fk_students_gender_id` FOREIGN KEY (`gender_id`) REFERENCES `genders` (`gender_id`),
  ADD CONSTRAINT `fk_students_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `student_achievements`
--
ALTER TABLE `student_achievements`
  ADD CONSTRAINT `fk_student_achievements_achievement_id` FOREIGN KEY (`achievement_id`) REFERENCES `achievements` (`achievement_id`),
  ADD CONSTRAINT `fk_student_achievements_school_year_id` FOREIGN KEY (`school_year_id`) REFERENCES `school_years` (`school_year_id`),
  ADD CONSTRAINT `fk_student_achievements_student_id` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`),
  ADD CONSTRAINT `fk_student_achievements_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`teacher_id`);

--
-- Constraints for table `student_documents`
--
ALTER TABLE `student_documents`
  ADD CONSTRAINT `fk_student_documents_document_type_id` FOREIGN KEY (`document_type_id`) REFERENCES `document_type` (`document_type_id`),
  ADD CONSTRAINT `fk_student_documents_student_id` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`);

--
-- Constraints for table `student_follow_ups`
--
ALTER TABLE `student_follow_ups`
  ADD CONSTRAINT `fk_student_follow_ups_student_id` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`),
  ADD CONSTRAINT `fk_student_follow_ups_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`teacher_id`);

--
-- Constraints for table `student_guardians`
--
ALTER TABLE `student_guardians`
  ADD CONSTRAINT `fk_student_guardians_guardian_id` FOREIGN KEY (`guardian_id`) REFERENCES `guardians` (`guardian_id`),
  ADD CONSTRAINT `fk_student_guardians_relationship_id` FOREIGN KEY (`relationship_id`) REFERENCES `guardian_relationship` (`relationship_id`),
  ADD CONSTRAINT `fk_student_guardians_student_id` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`);

--
-- Constraints for table `subjects`
--
ALTER TABLE `subjects`
  ADD CONSTRAINT `fk_subjects_grade_level_id` FOREIGN KEY (`grade_level_id`) REFERENCES `grade_levels` (`grade_level_id`);

--
-- Constraints for table `submissions`
--
ALTER TABLE `submissions`
  ADD CONSTRAINT `fk_submissions_activity_id` FOREIGN KEY (`activity_id`) REFERENCES `activities` (`activity_id`),
  ADD CONSTRAINT `fk_submissions_student_id` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`);

--
-- Constraints for table `teachers`
--
ALTER TABLE `teachers`
  ADD CONSTRAINT `fk_teachers_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_users_role_id` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
