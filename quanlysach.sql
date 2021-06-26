-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1:3306
-- Thời gian đã tạo: Th6 24, 2021 lúc 04:50 AM
-- Phiên bản máy phục vụ: 5.7.31
-- Phiên bản PHP: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `quanlysach`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart`
--

DROP TABLE IF EXISTS `cart`;
CREATE TABLE IF NOT EXISTS `cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idUser` int(11) NOT NULL,
  `idProduct` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Cart_Product` (`idProduct`),
  KEY `FK_Cart_User` (`idUser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoryName` varchar(255) NOT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`id`, `categoryName`, `description`) VALUES
(1, 'Giáo trình', NULL),
(2, 'Truyện, tiểu thuyết', NULL),
(3, 'Văn học', ''),
(4, 'Kĩ năng sống', '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `discount`
--

DROP TABLE IF EXISTS `discount`;
CREATE TABLE IF NOT EXISTS `discount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idProduct` int(11) NOT NULL,
  `discountValue` int(11) NOT NULL,
  `dateBegin` date NOT NULL,
  `dateEnd` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Discount_Product` (`idProduct`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `image`
--

DROP TABLE IF EXISTS `image`;
CREATE TABLE IF NOT EXISTS `image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idProduct` int(11) NOT NULL,
  `link` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Image_Product` (`idProduct`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `image`
--

INSERT INTO `image` (`id`, `idProduct`, `link`) VALUES
(1, 1, 'triethoc1.jpg'),
(2, 1, 'triethoc2.jpg'),
(3, 1, 'triethoc3.jpg'),
(4, 2, 'khtd1.jpg'),
(5, 2, 'khtd2.jpg'),
(6, 2, 'khtd3.jpg'),
(7, 3, 'pldc1.jpg'),
(8, 3, 'pldc2.jpg'),
(9, 3, 'pldc3.jpg'),
(10, 4, 'gpsl1.jpg'),
(11, 4, 'gpsl2.jpg'),
(12, 4, 'gpsl3.jpg'),
(13, 5, 'shpt1.jpg'),
(14, 5, 'shpt2.jpg'),
(15, 5, 'shpt3.jpg'),
(16, 6, 'mn1.jpg'),
(17, 6, 'mn2.jpg'),
(18, 6, 'mn3.jpg'),
(19, 7, 'cs1.jpg'),
(20, 7, 'cs2.jpg'),
(21, 7, 'cs3.jpg'),
(22, 8, 'nmlh1.jpg'),
(23, 8, 'nmlh2.jpg'),
(24, 8, 'nmlh3.jpg'),
(25, 9, 'dmc1.jpg'),
(26, 9, 'dmc2.jpg'),
(27, 9, 'dmc3.jpg'),
(28, 10, 'nktc1.jpg'),
(29, 10, 'nktc2.jpg'),
(30, 10, 'nktc3.jpg'),
(31, 11, 'VH1.jpg'),
(32, 12, 'VH2.jpg'),
(33, 13, 'VH3-1.jpg'),
(34, 13, 'VH3-2.jpg'),
(35, 14, 'VH4-1.jpg'),
(36, 14, 'VH4-2.jpg'),
(37, 15, 'VH5-1.jpg'),
(38, 15, 'VH5-2.jpg'),
(39, 16, 'KN1-1.jpg'),
(40, 16, 'KN1-2.jpg'),
(41, 17, 'KN2-1.jpg'),
(42, 17, 'KN2-2.jpg'),
(43, 18, 'KN3-1.jpg'),
(44, 18, 'KN3-2.jpg'),
(45, 19, 'KN4-1.jpg'),
(46, 19, 'KN4-2.jpg'),
(47, 20, 'KN5-1.jpg'),
(48, 20, 'KN5-2.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orderstatus`
--

DROP TABLE IF EXISTS `orderstatus`;
CREATE TABLE IF NOT EXISTS `orderstatus` (
  `id` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `orderstatus`
--

INSERT INTO `orderstatus` (`id`, `status`) VALUES
(1, 'Mới tạo'),
(2, 'Đang lấy hàng'),
(3, 'Đang giao'),
(4, 'Hoàn thành');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idCategory` int(11) NOT NULL,
  `productName` text NOT NULL,
  `price` int(11) NOT NULL,
  `description` text NOT NULL,
  `totalSold` int(11) NOT NULL DEFAULT '0',
  `dateAdd` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK_Product_Category` (`idCategory`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`id`, `idCategory`, `productName`, `price`, `description`, `totalSold`, `dateAdd`, `deleted`) VALUES
(1, 1, 'Giáo Trình Triết Học', 85000, 'Tác giả: nhiều tác giả\r\nĐứng top thứ 9 trong 1000 Giáo trình Đại Học - Cao Đẳng bán chạy', 12, '2021-06-23 05:43:57', 0),
(2, 1, 'Giáo Trình Khoa Học Trái Đất', 70000, '', 5, '2021-06-23 05:43:57', 0),
(3, 1, 'Giáo Trình Pháp Luật Đại Cương', 60000, '', 3, '2021-06-23 05:43:57', 0),
(4, 1, 'Giáo Trình Giải phẫu, Sinh Lý Người Và Động Vật Học', 114000, '', 10, '2021-06-23 05:43:57', 0),
(5, 1, 'Giáo Trình Sinh Học Phát Triển', 95000, '', 8, '2021-06-23 05:43:57', 0),
(6, 2, 'Mặt Nạ - Tiểu Thuyết', 51500, 'Đứng thứ 45 trong top 1000 Tiểu thuyết bán chạy', 25, '2021-06-23 05:43:57', 0),
(7, 2, 'Méo - Tiểu Thuyết 12 Chòm Sao - Tập 2 (Tặng Kèm: 6 Postcard Nhân Vật)', 74000, 'Tác giả: Tiên Sắc Xám', 16, '2021-06-23 05:43:57', 0),
(8, 2, 'Nhà Máy Sản Xuất Linh Hồn (Tiểu Thuyết)', 67500, 'Tác giả: Nguyễn Nguyên Phước', 7, '2021-06-23 05:43:57', 0),
(9, 2, 'Đất Mồ Côi (Tiểu Thuyết)', 97500, 'Tác giả: Cổ Viên', 5, '2021-06-23 05:43:57', 0),
(10, 2, 'Ngồi Khóc Trên Cây: Truyện Dài', 5900, 'Tác giả: Nguyễn Nhật Ánh', 20, '2021-06-23 05:43:57', 0),
(11, 3, 'Bước Chậm Lại Giữa Thế Gian Vội Vã', 51000, 'Ra mắt lần đầu năm 2012, \r\nBước chậm lại giữa thế gian vội vã của \r\nĐại đức Hae Min đã liên tục đứng đầu danh sách \r\nbest-seller của nhiều trang sách trực tuyến uy tín của Hàn Quốc, \r\ntrở thành cuốn sách chữa lành cho hàng triệu người trẻ luôn tất bật với nhiều công việc', 1, '2021-06-24 03:05:05', 0),
(12, 3, 'Chiến Binh Cầu Vồng', 98000, 'Tác phẩm đã bán được trên năm triệu bản, \r\nđược dịch ra 26 thứ tiếng, là một trong những đại diện xuất sắc nhất của văn học Indonesia hiện đại.', 10, '2021-06-24 03:05:05', 0),
(13, 3, 'Giết Con Chim Nhại', 100000, 'Gần 50 năm từ ngày đầu ra mắt, \r\nGiết con chim nhại, tác phẩm đầu tay và cũng là cuối cùng của nữ nhà văn Mỹ Harper Lee vẫn đầy sức hút với độc giả ở nhiều lứa tuổi.', 15, '2021-06-24 03:05:05', 0),
(14, 3, 'Hai Số Phận', 153000, 'Tất cả những trải nghiệm trong chuyến phiêu du theo đuổi vận mệnh của mình \r\nđã giúp Santiago thấu hiểu được ý nghĩa sâu xa nhất của hạnh phúc, hòa hợp với vũ trụ và con người.', 7, '2021-06-24 03:05:05', 0),
(15, 3, 'Nhà Giả Kim', 54000, 'Hai Số Phận (Bìa Cứng) là cuốn sách không chỉ đơn thuần là \r\nmột cuốn tiểu thuyết đây có thể coi như là \"thánh kinh\" cho những người không dễ dãi chấp nhận lối mòn, cuốn sách được nhiều độc giả yêu thích', 6, '2021-06-24 03:05:05', 0),
(16, 4, 'Đắc Nhân Tâm', 53000, 'Đắc nhân tâm của Dale Carnegie là quyển sách duy nhất\r\n về thể loại self-help liên tục đứng đầu danh mục sách bán chạy nhất (best-selling Books) do báo The New York Times bình chọn suốt 10 năm liền. Được xuất bản năm 1936, với số lượng bán ra hơn 15 triệu bản, tính đến nay, sách đã được dịch ra ở hầu hết các ngôn ngữ, trong đó có cả Việt Nam, và đã nhận được sự đón tiếp nhiệt tình của đọc giả ở hầu hết các quốc gia', 17, '2021-06-24 03:05:05', 0),
(17, 4, 'Càng Kỷ Luật, Càng Tự Do', 70000, 'CÀNG KỶ LUẬT, CÀNG TỰ DO - \r\nMong rằng tại thời điểm kết thúc hành trình với cuốn sách, bạn đã là một phiên bản khác kỷ luật hơn, nhưng tự do hơn.', 5, '2021-06-24 03:05:05', 0),
(18, 4, 'Thay Đổi Cuộc Sống Với Nhân Số Học', 155000, 'Cuốn sách Thay đổi cuộc sống với Nhân số học là tác phẩm được chị \r\nLê Đỗ Quỳnh Hương phát triển từ tác phẩm gốc “The Complete Book of Numerology” của tiến sỹ David A. Phillips, khiến bộ môn Nhân số học khởi nguồn từ nhà toán học Pythagoras trở nên gần gũi, dễ hiểu hơn với độc giả Việt Nam.', 10, '2021-06-24 03:05:05', 0),
(19, 4, 'Làm Sao Học Ít Hiểu Nhiều', 77000, 'Học, học nữa, học mãi là cách duy nhất để một con người \r\nliên tục tiến bộ và không tụt hậu, đó là chân lý ai cũng biết. Vấn đề là, không phải ai cũng biết phải học như thế nào vừa tiết kiệm các nguồn lực quý báu như thời gian, tiền bạc và công sức mà vẫn đạt hiệu quả tối đa trong việc dung nạp các kiến thức mình cần', 8, '2021-06-24 03:05:05', 0),
(20, 4, 'Đời Ngắn Đừng Ngủ Dài', 38000, 'Bằng những lời chia sẻ thật ngắn gọn, dễ hiểu về những trải nghiệm và suy ngẫm trong đời, \r\nRobin Sharma tiếp tục phong cách viết của ông từ cuốn sách Điều vĩ đại đời thường để mang đến cho độc giả những bài viết như lời tâm sự, vừa chân thành vừa sâu sắc.', 8, '2021-06-24 03:05:05', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `saleorder`
--

DROP TABLE IF EXISTS `saleorder`;
CREATE TABLE IF NOT EXISTS `saleorder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idUser` int(11) NOT NULL,
  `idStatus` int(11) NOT NULL DEFAULT '1',
  `fullName` varchar(255) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `address` text NOT NULL,
  `total` int(11) NOT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_SaleOrder_OrderStatus` (`idStatus`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `saleorderdetail`
--

DROP TABLE IF EXISTS `saleorderdetail`;
CREATE TABLE IF NOT EXISTS `saleorderdetail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idOrder` int(11) NOT NULL,
  `idProduct` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_SaleOerderDetail_SaleOrder` (`idOrder`),
  KEY `FK_SaleOrderDetail_Product` (`idProduct`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `FK_Cart_Product` FOREIGN KEY (`idProduct`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `FK_Cart_User` FOREIGN KEY (`idUser`) REFERENCES `user` (`id`);

--
-- Các ràng buộc cho bảng `discount`
--
ALTER TABLE `discount`
  ADD CONSTRAINT `FK_Discount_Product` FOREIGN KEY (`idProduct`) REFERENCES `product` (`id`);

--
-- Các ràng buộc cho bảng `image`
--
ALTER TABLE `image`
  ADD CONSTRAINT `FK_Image_Product` FOREIGN KEY (`idProduct`) REFERENCES `product` (`id`);

--
-- Các ràng buộc cho bảng `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK_Product_Category` FOREIGN KEY (`idCategory`) REFERENCES `category` (`id`);

--
-- Các ràng buộc cho bảng `saleorder`
--
ALTER TABLE `saleorder`
  ADD CONSTRAINT `FK_SaleOrder_OrderStatus` FOREIGN KEY (`idStatus`) REFERENCES `orderstatus` (`id`);

--
-- Các ràng buộc cho bảng `saleorderdetail`
--
ALTER TABLE `saleorderdetail`
  ADD CONSTRAINT `FK_SaleOerderDetail_SaleOrder` FOREIGN KEY (`idOrder`) REFERENCES `saleorder` (`id`),
  ADD CONSTRAINT `FK_SaleOrderDetail_Product` FOREIGN KEY (`idProduct`) REFERENCES `product` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
