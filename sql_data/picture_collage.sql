-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 08, 2023 lúc 03:58 AM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `picture_collage`
--
CREATE DATABASE IF NOT EXISTS `picture_collage` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `picture_collage`;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `generated_picture`
--

CREATE TABLE `generated_picture` (
  `fid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `filename` text NOT NULL,
  `status` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `qid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `generated_picture`
--

INSERT INTO `generated_picture` (`fid`, `uid`, `filename`, `status`, `timestamp`, `qid`) VALUES
(110, 1, 'topic_4830f5da-8ec4-42d3-9954-c17354a9cca7.PNG', 2, '2023-12-07 20:12:23', 17),
(111, 1, 'topic_431a4495-2f2b-4cfb-8de7-0e82c78673e7.PNG', 2, '2023-12-07 20:12:25', 17),
(112, 1, 'topic_9e542b1f-46d7-4870-9b9c-586e8ade2706.PNG', 2, '2023-12-07 20:16:41', 18),
(113, 1, 'topic_82f8c8ab-fb05-4ea8-92e7-cdc4d982ae1e.PNG', 2, '2023-12-07 20:16:42', 18);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `query`
--

CREATE TABLE `query` (
  `qid` int(11) NOT NULL,
  `query_topic` varchar(100) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `uid` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `height` int(11) NOT NULL,
  `width` int(11) NOT NULL,
  `variety` int(11) NOT NULL,
  `small_images` int(11) NOT NULL,
  `large_images` int(11) NOT NULL,
  `shape` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `query`
--

INSERT INTO `query` (`qid`, `query_topic`, `timestamp`, `uid`, `status`, `height`, `width`, `variety`, `small_images`, `large_images`, `shape`) VALUES
(17, 'Sunset', '2023-12-07 20:11:41', 1, 2, 1800, 2500, 50, 30, 2, 0),
(18, 'Fireworks', '2023-12-07 20:16:16', 1, 2, 5, 2000, 50, 25, 2, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `uid` int(11) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `fullname` text NOT NULL,
  `email` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`uid`, `username`, `password`, `fullname`, `email`) VALUES
(1, 'admin', 'admin', 'admin', 'admin@gmail.com'),
(2, 'user123', 'user123', 'Ha Duc Kien', 'haduckien1709@gmail.com');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `generated_picture`
--
ALTER TABLE `generated_picture`
  ADD PRIMARY KEY (`fid`),
  ADD KEY `fk_uid` (`uid`),
  ADD KEY `fk_qid` (`qid`);

--
-- Chỉ mục cho bảng `query`
--
ALTER TABLE `query`
  ADD PRIMARY KEY (`qid`),
  ADD KEY `fk_uid` (`uid`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`uid`),
  ADD UNIQUE KEY `username` (`username`(50));

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `generated_picture`
--
ALTER TABLE `generated_picture`
  MODIFY `fid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

--
-- AUTO_INCREMENT cho bảng `query`
--
ALTER TABLE `query`
  MODIFY `qid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `generated_picture`
--
ALTER TABLE `generated_picture`
  ADD CONSTRAINT `fk_qid` FOREIGN KEY (`qid`) REFERENCES `query` (`qid`),
  ADD CONSTRAINT `generated_picture_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`);

--
-- Các ràng buộc cho bảng `query`
--
ALTER TABLE `query`
  ADD CONSTRAINT `fk_uid` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
