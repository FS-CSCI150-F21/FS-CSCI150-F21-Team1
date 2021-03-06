-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 29, 2021 at 08:14 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rest_info`
--

-- --------------------------------------------------------

--
-- Table structure for table `user_info`
--

CREATE TABLE `user_info` (
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  `level` int(1) NOT NULL,
  `phone` varchar(25) NOT NULL,
  `email` varchar(25) NOT NULL,
  `position` varchar(25) NOT NULL,
  `wage` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_info`
--

INSERT INTO `user_info` (`first_name`, `last_name`, `username`, `password`, `level`, `phone`, `email`, `position`, `wage`) VALUES
('Ümit', 'Başoğlu', 'angrybutterfly804', 'eraser', 1, '(056)-246-3798', 'umit.basoglu@example.com', 'greeter', 19.13),
('Samir', 'Silveira', 'angrycat530', 'stefano', 2, '(03) 9109-3815', 'samir.silveira@example.co', '', 0),
('Flenn', 'Anderson', 'angryduck462', 'jesse', 0, '013873 98828', 'flenn.anderson@example.co', 'cook', 23.65),
('Janne', 'Sangolt', 'angrygorilla975', 'hannah1', 1, '54673080', 'janne.sangolt@example.com', 'waiter', 17.94),
('Charlie', 'Moore', 'angrywolf324', 'smart', 1, '(978)-021-1058', 'charlie.moore@example.com', 'cook', 16.05),
('Jose', 'Alonso', 'angryzebra467', 'dalejr', 0, '945-700-621', 'jose.alonso@example.com', 'waiter', 7.31),
('Camille', 'Pelletier', 'beautifulfrog434', 'buffalo1', 0, '729-665-4599', 'camille.pelletier@example', 'waiter', 13.3),
('یسنا', 'گلشن', 'beautifulostrich362', 'bicycle', 0, '084-75234930', 'ysn.glshn@example.com', 'bartender', 18.36),
('میلاد', 'نجاتی', 'beautifulzebra280', 'haha', 2, '053-77880089', 'myld.njty@example.com', '', 0),
('Gertraud', 'Neugebauer', 'bigfish236', 'blue42', 0, '0137-4249729', 'gertraud.neugebauer@examp', 'waiter', 4.36),
('سینا', 'كامياران', 'bigfish319', 'zxcvb', 2, '068-33698387', 'syn.kmyrn@example.com', '', 0),
('Fred', 'Carter', 'bigfrog346', 'denali', 1, '07-9966-7567', 'fred.carter@example.com', 'bartender', 17.54),
('Randall', 'Romero', 'bigladybug624', 'joe123', 1, '015394 23071', 'randall.romero@example.co', 'waiter', 20.24),
('Eva', 'Lee', 'bigleopard946', 'pppp', 2, '(854)-884-3125', 'eva.lee@example.com', '', 0),
('Hugo', 'Benitez', 'blackelephant143', 'train', 1, '934-080-298', 'hugo.benitez@example.com', 'bartender', 17.32),
('Sarah', 'Chan', 'blackgorilla508', '616161', 2, '802-260-5476', 'sarah.chan@example.com', '', 0),
('Aaron', 'Kumar', 'blackpanda751', 'savage', 0, '(141)-548-2557', 'aaron.kumar@example.com', 'cook', 18.8),
('Hector', 'Arias', 'blackrabbit342', 'basset', 0, '981-037-683', 'hector.arias@example.com', 'waiter', 7.47),
('Naja', 'Nielsen', 'blackwolf283', 'trains', 0, '30289239', 'naja.nielsen@example.com', 'janitor', 20.69),
('Jozef', 'Jacob', 'bluedog307', 'firefigh', 0, '0453-4240795', 'jozef.jacob@example.com', 'janitor', 14.53),
('Anna', 'Sullivan', 'bluegoose319', 'slow', 2, '061-308-9589', 'anna.sullivan@example.com', '', 0),
('Marie', 'Christiansen', 'bluemeercat865', 'hatred', 1, '93459307', 'marie.christiansen@exampl', 'bartender', 13.54),
('Gabe', 'Nelson', 'bluerabbit566', 'shelter', 0, '061-201-7949', 'gabe.nelson@example.com', 'greeter', 17.02),
('Ceylan', 'Özbey', 'brownbear535', 'disney', 0, '(159)-134-3028', 'ceylan.ozbey@example.com', 'waiter', 7.93),
('Blake', 'Moore', 'brownelephant605', 'xander', 2, '(309)-454-0973', 'blake.moore@example.com', '', 0),
('Phoebe', 'Murphy', 'browngoose276', 'spunk', 2, '015242 40811', 'phoebe.murphy@example.com', '', 0),
('Eddie', 'Banks', 'browngoose887', 'snowboard', 1, '05-2160-8995', 'eddie.banks@example.com', 'greeter', 22.45),
('Gilberte', 'Gauthier', 'brownkoala712', 'anthony', 0, '078 551 42 71', 'gilberte.gauthier@example', 'janitor', 10.5),
('Soan', 'Charles', 'brownmeercat269', 'donnie', 2, '05-40-25-76-84', 'soan.charles@example.com', '', 0),
('Charly', 'Meunier', 'brownostrich144', 'aragorn', 0, '02-49-73-88-90', 'charly.meunier@example.co', 'janitor', 20.62),
('Berit', 'Beyer', 'brownpanda411', 'advance', 2, '0199-7180870', 'berit.beyer@example.com', '', 0),
('Addison', 'Slawa', 'browntiger864', 'passthie', 1, '646-277-0062', 'addison.slawa@example.com', 'bartender', 5.16),
('Romy', 'Sanchez', 'crazybird420', 'crimson', 2, '02-80-30-32-02', 'romy.sanchez@example.com', '', 0),
('Nolan', 'Ruiz', 'crazybutterfly998', 'mongoose', 1, '013873 89611', 'nolan.ruiz@example.com', 'janitor', 8.33),
('Murat', 'Örge', 'crazyduck338', 'hookers', 1, '(700)-261-1940', 'murat.orge@example.com', 'janitor', 12.23),
('Gilbert', 'Rohmann', 'crazyfrog650', 'express', 0, '0475-1824991', 'gilbert.rohmann@example.c', 'cook', 23.42),
('بهاره', 'نكو نظر', 'crazyostrich586', 'machine', 1, '086-32513964', 'bhrh.nkwnzr@example.com', 'cook', 22.41),
('Yvette', 'Stich', 'crazyzebra713', 'feng', 1, '0200-8181380', 'yvette.stich@example.com', 'waiter', 3.92),
('Anna', 'Davies', 'goldenleopard125', 'laetitia', 0, '(501)-026-1849', 'anna.davies@example.com', 'greeter', 14.87),
('Quênia', 'Moreira', 'goldenleopard140', 'dummy', 1, '(11) 9956-2183', 'quenia.moreira@example.co', 'cook', 12.79),
('Maya', 'Knight', 'goldensnake107', 'apples', 0, '017684 80507', 'maya.knight@example.com', 'cook', 22.17),
('Franklin', 'Willis', 'greendog264', 'goldwing', 1, '051-449-2850', 'franklin.willis@example.c', 'greeter', 6.19),
('Sean', 'Watkins', 'greenfrog690', 'shou', 2, '(145)-147-5190', 'sean.watkins@example.com', '', 0),
('Florence', 'Cooper', 'greengoose591', 'cascade', 2, '(196)-133-5181', 'florence.cooper@example.c', '', 0),
('Alicja', 'Kjærland', 'greengorilla849', 'always', 0, '86423167', 'alicja.kjaerland@example.', 'greeter', 22.44),
('Rose', 'Macrae', 'greenostrich110', 'timeout', 1, '015396 46442', 'rose.macrae@example.com', 'cook', 24.53),
('Ronald', 'Price', 'greenpeacock230', 'koolaid', 2, '03-7021-6087', 'ronald.price@example.com', '', 0),
('Diná', 'Mendes', 'greenzebra436', 'callie', 1, '(89) 2370-3121', 'dina.mendes@example.com', 'janitor', 16.56),
('Dexter', 'Hagerup', 'happyduck765', 'technics', 1, '80895225', 'dexter.hagerup@example.co', 'janitor', 4.72),
('بیتا', 'سالاری', 'happygoose568', 'regina', 1, '067-30712114', 'byt.slry@example.com', 'greeter', 15.07),
('Connie', 'Castro', 'happygorilla928', 'bruno', 2, '03-6267-8386', 'connie.castro@example.com', '', 0),
('Edith', 'Burke', 'happyostrich631', 'cards', 2, '08-6630-1696', 'edith.burke@example.com', '', 0),
('Marco', 'Hernandez', 'happyzebra819', 'superior', 1, '999-758-663', 'marco.hernandez@example.c', 'greeter', 20.83),
('Roberto', 'Holmes', 'heavycat105', 'fellatio', 1, '011-946-4863', 'roberto.holmes@example.co', 'waiter', 12.51),
('Joel', 'Dunne', 'heavycat762', 'mephisto', 2, '061-084-6456', 'joel.dunne@example.com', '', 0),
('Lærke', 'Thomsen', 'heavygoose846', 'pimping', 2, '05431581', 'laerke.thomsen@example.co', '', 0),
('Mary', 'Lewis', 'heavygorilla987', 'carlitos', 2, '(040)-228-7089', 'mary.lewis@example.com', '', 0),
('Wenzel', 'Raasch', 'heavyleopard280', 'total', 1, '0127-4292394', 'wenzel.raasch@example.com', 'bartender', 16.88),
('Edgar', 'Jensen', 'heavylion793', 'stewart', 1, '(794)-808-6650', 'edgar.jensen@example.com', 'waiter', 22.32),
('Miodrag', 'Emde', 'heavysnake692', 'dharma', 2, '0405-3228813', 'miodrag.emde@example.com', '', 0),
('Erik', 'Velde', 'heavytiger736', 'luv2epus', 0, '62278705', 'erik.velde@example.com', 'waiter', 19.69),
('Jaxon', 'Cooper', 'heavytiger899', 'honda1', 2, '(319)-441-3450', 'jaxon.cooper@example.com', '', 0),
('Louis', 'Lavigne', 'heavyzebra990', '1948', 0, '789-923-2044', 'louis.lavigne@example.com', 'cook', 19.09),
('Wilfriede', 'Lamprecht', 'lazybear473', 'ashleigh', 0, '0032-9001225', 'wilfriede.lamprecht@examp', 'waiter', 9.34),
('Tony', 'Little', 'lazybear504', 'spankme', 2, '019467 22310', 'tony.little@example.com', '', 0),
('Nathan', 'Knight', 'lazybird163', 'amazon', 0, '890-158-3171', 'nathan.knight@example.com', 'bartender', 1.26),
('William', 'Li', 'lazygoose746', 'garcia', 1, '165-247-3581', 'william.li@example.com', 'janitor', 8.47),
('Tilje', 'Khan', 'lazylion908', 'cyclops', 2, '54323060', 'tilje.khan@example.com', '', 0),
('Sofia', 'Gutierrez', 'lazyrabbit306', 'moose', 1, '960-261-926', 'sofia.gutierrez@example.c', 'greeter', 12.48),
('Fanny', 'Dumont', 'orangeelephant526', 'eight', 2, '078 564 83 69', 'fanny.dumont@example.com', '', 0),
('Ali', 'Koç', 'orangegoose802', 'senators', 1, '(934)-033-0054', 'ali.koc@example.com', 'waiter', 15.13),
('Vilma', 'Perala', 'orangeladybug889', 'catcat', 1, '06-244-526', 'vilma.perala@example.com', 'cook', 22.96),
('Johnny', 'Long', 'orangemouse935', 'nothing', 2, '03-5528-3116', 'johnny.long@example.com', '', 0),
('Johanne', 'Nielsen', 'organicrabbit197', 'zanzibar', 1, '85920705', 'johanne.nielsen@example.c', 'waiter', 14.38),
('Oğuzhan', 'Kumcuoğlu', 'organicsnake716', 'submit', 2, '(580)-756-5771', 'oguzhan.kumcuoglu@example', '', 0),
('Danielle', 'May', 'organicwolf246', 'tennis', 2, '0718-2233015', 'danielle.may@example.com', '', 0),
('Mattheüs', 'Bierman', 'purplebear522', 'tazmania', 1, '(157)-125-3141', 'mattheus.bierman@example.', 'greeter', 18),
('Marius', 'Møller', 'purplekoala987', 'discover', 0, '59646285', 'marius.moller@example.com', 'cook', 3.17),
('Lindoro', 'da Mata', 'purplelion472', 'troy', 1, '(42) 9620-6317', 'lindoro.damata@example.co', 'waiter', 3.71),
('Anna', 'Hall', 'purplelion937', 'grand', 2, '(107)-007-7678', 'anna.hall@example.com', '', 0),
('Kiomi', 'Duits', 'purplemeercat820', '1235', 2, '(794)-714-0126', 'kiomi.duits@example.com', '', 0),
('Emmi', 'Lehtola', 'purplemouse860', 'jackoff', 2, '05-387-964', 'emmi.lehtola@example.com', '', 0),
('Shayan', 'Urstad', 'purpleostrich963', 'wanda', 2, '58743497', 'shayan.urstad@example.com', '', 0),
('Eduardo', 'Silva', 'purplepanda611', 'simmons', 0, '(64) 2366-4132', 'eduardo.silva@example.com', 'greeter', 8.37),
('Lemuel', 'Teixeira', 'purplerabbit672', 'losers', 2, '(75) 6837-3483', 'lemuel.teixeira@example.c', '', 0),
('Sophie', 'King', 'purplerabbit966', 'nopass', 2, '(797)-288-9352', 'sophie.king@example.com', '', 0),
('Lily', 'Walker', 'purplezebra927', 'north', 0, '952-619-4258', 'lily.walker@example.com', 'janitor', 23.42),
('Iwona', 'Hasse', 'redbear598', 'kissme', 2, '0898-4503300', 'iwona.hasse@example.com', '', 0),
('Esteban', 'Torres', 'reddog693', 'geronimo', 1, '904-360-351', 'esteban.torres@example.co', 'janitor', 7.27),
('Anneleen', 'Stouthart', 'redgoose725', 'windmill', 1, '(653)-833-7058', 'anneleen.stouthart@exampl', 'greeter', 16.01),
('Necati', 'Kutlay', 'redlion680', 'babylove', 0, '(137)-069-2544', 'necati.kutlay@example.com', 'bartender', 8.78),
('Elijah', 'Walker', 'redmeercat303', 'mississi', 0, '(415)-001-5266', 'elijah.walker@example.com', 'janitor', 4.77),
('Isabela', 'Pereira', 'redmouse893', 'radiohea', 2, '(74) 3156-2559', 'isabela.pereira@example.c', '', 0),
('Danijela', 'Ten Donkelaar', 'sadcat302', 'clancy', 0, '(526)-577-5529', 'danijela.tendonkelaar@exa', 'waiter', 17.18),
('Tommy', 'Garcia', 'sadfish299', 'twat', 1, '02-7818-8724', 'tommy.garcia@example.com', 'cook', 13.1),
('Simon', 'Pedersen', 'sadleopard507', 'salope', 2, '89741734', 'simon.pedersen@example.co', '', 0),
('Minea', 'Peltola', 'sadmouse944', 'nipper', 0, '09-326-248', 'minea.peltola@example.com', 'greeter', 14.83),
('Isaiah', 'Nichols', 'sadostrich182', 'doggy1', 1, '016973 00900', 'isaiah.nichols@example.co', 'waiter', 4.74),
('Carolijn', 'Juffermans', 'sadsnake239', 'enterme', 1, '(471)-688-4294', 'carolijn.juffermans@examp', 'janitor', 19.29),
('Louis', 'Bjerknes', 'sadswan160', 'cobalt', 0, '62130892', 'louis.bjerknes@example.co', 'bartender', 20.97),
('ایلیا', 'کامروا', 'sadswan288', 'hottie', 2, '018-73928031', 'yly.khmrw@example.com', '', 0),
('Jack', 'Daniels', 'sadswan289', '77777', 2, '051-061-4376', 'jack.daniels@example.com', '', 0),
('Ayşe', 'Erez', 'sadswan427', 'trixie', 1, '(069)-163-7634', 'ayse.erez@example.com', 'janitor', 15.93),
('Oskari', 'Wuollet', 'sadzebra301', 'gabber', 1, '07-715-189', 'oskari.wuollet@example.co', 'bartender', 15.26),
('Charlie', 'Thomas', 'silverbutterfly869', 'fred', 1, '021-370-9820', 'charlie.thomas@example.co', 'janitor', 15.91),
('Benjamin', 'Madsen', 'silverlion216', '1a2b3c', 1, '79235504', 'benjamin.madsen@example.c', 'cook', 8.08),
('Deniz', 'Kaya', 'silverpeacock483', 'trial', 0, '(416)-774-8382', 'deniz.kaya@example.com', 'janitor', 18.95),
('Giulia', 'Adam', 'silversnake862', 'easy', 1, '04-52-62-63-70', 'giulia.adam@example.com', 'bartender', 17.13),
('Emanuel', 'Freitas', 'smallbear610', 'nancy', 2, '(58) 8392-0949', 'emanuel.freitas@example.c', '', 0),
('Jose', 'Holt', 'smallfrog356', 'chacha', 0, '017687 33568', 'jose.holt@example.com', 'waiter', 15.74),
('Maddison', 'Green', 'smallfrog532', '1945', 2, '(069)-834-6585', 'maddison.green@example.co', '', 0),
('Florence', 'Singh', 'smallfrog986', 'jennie', 0, '526-802-4073', 'florence.singh@example.co', 'cook', 18.74),
('Anna', 'Santana', 'smallgoose496', 'thongs', 0, '957-568-591', 'anna.santana@example.com', 'cook', 10.65),
('Lidia', 'Romero', 'smallleopard126', 'virtual', 2, '914-039-230', 'lidia.romero@example.com', '', 0),
('Diana', 'Meyer', 'smalllion840', 'oooo', 2, '041-966-0482', 'diana.meyer@example.com', '', 0),
('Lucy', 'Chen', 'ticklishelephant745', 'jeep', 1, '(519)-993-0918', 'lucy.chen@example.com', 'janitor', 20.58),
('Pasquale', 'Borgers', 'ticklishlion707', 'redeye', 2, '(540)-573-0479', 'pasquale.borgers@example.', '', 0),
('Kim', 'Stewart', 'ticklishlion748', 'spoons', 0, '041-423-6989', 'kim.stewart@example.com', 'cook', 5.07),
('Sharon', 'Washington', 'ticklishmouse678', 'oyster', 0, '016977 3411', 'sharon.washington@example', 'greeter', 5.68),
('Karl-Otto', 'Olschewski', 'ticklishpeacock921', 'katherine', 0, '0179-1492728', 'karl-otto.olschewski@exam', 'bartender', 1.84),
('Hélèna', 'Bourgeois', 'ticklishswan953', 'billie', 0, '01-76-75-87-67', 'helena.bourgeois@example.', 'janitor', 24.03),
('Oskari', 'Haapala', 'ticklishtiger443', 'deng', 1, '08-219-500', 'oskari.haapala@example.co', 'cook', 6),
('Lucas', 'Calvo', 'ticklishzebra223', 'thecure', 0, '989-826-917', 'lucas.calvo@example.com', 'janitor', 20.28),
('Marinalda', 'Porto', 'tinyelephant309', 'bestbuy', 0, '(45) 3968-1994', 'marinalda.porto@example.c', 'janitor', 13.93),
('علیرضا', 'یاسمی', 'tinyfrog677', 'magic32', 1, '057-31847227', 'aalyrd.ysmy@example.com', 'cook', 14.98),
('Tanya', 'Fowler', 'tinysnake878', '252525', 2, '04-2706-6200', 'tanya.fowler@example.com', '', 0),
('Cristina', 'Saez', 'tinywolf341', 'maria1', 0, '906-080-249', 'cristina.saez@example.com', 'janitor', 6.73),
('سوگند', 'مرادی', 'tinyzebra897', 'clovis', 2, '033-29140745', 'swgnd.mrdy@example.com', '', 0),
('Elise', 'Vatland', 'whitebear966', 'hollow', 2, '50762789', 'elise.vatland@example.com', '', 0),
('Thomas', 'Shelton', 'whitebird661', 'telephon', 0, '0161 710 6274', 'thomas.shelton@example.co', 'greeter', 9.74),
('Celso', 'Gomes', 'whitedog632', '314159', 1, '(93) 5914-2544', 'celso.gomes@example.com', 'greeter', 18.99),
('Karen', 'Webb', 'whitedog745', 'willy', 0, '061-419-8194', 'karen.webb@example.com', 'waiter', 22.98),
('Mille', 'Johansen', 'whiteelephant158', 'mark', 0, '11241015', 'mille.johansen@example.co', 'bartender', 1.45),
('Olivia', 'Wilson', 'whitefish811', '636363', 2, '(918)-345-6634', 'olivia.wilson@example.com', '', 0),
('Jenny', 'King', 'whitegoose627', 'silvia', 0, '011-429-9826', 'jenny.king@example.com', 'greeter', 20.09),
('James', 'Green', 'whitelion915', 'people', 1, '(403)-955-8859', 'james.green@example.com', 'bartender', 18.4),
('Miriam', 'Ferrer', 'whiteswan363', 'corolla', 0, '998-155-458', 'miriam.ferrer@example.com', 'waiter', 21.9),
('Alissia', 'Boekhorst', 'yellowduck810', 'quincy', 2, '(598)-505-1854', 'alissia.boekhorst@example', '', 0),
('Friedrich', 'Rey', 'yellowpanda460', 'trout', 0, '075 612 72 37', 'friedrich.rey@example.com', 'cook', 15.8),
('Molly', 'Gonzales', 'yellowpeacock835', 'budweise', 1, '015396 55911', 'molly.gonzales@example.co', 'waiter', 8.55),
('Chandni', 'Verbeek', 'yellowswan457', 'asswipe', 2, '(285)-131-0110', 'chandni.verbeek@example.c', '', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`username`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
