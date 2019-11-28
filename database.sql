-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: cl1-sql20:3306
-- Generation Time: Nov 28, 2019 at 08:50 AM
-- Server version: 10.1.41-MariaDB-1~jessie
-- PHP Version: 7.0.33-0+deb9u6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `img76751`
--

-- --------------------------------------------------------

--
-- Table structure for table `bouquintheque_commande`
--

CREATE TABLE `bouquintheque_commande` (
  `id_commande` int(11) NOT NULL,
  `id_membre` int(11) NOT NULL,
  `montant` int(11) NOT NULL,
  `date_enregistrement` datetime NOT NULL,
  `etat` enum('en cours de traitement','envoyé','livré') NOT NULL,
  `promotion` varchar(50) NOT NULL DEFAULT 'Aucune'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bouquintheque_commande`
--

INSERT INTO `bouquintheque_commande` (`id_commande`, `id_membre`, `montant`, `date_enregistrement`, `etat`, `promotion`) VALUES
(2, 1, 6, '2019-06-24 11:26:43', 'envoyé', 'Aucune--0'),
(3, 1, 1000057, '2019-06-24 12:19:54', 'en cours de traitement', 'Aucune--0'),
(4, 1, 15, '2019-06-24 16:47:20', 'en cours de traitement', 'Aucune--0'),
(5, 1, 15, '2019-06-24 16:50:15', 'en cours de traitement', 'Aucune--0'),
(6, 1, 15, '2019-06-24 16:56:08', 'en cours de traitement', 'Aucune--0'),
(7, 1, 10000, '2019-06-24 16:59:50', 'en cours de traitement', 'Aucune--0'),
(8, 3, 15, '2019-06-24 18:44:21', 'en cours de traitement', 'Aucune--0'),
(9, 4, 1000000, '2019-06-25 11:21:42', 'en cours de traitement', 'Aucune--0'),
(10, 1, 7, '2019-09-30 10:48:26', 'en cours de traitement', 'Aucune--0'),
(11, 1, 7, '2019-09-30 11:00:24', 'en cours de traitement', 'Aucune--0'),
(12, 1, 7, '2019-09-30 11:02:39', 'en cours de traitement', 'Aucune--0'),
(13, 1, 15, '2019-09-30 11:04:05', 'en cours de traitement', 'Aucune--0'),
(14, 1, -5, '2019-09-30 11:27:05', 'en cours de traitement', 'PROMOBIS--5'),
(15, 1, 55, '2019-09-30 11:41:45', 'en cours de traitement', 'PROMOBIS--5'),
(16, 1, 60, '2019-09-30 13:29:36', 'en cours de traitement', 'Aucune--0'),
(17, 1, 60, '2019-09-30 13:32:00', 'en cours de traitement', 'Aucune--0'),
(18, 1, 55, '2019-09-30 13:42:21', 'en cours de traitement', 'Aucune--0'),
(19, 1, 55, '2019-09-30 13:45:02', 'en cours de traitement', 'PROMOBIS--5'),
(20, 1, 55, '2019-09-30 13:48:34', 'en cours de traitement', 'PROMOBIS--5'),
(21, 1, 55, '2019-09-30 13:49:43', 'en cours de traitement', 'PROMOBIS--5'),
(22, 1, 55, '2019-09-30 13:50:30', 'en cours de traitement', 'PROMOBIS--5'),
(23, 1, 45, '2019-09-30 13:51:36', 'en cours de traitement', 'PROMOBIS--5'),
(24, 1, 44, '2019-10-15 11:51:18', 'en cours de traitement', 'Aucune--0'),
(25, 1, 6, '2019-10-15 12:07:36', 'en cours de traitement', 'ESCROC--20'),
(26, 1, 30, '2019-11-28 08:30:23', 'en cours de traitement', 'Aucune--0'),
(27, 1, 25, '2019-11-28 08:43:47', 'en cours de traitement', 'Aucune--0'),
(28, 1, 72, '2019-11-28 08:44:43', 'en cours de traitement', 'Aucune--0'),
(29, 1, 8, '2019-11-28 08:45:38', 'en cours de traitement', 'Aucune--0');

-- --------------------------------------------------------

--
-- Table structure for table `bouquintheque_details_commande`
--

CREATE TABLE `bouquintheque_details_commande` (
  `id_details_commande` int(11) NOT NULL,
  `id_commande` int(3) NOT NULL,
  `id_produit` int(3) NOT NULL,
  `quantite` int(3) NOT NULL,
  `prix` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bouquintheque_details_commande`
--

INSERT INTO `bouquintheque_details_commande` (`id_details_commande`, `id_commande`, `id_produit`, `quantite`, `prix`) VALUES
(2, 2, 1, 3, 2),
(3, 3, 2, 1, 12),
(4, 3, 3, 1, 1000000),
(5, 3, 6, 3, 15),
(6, 8, 6, 1, 15),
(7, 9, 3, 1, 1000000),
(8, 10, 9, 1, 7),
(9, 11, 9, 1, 7),
(10, 12, 9, 1, 7),
(11, 13, 10, 1, 15),
(12, 14, 9, 11, 7),
(13, 15, 10, 4, 15),
(14, 16, 10, 4, 15),
(15, 17, 10, 4, 15),
(16, 18, 10, 4, 15),
(17, 19, 10, 4, 15),
(18, 20, 10, 4, 15),
(19, 21, 10, 4, 15),
(20, 22, 10, 4, 15),
(21, 23, 11, 5, 10),
(22, 24, 13, 3, 8),
(23, 24, 12, 1, 20),
(24, 25, 14, 1, 6),
(25, 25, 15, 2, 10),
(26, 26, 16, 4, 30),
(27, 26, 17, 1, 9),
(28, 26, 26, 3, 7),
(29, 27, 20, 3, 12),
(30, 27, 21, 5, 15),
(31, 27, 22, 1, 13),
(32, 28, 25, 4, 15),
(33, 29, 9, 1, 7);

-- --------------------------------------------------------

--
-- Table structure for table `bouquintheque_membre`
--

CREATE TABLE `bouquintheque_membre` (
  `id_membre` int(11) NOT NULL,
  `pseudo` varchar(20) NOT NULL,
  `mdp` varchar(60) NOT NULL,
  `nom` varchar(20) NOT NULL,
  `prenom` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `civilite` enum('m','f') NOT NULL,
  `ville` varchar(20) NOT NULL,
  `code_postal` int(5) UNSIGNED ZEROFILL NOT NULL,
  `adresse` varchar(100) NOT NULL,
  `statut` int(11) NOT NULL,
  `experience` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bouquintheque_membre`
--

INSERT INTO `bouquintheque_membre` (`id_membre`, `pseudo`, `mdp`, `nom`, `prenom`, `email`, `civilite`, `ville`, `code_postal`, `adresse`, `statut`, `experience`) VALUES
(1, 'Escroc', 'c576bd753d4ad47c21a3020d55f4b865', 'Daheb', 'Damien', 'cm.13@hotmail.fr', 'f', 'Marseille', 78300, '13 rue de la Cannebiere', 1, 0),
(2, 'axel', '699d9a04c9ecf42979a52e34c9c03d27', 'bee', 'axel', 'axel.bee.pro@gmail.com', 'm', 'Ville générique', 00000, 'rue générique', 0, 0),
(3, 'Whithak', '5d45c90f9e8c341500f99084c2e5be10', 'Menard', 'Clément', 'clement.menard.13@gmail.com', 'm', 'poissy', 78300, '13 rue du docteur labarriere', 0, 0),
(4, 'dav', '725b6f3995713a76fe8a13e1e53127ce', 'Lepron', 'David', 'veville@gmail.com', 'm', 'Montataire', 60160, '7 rue de Rien', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `bouquintheque_note`
--

CREATE TABLE `bouquintheque_note` (
  `id_note` int(11) NOT NULL,
  `id_produit` int(11) NOT NULL,
  `id_membre` int(11) NOT NULL,
  `titre` varchar(255) DEFAULT NULL,
  `description` text,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `note` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bouquintheque_note`
--

INSERT INTO `bouquintheque_note` (`id_note`, `id_produit`, `id_membre`, `titre`, `description`, `date`, `note`) VALUES
(1, 9, 1, 'Super livre', 'Je vous le recommande', '2019-09-10 00:00:00', 9),
(2, 10, 1, 'Ok', 'Pas si mal', '2019-09-30 16:19:18', 7),
(3, 10, 1, 'Nul', 'Nulnul', '2019-09-30 16:21:22', 1),
(4, 16, 1, 'Cool', 'J&#039;aime tintin', '2019-10-10 17:27:11', 2),
(5, 16, 1, 'Super cool', 'J&#039;adore tintin', '2019-10-10 17:27:54', 9),
(6, 16, 1, 'Ok', 'C&#039;est pas mal Tintin', '2019-10-10 17:29:38', 6),
(7, 19, 1, 'Inutile', 'Pire qu&#039;un cours de Francois', '2019-10-15 12:03:49', 2),
(8, 19, 1, 'T&#039;est dur quand même', 'Ca peut pas être si mauvais', '2019-10-15 12:04:23', 5),
(9, 9, 1, 'ok', 'dsds', '2019-11-27 14:30:05', -2),
(10, 9, 1, 'ok', 'dsds', '2019-11-27 14:31:30', -2),
(11, 9, 1, 'ok', 'dsds', '2019-11-27 14:31:49', -2),
(12, 9, 1, 'ok', 'dsds', '2019-11-27 14:33:22', -2),
(13, 9, 1, 'ok', 'dsds', '2019-11-27 14:34:33', -2),
(14, 9, 1, 'ok', 'dsds', '2019-11-27 14:37:39', 7),
(15, 9, 1, 'ok', 'oo', '2019-11-27 14:38:04', 9),
(16, 10, 1, 'Mami', 'dfsf', '2019-11-27 14:38:38', 9),
(17, 10, 1, 'Mami', 'dfsf', '2019-11-27 14:41:49', 9);

-- --------------------------------------------------------

--
-- Table structure for table `bouquintheque_produit`
--

CREATE TABLE `bouquintheque_produit` (
  `id_produit` int(11) NOT NULL,
  `reference` varchar(20) NOT NULL,
  `categorie` varchar(20) NOT NULL,
  `titre` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `auteur` varchar(100) NOT NULL DEFAULT 'Anne Onyme',
  `date_parution` int(4) NOT NULL DEFAULT '0',
  `traducteur` varchar(100) DEFAULT NULL,
  `editeur` varchar(100) NOT NULL,
  `collection` varchar(100) NOT NULL,
  `date_traduction` int(4) DEFAULT '0',
  `photo` varchar(100) NOT NULL,
  `prix` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bouquintheque_produit`
--

INSERT INTO `bouquintheque_produit` (`id_produit`, `reference`, `categorie`, `titre`, `description`, `auteur`, `date_parution`, `traducteur`, `editeur`, `collection`, `date_traduction`, `photo`, `prix`, `stock`, `is_deleted`) VALUES
(1, 'TFR1', 'Sticker', 'Trois fois rien', 'Le sticker du logo de la boutique, à coller partout chez vous et chez vos voisins!', '', 0, NULL, '', '', NULL, 'TFR1_twiter.png', 2, 49997, 1),
(2, 'RRR101', 'Chanson', 'Non, je ne regrette rien', 'Non! Rien de rien ... \r\nNon! Je ne regrette rien... \r\nNi le bien qu&#039;on m&#039;a fait \r\nNi le mal tout ça m&#039;est bien égal! \r\n\r\nNon! Rien de rien ... \r\nNon! Je ne regrette rien...\r\n\r\nC&#039;est payé, balayé, oublié \r\nJe me fous du passé! \r\n\r\nAvec mes souvenirs \r\nJ&#039;ai allumé le feu \r\nMes chagrins, mes plaisirs \r\nJe n&#039;ai plus besoin d&#039;eux! \r\n\r\nBalayés les amours \r\n\r\nAvec leurs trémolos \r\nBalayés pour toujours \r\nJe repars à zéro ... \r\n\r\nNon! Rien de rien ... \r\nNon! Je ne regrette rien ... \r\nNi le bien, qu&#039;on m&#039;a fait \r\nNi le mal, tout ça m&#039;est bien égal! \r\n\r\nNon! Rien de rien ... \r\nNon! Je ne regrette rien ... \r\nCar ma vie, car mes joies \r\nAujourd&#039;hui, ça commence avec toi!', '', 0, NULL, '', '', NULL, 'RRR101_Edith_Piaf.jpg', 12, 499, 1),
(3, 'VD101', 'Vide', 'Faille de l&#039;espace-temps', 'Un raccourci pour aller nulle part en un rien de temps', '', 0, NULL, '', '', NULL, 'VD101_abc chauffage.jpg', 1000000, 0, 1),
(4, 'K45P', 'Livre', 'Un rien vaut mieux que deux tu l&#039;auras', 'Petit guide de moral publié au profit des avides.', '', 0, NULL, '', '', NULL, 'K45P_livre.jpg', 20, 200, 1),
(5, 'FAF007', 'Vitesse', 'En un rien de temps', 'Pour parvenir en un rien de temps du berceau au tombeau', '', 0, NULL, '', '', NULL, 'FAF007_rien_de_temps.jpg', 10000, 70, 1),
(6, 'INPR404', 'Chanson', 'Il n&#039;y a plus rien', 'Écoute, écoute... Dans le silence de la mer, il y a comme un balancement maudit qui vous met le cœur à l´heure, avec le sable qui se remonte un peu, comme les vieilles putes qui remontent leur peau, qui tirent la couverture. \r\n\r\nImmobile... L&#039;immobilité, ça dérange le siècle. \r\nC´est un peu le sourire de la vitesse, et ça sourit pas lerche, la vitesse, en ces temps. \r\nLes amants de la mer s´en vont en Bretagne ou à Tahiti. \r\nC´est vraiment con, les amants. \r\n\r\nIl n&#039;y a plus rien \r\n\r\n\r\nCamarade maudit, camarade misère... \r\nMisère, c&#039;était le nom de ma chienne qui n´avait que trois pattes. \r\nL´autre, le destin la lui avait mise de côté pour les olympiades de la bouffe et des culs semestriels qu´elle accrochait dans les buissons pour y aller de sa progéniture. \r\nElle est partie, Misère, dans des cahots, quelque part dans la nuit des chiens. \r\n\r\nCamarade tranquille, camarade prospère \r\nQuand tu rentreras chez toi \r\nPourquoi chez toi? \r\nQuand tu rentreras dans ta boîte, rue d´Alésia ou du Faubourg \r\nSi tu trouves quelqu&#039;un dans ton lit \r\nSi tu y trouves quelqu´un qui dort \r\nAlors va-t&#039;en, dans le matin clairet \r\n\r\nSeul \r\nTe marie pas \r\nSi c&#039;est ta femme qui est là, réveille-la de sa mort imagée \r\nFous-lui une baffe, comme à une qui aurait une syncope ou une crise de nerfs... \r\nTu pourras lui dire : &quot;Dis, t&#039;as pas honte de t&#039;assumer comme ça dans ta liquide sénescence? \r\nDis, t´as pas honte? Alors qu&#039;il y a quatre-vingt-dix mille espèces de fleurs? \r\nEspèce de conne!&quot; \r\nEt barre-toi! \r\nDivorce-la \r\nTe marie pas! \r\nTu peux tout faire \r\nT´empaqueter dans le désordre, pour l´honneur, pour la conservation du titre... \r\n\r\n\r\nLe désordre, c&#039;est l&#039;ordre moins le pouvoir! \r\n\r\nIl n´y a plus rien \r\n\r\nJe suis un nègre blanc qui mange du cirage \r\nParce qu&#039;il se fait chier à être blanc, ce nègre, \r\nIl en a marre qu´on lui dise: &quot;Sale blanc!&quot; \r\n\r\nA Marseille, la Sardine qui bouche le port \r\nÉtait bourrée d&#039;héroïne \r\nEt les hommes-grenouilles n&#039;en sont pas revenus... \r\nLibérez les sardines \r\nEt y aura plus de mareyeurs! \r\n\r\nSi tu savais ce que je sais \r\nOn te montrerait du doigt dans la rue \r\n\r\nAlors, il vaut mieux que tu ne saches rien \r\nComme ça, au moins, tu es peinard, anonyme, citoyen! \r\n\r\nTu as droit, citoyen, au minimum décent \r\nA la publicité des enzymes et du charme \r\nAu trafic des dollars et aux trafiquants d&#039;armes \r\nQui traînent les journaux dans la boue et le sang \r\n\r\nTu as droit à ce bruit de la mer qui descend \r\nEt si tu veux la prendre, elle te fera du charme \r\nAvec le vent au cul et des sextants d´alarme \r\nEt la mer reviendra sans toi, si tu es méchant \r\n\r\nLes mots... toujours les mots, bien sûr! \r\nCitoyens! Aux armes! \r\nAux pépées, citoyens! A l&#039;amour, citoyens! \r\n\r\nNous entrerons dans la carrière quand nous aurons cassé la gueule à nos aînés! \r\nLes préfectures sont des monuments en airain \r\nUn coup d´aile d´oiseau ne les entame même pas, c&#039;est vous dire!\r\n\r\nNous ne sommes même plus des Juifs allemands \r\nNous ne sommes plus rien \r\nIl n´y a plus rien \r\n\r\nDes futals bien coupés sur lesquels lorgnent les gosses, certes! \r\nDes poitrines occupées \r\nDes ventres vacants \r\nArrange-toi avec ça! \r\n\r\nLe sourire de ceux qui font chauffer leur gamelle \r\nSur les plages reconverties et démoustiquées \r\n\r\nC´est-à-dire en enfer, là où Dieu met ses lunettes noires pour ne pas risquer d&#039;être reconnu par ses admirateurs \r\nDieu est une idole, aussi! \r\nSous les pavés, il n´y a plus la plage \r\nIl y a l´enfer et la sécurité \r\nNotre vraie vie n´est pas ailleurs, elle est ici \r\nNous sommes au monde, on nous l´a assez dit \r\nN´en déplaise à la littérature \r\n\r\nLes mots, nous leur mettons des masques, un bâillon sur la tronche \r\nA l´encyclopédie, les mots! \r\nEt nous partons avec nos cris! \r\nEt voilà! \r\n\r\nIl n&#039;y a plus rien...plus, plus rien \r\n\r\n\r\nJe suis un chien? \r\nPerhaps! \r\nJe suis un rat \r\nRien \r\nAvec le cœur battant jusqu´à la dernière battue \r\n\r\nNous arrivons avec nos accessoires pour faire le ménage dans la tête des gens \r\nApprends donc à te coucher tout nu! \r\nFous en l&#039;air tes pantoufles! \r\nRenverse tes chaises! \r\nMange debout! \r\nAssois-toi sur des tonnes d´inconvenances et montre-toi à la fenêtre en gueulant des gueulantes de principe \r\n\r\nSi jamais tu t&#039;aperçois que ta révolte s&#039;encroûte et devient une habituelle révolte, alors \r\n\r\nSors \r\nMarche \r\nCrève \r\nBaise \r\nAime enfin les arbres, les bêtes et détourne-toi du conforme et de l&#039;inconforme \r\nLâche ces notions, si ce sont des notions \r\nRien ne vaut la peine de rien \r\n\r\nIl n&#039;y a plus rien...plus, plus rien \r\n\r\nInvente des formules de nuit. CLN : C&#039;est la nuit! \r\nMême au soleil, surtout au soleil, c&#039;est la nuit \r\n\r\nTu peux crever. Les gens ne retiendront même pas une de leurs inspirations \r\nIls canaliseront sur toi leur air vicié en des regrets éternels puant le certificat d&#039;études et le catéchisme ombilical \r\n\r\nC´est vraiment dégueulasse! \r\nIls te tairont, les gens \r\nLes gens taisent l&#039;autre, toujours \r\nRegarde, à table, quand ils mangent \r\nIls s&#039;engouffrent dans l&#039;innommé \r\nIls se dépassent eux-mêmes et s&#039;en vont vers l&#039;ordure et le rot ponctuel! \r\n\r\nLa ponctuation de l´absurde, c&#039;est bien ce renversement des réacteurs abdominaux, comme à l&#039;atterrissage : on rote et on arrête le massacre \r\nSur les pistes de l&#039;inconscient, il y a des balises baveuses toujours un peu se souvenant du frichti, de l&#039;organe, du repu \r\n\r\nMes plus beaux souvenirs sont d&#039;une autre planète \r\nOù les bouchers vendaient de l´homme à la criée \r\n\r\nMoi, je suis de la race ferroviaire qui regarde passer les vaches \r\nSi on ne mangeait pas les vaches, les moutons et les restes \r\nNous ne connaîtrions ni les vaches, ni les moutons, ni les restes \r\nAu bout du compte, on nous élève pour nous becqueter \r\nAlors, becquetons! \r\nCôte à l´os pour deux personnes, tu connais? \r\n\r\nHeureusement il y a le lit : un parking! \r\nTu viens, mon amour? \r\nEt puis, c&#039;est comme à la roulette : on mise, on mise \r\nSi la roulette n&#039;avait qu&#039;un trou, on nous ferait miser quand même \r\nD´ailleurs, c&#039;est ce qu&#039;on fait! \r\nJe comprends les joueurs : ils ont trente-cinq chances de ne pas se faire mettre \r\nEt ils mettent, ils mettent \r\nLe drame, dans le couple, c´est qu´on est deux \r\nEt qu&#039;il n&#039;y a qu&#039;un trou dans la roulette \r\n\r\nQuand je vois un couple dans la rue, je change de trottoir! \r\nTe marie pas \r\nNe vote pas \r\nSinon t´es coincé \r\n\r\nElle était belle comme la révolte \r\nNous l´avions dans les yeux \r\nDans les bras, dans nos futals \r\nElle s´appelait l&#039;imagination \r\nElle dormait comme une morte, elle était comme morte \r\nElle sommeillait \r\nOn l´enterra de mémoire \r\n\r\nDans le cocktail Molotov, il faut mettre du Martini, mon petit! \r\n\r\nTransbahutez vos idées comme de la drogue. Tu risques rien à la frontière \r\nRien dans les mains \r\nRien dans les poches \r\n\r\nTout dans la tronche! \r\n\r\n- Vous n´avez rien à déclarer? \r\n- Non \r\n- Comment vous nommez-vous? \r\n- Karl Marx \r\n- Allez, passez \r\n\r\nNous partîmes. Nous étions une poignée... \r\n\r\nNous nous retrouverons bientôt démunis, seuls, avec nos projets dans le passé \r\nÉcoutez-les...écoutez-les... \r\nÇa râpe comme le vin nouveau \r\nNous partîmes... Nous étions une poignée \r\nBientôt ça débordera sur les trottoirs \r\nLa parlote, ça n&#039;est pas un détonateur suffisant \r\nLe silence armé, c&#039;est bien, mais il faut bien fermer sa gueule \r\nToutes des concierges! \r\nÉcoutez-les... \r\n\r\nIl n´y a plus rien \r\n\r\nSi les morts se levaient? \r\nHein? \r\n\r\nNous étions combien? \r\nÇa ira! \r\n\r\nLa tristesse, toujours la tristesse \r\n\r\nIls chantaient, ils chantaient \r\nDans les rues \r\n\r\nTe marie pas \r\nCeux de San Francisco, de Paris, de Milan \r\nEt ceux de Mexico \r\nBras dessus bras dessous \r\nBien accrochés au rêve \r\n\r\nNe vote pas \r\n\r\nÔ DC-8 des pélicans \r\nCigognes qui partent à l´heure \r\nLabrador, lèvres des bisons \r\nJ&#039;invente en bas des rennes bleus \r\nEn habit rouge du couchant \r\nJe vais à l&#039;ouest de ma mémoire \r\nVers la clarté, vers la clarté \r\n\r\nJe m&#039;éclaire la nuit dans le noir de mes nerfs \r\nDans l&#039;or de mes cheveux j&#039;ai mis cent mille watts \r\nDes circuits sont en panne dans le fond de ma viande \r\nJ&#039;imagine le téléphone dans une lande \r\nCelle où nous nous voyons moi et moi \r\nDans cette brume obscène au crépuscule teint \r\nJe ne suis qu&#039;un voyant embarrassé de signes \r\nMes circuits déconnectent \r\nJe ne suis qu&#039;un binaire \r\n\r\nMon fils, il faut lever le camp comme lève la pâte \r\nIl est tôt. Lève-toi. Prends du vin pour la route \r\nDégaine-toi du rêve anxieux des bien-assis \r\nRoule, roule, mon fils, vers l´étoile idéale \r\nTu te rencontreras, tu te reconnaîtras \r\nTon dessin devant toi, tu rentreras dedans \r\nLa mue ça se fait à l&#039;envers dans ce monde inventif \r\nTu reprendras ta voix de fille et chanteras demain \r\nRetourne tes yeux au-dedans de toi \r\nQuand tu auras passé le mur du mur \r\nQuand tu auras outrepassé ta vision \r\nAlors tu verras... rien! \r\n\r\nIl n&#039;y a plus rien \r\n\r\nQue les pères et les mères \r\nQue ceux qui t&#039;ont fait \r\nQue ceux qui ont fait tous les autres \r\nQue les &quot;Monsieur&quot; \r\nQue les &quot;Madame&quot; \r\nQue les assis dans les velours glacés, soumis, mollasses \r\nQue ces horribles magasins roulants \r\nQui portent tout en devanture \r\nTous ceux à qui tu pourras dire : \r\n\r\nMonsieur! \r\nMadame! \r\n\r\nLaissez donc ces gens-là tranquilles \r\nCes courbettes imaginées que vous leur inventez \r\nCes désespoirs soumis \r\nToute cette tristesse qui se lève le matin à heure fixe pour aller gagner vos sous \r\nAvec les poumons resserrés \r\nLes mains grandies par l&#039;outrage et les bonnes mœurs \r\nLes yeux défaits par les veilles soucieuses \r\nEt vous comptez vos sous? \r\nPardon, leurs sous! \r\n\r\nCe qui vous déshonore \r\nC´est la propreté administrative, écologique, dont vous tirez orgueil \r\nDans vos salles de bains climatisées \r\nDans vos bidets déserts \r\nEn vos miroirs menteurs \r\n\r\nVous faites mentir les miroirs! \r\nVous êtes puissants au point de vous refléter tels que vous êtes \r\nCravatés \r\nEnvisonnés \r\nEmpapaoutés de morgue et d´ennui dans l´eau verte qui descend \r\ndes montagnes et que vous vous êtes arrangés pour soumettre \r\nA un point donné \r\nA heure fixe \r\n\r\nPour vos narcissiques partouzes \r\nVous vous regardez et vous ne pouvez même plus vous reconnaître \r\nTellement vous êtes beaux \r\nEt vous comptez vos sous \r\nEn long \r\nEn large \r\nEn marge \r\nDe ces salaires que vous lâchez avec précision \r\nAvec parcimonie \r\nJ´allais dire &quot;en douce&quot;, comme ces aquilons avant-coureurs et qui racontent les exploits du bol alimentaire, avec cet apparat vengeur et nivellateur qui empêche toute identification \r\nJe veux dire que pour exploiter votre prochain, vous êtes les champions de l&#039;anonymat \r\n\r\nLes révolutions? Parlons-en! \r\nJe veux parler des révolutions qu´on peut encore montrer \r\nParce qu´elles vous servent \r\nParce qu´elles vous ont toujours servis \r\nCes révolutions qui sont de &quot;l&#039;Histoire&quot; \r\nParce que les &quot;histoires&quot; ça vous amuse, avant de vous intéresser \r\nEt quand ça vous intéresse, il est trop tard, on vous dit qu&#039;il s&#039;en prépare une autre \r\nLorsque quelque chose d&#039;inédit vous choque et vous gêne \r\nVous vous arrangez la veille, toujours la veille, pour retenir une place \r\nDans un palace d´exilés, dans un pays sûr, entouré du prestige des déracinés \r\nLes racines profondes de ce pays, c´est vous, paraît-il \r\nEt quand on vous transbahute d&#039;un désordre de la rue, comme vous dites, à un ordre nouveau, vous vous faites greffer au retour et on vous salue \r\n\r\nDepuis deux cents ans, vous prenez des billets pour les révolutions. \r\nVous seriez même tentés d&#039;y apporter votre petit panier \r\nPour n&#039;en pas perdre une miette, n&#039;est-ce-pas? \r\nEt les vauriens qui vous amusent, ces vauriens qui vous dérangent aussi, on les enveloppe dans un fait divers pendant que vous enveloppez les vôtres dans un drapeau \r\n\r\nVous vous croyez toujours, vous autres, dans un haras \r\nLa race ça vous tient debout dans ce monde que vous avez assis \r\nVous avez le style du pouvoir \r\nVous en arrivez même à vous parler à vous-mêmes \r\nComme si vous parliez à vos subordonnés \r\nDe peur de quitter votre stature, vos boursouflures, de peur qu´on vous montre du doigt, dans les corridors de l&#039;ennui, et qu&#039;on se dise: &quot;Tiens, il baisse, il va finir par se plier, par ramper&quot; \r\nSoyez tranquilles! Pour la reptation, vous êtes imbattables \r\nSeulement, vous ne vous la concédez que dans la métaphore \r\nVous voulez bien vous allonger, mais avec de l´allure \r\nCette &quot;allure&quot; que vous portez, Monsieur, à votre boutonnière \r\nEt quand on sait ce qu&#039;a pu vous coûter de silences aigres \r\nDe renvois mal aiguillés \r\nDe demi-sourires séchés comme des larmes \r\nCe ruban malheureux et rouge comme la honte, dont vous ne vous êtes jamais décidé à empourprer votre visage \r\nJe me demande pourquoi la nature met \r\nTant d&#039;entêtement \r\nTant d&#039;adresse \r\nEt tant d&#039;indifférence biologique \r\nA faire que vos fils ressemblent à ce point à leurs pères \r\nDepuis les jupes de vos femmes matrimoniales \r\nJusqu&#039;aux salonnardes équivoques où vous les dressez à boire \r\nDans votre grand monde \r\nA la coupe des bien-pensants \r\n\r\nMoi, je suis un bâtard \r\nNous sommes tous des bâtards \r\nCe qui nous sépare, aujourd´hui, c&#039;est que votre bâtardise à vous est sanctionnée par le code civil \r\nSur lequel, avec votre permission, je me plais à cracher, avant de prendre congé \r\n\r\nSoyez tranquilles, vous ne risquez rien! \r\n\r\nIl n&#039;y a plus rien \r\n\r\nEt ce rien, on vous le laisse! \r\nFoutez-vous-en jusque-là, si vous pouvez \r\nNous, on peut pas \r\nUn jour, dans dix mille ans \r\nQuand vous ne serez plus là \r\nNous aurons tout \r\nRien de vous \r\nTout de nous \r\n\r\nNous aurons eu le temps d&#039;inventer la Vie, la Beauté, la Jeunesse \r\nLes larmes qui brilleront comme des émeraudes dans les yeux des filles \r\nLes bêtes enfin détraquées \r\nLa priorité à gauche, permettez! \r\n\r\nNous ne mourrons plus de rien \r\nNous vivrons de tout \r\n\r\nEt les microbes de la connerie que nous n´aurez pas manqué de nous léguer \r\nMontant \r\nDe vos fumures \r\nDe vos livres engrangés dans vos silothèques \r\nDe vos documents publics \r\nDe vos règlements d´administration pénitentiaire \r\nDe vos décrets \r\nDe vos prières, même \r\nTous ces microbes juridico-pantoufles \r\nSoyez tranquilles! \r\nNous avons déjà des machines pour les révoquer \r\n\r\nNous aurons tout \r\n\r\nDans dix mille ans', '', 0, NULL, '', '', NULL, 'INPR404_media.jpg', 15, 995, 1),
(9, '9782070373628 ', 'Roman', 'La vie devant soi', 'Signé Ajar, ce roman reçut le prix Goncourt en 1975. Histoire d&#039;amour d&#039;un petit garçon arabe pour une très vieille femme juive : Momo se débat contre les six étages que Madame Rosa ne veut plus monter et contre la vie parce que «ça ne pardonne pas» et parce qu&#039;il n&#039;est «pas nécessaire d&#039;avoir des raisons pour avoir peur». Le petit garçon l&#039;aidera à se cacher dans son «trou juif», elle n&#039;ira pas mourir à l&#039;hôpital et pourra ainsi bénéficier du droit sacré «des peuples à disposer d&#039;eux-mêmes» qui n&#039;est pas respecté par l&#039;Ordre des médecins. Il lui tiendra compagnie jusqu&#039;à ce qu&#039;elle meure et même au-delà de la mort.', 'Emile Ajar', 1982, '', 'Gallimard', 'folio', 0, '9782070373628_laviedevantsoi.jpg', 7, 86, 0),
(10, '9782070461769 ', 'Roman', 'Gatsby le magnifique', '«S’il faut dire la vérité, Jay Gatsby, de West Egg, Long Island, naquit de la conception platonicienne qu’il avait de lui-même. Il était fils de Dieu – expression qui ne signifie peut-être rien d’autre que cela – et il lui incombait de s’occuper des affaires de Son Père, de servir une beauté immense, vulgaire, clinquante. Aussi inventa-t-il la seule sorte de Jay Gatsby qu’un garçon de dix-sept ans était susceptible d’inventer, et il demeura fidèle à cette conception jusqu’à la fin.»\r\nLe chef-d’œuvre de Francis Scott Fitzgerald paraît ici dans une traduction inédite.', 'Francis Scott Fitzgerald', 1925, ' Philippe Jaworski', 'Gallimard', 'Folio', 2012, '9782070461769_gatsbylemagnifique.jpg', 15, 7, 0),
(11, '9781340173739', 'Theatre', 'Faust', 'Aux yeux mêmes de Goethe, cette Première partie de la tragédie de Faust, qu&#039;il frit paraître en 1808 et qui sera plus tard suivie d&#039;un Second Faust, est une oeuvre étrange et barbare, qui ne vise à rien de moins qu&#039;à présenter le &quot; théâtre du monde &quot;. Une oeuvre complexe aussi, où le protagoniste, Faust, assure le lien entre le drame du savant amer, désespérant de percer les secrets de la nature vivante, et celui de Marguerite qui s&#039;éprend du vieil homme rajeuni par Méphistophélès, avant de devenir mère, de tuer son enfant et, condamnée à mort, de refuser de suivre Faust qui, finalement, a tout perdu. Vingt ans plus tard, la traduction de Nerval rencontre un accueil enthousiaste auprès des écrivains, mais aussi de musiciens comme Berlioz, qui composera La Damnation de Faust, ou de peintres comme Delacroix. Faust devient partie intégrante de la culture romantique française. Si le personnage ne s&#039;efface pas non plus de la nôtre, c&#039;est aussi pour une part grâce au génie de Nerval : tout autant qu&#039;à l&#039;¿uvre de Goethe, cette éblouissante traduction appartient à la sienne.', 'Johann Wolfgang von Goethe', 1808, 'François-René Daillie', 'Livre De Poche', 'Classiques de poche', 1970, '9781340173739_faust.webp', 10, 495, 0),
(12, '2012315755', 'Cuisine', 'Jérusalem', 'Les saveurs et les senteurs de Jérusalem sont notre langue maternelle. Les herbes sauvages ramassées lors de voyages scolaires, les jours de marché, les odeurs du sol sec un jour d&#039;été, les chèvres et les moutons errants dans les collines, les pitas fraîches, le persil coupé, les figues noires, les gâteaux sirupeux, les cookies friables...', ' Yotam Ottolenghi', 2012, '', 'Hachette Pratique', 'Cuisine', 0, '2012315755_jerusalem.jpg', 20, 49, 0),
(13, '1975651472', 'Cuisine', 'Recettes Cétogènes: 77 recettes délicieuses – Petit-déjeuner, déjeuner, dîner, smoothies, desserts', 'Ce livre a pour mission de te soutenir dans ton parcours en te faisant découvrir de nombreuses recettes délicieuses. Toutes les recettes sont réellement savoureuses, faciles à préparer et – point essentiel – riches en lipides et pauvre en glucides. Ainsi, tu trouveras dans ce livre exactement ce dont tu as besoin pour mener à bien ton régime cétogène.\r\n\r\nSi tu ne connais pas les principes du régime cétogène et sa raison d’être, le prochain chapitre te permettra de te familiariser un peu plus avec. Pour les connaisseurs, ne vous en faites pas, vous n’allez pas vous ennuyer. Si vous êtes à court d’idées pour vos prochains repas, laissez-vous inspirer pas ces recettes. Du petit-déjeuner express jusqu’aux desserts gourmands, tu trouveras ici l’inspiration nécessaire pour toute la journée.', 'Pierre Dubois', 2017, '', 'Amazon Media', '', 0, '1975651472_cetogene.jpg', 8, 997, 0),
(14, 'B07PNNFYQH', 'Cuisine', 'Le compteur de glucides', 'L&#039;Organisation mondiale de la santé conseille de réduire les sucres cachés. Ce petit guide va vous y aider. Il passe en revue des centaines d&#039;aliments courants et vous dit combien de glucides ils renferment. Bien choisir devient facile !\r\n\r\n\r\nLe Compteur de glucides, c&#039;est l&#039;outil indispensable pour perdre du poids, équilibrer un diabète, lutter au mieux contre le cancer ou freiner la maladie d&#039;Alzheimer.\r\n\r\nVous trouverez la teneur en glucides pour 100 grammes et pour la portion usuelle. Vous saurez aussi combien de calories, graisses et protéines renferme chaque aliment et vous identifi erez en un clin d&#039;oeil les aliments à favoriser et ceux à éviter.\r\n\r\nEn plus, c&#039;est un vrai cours de diététique qui vous explique :\r\n\r\n– en quoi un régime riche en glucides pose problème et pourquoi les réduire apporte tant de bénéfices\r\n\r\n– comment choisir un régime pauvre en glucides\r\n\r\n– comment débusquer les sucres cachés\r\n\r\n– comment décoder les étiquettes au supermarché\r\n\r\n\r\nUN GUIDE INCONTOURNABLE SI VOUS VOULEZ SUIVRE UN RÉGIME LOW CARB, ATKINS, IG, OU CÉTOGÈNE.', 'Magali Walkowicz', 2019, '', 'Thierry Souccar', '', 0, 'B07PNNFYQH_Lglucide.jpg', 6, 499, 0),
(15, '2884710353', 'BandeDessinée', 'Lucky Luke, tome 20 : La corde du pendu et autres histoires', 'Ce personnage immortel parcourt depuis 1947 (44 ans !) l&#039;histoire de l&#039;ouest américain. Il y a rencontré des personnages célèbres (Jesse James, Calamity Jane, Billy the Kid, Sarah Bernhardt...). Lucky Luke est l&#039;homme des missions impossibles, le défenseur des pauvres, des veuves et des orphelins, bref le parfait héros ! Son cheval, Jolly Jumper, est un parfait compagnon de ce &quot;poor lonesome cowboy&quot;.', 'Morris', 1960, '', 'Lucky Comics', 'Lucky Luke', 0, '2884710353_51abqX6lvzL._SX379_BO1,204,203,200_.jpg', 10, 97, 0),
(16, '9782203001008', 'BandeDessinée', 'Les aventures de Tintin au pays des soviets', 'Le 10 janvier 1929, un jeune reporter fait son apparition dans Le Petit Vingtième, le supplément pour enfants du quotidien belge Le XXe siècle. Son nom ? Tintin. Accompagné de Milou, un jeune chien blanc, il part pour la &quot;Russie soviétique&quot;. Son créateur, un certain Georges Remi, signe Hergé, pseudonyme inspiré par ses initiales. Après ce premier voyage en Russie, qui donne naissance à l&#039;album Tintin chez les Soviets, le jeune reporter s&#039;envole pour l&#039;Afrique (Tintin au Congo), puis pour l&#039;Amérique. Mais c&#039;est Le Lotus bleu, publié dans Le Petit Vingtième dès août 1934, qui marque un tournant important dans l&#039;œuvre d&#039;Hergé. Celui-ci, après avoir rencontré Tchang Tchong-Jen, jeune étudiant chinois qui lui a ouvert les yeux sur l&#039;Asie, va désormais se soucier de rigueur documentaire. Il va aussi s&#039;efforcer de faire passer dans ses histoires un message d&#039;humanisme et de tolérance. Le succès de son reporter à la houppe ne va cesser de grandir. Hergé lui fait parcourir le monde. Il teinte ses aventures d&#039;onirisme (L&#039;Étoile mystérieuse), flirte avec le surnaturel (Les Sept Boules de cristal), l&#039;expédie même sur la lune.', 'Hergé', 1930, '', 'Casterman', 'Tintin', 0, '9782203001008_51R+DPBl7iL._SX361_BO1,204,203,200_.jpg', 30, 6, 0),
(17, '2375542088', 'BandeDessinée', 'La famille Au poil, tome 1', 'Trois enfants, deux parents, deux chiens, un chat, sans compter les poules et l&#039;âne au fond du jardin... la maison de la famille Au poil, c&#039;est l&#039;arche de Noé ! Mais comme quand on aime, on ne compte pas, ils ont décidé d&#039;accueillir régulièrement les animaux du refuge de la ville avant leur adoption définitive, pour le plus grand bonheur de tous... ou presque !', 'Ingrid CHABBERT', 2019, '', 'Slalom', 'Tuschuss', 0, '2375542088_51-Sk+iWlUL._SX393_BO1,204,203,200_.jpg', 9, 199, 0),
(18, '2035844576', 'Theatre', 'La guerre de Troie n&#039;aura pas lieu', 'Hélène, enlevée par Pâris, est réclamée par les Grecs. Mais la plupart des Troyens, fascinés par sa beauté, refusent de la rendre. D&#039;âpres négociations s&#039;ensuivent. Les partisans de la paix l&#039;emporteront-ils ? Avec cette relecture de la mythologie antique, Giraudoux s&#039;adresse aussi à ses contemporains : en 1935, la Première Guerre mondiale est encore dans les mémoires. Et la pièce, qui interroge le caractère éternel des conflits armés, fait surgir la menace d&#039;une nouvelle tragédie, peut-être imminente.', 'Jean Giraudoux', 1930, '', 'Larousse', 'Petits Classiques', 0, '2035844576_51C1FPZ8VhL._SX341_BO1,204,203,200_.jpg', 20, 1000, 0),
(19, '2412028990', 'Manuel', 'L&#039;Ordinateur avec Windows 10 les Nuls Pas à Pas, 2e édition', 'Un livre tout en couleur et disposant de spirales qui vous permettent de travailler livre ouvert sur le bureau pour découvrir l&#039;essentiel de votre PC sous Windows 10 rapidement !\r\n\r\nLes Pas à Pas sont des livres en couleur au format poche agrandi et spiralés, ils inaugurent un nouveau concept dans la collection. Ces livres très pratiques car ils tiennent ouverts sur votre bureau se proposent de vous former aux différentes fonctions d&#039;un logiciel en suivant des pas à pas très pédagogiques. Contrairement aux autres Nuls qui sont des livres de référence, ici, on prend une tâche, et on déroule son processus étape par étape. Chaque tâche est décrite sur deux pages, le texte en page de gauche et les illustrations correspondantes en page de droite. Toutes les tâches sont regroupées dans des parties thématiques.\r\n\r\nCe livre a été entièrement mis à jour pour Windows 10.', 'Philip ESCARTIN', 2017, '', 'First Interactive', 'Les nuls', 0, '2412028990_infonul.jpg', 15, 2000, 0),
(20, '2412037507', 'Manuel', 'L&#039;Ordinateur portable pour les Nuls poche, 4e édition', 'Indispensable pour découvrir son PC avec Windows 10 et Internet !\r\n\r\nNouvelle édition du titre le plus vendu sur l&#039;ordinateur portable.\r\n\r\nVous venez de faire l&#039;acquisition d&#039;un nouveau PC flambant neuf avec Windows 10 ou vous êtes décidé à le faire, mais la bête vous fait peur ?\r\n\r\nAvec ce livre tout en couleur entièrement consacré au PC sous Windows 10, oubliez vos craintes, vous êtes tout prêt de maîtriser sur le bout des doigts les multiples facettes de votre nouvelle machine. Windows 10, les périphériques comme les imprimantes, les scanners, les caméras vidéo, vous saurez bientôt les faire fonctionner sans problème et sans stress ! Ce livre vous permettra d&#039;aborder sans craintes l&#039;ère des nouvelles technologies.', 'Dan GOOKIN', 2018, '', 'First Interactive', 'Nuls', 0, '2412037507_ordinul.jpg', 12, 997, 0),
(21, '2412020825', 'Manuel', 'Internet pour les Nuls poche', 'Le best-seller des livres sur Internet dans sa nouvelle édition pour Windows 10 toute en couleurs !\r\n\r\n\r\n\r\nVous n&#039;avez aucune prédisposition naturelle pour les nouvelles technologies informatiques ? Tant mieux ! Internet pour les Nuls va répondre à toutes les questions que vous vous posez : qu&#039;est-ce qu&#039;Internet, comment installer mon navigateur, comment me connecter, comment surfer décontracté sur le Web, comment adresser mon courrier électronique (e-mail) à mes correspondants, quelles sont les meilleures &quot; adresses &quot;, quel fournisseur d&#039;accès choisir, quel type de connexion, câble, ADSL ? Cette nouvelle édition est entièrement mise à jour pour le navigateur Microsoft Edge et Windows 10.', 'Carol BAROUDI', 2017, '', ' First Interactive', 'Nuls', 0, '2412020825_internul.jpg', 15, 1995, 0),
(22, '2412041148', 'Manuel', 'Excel 2019 pour les Nuls', 'La sortie logicielle la plus attendue cette année, Office 2019, avec ici le deuxième opus Excel 2019\r\n\r\nTotalement relookées, les nouvelles composantes de cette nouvelle suite Office 2019 risquent bien de déstabiliser plus d&#039;un utilisateur des précédentes versions. Ce livre va vous aider à retrouver où se cachent toutes les fonctionnalités que vous utilisiez déjà et vous faire découvrir toutes les nouveautés importantes.\r\n\r\nSi vous n&#039;avez jamais entendu parler de feuille de calcul, si enentendant &#039;Cellule E14&#039;, vous répondez &#039;coulé !&#039;, plongez-vous vite dans ce livre ! Vous apprendrez à créer des graphiques spectaculaires qui impressionneront vos supérieurs, à publier vos documents sur Internet, à améliorer la présentation en quelques clics et à partager vos documents en les exportant au format XML.\r\n', 'Greg HARVEY', 2018, '', 'First Interactive', 'Nuls', 0, '2412041148_excelnul.jpg', 13, 999, 0),
(23, '2754089942', 'Manuel', 'Analyse de données avec Excel pour les Nuls', 'Excel le sujet bureautique le plus vendu de la suite Office 2016\r\nExcel est définitivement le logiciel le plus complexe et le plus puissant de la suite Office. La gestion des données, leur tri et leur analyse sont des tâches récurrentes pour tous les comptables, scientifiques ou contrôleurs de gestion. ce livre vous donnera toutes les clés pour regrouper, trier et analyser toutes vos données et les présenter de manière efficace.', ' Elizabeth C. NELSON', 2016, '', 'First Interactive', 'Nuls', 0, '2754089942_donne.jpg', 15, 500, 0),
(24, '2409016952', 'Manuel', 'Excel (versions 2019 et Office 365) - Maîtrisez les fonctions avancées du tableur de Microsoft®', 'Ce livre couvre les fonctions avancées de Microsoft® Excel 2019 ; il est destiné à toute personne connaissant les bases d&#039;Excel et souhaitant aller plus loin par l&#039;apprentissage des fonctions avancées de ce tableur. Il a été rédigé avec la version 2019 d&#039;Excel et intègre les nouveautés et différences de la version Excel livrée avec Office 365. Vous verrez comment créer des modèles de classeur, saisir des données spécifiques dans vos classeurs telles que des équations mathématiques, des liens hypertextes, vous apprendrez à créer des séries de données personnalisées, des listes déroulantes de valeurs, des critères de validation ; vous verrez également comment importer des données à partir d&#039;une base Access, d&#039;un fichier texte ou d&#039;une page web. Vous apprendrez à créer et utiliser les zones nommées. Vous exploiterez les outils d&#039;analyse et de calcul d&#039;Excel : nouvelles fonctions de calcul (CONCAT, JOINDRE.TEXTE, MAX.SI.ENS, MIN.SI.ENS, SI.CONDITIONS, SI.MULTIPLE), fonctions de recherche, consolidation des données, table à double entrée, formule matricielle, scénario, valeur cible et solveur. Vous effectuerez l&#039;analyse et l&#039;audit de vos feuilles de calcul. La partie suivante est consacrée à la présentation des données : vous verrez comment créer des formats personnalisés, des règles de mise en forme conditionnelle, vous verrez comment créer et appliquer styles et thèmes avant d&#039;aborder la partie sur la réorganisation des données : trier, filtrer les données à l&#039;aide d&#039;un ou plusieurs critères. Dans la partie consacrée aux graphiques, vous verrez comment créer des modèles de graphiques et découvrirez les options avancées permettant de réaliser tout type de graphique. Pour optimiser l&#039;analyse des données, vous apprendrez à utiliser les tableaux de données et à créer tableaux et graphiques croisés dynamiques. La partie suivante est consacrée au travail collaboratif : vous verrez comment partager un classeur et comment le modifier grâce à la coédition. Pour finir, vous verrez comment créer des macro-commandes, comment personnaliser votre environnement de travail en modifiant la barre d&#039;outils Accès rapide et le ruban et comment gérer les comptes Utilisateur Microsoft.', 'Microsoft', 2019, '', 'Editions ENI', 'Référence bureautique', 0, '2409016952_41T6yCywOLL._SX414_BO1,204,203,200_.jpg', 30, 50, 0),
(25, '2100779478', 'Manuel', 'Architecture des machines et des systèmes informatiques', 'Cet ouvrage présente le fonctionnement d&#039;un ordinateur au niveau matériel et au niveau système d&#039;exploitation. L&#039;ordinateur est ainsi étudié depuis son niveau le plus haut - celui du du langage de programmation et celui de l&#039;interface du système- jusqu&#039;à son niveau le plus bas- celui de l&#039;exécution binaire et des composants électroniques.\r\nPour chaque fonction ou composant de la machine les notions de base sont présentées illustrées par des architectures à base de processeurs ou de systèmes d&#039;exploitation connus.\r\n\r\nChaque partie se termine par une série d&#039;exercices corrigés.\r\n\r\nCette sixième édition comporte  quelques nouveaux exercices et approfondit des notions sur les systèmes d’exploitation, notamment sur la synchronisation de processus et le langage de commandes concernant les processus et les fichiers.', 'Joëlle Delacroix', 2018, '', 'Dunod', 'InfoSup', 0, '2100779478_infosup.jpg', 15, 56, 0),
(26, '2081382644', 'Philosophie', 'Le Banquet', 'Ils sont allongés sur des lits et parlent de l’Amour et de la Beauté. Leurs discours se succèdent, parfois se répondent : car il y a plusieurs Amours et plusieurs manières de désirer le Beau. A ces hommes vivant en un temps et un lieu où l’éducation des garçons est indissociable de la sexualité qui règle les rapports du maître et du disciple, une étrangère, Diotime, oppose un modèle féminin de la procréation du savoir. A travers elle, Socrate dessine les étapes de l’apprentissage du philosophe capable de se détacher du monde sensible pour devenir «l’amant» par excellence qui guide l’«aimé» dans sa quête du Vrai et du Beau. Par-delà les interprétations prudentes du Banquet que nous a léguées la tradition philosophique, cette traduction invite à une lecture renouvelée du dialogue un Banquet parfois extravagant, à l’image de son objet, d’une richesse stylistique exubérante, souvent cru dans son langage, foisonnant enfin dans sa recherche du bonheur véritable.', 'Platon', 0, 'Luc Brisson', 'Editions Flammarion', 'GF', 2016, '2081382644_banquet.jpg', 7, 297, 0);

-- --------------------------------------------------------

--
-- Table structure for table `bouquintheque_promotion`
--

CREATE TABLE `bouquintheque_promotion` (
  `id_promotion` int(11) NOT NULL,
  `reference` varchar(20) NOT NULL,
  `panier_minimum` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `valeur` int(11) NOT NULL,
  `date_expiration` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bouquintheque_promotion`
--

INSERT INTO `bouquintheque_promotion` (`id_promotion`, `reference`, `panier_minimum`, `stock`, `valeur`, `date_expiration`) VALUES
(1, 'PROMOTIONS', 30, 50, 5, '2019-12-12'),
(2, 'PROMOBIS', 40, 100, 5, '2020-01-01'),
(3, 'ESCROC', 20, 1, 20, '2019-12-12');

-- --------------------------------------------------------

--
-- Table structure for table `bouquintheque_promotion_par_membre`
--

CREATE TABLE `bouquintheque_promotion_par_membre` (
  `id_promotion_par_membre` int(11) NOT NULL,
  `id_membre` int(11) NOT NULL,
  `id_promotion` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bouquintheque_promotion_par_membre`
--

INSERT INTO `bouquintheque_promotion_par_membre` (`id_promotion_par_membre`, `id_membre`, `id_promotion`) VALUES
(1, 7, 1),
(2, 8, 1),
(3, 8, 1),
(4, 9, 1),
(5, 1, 2),
(6, 1, 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bouquintheque_commande`
--
ALTER TABLE `bouquintheque_commande`
  ADD PRIMARY KEY (`id_commande`),
  ADD KEY `id_membre` (`id_membre`);

--
-- Indexes for table `bouquintheque_details_commande`
--
ALTER TABLE `bouquintheque_details_commande`
  ADD PRIMARY KEY (`id_details_commande`),
  ADD KEY `id_commande` (`id_commande`),
  ADD KEY `id_produit` (`id_produit`);

--
-- Indexes for table `bouquintheque_membre`
--
ALTER TABLE `bouquintheque_membre`
  ADD PRIMARY KEY (`id_membre`),
  ADD UNIQUE KEY `pseudo` (`pseudo`);

--
-- Indexes for table `bouquintheque_note`
--
ALTER TABLE `bouquintheque_note`
  ADD PRIMARY KEY (`id_note`);

--
-- Indexes for table `bouquintheque_produit`
--
ALTER TABLE `bouquintheque_produit`
  ADD PRIMARY KEY (`id_produit`);

--
-- Indexes for table `bouquintheque_promotion`
--
ALTER TABLE `bouquintheque_promotion`
  ADD PRIMARY KEY (`id_promotion`);

--
-- Indexes for table `bouquintheque_promotion_par_membre`
--
ALTER TABLE `bouquintheque_promotion_par_membre`
  ADD PRIMARY KEY (`id_promotion_par_membre`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bouquintheque_commande`
--
ALTER TABLE `bouquintheque_commande`
  MODIFY `id_commande` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `bouquintheque_details_commande`
--
ALTER TABLE `bouquintheque_details_commande`
  MODIFY `id_details_commande` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `bouquintheque_membre`
--
ALTER TABLE `bouquintheque_membre`
  MODIFY `id_membre` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `bouquintheque_note`
--
ALTER TABLE `bouquintheque_note`
  MODIFY `id_note` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `bouquintheque_produit`
--
ALTER TABLE `bouquintheque_produit`
  MODIFY `id_produit` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `bouquintheque_promotion`
--
ALTER TABLE `bouquintheque_promotion`
  MODIFY `id_promotion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `bouquintheque_promotion_par_membre`
--
ALTER TABLE `bouquintheque_promotion_par_membre`
  MODIFY `id_promotion_par_membre` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bouquintheque_details_commande`
--
ALTER TABLE `bouquintheque_details_commande`
  ADD CONSTRAINT `bouquintheque_details_commande_ibfk_1` FOREIGN KEY (`id_commande`) REFERENCES `bouquintheque_commande` (`id_commande`) ON UPDATE CASCADE,
  ADD CONSTRAINT `bouquintheque_details_commande_ibfk_2` FOREIGN KEY (`id_produit`) REFERENCES `bouquintheque_produit` (`id_produit`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
