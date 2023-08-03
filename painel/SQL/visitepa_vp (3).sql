-- phpMyAdmin SQL Dump
-- version 4.4.15.10
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 14-Jun-2020 às 03:22
-- Versão do servidor: 5.7.30
-- PHP Version: 7.3.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `visitepa_vp`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_acesso`
--

CREATE TABLE IF NOT EXISTS `tb_acesso` (
  `id` int(11) NOT NULL,
  `ds_email` varchar(30) NOT NULL,
  `ds_senha` varchar(10) NOT NULL,
  `st_registro_ativo` varchar(2) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tb_acesso`
--

INSERT INTO `tb_acesso` (`id`, `ds_email`, `ds_senha`, `st_registro_ativo`) VALUES
(1, 'leoharleygoncalves@gmail.com', '150150', 'S'),
(2, 'detur', '1234', 'S');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_conteudo`
--

CREATE TABLE IF NOT EXISTS `tb_conteudo` (
  `id` int(11) NOT NULL,
  `titulo_previa` varchar(30) DEFAULT NULL,
  `corpo_previa` varchar(1000) DEFAULT NULL,
  `titulo_completo` varchar(30) DEFAULT NULL,
  `corpo_completo` varchar(2000) DEFAULT NULL,
  `endereco_completo` varchar(50) DEFAULT NULL,
  `contato_completo` varchar(30) DEFAULT NULL,
  `funcionamento_completo` varchar(30) DEFAULT NULL,
  `email_completo` varchar(40) DEFAULT NULL,
  `telefone_completo` varchar(20) DEFAULT NULL,
  `endereco_info` varchar(50) DEFAULT NULL,
  `bairro_info` varchar(30) DEFAULT NULL,
  `email_info` varchar(40) DEFAULT NULL,
  `telefone_info` varchar(40) DEFAULT NULL,
  `link` varchar(50) DEFAULT NULL,
  `ds_categoria` enum('acidade','rotasturisticas','comercio','gastronomia','hospedagem','eventos','informacoes','servicosturisticos','principal') NOT NULL,
  `ds_subcategoria` varchar(40) DEFAULT NULL,
  `img1` varchar(60) DEFAULT NULL,
  `img2` varchar(60) DEFAULT NULL,
  `img3` varchar(60) DEFAULT NULL,
  `img4` varchar(60) DEFAULT NULL,
  `img5` varchar(60) DEFAULT NULL,
  `video1` varchar(150) DEFAULT NULL,
  `tp_mostra` enum('I','V') DEFAULT NULL,
  `geolatlng` varchar(60) DEFAULT NULL,
  `st_registro_ativo` varchar(2) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=100 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tb_conteudo`
--

