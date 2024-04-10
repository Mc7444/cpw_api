-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 10, 2024 at 08:49 PM
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
-- Database: `cpw_sql`
--

-- --------------------------------------------------------

--
-- Table structure for table `answer_question`
--

CREATE TABLE `answer_question` (
  `answer_question_id` varchar(255) NOT NULL,
  `answer` varchar(500) DEFAULT NULL,
  `message_group` varchar(20) DEFAULT NULL,
  `question_type` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `answer_question`
--

INSERT INTO `answer_question` (`answer_question_id`, `answer`, `message_group`, `question_type`) VALUES
('0d75565f-c50d-11ee-a02e-1c1bb5362338', 'สวัสดีค่ะ ตอบกลับจาก หน่วยงานฝ่ายโภชนาการ โรงเรียนชลประทานวิทยา\r\nกรุณาระบุหมายเลขที่คุณต้องการติดต่อ\r\n1. เมนูอาหารกลางวันประจำสัปดาห์ \r\n2. สหกรณ์โรงเรียนชลประทานวิทยา \r\n3. ลานจอดรถใหม่สนามกอล์ฟชลประทาน \r\n4. อื่นๆ ติดต่อสอบถามเพิ่มเติม', 'question', '2'),
('27dbe513-c50e-11ee-a02e-1c1bb5362338', 'รอสักครู่ ฉันจะรีบติดต่อกลับไปให้เร็วที่สุดนะคะ / I’ll get back to you as soon as possible', 'question', '0'),
('4b68ef18-c50d-11ee-a02e-1c1bb5362338', 'สวัสดีค่ะ ตอบกลับจาก หน่วยงานฝ่ายปกครอง โรงเรียนชลประทานวิทยา\r\nกรุณาระบุหมายเลขที่คุณต้องการติดต่อ\r\n1.ระเบียบการแต่งกายของนักเรียน (จากคู่มือนักเรียน)\r\n2.ภาพกิจกรรม \r\n3.นักศึกษาวิชาทหาร \r\n4.อื่นๆ ติดต่อสอบถามเพิ่มเติม', 'question', '3'),
('71261234-c5a7-11ee-a706-1c1bb5362338', 'สวัสดีค่ะ ตอบกลับจาก หน่วยงานฝ่ายสารสนเทศ โรงเรียนชลประทานวิทยา\r\nกรุณาระบุหมายเลขที่คุณต้องการติดต่อ \r\n1. ระบบการจัดการศูนย์ฝึกว่ายน้ำ \r\n2. ระบบชำระเงิน\r\n3. ระบบประกาศผลการเรียน \r\n4. ระบบรถรับ-ส่งนักเรียน\r\n5. ระบบการจัดการโรงอาหาร \r\n6. ระบบ CPW School Application \r\n7. อื่นๆ ติดต่อสอบถามเพิ่มเติม', 'question', '5'),
('93544438-c50c-11ee-a02e-1c1bb5362338', 'สวัสดีค่ะ ตอบกลับจาก หน่วยงานฝ่ายวิชาการ โรงเรียนชลประทานวิทยา\nกรุณาระบุหมายเลขที่คุณต้องการติดต่อ\n1. ตารางเรียน \n2. ตารางสอบ \n3. หลักสูตร \n4. ฟอร์มแบบคำร้องขอหลักฐานการศึกษา \n5. โครงการห้องเรียนพิเศษ \n6. English Program \n7. อื่นๆ ติดต่อสอบถามเพิ่มเติม', 'question', '1'),
('be90c4f5-c50d-11ee-a02e-1c1bb5362338', 'สวัสดีค่ะ ตอบกลับจาก หน่วยงานฝ่ายธุรการและบัญชี โรงเรียนชลประทานวิทยา\r\nกรุณาระบุหมายเลขที่คุณต้องการติดต่อ \r\n1. สมัครเรียน \r\n2. สมัครบุคลากร \r\n3. ค่าธรรมเนียมการศึกษา \r\n4. อื่นๆ ติดต่อสอบถามเพิ่มเติม', 'question', '4'),
('e7626367-3e41-11eb-b897-0862660ccbd', 'โรงเรียนชลประทานวิทยา ขอขอบคุณค่ะ', 'positive', NULL),
('fbe516f6-3e39-11eb-b897-0862660ccbd4', 'ขอบคุณสำหรับคำแนะนำค่ะ ทางโรงเรียนชลประทานวิทยาจะดำเนินการแจ้งให้กับหน่วยงานที่เกี่ยวข้องได้รับทราบค่ะ', 'negative', NULL),
('hgj24dcd-h549-1qye-cc8s-1c1bb7sd2338', 'กรุณาใช้คำที่สุภาพในการสอบถามข้อมูล', 'bad_word_handler', 'bad_word');

-- --------------------------------------------------------

--
-- Table structure for table `cpw_agency`
--

CREATE TABLE `cpw_agency` (
  `agency_id` int(10) NOT NULL,
  `agency_name` varchar(20) NOT NULL,
  `username` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `cpw_agency`
--

INSERT INTO `cpw_agency` (`agency_id`, `agency_name`, `username`) VALUES
(1, 'วิชาการ', NULL),
(2, 'โภชนาการ', NULL),
(3, 'ฝ่ายปกครอง', NULL),
(4, 'ธุรการและบัญชี', NULL),
(5, 'สารสนเทศ', NULL),
(6, 'ผู้ดูแลระบบ', NULL),
(7, 'ผู้บริหาร', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sub_answer`
--

CREATE TABLE `sub_answer` (
  `s_answer_id` varchar(255) NOT NULL,
  `choice` varchar(2) DEFAULT NULL,
  `s_answer` text DEFAULT NULL,
  `answer_question_id` varchar(255) DEFAULT NULL,
  `agency_id` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `sub_answer`
--

INSERT INTO `sub_answer` (`s_answer_id`, `choice`, `s_answer`, `answer_question_id`, `agency_id`) VALUES
('00ff8c4a-cef9-11ee-82c3-1c1bb5362338', '1', 'ศูนย์ฝึกว่ายน้ำ : https://www.facebook.com/photo?fbid=122125185914065583&set=a.122107973636065583\r\n\r\nริชแบนด์ : https://www.facebook.com/chonprathanwittaya/videos/943401019876585', '71261234-c5a7-11ee-a706-1c1bb5362338', 5),
('06f2feaf-cf33-11ee-9e8c-1c1bb5362338', '2', 'ศูนย์วัสดุอุปกรณ์เพื่อการศึกษา (สหกรณ์โรงเรียนชลประทานวิทยา) เปิดทำการจำหน่ายวัสดุ-อุปกรณ์การเรียนของนักเรียน เวลา 8.30-15.30 น.\r\n\r\nราคาชุด : https://app.cpw.ac.th/view_pdf/news.php?public_key=120191018091445&fbclid=IwAR3O9molD400I6fx7SpexiB-IdC1NjdoIpH9vyG3pyr6adD2pk_u5iMhpTE\r\n\r\nจำหน่ายหนังสือ : https://www.facebook.com/chonprathanwittaya.school/posts/pfbid0nsYQLiVNfsWDeTLWtCYouCJ2582FAreLL1WLwU3JcHs78jzxJBnn1QsH8fKn7PSLl\r\n\r\nรับปักเสื้อ : สำหรับผู้ปกครองที่ต้องการให้ทางร้านจัดส่งเสื้อที่ปักทางร้านคิดค่าดำเนินการส่ง 70 บาท\r\nโดยให้ผปค.​แอดไลน์ @njschool\r\nติดต่อสอบถาม​ ☎️\r\nคุณเปิล 081-618-1295 ,\r\nคุณแต๋ว 086-302-6504 ,\r\nคุณดร 086-431-1501', '0d75565f-c50d-11ee-a02e-1c1bb5362338', 2),
('06f6edce-cf33-11ee-9e8c-1c1bb5362338', '1', 'ระเบียบการแต่งกายของนักเรียน : https://www.cpw.ac.th/albums_view.php?public_key=201804231144221524458662\r\n\r\nคู่มือครู นักเรียน และผู้ปกครอง : https://www.cpw.ac.th/manual.php', '4b68ef18-c50d-11ee-a02e-1c1bb5362338', 3),
('06f89ce2-cf33-11ee-9e8c-1c1bb5362338', '2', 'ภาพกิจกรรม : https://www.cpw.ac.th/albums.php', '4b68ef18-c50d-11ee-a02e-1c1bb5362338', 3),
('142567f8-d38c-11ee-b715-1c1bb5362338', '3', 'รายละเอียดการสมัครนักศึกษาวิชาทหาร ชั้นปีที่ 1 : https://www.facebook.com/chonprathanwittaya.school/photos/a.450685018309967/3308729885838785/\r\n\r\nประกาศผลการสอบเลื่อนชั้นนักศึกษาวิชาทหาร : https://www.facebook.com/chonprathanwittaya.school/photos/a.1452678021443990/4316284521749978/', '4b68ef18-c50d-11ee-a02e-1c1bb5362338', 3),
('39b7c79e-cf2e-11ee-9e8c-1c1bb5362338', '1', 'ตารางเรียนชั้นประถมศึกษาปีที่ 1 : https://app.cpw.ac.th/view_pdf/news.php?public_key=120230508071410\n\nตารางเรียนชั้นประถมศึกษาปีที่ 2 : https://app.cpw.ac.th/view_pdf/news.php?public_key=120230508071339\n\nตารางเรียนชั้นประถมศึกษาปีที่ 3 : https://app.cpw.ac.th/view_pdf/news.php?public_key=120230508071255\n\nตารางเรียนชั้นประถมศึกษาปีที่ 4 : https://app.cpw.ac.th/view_pdf/news.php?public_key=120230508071222\n\nตารางเรียนชั้นประถมศึกษาปีที่ 5 : https://app.cpw.ac.th/view_pdf/news.php?public_key=120230508071147\n\nตารางเรียนชั้นประถมศึกษาปีที่ 6 : https://app.cpw.ac.th/view_pdf/news.php?public_key=120230508070928\n\nตารางเรียนชั้นมัธยมศึกษาปีที่ 1 : https://app.cpw.ac.th/view_pdf/news.php?public_key=120221104094059\n\nตารางเรียนชั้นมัธยมศึกษาปีที่ 2 : https://app.cpw.ac.th/view_pdf/news.php?public_key=120221104094242\n\nตารางเรียนชั้นมัธยมศึกษาปีที่ 3 : https://app.cpw.ac.th/view_pdf/news.php?public_key=120221104094312\n\nตารางเรียนชั้นมัธยมศึกษาปีที่ 4 : https://app.cpw.ac.th/view_pdf/news.php?public_key=120221104094337\n\nตารางเรียนชั้นมัธยมศึกษาปีที่ 5 : https://app.cpw.ac.th/view_pdf/news.php?public_key=120221104094405\n\nตารางเรียนชั้นมัธยมศึกษาปีที่ 6 : https://app.cpw.ac.th/view_pdf/news.php?public_key=120221104094426', '93544438-c50c-11ee-a02e-1c1bb5362338', 1),
('4a2dc0c8-cf2f-11ee-9e8c-1c1bb5362338', '5', 'โครงการพิเศษ : https://www.facebook.com/story.php?story_fbid=3954301314614969&id=443445962367206\r\n\r\nระเบียบการรับสมัครโครงการพิเศษ : https://app.cpw.ac.th/view_pdf/news.php?public_key=120190815151444&fbclid=IwAR1avqvFCUQbrhGK7dvzzCRMAiT5idGIlJsGogXDwLxiTSwNeo9STdD8R8o\r\n\r\nตารางการสอบคัดเลือกเข้าเรียนโครงการห้องเรียนพิเศษ : https://www.facebook.com/chonprathanwittaya.school/photos/a.450685018309967/2865104150201363/\r\n', '93544438-c50c-11ee-a02e-1c1bb5362338', 1),
('60626910-d192-11ee-a001-1c1bb5362338', '3', 'ลานจอดรถใหม่สนามกอล์ฟชลประทาน : https://www.facebook.com/watch/?v=564049690816838', '0d75565f-c50d-11ee-a02e-1c1bb5362338', 2),
('6585f748-cf2f-11ee-9e8c-1c1bb5362338', '6', 'ระเบียบการรับสมัครนักเรียน English Program : https://www.facebook.com/permalink.php?story_fbid=pfbid0fbzSiRDKALUvvjHwSQY29LPcg11NeCUynJ9Afd37HDcdKp3uSAJp6mMVzRcuaDQvl&id=100093686707861', '93544438-c50c-11ee-a02e-1c1bb5362338', 1),
('76cac402-cf36-11ee-9e8c-1c1bb5362338', '1', 'สมัครชั้นเตรียมอนุบาล และอนุบาล 1 : https://www.facebook.com/story.php?story_fbid=285448354282786&id=100084528714270\r\n\r\nสมัครนักเรียนใหม่ (ต่างโรงเรียน) : https://www.facebook.com/100084528714270/posts/278771431617145/\r\n\r\nเปิดรับสมัครนักเรียนใหม่ : https://www.cpw.ac.th/albums_view.php?public_key=320230828103526&fbclid=IwAR2VVNKfJUM6ce18d6-8XdnoJ0J4l6I-7koFh7FCBAy-ERWPQ9M_VM-0rOY', 'be90c4f5-c50d-11ee-a02e-1c1bb5362338', 4),
('76cd7c82-cf36-11ee-9e8c-1c1bb5362338', '2', 'สมัครบุคลากร : https://www.facebook.com/chonprathanwittaya.school/photos/a.450685018309967/3064816370230139/', 'be90c4f5-c50d-11ee-a02e-1c1bb5362338', 4),
('76ce963c-cf36-11ee-9e8c-1c1bb5362338', '3', 'ค่าธรรมเนียมการศึกษา : https://app.cpw.ac.th/cpw_api_content/files/2202310040849592039002898.pdf?fbclid=IwAR2pHa1AOvc8mNonl2GwY7e6zxkFpXGFxtFbVUHDlA4rnTDE4cnYTIDTqO8\r\n\r\nผ่อนค่าธรรมเนียมการศึกษา : https://www.facebook.com/chonprathanwittaya.school/posts/pfbid0pMGjqoxTSW515b97w8pqvLgo1EeYiLpSCJHUpRywHucoRMKjUbLbBMyN8TKiHW4Gl', 'be90c4f5-c50d-11ee-a02e-1c1bb5362338', 4),
('7993ce3c-d148-11ee-a89e-1c1bb5362338', '6', 'CPW School Application ผู้ปกครองสามารถเข้าสู่ระบบเพื่อใช้งานได้ \r\nUsername : เลขประจำตัว 13 หลัก ของผู้ปกครอง\r\nPassword : 12345678\r\n\r\nสามารถดาวน์โหลดได้แล้ววันนี้ทั้ง android และ iOS >> http://www.cpw.ac.th/cpw_school_app\r\nผู้ปกครองที่ไม่สามารถ login เข้าใช่งานได้ สามารถลงทะเบียน >> http://app.cpw.ac.th/register/\r\n==========================\r\nมีปัญหาในการใช้งาน \r\nติดต่อศูนย์สารสนเทศโรงเรียนชลประทานวิทยา ได้ที่ตึก 100 ปีชั้น 2 ทุกวันทำการ หยุดเสาร์ - อาทิตย์\r\nโทรศัพท์ : 0-2583-4047 ต่อ 145\r\nline @cpwschool  >> http://line.me/ti/p/%40hjk4451r\r\nfacebook messenger >> https://www.messenger.com/t/chonprathanwittaya.school', '71261234-c5a7-11ee-a706-1c1bb5362338', 5),
('7a0824e7-cf2e-11ee-9e8c-1c1bb5362338', '2', 'ตารางสอบแผนกประถมศึกษา : https://app.cpw.ac.th/cpw_api_content/files/220201009151308491215941.pdf?fbclid=IwAR1avqvFCUQbrhGK7dvzzCRMAiT5idGIlJsGogXDwLxiTSwNeo9STdD8R8o\r\n\r\nตารางสอบแผนกมัธยมศึกษา : https://www.cpw.ac.th/news_parent.php?fbclid=IwAR2gvBf0xopjHkZ2fB5khe9MC9FeuRkKYPSw3eMhXWwa9E-Hue6DSodxIck', '93544438-c50c-11ee-a02e-1c1bb5362338', 1),
('886990f5-cf30-11ee-9e8c-1c1bb5362338', '1', 'เมนูอาหารกลางวันประจำสัปดาห์ : https://www.facebook.com/photo/?fbid=361966939964260&set=a.113265668167723', '0d75565f-c50d-11ee-a02e-1c1bb5362338', 2),
('9b7af640-cef8-11ee-82c3-1c1bb5362338', '2', 'ระบบชำระเงิน : https://www.facebook.com/chonprathanwittaya.school/photos/a.450685018309967/4783698775008548/          \r\n\r\nระบบยังขึ้นค้างชำระ : https://www.facebook.com/photo?fbid=244378775286307&set=a.106748949049291\r\n                 \r\n** หากต้องการใบเสร็จสามารถรับได้ที่ห้องการเงินวัน จ-ศ เวลา 8.30-15.00 น. ยกเว้นวันหยุดค่ะ **', '71261234-c5a7-11ee-a706-1c1bb5362338', 5),
('b858be19-cef8-11ee-82c3-1c1bb5362338', '3', 'ประกาศผลการเรียน : https://www.facebook.com/chonprathanwittaya.school/posts/3864453076933127/', '71261234-c5a7-11ee-a706-1c1bb5362338', 5),
('c8fdf636-cf2e-11ee-9e8c-1c1bb5362338', '3', 'หลักสูตร : https://www.cpw.ac.th/admission/?fbclid=IwAR3WD6MbR8Mi8BU3Z-aPDmqzRzX_VHvjSOT8YlHrtnVe0P5uTsgkfWTORAc', '93544438-c50c-11ee-a02e-1c1bb5362338', 1),
('cde94e54-cef8-11ee-82c3-1c1bb5362338', '4', 'นักเรียนทุกระดับชั้นที่ใช้บริการรถรับ-ส่งนักเรียนโรงเรียนชลประทานวิทยา (นักเรียนเก่าที่ใช้บริการอยู่แล้ว) ขอให้แจ้งความประสงค์เพื่อทำประวัติใหม่ ณ อาคารหอประชุมชูชาติ กำภู 60 ปี เวลา 8.00-14.00 น. \r\n\r\nรับสมัครรถตู้ : ติดต่อสอบถาม คุณนภาพร วายุรัตน์ 081-916-5011 , 02-962-6401 ณ สำนักงานรถรับ - ส่งนักเรียน  \r\n                            \r\nคู่มือการใช้งานระบบรถรับ-ส่ง : https://www.facebook.com/watch/?v=315788696254992', '71261234-c5a7-11ee-a706-1c1bb5362338', 5),
('f08141c6-cef8-11ee-82c3-1c1bb5362338', '5', 'เติมเงินเข้าบัตร : https://www.facebook.com/photo?fbid=299718813085636&set=a.106748949049291  \r\n\r\nเติมเงินเข้าบัตรแล้วยอดเงินไม่เข้า : https://www.facebook.com/photo?fbid=178780038512848&set=a.106748949049291\r\n  \r\nวิธีใช้คูปอง : https://www.facebook.com/443445962367206/posts/2470698982975217/?mibextid=QwDbR1\r\n \r\n** บัตรเติมเงินไม่ได้ให้มาติดต่อที่ศูนย์สารสนเทศ อาคาร 100 ปี ชั้น 2 ค่ะ **', '71261234-c5a7-11ee-a706-1c1bb5362338', 5),
('f5176b1d-d56b-11ee-bb11-1c1bb5362338', '00', 'รอสักครู่ ฉันจะรีบติดต่อกลับไปให้เร็วที่สุดนะคะ / I’ll get back to you as soon as possible', NULL, NULL),
('fd06178d-cf2e-11ee-9e8c-1c1bb5362338', '4', 'ฟอร์มแบบคำร้องขอหลักฐานการศึกษา : https://www.facebook.com/chonprathanwittaya.school/posts/pfbid02TkWV1X94vnyQtM44nFuT7T5G2RNv7ANxRgLBW1v4wVntLnkLTRMNvnuJ6YyHcpVJl', '93544438-c50c-11ee-a02e-1c1bb5362338', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `answer_question`
--
ALTER TABLE `answer_question`
  ADD PRIMARY KEY (`answer_question_id`);

--
-- Indexes for table `cpw_agency`
--
ALTER TABLE `cpw_agency`
  ADD PRIMARY KEY (`agency_id`);

--
-- Indexes for table `sub_answer`
--
ALTER TABLE `sub_answer`
  ADD PRIMARY KEY (`s_answer_id`),
  ADD KEY `answer_question_id_pk` (`answer_question_id`) USING BTREE,
  ADD KEY `agency_id` (`agency_id`) USING BTREE;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `sub_answer`
--
ALTER TABLE `sub_answer`
  ADD CONSTRAINT `sub_answer_ibfk_1` FOREIGN KEY (`answer_question_id`) REFERENCES `answer_question` (`answer_question_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `sub_answer_ibfk_2` FOREIGN KEY (`agency_id`) REFERENCES `cpw_agency` (`agency_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
