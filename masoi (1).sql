-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 23, 2021 at 05:11 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `masoi`
--

-- --------------------------------------------------------

--
-- Table structure for table `game`
--

CREATE TABLE `game` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `room` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `isAdmin` tinyint(1) NOT NULL,
  `role` int(11) NOT NULL DEFAULT '20',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `lastping` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `point` int(11) NOT NULL DEFAULT '100'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `game`
--

INSERT INTO `game` (`id`, `username`, `room`, `isAdmin`, `role`, `status`, `lastping`, `point`) VALUES
(1, 'accc', 'Uxd4dvIybf', 1, 1, 0, '2021-01-21 23:10:44', 100),
(2, 'accc', 'Uxd4dvIybf', 0, 0, 0, '2021-01-21 23:10:45', 100),
(3, 'addd', 'Uxd4dvIybf', 1, 0, 0, '2021-01-21 23:12:10', 100),
(4, 'Dcoa', 'ogI1r3f7IV', 1, 0, 0, '2021-01-22 00:00:48', 100),
(5, 'Xuxu', 'lcbXduE5Gz', 1, 1, 0, '2021-01-22 00:04:00', 100),
(6, 'Hau', 'UbVMDabVf84KhUZ45909mq0rLCHF7vGf', 1, 1, 0, '2021-01-23 21:11:22', 100),
(7, 'Xuan', 'UbVMDabVf84KhUZ45909mq0rLCHF7vGf', 0, 0, 0, '2021-01-23 20:47:32', 100),
(8, 'GauXu', 'UbVMDabVf84KhUZ45909mq0rLCHF7vGf', 0, 5, 0, '2021-01-23 21:04:29', 200),
(9, 'BongHoi', 'UbVMDabVf84KhUZ45909mq0rLCHF7vGf', 0, 0, 0, '2021-01-23 21:17:08', 100),
(10, 'BongNgu', 'UbVMDabVf84KhUZ45909mq0rLCHF7vGf', 0, 0, 0, '2021-01-23 21:04:06', 100),
(11, 'BongHoi', 'UbVMDabVf84KhUZ45909mq0rLCHF7vGf', 0, 0, 0, '2021-01-23 21:06:18', 100),
(12, 'BongHoi', 'UbVMDabVf84KhUZ45909mq0rLCHF7vGf', 0, 20, 0, '2021-01-23 21:11:26', 100),
(13, 'BossBong', 'jgCMqTuu1RIU', 1, 21, 1, '2021-01-23 23:11:27', 140),
(14, 'BossXu', 'jgCMqTuu1RIU', 0, 2, 1, '2021-01-23 23:11:27', 120),
(15, 'BongHoi', 'jgCMqTuu1RIU', 0, 5, 0, '2021-01-23 21:33:08', 100),
(16, 'HoiHoi', 'jgCMqTuu1RIU', 0, 6, 1, '2021-01-23 23:11:27', 100),
(17, 'BongNgu', 'jgCMqTuu1RIU', 0, 6, 1, '2021-01-23 23:11:27', 140),
(18, 'XuSoi', 'jgCMqTuu1RIU', 0, 1, 0, '2021-01-23 21:33:09', 100),
(20, 'BongLao', 'jgCMqTuu1RIU', 0, 1, 1, '2021-01-23 23:11:27', 100),
(21, 'Huhu', 'jgCMqTuu1RIU', 0, 0, 0, '2021-01-23 22:34:26', 100),
(22, 'Hiha', 'jgCMqTuu1RIU', 0, 1, 1, '2021-01-23 23:11:27', 100);

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `note` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `img` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `team` varchar(30) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `name`, `note`, `img`, `team`) VALUES
(1, 'Werewolf  (Ma sói)', 'Vào ban đêm, Ma sói sẽ tỉnh dậy cùng nhau và thống nhất giết 1 nạn nhận nào đó. Sói có thể không giết người nào và không được giết sói khác.', 'werewolf.png', 'Ma sói'),
(2, 'Witch (Phù thủy)', 'Phù thủy sẽ có hai bình thuốc. Một bình thuốc để cứu 1 người và một bình thuốc để giết 1 người. Trong đêm, Quản trò sẽ cho Phù Thủy biết ai sẽ bị giết trong đêm và hỏi xem Phù thủy có muốn sử dụng quyền năng nào hay không. Có thể dùng cả hai bình thuốc này vào cùng 1 đêm, nhưng mỗi bình chỉ dùng một lần.', 'witch.png', 'Dân làng'),
(3, 'Hunter (Thợ săn)', 'Nếu thợ săn chết, hắn sẽ phép nhắm vào một người và người này sẽ bị chết.', 'hunter.png', 'Dân làng'),
(4, 'Bodyguard (Bảo vệ)', 'Mỗi đêm, Bảo vệ chọn một người khác nhau để bảo vệ. Người chơi này sẽ bất tử vào đêm đó. Không thể chọn 1 người 2 đêm liên tiếp.', 'bodyguard.png', 'Dân làng'),
(5, 'Seeker (Tiên tri)', 'Mỗi đêm, Tiên tri chỉ tay vào một người. Quản trò sẽ cho Tiên tri biết người đó có phải là Ma sói hay không bằng cách gật hoặc lắc đầu.', 'seer.png', 'Dân làng'),
(6, 'Village (Dân làng)', 'Không có tính năng đặc biệt nào cả, ngủ suốt đêm và tham gia biểu quyết tìm Sói vào ban ngày.', 'villager.png', 'Dân làng'),
(7, 'Apprentice Seer (Tiên tri tập sự)', 'Nếu Tiên Tri chết, Tiên tri tập sự sẽ trở thành Tiên tri mới. Tiên tri tập sự được thông báo  bằng cách trong đêm, vào lượt gọi Tiên tri, quản trò đụng vào vai của Tiên tri thực tập để gọi dậy.', 'Apprentice_Seer.png', 'Dân làng'),
(8, 'Aura Seer (Tiên tri hào quang)', 'Tiên tri hào quang thức dậy mỗi đêm để tìm kiếm người chơi có chức năng, không phải là Dân thường hay Sói.', 'Aura-Seer.png', 'Dân làng'),
(9, 'Cupid (Thần tình yêu)', 'Thức dậy vào đêm đầu tiên và chọn ra 2 người chơi ( được phép chọn cả mình). Hai người được chọn sẽ trở thành 2 người yêu nhau. Nếu một trong hai người này chết, người còn lại cũng sẽ chết theo.', 'cupid.png', 'Dân làng'),
(10, 'Minion  (Kẻ phản bội)', 'Phản bội thức dậy cùng Sói và biết Sói là ai. Tham gia cùng Sói để giết Dân làng. Tuy nhiên Tiên tri khi soi vào Phản bội thì vẫn ra dân làng.', 'minion.png', 'Ma sói'),
(11, 'Idiot  (Thằng ngốc)', 'Thằng ngốc luôn luôn phải giơ tay tán thành việc giết một người chơi khác.', 'village-idiot.png', 'Dân làng'),
(12, 'Lycan (Người hóa sói)', 'Người hóa sói thuộc Phe dân làng, nhưng nếu được chỉ định bởi Tiên tri, thì sẽ bị thông báo là Sói.', 'lycan.png', 'Dân làng'),
(13, 'Mayor (Thị trưởng)', 'Phiếu biểu quyết của Thị trường được tính là 2 phiếu khi biểu quyết treo cổ.', 'mayor.png', 'Dân làng'),
(14, 'Lone Wolf (Sói cô đơn)', 'Hằng đêm, thức dậy cùng những con Sói khác. Sói cô đơn chỉ thắng cuộc nếu là người chơi cuối cùng trong trò chơi.', 'lone-wolf.png', 'Ma sói'),
(15, 'Wolf Cub (Sói con)', 'Sói con là Sói và thức dậy cùng Sói mỗi đêm. Nếu Sói con bị giết, Sói còn lại sẽ giết 2 người vào đêm hôm sau. Sói có thể chọn giết Sói Con như 1 sự hy sinh ( Tất cả Sói bao gồm cả Sói con đều đồng ý việc đó). Khi đó Sói có thể lập tức giết 2 người chơi khác vào ngay đêm hôm đó.', 'wolf-cub.png', 'Ma sói'),
(16, 'Cursed (Kẻ bị nguyền rủa)', 'Kẻ bị Nguyền rủa ban đầu là người, Tiên tri soi cũng ra người. Nếu Kẻ bị Nguyền rủa bị Sói cắn thì sẽ không chết, mà từ đêm tiếp theo sẽ biến thành Sói, đồng thời nếu Tiên tri sói thì cũng sẽ là Sói. Kẻ bị Nguyền rủa mỗi đêm được gọi dậy riêng biệt, kể cả sau khi hóa Sói, để cho người này biết đã bị hóa Sói hay chưa.', 'cursed.png', 'Chuyển phe'),
(17, 'Doppelganger (Nhân bản)', 'Vào đêm đầu tiên, Nhân bản tỉnh dậy và lựa chọn một người chơi. Nếu người chơi kia chết trong đêm, Nhân bản sẽ bí mật lấy chức năng của người đó. Trước khi có chức năng mới, Nhân bản theo Phe dân. Sau khi có chức năng mới, Nhân bản theo phe của chức năng này.', 'doppelganger.png', 'Chuyển phe'),
(18, 'Tanner (Chán đời)', 'Chán đời chỉ thắng khi anh ta bị giết. Các điều kiện thắng khác cũng được áp dụng.', 'tanner.png', 'Phe thứ 3'),
(19, 'Big Bad Wolf (Sói đại ca)', 'Thức dậy cùng Ma sói. Chừng nào Big Bad Wolf còn tồn tại trong trò chơi thì mỗi đêm phe Ma sói có thể giết hai người chơi, miễn là hai người chơi đó ngồi cạnh nhau.', 'Big_Bad_Wolf.png', 'Ma sói'),
(20, 'Chưa Nhận', 'Đang chờ', 'blank.jpg', 'Chưa nhận'),
(21, 'Moderator (Quản trò)', 'Bạn là Quản trò', 'Moderator.jpg', 'Không');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `game`
--
ALTER TABLE `game`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `game`
--
ALTER TABLE `game`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
