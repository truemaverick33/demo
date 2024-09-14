-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Sep 14, 2024 at 11:59 AM
-- Server version: 8.3.0
-- PHP Version: 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `book_db.sql`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookmark`
--

DROP TABLE IF EXISTS `bookmark`;
CREATE TABLE IF NOT EXISTS `bookmark` (
  `bookmark_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `book_id` int NOT NULL,
  `page_no` int NOT NULL,
  PRIMARY KEY (`bookmark_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `book_master`
--

DROP TABLE IF EXISTS `book_master`;
CREATE TABLE IF NOT EXISTS `book_master` (
  `book_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `genre` varchar(75) NOT NULL,
  `author` varchar(75) NOT NULL,
  `uploaded_by` int NOT NULL,
  `loc` text NOT NULL,
  `cover` text NOT NULL,
  `descrip` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `book_master`
--

INSERT INTO `book_master` (`book_id`, `title`, `genre`, `author`, `uploaded_by`, `loc`, `cover`, `descrip`) VALUES
(1, 'Pride and Prejudice', 'Love Story', 'Jane Austen', 1, 'books/prideandprej.pdf', 'love1.jpg', 'Pride and Prejudice by Jane Austen is a classic novel that explores themes of love, class, and social expectations in early 19th-century England. The story follows Elizabeth Bennet, a witty and independent young woman, as she navigates complex relationships, particularly with the wealthy and seemingly arrogant Mr. Darcy. Despite initial misunderstandings and prejudice, Elizabeth and Darcy grow to understand and love each other, overcoming societal pressures and personal flaws. The novel highlights the importance of personal growth and challenges assumptions about wealth, status, and marriage.'),
(2, 'The Picture of Dorian Gray', 'Horror', 'Oscar Wilde', 2, 'books/tpodg.pdf', 'horror2.jpg', 'The Picture of Dorian Gray by Oscar Wilde tells the story of a young man, Dorian Gray, who wishes that a portrait of him would age instead of himself. As Dorian indulges in a life of hedonism and moral corruption, the portrait bears the marks of his sins and decays, while he remains outwardly youthful. Eventually, the weight of his actions becomes unbearable, leading to a tragic end when Dorian destroys the portrait, causing his own death. The novel explores themes of vanity, consequence, and the corrupting influence of unchecked desires.'),
(3, 'Nothenger Abbey', 'Horror', 'Jane Austen', 2, 'books/nothenger.pdf', 'horror1.jpg', 'Northanger Abbey by Jane Austen follows Catherine Morland, a young and naive woman who loves gothic novels. She is invited to stay at Northanger Abbey, the home of the Tilney family, where her imagination runs wild, leading her to suspect dark secrets within the abbey. Throughout the novel, Catherine matures and learns to distinguish between fiction and reality. The story is a satire of the gothic genre and a commentary on societal expectations, with a focus on Catherine\'s growth, her romantic interest in Henry Tilney, and her realization of the importance of reason and good judgment.'),
(4, 'The Hunchback of Notre Dame', 'History', 'Victor Hugo', 1, 'books/hunch.pdf', 'history2.jpg', 'The Hunchback of Notre-Dame by Victor Hugo is a dramatic tale set in 15th-century Paris, centering on the deformed but kind-hearted bell-ringer Quasimodo, who lives in the Notre-Dame Cathedral. The novel intertwines his tragic love for the beautiful gypsy Esmeralda with the sinister machinations of the villainous archdeacon, Claude Frollo. Quasimodo\'s deep affection for Esmeralda, who is also loved by a brave soldier, leads to a series of tragic events. The novel explores themes of love, obsession, and social injustice, with the cathedral itself symbolizing both the grandeur and the cruelty of the time.'),
(5, 'War and Peace', 'History', 'Leo Tolstoy', 1, 'books/warandpeace.pdf', 'history1.jpg', 'War and Peace by Leo Tolstoy is an epic novel set against the backdrop of the Napoleonic Wars in early 19th-century Russia. It follows the lives of several aristocratic families, focusing on key characters such as Pierre Bezukhov, an idealistic count; Andrei Bolkonsky, a disillusioned war hero; and Natasha Rostova, a young woman caught between love and societal expectations. The novel intricately weaves personal dramas with historical events, exploring themes of fate, free will, and the impact of historical change on individual lives. It is renowned for its detailed depiction of Russian society and its profound philosophical reflections on war and peace.'),
(6, 'Ozma Of Oz', 'Fantasy', 'L. Frank Baum', 2, 'books/ozmaof.pdf', 'fantasy3.jpg', 'Ozma of Oz is the third book in L. Frank Baum\'s Oz series. In this adventure, Dorothy Gale from Kansas finds herself back in the magical land of Oz, but this time she travels to the country of Ev, where she meets the young Princess Ozma. The story follows Dorothy as she encounters new characters, including the mechanical man Tik-Tok and the cowardly Lion. Together, they must battle the wicked Nome King, who has conquered the Emerald City and kidnapped Princess Ozma. The novel is filled with fantasy, courage, and friendship as Dorothy and her friends embark on a quest to restore peace to the land of Oz.'),
(7, 'The Wonderful Wizard Of Oz', 'Fantasy', 'L. Frank Baum', 2, 'books/wonderwizardoz.pdf', 'fantasy2.jpg', 'The Wonderful Wizard of Oz by L. Frank Baum is a classic children\'s novel that tells the story of Dorothy Gale, a young girl from Kansas who is swept away by a tornado to the magical land of Oz. To return home, Dorothy must seek the help of the mysterious Wizard of Oz, who lives in the Emerald City. Along the way, she befriends the Scarecrow, who desires a brain; the Tin Woodman, who wants a heart; and the Cowardly Lion, who seeks courage. Together, they face various challenges and discover that the power to achieve their desires lies within themselves. The novel is celebrated for its imaginative world, memorable characters, and underlying themes of self-discovery and bravery.');

-- --------------------------------------------------------

--
-- Table structure for table `chats`
--

DROP TABLE IF EXISTS `chats`;
CREATE TABLE IF NOT EXISTS `chats` (
  `chat_id` int NOT NULL AUTO_INCREMENT,
  `frd_id` int NOT NULL,
  `book_id` int NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`chat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `friend`
--

DROP TABLE IF EXISTS `friend`;
CREATE TABLE IF NOT EXISTS `friend` (
  `frd_id` int NOT NULL AUTO_INCREMENT,
  `user_id1` int NOT NULL,
  `user_id2` int NOT NULL,
  `status` int NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`frd_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `friend`
--

INSERT INTO `friend` (`frd_id`, `user_id1`, `user_id2`, `status`, `time`) VALUES
(1, 1, 2, 0, '2024-09-14 07:07:06'),
(8, 4, 3, 1, '2024-09-14 10:13:41'),
(9, 1, 3, 1, '2024-09-14 11:14:01');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
CREATE TABLE IF NOT EXISTS `messages` (
  `msg_id` int NOT NULL AUTO_INCREMENT,
  `msg` varchar(80) NOT NULL,
  `from_uid` int NOT NULL,
  `to_uid` int NOT NULL,
  `timestmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`msg_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_master`
--

DROP TABLE IF EXISTS `ticket_master`;
CREATE TABLE IF NOT EXISTS `ticket_master` (
  `ticket_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `descrip` varchar(80) NOT NULL,
  `book_id` int NOT NULL,
  `handled_by` int NOT NULL,
  PRIMARY KEY (`ticket_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_master`
--

DROP TABLE IF EXISTS `user_master`;
CREATE TABLE IF NOT EXISTS `user_master` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `fullname` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email_id` varchar(75) NOT NULL,
  `pwd` text NOT NULL,
  `gender` varchar(11) NOT NULL,
  `pfp` text NOT NULL,
  `isadmin` int NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_master`
--

INSERT INTO `user_master` (`user_id`, `fullname`, `username`, `email_id`, `pwd`, `gender`, `pfp`, `isadmin`) VALUES
(1, 'Vaishnavi Pandya', 'princess10', 'vaishnavipandya@gmail.com', '793121fbe27c19026f0e083dd0bf93e09496f7ec820a753f31d86c4f212edec7', 'Female', '13924170639user1.jpg', 0),
(2, 'Cha Eunwoo', 'eunwoo30', 'chaeunwoo@gmail.com', 'cb5679b0becebdbbb8f3064038274aeb977d1f9a48343bd98ace060e35b8611f', 'Male', 'user2.jpg', 1),
(3, 'Shraddha Kapoor', 'sparkling_girl23', 'shraddhakapoor@gmail.com', 'ec73f1cb53b2219c862b992e226e8d8b5c819efe0bd4e8901dc877173f00da3a', 'Female', 'default.jpg', 0),
(4, 'Ayushi Shah', 'ayushi18', 'ayushishah@gmail.com', '9ca98d42df1439ab902a2be1f5a7d80fec63d10781337188270b3110c7525759', 'Female', 'default.jpg', 0),
(5, 'Misha Patel', 'mishy12', 'mishapatel@gmail.com', 'cf333f0487504ea767fe644995c14d6fc6bcb2b8d68c2417f3158c18dafdd075', 'Female', 'default.jpg', 0);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