INSERT INTO `tb_conteudo` (`id`, `titulo_previa`, `corpo_previa`, `titulo_completo`, `corpo_completo`, `endereco_completo`, `contato_completo`, `funcionamento_completo`, `email_completo`, `telefone_completo`, `endereco_info`, `bairro_info`, `email_info`, `telefone_info`, `link`, `ds_categoria`, `ds_subcategoria`, `img1`, `img2`, `img3`, `img4`, `img5`, `video1`, `tp_mostra`, `geolatlng`, `st_registro_ativo`) VALUES
(1, 'Parauapebas, ParÃ¡', 'Parauapebas, no estado do ParÃ¡, Brasil, Ã© a capital do ecoturismo de CarajÃ¡s. Um pedaÃ§o da AmazÃ´nia composto por 6 Unidades de ConservaÃ§Ã£o e uma reserva indÃ­gena com inÃºmeras espÃ©cies da rica flora e fauna amazÃ´nicas. \nA cidade possui importantes atrativos turÃ­sticos.', 'Parauapebas, ParÃ¡', 'Parauapebas, cidade do sudeste paraense, Ã© um municÃ­pio jovem, mas com dinÃ¢mica de cidade grande. Rica em biodiversidade abriga em seu territÃ³rio boa parte da Floresta Nacional de CarajÃ¡s. A natureza estÃ¡ presente ate mesmo no seu nome, que significa Rio de Ãguas Rasas, na lÃ­ngua tupi-guarani, uma homenagem ao rio que tem o mesmo nome da cidade e banha seu territÃ³rio. \nA cidade tem pouco mais de  30 anos de emancipaÃ§Ã£o polÃ­tica, com uma economia forte, cresce a longos passos. Sua populaÃ§Ã£o Ã© de cerca de 260 mil habitantes, formada por pessoas de todas as regiÃµes do paÃ­s.\nParauapebas Ã© a cidade com o segundo PIB do estado, e IDH considerado alto, possui uma Ã¡rea de 6.886, 208 Km2. \nParauapebas estÃ¡ em uma regiÃ£o privilegiada, cercada pelo Mosaico de Unidades de ConservaÃ§Ã£o de CarajÃ¡s, com cerca de 1,2 milhÃ£o de hectares de florestas preservadas, abrigando inÃºmeras espÃ©cies da rica flora e fauna amazÃ´nicas. Algumas dessas espÃ©cies sÃ£o consideradas endÃªmicas, como Ã© o caso da Flor de CarajÃ¡s, jÃ¡ outras sÃ£o ameaÃ§adas de extinÃ§Ã£o. Composta por seis Unidades de ConservaÃ§Ã£o e uma Terra IndÃ­gena, a regiÃ£o de CarajÃ¡s possui atrativos para os mais variados gostos. Desde trilhas em meio Ã  exuberante floresta, cachoeiras de Ã¡guas cristalinas, lagoas, observaÃ§Ã£o de aves, com mais de 600 espÃ©cies jÃ¡ catalogadas e cerca de 1.300 cavernas ferrÃ­feras, algumas inclusive com  vestÃ­gios arqueolÃ³gicos, o que representa mais de 20% do acervo de cavernas desse tipo no paÃ­s. \nCom uma infraestrutura boa, rede hoteleira que Ã© comparada Ã  da capital do estado, centros de compras, boa logÃ­stica e fÃ¡cil acesso aÃ©reo, rodoviÃ¡rio e ferroviÃ¡rio, Parauapebas estÃ¡ sendo preparada para receber seus visitantes e atrair turistas que buscam aliar aventura, sustentabilidade, conhecimento e lazer. \n', '', '', '', '', '', '', '', '', '', 'dasdsa', 'acidade', NULL, '/about-img.jpg', '\\parauapebas-a-cidade-2.jpg', '\\parauapebas-a-cidade-3.jpg', '\\parauapebas-a-cidade-4.jpg', '', '', 'I', '', ''),
(2, 'Rota CarajÃ¡s', 'Conhecida mundialmente como uma das regiÃµes mais ricas por sua biodiversidade, CarajÃ¡s possui cerca de 1,2 milhÃ£o de hectares de florestas preservadas. Ela Ã© composta pelo maior parque de cavernas ferrÃ­feras do mundo, com mais de 1.000 cavernas catalogadas â€“ o Parque Nacional dos Campos Ferruginosos â€“ alÃ©m de trilhas, mirantes, savana, parque zoobotÃ¢nico e cachoeiras.', '', '', '', '', '', '', '', '', '', '', NULL, 'dasdas', 'rotasturisticas', 'rotacitytour', '/rotas-turisticas/rota-city-tour/1.jpg', '', '', '', '', '', 'I', '', ''),
(3, 'Rota do BÃºfalo', 'As principais opÃ§Ãµes de cultura e lazer oferecidas ao visitante que decide conhecer esta rota sÃ£o: exploraÃ§Ã£o da gastronomia rural; conhecimento do processo de produÃ§Ã£o de derivados do leite de bÃºfala e contato com os animais; participaÃ§Ã£o em atividades no campo com pequenos agricultores locais, que apresentam o processo de plantaÃ§Ã£o e apicultura.', 'teste', 'testeasdasd dasdadasdasdsa', 'QI 22 Conjunto U Casa 25 GuarÃ¡ I BrasÃ­lia', 'dasasd', 'dasdas===', '', '', 'endereco_info', 'bairro_info', 'email_info', NULL, '', 'rotasturisticas', 'rotacarajas', '/rotas-turisticas/rota-carajas/1.jpg', '', '', '', '', '', 'I', '-6.076019, -49.859203', ''),
(4, 'Rota das Ãguas', 'Um mergulho  na Rota das Ãguas! \nQuem decide conhecÃª-la vai contemplar lagos, estÃ¢ncia e balneÃ¡rios, alÃ©m de trilhas e degustaÃ§Ã£o da deliciosa culinÃ¡ria regional em conjunto com a gastronomia rural. A comercializaÃ§Ã£o das gemas e joias extraÃ­das em uma das maiores jazidas de pedras ametistas do Brasil e a piscina de Ã¡guas termais, com propriedades terapÃªuticas, tornaram o Garimpo das Pedras o atrativo destaque da rota. ', '', '', '', '', '', '', '', '', '', '', NULL, '', 'rotasturisticas', 'rotadasaguas', '/rotas-turisticas/rota-das-aguas/1.jpg', '', '', '', '', '', 'I', '', ''),
(5, 'Rota IndÃ­gena', 'Parauapebas conta com quatro aldeias indÃ­genas em seu territÃ³rio: Ã”Ã´djÃ¡, DjudjÃªkÃ´, KatetÃ© e a PokrÃ´, recÃ©m-criada. Nesta rota o visitante tem a chance de fazer uma verdadeira imersÃ£o na cultura dos Ã­ndios da etnia Xikrins. AlÃ©m de conhecer os costumes dos Ã­ndios, o turista tambÃ©m tem acesso Ã s pinturas corporais, artesanato, bijuterias, mergulho e passeio de canoa pelo rio CatetÃ©.', '', '', '', '', '', '', '', '', '', '', NULL, '', 'rotasturisticas', 'rotaindigena', '/rotas-turisticas/rota-indigena/1.jpg', '', '', '', '', '', 'I', '', ''),
(6, 'Rota City Tour', 'Uma viagem sem sair da cidade: Ã© isso que a Rota City Tour proporciona. Um passeio pelos principais atrativos pÃºblicos. O objetivo dessa rota Ã© contar um pouco sobre a cidade que possui muita riqueza tambÃ©m em sua histÃ³ria. O municÃ­pio possui diversos espaÃ§os para os amantes do esporte, lazer e tambÃ©m pra quem gosta de contemplar as belezas naturais. ', '', '', '', '', '', '', '', '', '', '', NULL, '', 'rotasturisticas', 'rotadobufalo', '/rotas-turisticas/rota-do-bufalo/1.jpg', '', '', '', '', '', 'I', '', ''),
(7, 'Partage Shopping Parauapebas', 'O Partage Shopping Parauapebas estÃ¡ localizado Ã s margens da PA-275, em uma das Ã¡reas que mais crescem em Parauapebas, com implantaÃ§Ã£o e construÃ§Ã£o de empreendimentos comerciais e habitacionais no entorno do shopping.\n\nAdministrado pelo Grupo Partage, o shopping, possui 21.200 mil mÂ² de Ã¡rea construÃ­da, sendo 14.500 mil mÂ² de ABL (Ã¡rea bruta locÃ¡vel), 741 vagas de estacionamento, 100 lojas, sendo quatro Ã¢ncoras, duas megalojas, alÃ©m de 15 operaÃ§Ãµes na praÃ§a de alimentaÃ§Ã£o.', '', '', '', '', '', '', '', '', '', '', NULL, '', 'comercio', 'farmacias', '\\comercio\\comercio1.jpg', '', '', '', '', '', 'I', '', ''),
(8, 'Rua do ComÃ©rcio - Rio Verde', 'A Rua do ComÃ©rcio Ã© o maior centro de comÃ©rcio popular da cidade, abrigando vÃ¡rias lojas, onde se encontra desde roupas, eletrÃ´nicos, farmÃ¡cias, floriculturas, acessÃ³rios, presentes e souvenires. Esta Ã© tambÃ©m uma das ruas mais antigas da cidade, que no inÃ­cio recebeu o nome de Avenida CuriÃ³, se transformando num grande conglomerado de pequenos comÃ©rcios que atendiam a necessidade das pessoas que aqui chegavam atraÃ­das pelo garimpo de Serra Pelada, em CurionÃ³polis, ou mesmo para prestar serviÃ§o para as empresas contratadas pela Vale. Dentro de pouco tempo, a rua perdeu o nome original e passou a denominar-se Rua do ComÃ©rcio, atÃ© os dias atuais.', '', '', '', '', '', '', '', '', '', '', NULL, '', 'comercio', 'clinicas', '\\comercio\\comercio2.jpg', '', '', '', '', '', 'I', '', ''),
(35, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'acidade', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(36, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'acidade', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 'Rua A - Cidade Nova ', '', '', '', '', '', '', '', '', '', '', '', NULL, '', 'comercio', NULL, '\\comercio\\comercio4.jpg', '', '', '', '', '', 'I', '', ''),
(11, '1', '1', '', '', '', '', '', '', '', '', '', '', NULL, '', 'gastronomia', 'restaurantes', '\\gastronomia\\foto1.jpg', '', '', '', '', '', 'I', '', ''),
(12, 'fgdsgfdgfd', '1dfdsfdsfsd', '', '', '', '', '', '', '', '', '', '', NULL, '', 'gastronomia', 'restaurantes', '\\gastronomia\\foto2.jpg', '', '', '', '', '', 'I', '', ''),
(13, 'teste3', '1', '', '', '', '', '', '', '', '', '', '', NULL, '', 'gastronomia', 'restaurantes', '\\gastronomia\\foto3.jpg', '', '', '', '', '', 'I', '', ''),
(14, 'teste 3', '1fsfds', '', '', '', '', '', '', '', '', '', '', NULL, '', 'gastronomia', 'restaurantes', '\\gastronomia\\foto4.jpg', '', '', '', '', '', 'I', '', ''),
(15, 'teste', '1', '', '', '', '', '', '', '', '', '', '', NULL, '', 'hospedagem', 'hoteis', '\\hospedagem\\hospedagem1.jpg', '', '', '', '', '', 'I', '', ''),
(16, '1', '1', '', '', '', '', '', '', '', '', '', '', NULL, '', 'hospedagem', 'hoteis', '\\hospedagem\\hospedagem2.jpg', '', '', '', '', '', 'I', '', ''),
(17, '1', '1fsdfs', '', '', '', '', '', '', '', '', '', '', NULL, '', 'hospedagem', 'pousadas', '\\hospedagem\\hospedagem3.jpg', '', '', '', '', '', 'I', '', ''),
(18, 'teste5', '1', '', '', '', '', '', '', '', '', '', '', NULL, '', 'hospedagem', 'pousadas', '\\hospedagem\\hospedagem4.jpg', '', '', '', '', '', 'I', '', ''),
(19, 'teste2', '', '', '', '', '', '', '', '', '', '', '', NULL, '', 'eventos', '1', '\\eventos\\evento1.jpg', '', '', '', '', '', 'I', '', ''),
(20, 'teste', '', '', '', '', '', '', '', '', '', '', '', NULL, '', 'eventos', '2', '\\eventos\\evento2.jpg', '', '', '', '', '', 'I', '', ''),
(21, 'teste3', '', '', '', '', '', '', '', '', '', '', '', NULL, '', 'eventos', NULL, '\\eventos\\evento3.jpg', '', '', '', '', '', 'I', '', ''),
(22, 'teste5', '', '', '', '', '', '', '', '', '', '', '', NULL, '', 'eventos', NULL, '\\eventos\\evento4.jpg', '', '', '', '', '', 'I', '', ''),
(23, 'Mapas teste', '', '', '', '', '', '', '', '', '', '', '', NULL, '', 'informacoes', NULL, '\\informacoes\\mapa_turistico.jpg', '', '', '', '', '', 'I', '', ''),
(24, 'Telefones Ãšteis', '', '', '', '', '', '', '', '', '', '', '', NULL, '', 'informacoes', NULL, '\\informacoes\\telefones_uteis.png', '', '', '', '', '', 'I', '', ''),
(25, 'Aluguel de veÃ­culos', 'teste', '', '', '', '', '', '', '', '', '', '', NULL, '', 'servicosturisticos', 'alugueldeveiculos', '\\servicos_turisticos\\aluguel_de_veiculos_1.jpg', '', '', '', '', '', 'I', '', ''),
(26, 'Apoio ao Turist', '', '', '', '', '', '', '', '', '', '', '', NULL, '', 'servicosturisticos', 'apoioaoturista', '\\servicos_turisticos\\apoio_ao_turista.jpg', '', '', '', '', '', 'I', '', ''),
(27, 'ServiÃ§o de TÃ¡xi', '', '', '', '', '', '', '', '', '', '', '', NULL, '', 'servicosturisticos', 'servicodetaxi', '\\servicos_turisticos\\servico_de_taxi.jpg', '', '', '', '', '', 'I', '', ''),
(28, 'ServiÃ§o de Transfer', '', '', '', '', '', '', '', '', '', '', '', NULL, '', 'servicosturisticos', 'servicodetransfer', '\\servicos_turisticos\\servico_de_transfer.jpg', '', '', '', '', '', 'I', '', ''),
(29, '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'principal', NULL, '/intro-carousel/1.jpg', '/intro-carousel/2.jpg', '/intro-carousel/3.jpg', '', '', '', 'I', '', 'S'),
(31, 'teste', '', '', '', '', '', '', '', '', '', '', 'teste@teste.com.br', '55555555', NULL, 'rotasturisticas', 'rotacarajas', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 'S'),
(32, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'rotasturisticas', 'rotacarajas', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'S'),
(33, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'rotasturisticas', 'rotacarajas', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'S'),
(57, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'acidade', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(37, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'acidade', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(38, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'acidade', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(39, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'acidade', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(55, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'acidade', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(40, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'acidade', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(41, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'acidade', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(42, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'acidade', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(43, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'acidade', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(44, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'acidade', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(45, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'acidade', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(46, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'acidade', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(47, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'acidade', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(48, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'acidade', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(49, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'acidade', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(50, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'acidade', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(51, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'acidade', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(52, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'acidade', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(53, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'acidade', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(56, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'acidade', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(54, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'acidade', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(58, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'acidade', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(59, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'acidade', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(60, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'acidade', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(61, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'acidade', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(62, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'acidade', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(63, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'acidade', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(64, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'acidade', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(65, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'acidade', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(66, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'acidade', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(67, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'acidade', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(68, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'acidade', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(69, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'acidade', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(70, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'acidade', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(71, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'acidade', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(72, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'acidade', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(75, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'acidade', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(73, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'acidade', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(74, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'acidade', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(76, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'acidade', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(77, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'acidade', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(78, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'acidade', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(79, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'acidade', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(80, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'acidade', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(81, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'acidade', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(82, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'acidade', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(83, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'acidade', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(84, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'acidade', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(85, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'acidade', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(86, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'acidade', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(87, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'acidade', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(88, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'acidade', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(89, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'acidade', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(90, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'acidade', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(91, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'acidade', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(92, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'acidade', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(93, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'acidade', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(94, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'acidade', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(95, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'acidade', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(96, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'acidade', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(97, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'acidade', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(98, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'acidade', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(99, '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'acidade', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_mala_direta`
--

CREATE TABLE IF NOT EXISTS `tb_mala_direta` (
  `id` int(11) NOT NULL,
  `ds_nome` varchar(40) NOT NULL,
  `ds_email` varchar(40) NOT NULL,
  `st_registro_ativo` varchar(2) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tb_mala_direta`
--

INSERT INTO `tb_mala_direta` (`id`, `ds_nome`, `ds_email`, `st_registro_ativo`) VALUES
(1, 'Leonardo', 'leoharleygoncalves@gmail.com', 'S'),
(2, 'Leonardo', 'leoharleygoncalves@gmail.com', 'S'),
(3, 'Ana', 'anarabello@hotmail.com', 'S');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_titulos`
--

CREATE TABLE IF NOT EXISTS `tb_titulos` (
  `id` int(11) NOT NULL,
  `ds_titulo_resumido` varchar(50) NOT NULL,
  `ds_titulo_completo` varchar(50) NOT NULL,
  `ds_nome` varchar(40) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tb_titulos`
--

INSERT INTO `tb_titulos` (`id`, `ds_titulo_resumido`, `ds_titulo_completo`, `ds_nome`) VALUES
(1, 'Rotas Turísticas', 'Rotas Turísticas', 'rotasturisticas'),
(2, 'Comércio', 'Comércio', 'comercio'),
(3, 'Gastronomia', 'Gastronomia', 'gastronomia');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_acesso`
--
ALTER TABLE `tb_acesso`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_conteudo`
--
ALTER TABLE `tb_conteudo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_mala_direta`
--
ALTER TABLE `tb_mala_direta`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_titulos`
--
ALTER TABLE `tb_titulos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_acesso`
--
ALTER TABLE `tb_acesso`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tb_conteudo`
--
ALTER TABLE `tb_conteudo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=100;
--
-- AUTO_INCREMENT for table `tb_mala_direta`
--
ALTER TABLE `tb_mala_direta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tb_titulos`
--
ALTER TABLE `tb_titulos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
