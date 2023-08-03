-- phpMyAdmin SQL Dump
-- version 4.4.15.10
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 14-Jun-2020 às 03:05
-- Versão do servidor: 5.7.30
-- PHP Version: 7.3.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `appbm`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `rl_inscricao`
--

CREATE TABLE IF NOT EXISTS `rl_inscricao` (
  `co_seq_inscricao` int(11) NOT NULL,
  `nu_avaliacao_individual` int(11) DEFAULT '0',
  `st_registro_ativo` varchar(2) DEFAULT NULL,
  `co_cadastro_pessoa` int(11) NOT NULL,
  `co_situacao_na_atividade` int(11) NOT NULL,
  `co_cadastro_atividade` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `rl_inscricao`
--

INSERT INTO `rl_inscricao` (`co_seq_inscricao`, `nu_avaliacao_individual`, `st_registro_ativo`, `co_cadastro_pessoa`, `co_situacao_na_atividade`, `co_cadastro_atividade`) VALUES
(22, 0, 'S', 31, 5, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `rl_notificacao`
--

CREATE TABLE IF NOT EXISTS `rl_notificacao` (
  `co_seq_notificacao` int(11) NOT NULL,
  `nu_horario` int(11) DEFAULT NULL,
  `dt_envio` date DEFAULT NULL,
  `co_descricao_notificacao` int(11) NOT NULL,
  `co_acesso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_acesso`
--

CREATE TABLE IF NOT EXISTS `tb_acesso` (
  `co_seq_acesso` int(11) NOT NULL,
  `nu_cpf` varchar(12) NOT NULL,
  `ds_senha` varchar(45) NOT NULL,
  `tp_cadastro` varchar(10) DEFAULT NULL,
  `st_registro_ativo` varchar(2) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tb_acesso`
--

INSERT INTO `tb_acesso` (`co_seq_acesso`, `nu_cpf`, `ds_senha`, `tp_cadastro`, `st_registro_ativo`) VALUES
(1, '89090888187', '150150', 'aluno', 'S'),
(2, '69062897134', 'havona', 'aluno', 'S'),
(3, '21733567801', 'teste1', 'aluno', 'S'),
(4, '64545464664', '150150', 'aluno', 'S'),
(5, '54546545465', '150150', 'aluno', 'S'),
(6, '02337623106', 'teste', 'aluno', 'S');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_cadastro_atividade`
--

CREATE TABLE IF NOT EXISTS `tb_cadastro_atividade` (
  `co_seq_cadastro_atividade` int(11) NOT NULL,
  `ds_titulo` varchar(30) DEFAULT NULL,
  `ds_descricao` varchar(200) DEFAULT NULL,
  `ds_localidade` varchar(45) DEFAULT NULL,
  `nu_horario` time DEFAULT NULL,
  `nu_duracao` int(11) DEFAULT NULL,
  `dt_inicio` varchar(12) DEFAULT NULL,
  `nu_avaliacao_geral` int(11) DEFAULT NULL,
  `ds_lat` varchar(10) DEFAULT NULL,
  `ds_long` varchar(10) DEFAULT NULL,
  `st_registro_ativo` varchar(2) DEFAULT NULL,
  `co_modalidade` int(11) NOT NULL,
  `co_status_atividade` int(11) NOT NULL,
  `co_cadastro_pessoa` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tb_cadastro_atividade`
--

INSERT INTO `tb_cadastro_atividade` (`co_seq_cadastro_atividade`, `ds_titulo`, `ds_descricao`, `ds_localidade`, `nu_horario`, `nu_duracao`, `dt_inicio`, `nu_avaliacao_geral`, `ds_lat`, `ds_long`, `st_registro_ativo`, `co_modalidade`, `co_status_atividade`, `co_cadastro_pessoa`) VALUES
(1, 'Corrida no parque', 'Atividade de corrida no parque do Guará', 'Parque ecológico do guará ezechias heringer', '16:00:00', 30, '10/05/2020', 9, NULL, NULL, 'S', 1, 1, 31),
(2, 'Alongamento com Prof. Denis', 'Atividade de alongamento', 'Pontão do Lago Sul', '16:00:00', 30, '13/05/2020', 7, NULL, NULL, 'S', 2, 1, 32),
(16, 'teste', 'dasdas', 'esplanada dos ministérios', '15:58:00', 30, '11/05/2020', NULL, NULL, NULL, 'S', 1, 1, 32);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_cadastro_pessoa`
--

CREATE TABLE IF NOT EXISTS `tb_cadastro_pessoa` (
  `co_seq_cadastro_pessoa` int(11) NOT NULL,
  `ds_nome` varchar(45) DEFAULT NULL,
  `ds_sobrenome` varchar(45) DEFAULT NULL,
  `nu_cpf` varchar(12) DEFAULT NULL,
  `nu_cref` varchar(20) DEFAULT NULL,
  `ds_email` varchar(45) DEFAULT NULL,
  `nu_telefone` varchar(15) DEFAULT NULL,
  `ds_sexo` varchar(45) DEFAULT NULL,
  `dt_nascimento` varchar(12) DEFAULT NULL,
  `tp_cadastro` varchar(10) DEFAULT NULL,
  `st_registro_ativo` varchar(2) DEFAULT NULL,
  `co_acesso` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tb_cadastro_pessoa`
--

INSERT INTO `tb_cadastro_pessoa` (`co_seq_cadastro_pessoa`, `ds_nome`, `ds_sobrenome`, `nu_cpf`, `nu_cref`, `ds_email`, `nu_telefone`, `ds_sexo`, `dt_nascimento`, `tp_cadastro`, `st_registro_ativo`, `co_acesso`) VALUES
(31, 'Leonardo', 'Gonçalves', '89090888187', NULL, 'leoharleygoncalves@gmail.com', '(61)98531-1722', 'masculino', '17/01/1981', 'aluno', 'S', 1),
(32, 'Ana', 'Rabello', '69062897134', NULL, 'anarabello2015@gmail.com', '(61)99449-2195', 'feminino', '18/11/1979', 'professor', 'S', 2),
(33, 'Amilton', 'Vieira', '21733567801', NULL, 'acmribeirao@gmail.com', '(55)61983-5558', 'masculino', '26/02/1982', 'professor', 'S', 3),
(36, 'Alexandre', 'Brito', '64545464664', NULL, 'alexbrito@gmail.com', '(61)95656-5656', 'masculino', '15/11/1982', 'aluno', 'S', 4),
(37, 'Paulo', 'Roberto', '54546545465', NULL, 'pauloroberto@gmail.com', '(61)65656-5656', 'masculino', '15/11/1978', 'aluno', 'S', 5),
(38, 'Alexandre', 'Soares de Brito', '02337623106', NULL, 'asb.alexandrebrito@gmail.com', '(61)99113-4110', 'masculino', '27/07/1988', 'aluno', 'S', 6);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_descricao_notificacao`
--

CREATE TABLE IF NOT EXISTS `tb_descricao_notificacao` (
  `co_seq_descricao_notificacao` int(11) NOT NULL,
  `ds_descricao` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_formulario_parq`
--

CREATE TABLE IF NOT EXISTS `tb_formulario_parq` (
  `co_seq_formulario_parq` int(11) NOT NULL,
  `ds_resposta_1` varchar(5) DEFAULT NULL,
  `ds_resposta_2` varchar(5) DEFAULT NULL,
  `ds_resposta_3` varchar(5) DEFAULT NULL,
  `ds_resposta_4` varchar(5) DEFAULT NULL,
  `ds_resposta_5` varchar(5) DEFAULT NULL,
  `ds_resposta_6` varchar(5) DEFAULT NULL,
  `ds_resposta_7` varchar(5) DEFAULT NULL,
  `st_registro_ativo` varchar(2) DEFAULT NULL,
  `co_cadastro_pessoa` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tb_formulario_parq`
--

INSERT INTO `tb_formulario_parq` (`co_seq_formulario_parq`, `ds_resposta_1`, `ds_resposta_2`, `ds_resposta_3`, `ds_resposta_4`, `ds_resposta_5`, `ds_resposta_6`, `ds_resposta_7`, `st_registro_ativo`, `co_cadastro_pessoa`) VALUES
(8, 'sim', 'nao', 'nao', 'sim', 'nao', 'sim', 'sim', 'S', 31),
(9, 'sim', 'nao', 'sim', 'nao', 'nao', 'sim', 'sim', 'S', 32),
(10, 'nao', 'nao', 'nao', 'nao', 'nao', 'nao', 'nao', 'S', 33),
(13, 'nao', 'nao', 'nao', 'nao', 'nao', 'nao', 'nao', 'S', 36),
(14, 'sim', 'nao', 'sim', 'sim', 'nao', 'nao', 'nao', 'S', 37),
(15, 'nao', 'nao', 'nao', 'nao', 'nao', 'nao', 'nao', 'S', 38);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_modalidade`
--

CREATE TABLE IF NOT EXISTS `tb_modalidade` (
  `co_seq_modalidade` int(11) NOT NULL,
  `ds_titulo` varchar(30) DEFAULT NULL,
  `ds_descricao` varchar(50) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tb_modalidade`
--

INSERT INTO `tb_modalidade` (`co_seq_modalidade`, `ds_titulo`, `ds_descricao`) VALUES
(1, 'Corrida', 'Atividade de corrida ao ar livre'),
(2, 'Alongamento', 'Atividade de alongamento'),
(3, 'Dança', 'Dança de salão');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_situacao_na_atividade`
--

CREATE TABLE IF NOT EXISTS `tb_situacao_na_atividade` (
  `co_seq_situacao_na_atividade` int(11) NOT NULL,
  `ds_situacao` varchar(45) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tb_situacao_na_atividade`
--

INSERT INTO `tb_situacao_na_atividade` (`co_seq_situacao_na_atividade`, `ds_situacao`) VALUES
(1, 'Inscrição feita'),
(2, 'Inscrição confirmada'),
(3, 'Atividade concluída'),
(4, 'Inscrição negada'),
(5, 'Inscrição cancelada');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_status_atividade`
--

CREATE TABLE IF NOT EXISTS `tb_status_atividade` (
  `co_seq_status_atividade` int(11) NOT NULL,
  `ds_status` varchar(45) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tb_status_atividade`
--

INSERT INTO `tb_status_atividade` (`co_seq_status_atividade`, `ds_status`) VALUES
(1, 'programada_com_vagas'),
(2, 'programada_sem_vagas'),
(3, 'iniciada'),
(4, 'realizada'),
(5, 'cancelada');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `rl_inscricao`
--
ALTER TABLE `rl_inscricao`
  ADD PRIMARY KEY (`co_seq_inscricao`),
  ADD KEY `fk_rl_inscricao_tb_aluno_idx` (`co_cadastro_pessoa`),
  ADD KEY `fk_rl_inscricao_tb_situacao_na_atividade1_idx` (`co_situacao_na_atividade`),
  ADD KEY `fk_rl_inscricao_tb_atividade1_idx` (`co_cadastro_atividade`);

--
-- Indexes for table `rl_notificacao`
--
ALTER TABLE `rl_notificacao`
  ADD PRIMARY KEY (`co_seq_notificacao`),
  ADD KEY `fk_rl_notificacao_tb_descricao_notificacao1_idx` (`co_descricao_notificacao`),
  ADD KEY `fk_rl_notificacao_tb_acesso1_idx` (`co_acesso`);

--
-- Indexes for table `tb_acesso`
--
ALTER TABLE `tb_acesso`
  ADD PRIMARY KEY (`co_seq_acesso`);

--
-- Indexes for table `tb_cadastro_atividade`
--
ALTER TABLE `tb_cadastro_atividade`
  ADD PRIMARY KEY (`co_seq_cadastro_atividade`),
  ADD KEY `fk_tb_atividade_tb_modalidade1_idx` (`co_modalidade`),
  ADD KEY `fk_tb_atividade_tb_status_atividade1_idx` (`co_status_atividade`);

--
-- Indexes for table `tb_cadastro_pessoa`
--
ALTER TABLE `tb_cadastro_pessoa`
  ADD PRIMARY KEY (`co_seq_cadastro_pessoa`,`co_acesso`),
  ADD KEY `fk_tb_aluno_tb_acesso1_idx` (`co_acesso`);

--
-- Indexes for table `tb_descricao_notificacao`
--
ALTER TABLE `tb_descricao_notificacao`
  ADD PRIMARY KEY (`co_seq_descricao_notificacao`);

--
-- Indexes for table `tb_formulario_parq`
--
ALTER TABLE `tb_formulario_parq`
  ADD PRIMARY KEY (`co_seq_formulario_parq`,`co_cadastro_pessoa`),
  ADD KEY `fk_tb_formulario_parq_tb_aluno1_idx` (`co_cadastro_pessoa`);

--
-- Indexes for table `tb_modalidade`
--
ALTER TABLE `tb_modalidade`
  ADD PRIMARY KEY (`co_seq_modalidade`);

--
-- Indexes for table `tb_situacao_na_atividade`
--
ALTER TABLE `tb_situacao_na_atividade`
  ADD PRIMARY KEY (`co_seq_situacao_na_atividade`);

--
-- Indexes for table `tb_status_atividade`
--
ALTER TABLE `tb_status_atividade`
  ADD PRIMARY KEY (`co_seq_status_atividade`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `rl_inscricao`
--
ALTER TABLE `rl_inscricao`
  MODIFY `co_seq_inscricao` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `rl_notificacao`
--
ALTER TABLE `rl_notificacao`
  MODIFY `co_seq_notificacao` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tb_acesso`
--
ALTER TABLE `tb_acesso`
  MODIFY `co_seq_acesso` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `tb_cadastro_atividade`
--
ALTER TABLE `tb_cadastro_atividade`
  MODIFY `co_seq_cadastro_atividade` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `tb_cadastro_pessoa`
--
ALTER TABLE `tb_cadastro_pessoa`
  MODIFY `co_seq_cadastro_pessoa` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=39;
--
-- AUTO_INCREMENT for table `tb_formulario_parq`
--
ALTER TABLE `tb_formulario_parq`
  MODIFY `co_seq_formulario_parq` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `tb_modalidade`
--
ALTER TABLE `tb_modalidade`
  MODIFY `co_seq_modalidade` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tb_situacao_na_atividade`
--
ALTER TABLE `tb_situacao_na_atividade`
  MODIFY `co_seq_situacao_na_atividade` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `tb_status_atividade`
--
ALTER TABLE `tb_status_atividade`
  MODIFY `co_seq_status_atividade` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `rl_inscricao`
--
ALTER TABLE `rl_inscricao`
  ADD CONSTRAINT `fk_rl_inscricao_tb_aluno` FOREIGN KEY (`co_cadastro_pessoa`) REFERENCES `tb_cadastro_pessoa` (`co_seq_cadastro_pessoa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_rl_inscricao_tb_atividade1` FOREIGN KEY (`co_cadastro_atividade`) REFERENCES `tb_cadastro_atividade` (`co_seq_cadastro_atividade`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_rl_inscricao_tb_situacao_na_atividade1` FOREIGN KEY (`co_situacao_na_atividade`) REFERENCES `tb_situacao_na_atividade` (`co_seq_situacao_na_atividade`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `rl_notificacao`
--
ALTER TABLE `rl_notificacao`
  ADD CONSTRAINT `fk_rl_notificacao_tb_acesso1` FOREIGN KEY (`co_acesso`) REFERENCES `tb_acesso` (`co_seq_acesso`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_rl_notificacao_tb_descricao_notificacao1` FOREIGN KEY (`co_descricao_notificacao`) REFERENCES `tb_descricao_notificacao` (`co_seq_descricao_notificacao`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tb_cadastro_atividade`
--
ALTER TABLE `tb_cadastro_atividade`
  ADD CONSTRAINT `fk_tb_atividade_tb_modalidade1` FOREIGN KEY (`co_modalidade`) REFERENCES `tb_modalidade` (`co_seq_modalidade`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tb_atividade_tb_status_atividade1` FOREIGN KEY (`co_status_atividade`) REFERENCES `tb_status_atividade` (`co_seq_status_atividade`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tb_cadastro_pessoa`
--
ALTER TABLE `tb_cadastro_pessoa`
  ADD CONSTRAINT `fk_tb_aluno_tb_acesso1` FOREIGN KEY (`co_acesso`) REFERENCES `tb_acesso` (`co_seq_acesso`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tb_formulario_parq`
--
ALTER TABLE `tb_formulario_parq`
  ADD CONSTRAINT `fk_tb_formulario_parq_tb_aluno1` FOREIGN KEY (`co_cadastro_pessoa`) REFERENCES `tb_cadastro_pessoa` (`co_seq_cadastro_pessoa`) ON DELETE NO ACTION ON UPDATE NO ACTION;
--
-- Database: `codeigniter`
--
--
-- Database: `dbcgpan`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_menu`
--

CREATE TABLE IF NOT EXISTS `tb_menu` (
  `CO_SEQ_MENU` int(9) NOT NULL,
  `NO_MENU` varchar(60) NOT NULL,
  `DS_MENU` varchar(200) NOT NULL,
  `IM_MENU` blob,
  `DS_URL` varchar(400) NOT NULL,
  `CO_MENU` int(9) DEFAULT NULL,
  `NU_ORDEM` int(3) NOT NULL,
  `DT_CADASTRO` date NOT NULL,
  `DT_ATUALIZACAO` date DEFAULT NULL,
  `CO_PROGRAMA` int(6) NOT NULL,
  `CO_PROGRAMA_MODULO` int(6) DEFAULT NULL,
  `CO_GRUPO` int(11) NOT NULL,
  `CO_MUNICIPIO_IBGE` varchar(6) DEFAULT NULL,
  `CO_UNIDADE` varchar(31) DEFAULT NULL,
  `CO_CNES` varchar(7) DEFAULT NULL,
  `CO_EQUIPE` varchar(10) DEFAULT NULL,
  `NO_CLASSECSS` varchar(100) NOT NULL,
  `ST_REGISTRO_ATIVO` varchar(2) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=736 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tb_menu`
--

INSERT INTO `tb_menu` (`CO_SEQ_MENU`, `NO_MENU`, `DS_MENU`, `IM_MENU`, `DS_URL`, `CO_MENU`, `NU_ORDEM`, `DT_CADASTRO`, `DT_ATUALIZACAO`, `CO_PROGRAMA`, `CO_PROGRAMA_MODULO`, `CO_GRUPO`, `CO_MUNICIPIO_IBGE`, `CO_UNIDADE`, `CO_CNES`, `CO_EQUIPE`, `NO_CLASSECSS`, `ST_REGISTRO_ATIVO`) VALUES
(88, 'Inicial', 'Painel Inicial do PMAQ', NULL, 'sistema', NULL, 1, '2008-12-15', NULL, 48, 2, 29, NULL, NULL, NULL, NULL, 'fa fa-link', 'S'),
(86, 'Perfil de Acesso', 'Perfil de Acesso', NULL, 'login/perfil', NULL, 3, '2008-12-15', NULL, 48, 2, 46, NULL, NULL, NULL, NULL, 'fa fa-gear', 'S'),
(87, 'Certificação', 'Certificação de equipes participantes do PMAQ', NULL, 'sistema/certificacao', NULL, 2, '2008-12-15', NULL, 48, 2, 29, NULL, NULL, NULL, NULL, 'fa fa-certificate', 'S'),
(85, 'Relatório Descritivo', 'Relatório Descritivo', NULL, '../pmaq_relatorio/relatorio/recuperarsessao/token:', 82, 2, '2008-12-15', NULL, 48, 2, 46, NULL, NULL, NULL, NULL, 'fa fa-line-chart', 'S'),
(83, 'Inicial', 'Painel Inicial do PMAQ', NULL, 'sistema', NULL, 1, '2008-12-15', NULL, 48, 2, 46, NULL, NULL, NULL, NULL, 'fa fa-link', 'S'),
(84, 'Relatório Analítico', 'Relatório Analítico', NULL, 'login/acessolinkexterno/b2tDRHJtMDljUkNueVBxSW1YTG1QUEFUem9ScURxMVdpcUxRWlBhZHRHNGF5V1BLSmozWFNZVXNsVEo4NTdCbGJCU3krbXRwYWxQd0c3QXdWV21qYmc9PQ__/', 82, 1, '2008-12-15', NULL, 48, 2, 46, NULL, NULL, NULL, NULL, 'fa fa-line-chart', 'S'),
(82, 'Certificação', 'Certificação de equipes participantes do PMAQ', NULL, 'sistema/certificacao', NULL, 2, '2008-12-15', NULL, 48, 2, 46, NULL, NULL, NULL, NULL, 'fa fa-certificate', 'S'),
(81, 'AMAQ', 'Autoavaliação para Melhoria do Acesso e Qualidade da Atenção Básica', NULL, 'sistema/desenvolvimento', 80, 1, '2008-12-15', NULL, 48, 2, 4, NULL, NULL, NULL, NULL, 'fa fa-check-square-o', 'S'),
(80, 'Desenvolvimento', 'Desenvolvimento de equipes participantes do PMAQ', NULL, 'sistema/desenvolvimento', NULL, 4, '2008-12-15', NULL, 48, 2, 4, NULL, NULL, NULL, NULL, 'fa fa-pencil', 'S'),
(79, 'Relatório Descritivo', 'Relatório Descritivo', NULL, '../pmaq_relatorio/relatorio/recuperarsessao/token:', 78, 1, '2008-12-15', NULL, 48, 2, 4, NULL, NULL, NULL, NULL, 'fa fa-line-chart', 'S'),
(78, 'Certificação', 'Certificação de equipes participantes do PMAQ', NULL, 'sistema/certificacao', NULL, 3, '2008-12-15', NULL, 48, 2, 4, NULL, NULL, NULL, NULL, 'fa fa-certificate', 'S'),
(77, 'Perfil de Acesso', 'Perfil de Acesso', NULL, 'login/perfil', NULL, 4, '2008-12-15', NULL, 48, 2, 2, NULL, NULL, NULL, NULL, 'fa fa-gear', 'S'),
(76, 'Inicial', 'Painel Inicial do PMAQ', NULL, 'sistema', NULL, 1, '2008-12-15', NULL, 48, 2, 2, NULL, NULL, NULL, NULL, 'fa fa-link', 'S'),
(75, 'AMAQ', 'Autoavaliação para Melhoria do Acesso e Qualidade da Atenção Básica', NULL, 'sistema/desenvolvimento', 74, 1, '2008-12-15', NULL, 48, 2, 2, NULL, NULL, NULL, NULL, 'fa fa-check-square-o', 'S'),
(74, 'Desenvolvimento', 'Desenvolvimento de equipes participantes do PMAQ', NULL, 'sistema/desenvolvimento', NULL, 3, '2008-12-15', NULL, 48, 2, 2, NULL, NULL, NULL, NULL, 'fa fa-pencil', 'S'),
(73, 'Relatório Descritivo', 'Relatório Descritivo', NULL, '../pmaq_relatorio/relatorio/recuperarsessao/token:', 71, 2, '2008-12-15', NULL, 48, 2, 2, NULL, NULL, NULL, NULL, 'fa fa-line-chart', 'S'),
(72, 'Relatório Analítico', 'Relatório Analítico', NULL, 'login/acessolinkexterno/b2tDRHJtMDljUkNueVBxSW1YTG1QUEFUem9ScURxMVdpcUxRWlBhZHRHNGF5V1BLSmozWFNZVXNsVEo4NTdCbGJCU3krbXRwYWxQd0c3QXdWV21qYmc9PQ__/', 71, 1, '2008-12-15', NULL, 48, 2, 2, NULL, NULL, NULL, NULL, 'fa fa-line-chart', 'S'),
(71, 'Certificação', 'Certificação de equipes participantes do PMAQ', NULL, 'sistema/certificacao', NULL, 2, '2008-12-15', NULL, 48, 2, 2, NULL, NULL, NULL, NULL, 'fa fa-certificate', 'S'),
(735, 'Relatórios', 'Micronutriente NutriSus', NULL, 'nutrisus/relatorio', 723, 3, '2021-03-19', NULL, 3, 3, 60, NULL, NULL, NULL, NULL, 'fa fa-check-square-o', 'S'),
(734, 'Dose Crianças', 'Micronutriente NutriSus', NULL, 'nutrisus/dose/1', 723, 2, '2021-03-19', NULL, 3, 3, 60, NULL, NULL, NULL, NULL, 'fa fa-check-square-o', 'S'),
(733, 'Início', 'Micronutriente NutriSus', NULL, 'nutrisus', 723, 1, '2021-03-19', NULL, 3, 3, 60, NULL, NULL, NULL, NULL, 'fa fa-home', 'S'),
(732, 'Relatórios', 'Micronutriente ferro', NULL, 'ferro/relatorio', 722, 4, '2021-03-19', NULL, 3, 2, 60, NULL, NULL, NULL, NULL, 'fa fa-check-square-o', 'S'),
(731, 'Dose Gestantes', 'Micronutriente ferro', NULL, 'ferro/dose/2', 722, 3, '2021-03-19', NULL, 3, 2, 60, NULL, NULL, NULL, NULL, 'fa fa-check-square-o', 'S'),
(730, 'Dose Crianças', 'Micronutriente ferro', NULL, 'ferro/dose/1', 722, 2, '2021-03-19', NULL, 3, 2, 60, NULL, NULL, NULL, NULL, 'fa fa-check-square-o', 'S'),
(729, 'Início', 'Micronutriente ferro', NULL, 'ferro', 722, 1, '2021-03-19', NULL, 3, 2, 60, NULL, NULL, NULL, NULL, 'fa fa-home', 'S'),
(728, 'Relatórios', 'Micronutriente Vitamina A', NULL, 'vitaminaa/relatorio', 721, 5, '2021-03-19', NULL, 3, 1, 60, NULL, NULL, NULL, NULL, 'fa fa-check-square-o', 'S'),
(727, 'Perda de Cápsulas', 'Micronutriente Vitamina A', NULL, 'vitaminaa/perda/1', 721, 4, '2021-03-19', NULL, 3, 1, 60, NULL, NULL, NULL, NULL, 'fa fa-check-square-o', 'S'),
(726, 'Dose 200.000 U', 'Micronutriente Vitamina A', NULL, 'vitaminaa/dose/2', 721, 3, '2021-03-19', NULL, 3, 1, 60, NULL, NULL, NULL, NULL, 'fa fa-check-square-o', 'S'),
(724, 'Início', 'Micronutriente Vitamina A', NULL, 'vitaminaa', 721, 1, '2021-03-19', NULL, 3, 1, 60, NULL, NULL, NULL, NULL, 'fa fa-home', 'S'),
(725, 'Dose 100.000 UI', 'Micronutriente Vitamina A', NULL, 'vitaminaa/dose/1', 721, 2, '2021-03-19', NULL, 3, 1, 60, NULL, NULL, NULL, NULL, 'fa fa-check-square-o', 'S'),
(723, 'NutriSus', 'Micronutriente Nutrisus', NULL, '#', NULL, 3, '2021-03-19', NULL, 3, 3, 60, NULL, NULL, NULL, NULL, 'fa fa-folder', 'S'),
(721, 'Vitamina A', 'Micronutriente Vitamina A', NULL, '#', NULL, 1, '2021-03-19', NULL, 3, 1, 60, NULL, NULL, NULL, NULL, 'fa fa-folder', 'S'),
(722, 'Ferro', 'Micronutriente Ferro', NULL, '#', NULL, 2, '2021-03-19', NULL, 3, 2, 60, NULL, NULL, NULL, NULL, 'fa fa-folder', 'S'),
(483, 'Calendário', 'Calendário', NULL, '#', NULL, 3, '2029-06-17', NULL, 70, NULL, 79, NULL, NULL, NULL, NULL, 'fa fa-calendar', 'S'),
(172, 'Relatórios Públicos', 'Relatórios Públicos', NULL, 'paginas/acessoPublico/relatoriosPublicos.xhtml', NULL, 2, '2005-10-16', NULL, 77, NULL, 75, NULL, NULL, NULL, NULL, 'fa fa-user', 'N'),
(162, 'AMAQ', 'Autoavaliação para Melhoria do Acesso e Qualidade da Atenção Básica', NULL, 'sistema/desenvolvimento', 161, 1, '2008-12-15', NULL, 48, 2, 69, NULL, NULL, NULL, NULL, 'fa fa-check-square-o', 'S'),
(161, 'Desenvolvimento', 'Desenvolvimento de equipes participantes do PMAQ', NULL, 'sistema/desenvolvimento', NULL, 4, '2008-12-15', NULL, 48, 2, 69, NULL, NULL, NULL, NULL, 'fa fa-pencil', 'S'),
(160, 'Relatório Descritivo', 'Relatório Descritivo', NULL, '../pmaq_relatorio/relatorio/recuperarsessao/token:', 159, 1, '2008-12-15', NULL, 48, 2, 69, NULL, NULL, NULL, NULL, 'fa fa-line-chart', 'S'),
(159, 'Certificação', 'Certificação de equipes participantes do PMAQ', NULL, 'sistema/certificacao', NULL, 3, '2008-12-15', NULL, 48, 2, 69, NULL, NULL, NULL, NULL, 'fa fa-certificate', 'S'),
(158, 'Perfil de Acesso', 'Perfil de Acesso', NULL, 'login/perfil', NULL, 3, '2023-10-15', NULL, 48, 2, 69, NULL, NULL, NULL, NULL, 'fa fa-gear', 'S'),
(157, 'CEO', 'Adesão de equipes de CEO', NULL, 'adesaoceo', 156, 1, '2023-10-15', NULL, 48, 2, 69, NULL, NULL, NULL, NULL, 'fa fa-thumbs-o-up', 'S'),
(155, 'Inicial', 'Painel Inicial do PMAQ', NULL, 'sistema', NULL, 1, '2023-10-15', NULL, 48, 2, 69, NULL, NULL, NULL, NULL, 'fa fa-link', 'S'),
(156, 'Adesão', 'Adesão do PMAQ', NULL, 'sistema/adesao', NULL, 2, '2023-10-15', NULL, 48, 2, 69, NULL, NULL, NULL, NULL, 'fa fa-thumbs-o-up', 'S'),
(154, 'Relatório Descritivo CEO', 'Relatório Descritivo CEO', NULL, '../pmaq_relatorio_ceo/relatorio/recuperarsessao/token:', 8, 3, '2005-05-16', NULL, 48, 2, 8, NULL, NULL, NULL, NULL, 'fa fa-line-chart', 'S'),
(89, 'Relatório Analítico', 'Relatório Analítico', NULL, 'login/acessolinkexterno/b2tDRHJtMDljUkNueVBxSW1YTG1QUEFUem9ScURxMVdpcUxRWlBhZHRHNGF5V1BLSmozWFNZVXNsVEo4NTdCbGJCU3krbXRwYWxQd0c3QXdWV21qYmc9PQ__/', 87, 1, '2008-12-15', NULL, 48, 2, 29, NULL, NULL, NULL, NULL, 'fa fa-line-chart', 'S'),
(90, 'Relatório Descritivo', 'Relatório Descritivo', NULL, '../pmaq_relatorio/relatorio/recuperarsessao/token:', 87, 2, '2008-12-15', NULL, 48, 2, 29, NULL, NULL, NULL, NULL, 'fa fa-line-chart', 'S'),
(91, 'Perfil de Acesso', 'Perfil de Acesso', NULL, 'login/perfil', NULL, 3, '2008-12-15', NULL, 48, 2, 29, NULL, NULL, NULL, NULL, 'fa fa-gear', 'S'),
(92, 'Certificação', 'Certificação de equipes participantes do PMAQ', NULL, 'sistema/certificacao', NULL, 2, '2008-12-15', NULL, 48, 2, 47, NULL, NULL, NULL, NULL, 'fa fa-certificate', 'S'),
(93, 'Inicial', 'Painel Inicial do PMAQ', NULL, 'sistema', NULL, 1, '2008-12-15', NULL, 48, 2, 47, NULL, NULL, NULL, NULL, 'fa fa-link', 'S'),
(94, 'Relatório Analítico', 'Relatório Analítico', NULL, 'login/acessolinkexterno/b2tDRHJtMDljUkNueVBxSW1YTG1QUEFUem9ScURxMVdpcUxRWlBhZHRHNGF5V1BLSmozWFNZVXNsVEo4NTdCbGJCU3krbXRwYWxQd0c3QXdWV21qYmc9PQ__/', 92, 1, '2008-12-15', NULL, 48, 2, 47, NULL, NULL, NULL, NULL, 'fa fa-line-chart', 'S'),
(95, 'Relatório Descritivo', 'Relatório Descritivo', NULL, '../pmaq_relatorio/relatorio/recuperarsessao/token:', 92, 2, '2008-12-15', NULL, 48, 2, 47, NULL, NULL, NULL, NULL, 'fa fa-line-chart', 'S'),
(96, 'Perfil de Acesso', 'Perfil de Acesso', NULL, 'login/perfil', NULL, 3, '2008-12-15', NULL, 48, 2, 47, NULL, NULL, NULL, NULL, 'fa fa-gear', 'S'),
(97, 'Desenvolvimento', 'Desenvolvimento de equipes participantes do PMAQ', NULL, 'sistema/desenvolvimento', NULL, 3, '2008-12-15', NULL, 48, 2, 46, NULL, NULL, NULL, NULL, 'fa fa-pencil', 'S'),
(98, 'AMAQ', 'Autoavaliação para Melhoria do Acesso e Qualidade da Atenção Básica', NULL, 'sistema/desenvolvimento', 97, 1, '2008-12-15', NULL, 48, 2, 46, NULL, NULL, NULL, NULL, 'fa fa-check-square-o', 'S'),
(99, 'Desenvolvimento', 'Desenvolvimento de equipes participantes do PMAQ', NULL, 'sistema/desenvolvimento', NULL, 3, '2008-12-15', NULL, 48, 2, 29, NULL, NULL, NULL, NULL, 'fa fa-pencil', 'S'),
(100, 'AMAQ', 'Autoavaliação para Melhoria do Acesso e Qualidade da Atenção Básica', NULL, 'sistema/desenvolvimento', 99, 1, '2008-12-15', NULL, 48, 2, 29, NULL, NULL, NULL, NULL, 'fa fa-check-square-o', 'S'),
(101, 'Desenvolvimento', 'Desenvolvimento de equipes participantes do PMAQ', NULL, 'sistema/desenvolvimento', NULL, 3, '2008-12-15', NULL, 48, 2, 47, NULL, NULL, NULL, NULL, 'fa fa-pencil', 'S'),
(102, 'AMAQ', 'Autoavaliação para Melhoria do Acesso e Qualidade da Atenção Básica', NULL, 'sistema/desenvolvimento', 101, 1, '2008-12-15', NULL, 48, 2, 47, NULL, NULL, NULL, NULL, 'fa fa-check-square-o', 'S'),
(103, 'Certificação', 'Certificação de equipes participantes do PMAQ', NULL, 'sistema/certificacao', NULL, 3, '2008-12-15', NULL, 48, 2, 71, NULL, NULL, NULL, NULL, 'fa fa-certificate', 'S'),
(104, 'Relatório Analítico', 'Relatório Analítico', NULL, 'login/acessolinkexterno/b2tDRHJtMDljUkNueVBxSW1YTG1QUEFUem9ScURxMVdpcUxRWlBhZHRHNGF5V1BLSmozWFNZVXNsVEo4NTdCbGJCU3krbXRwYWxQd0c3QXdWV21qYmc9PQ__/', 103, 1, '2008-12-15', NULL, 48, 2, 71, NULL, NULL, NULL, NULL, 'fa fa-line-chart', 'S'),
(105, 'Relatório Descritivo', 'Relatório Descritivo', NULL, '../pmaq_relatorio/relatorio/recuperarsessao/token:', 103, 2, '2008-12-15', NULL, 48, 2, 71, NULL, NULL, NULL, NULL, 'fa fa-line-chart', 'S'),
(106, 'Inicial', 'Painel Inicial do PMAQ', NULL, 'sistema', NULL, 1, '2008-12-15', NULL, 48, 2, 58, NULL, NULL, NULL, NULL, 'fa fa-link', 'S'),
(107, 'Perfil de Acesso', 'Perfil de Acesso', NULL, 'login/perfil', NULL, 3, '2008-12-15', NULL, 48, 2, 58, NULL, NULL, NULL, NULL, 'fa fa-gear', 'S'),
(108, 'Certificação', 'Certificação de equipes participantes do PMAQ', NULL, 'sistema/certificacao', NULL, 2, '2008-12-15', NULL, 48, 2, 58, NULL, NULL, NULL, NULL, 'fa fa-certificate', 'S'),
(109, 'Relatório Descritivo', 'Relatório Descritivo', NULL, '../pmaq_relatorio/relatorio/recuperarsessao/token:', 108, 1, '2008-12-15', NULL, 48, 2, 58, NULL, NULL, NULL, NULL, 'fa fa-line-chart', 'S'),
(110, 'Inicial', 'Painel Inicial do PMAQ', NULL, 'sistema', NULL, 1, '2008-12-15', NULL, 48, 2, 70, NULL, NULL, NULL, NULL, 'fa fa-link', 'S'),
(111, 'Perfil de Acesso', 'Perfil de Acesso', NULL, 'login/perfil', NULL, 3, '2008-12-15', NULL, 48, 2, 70, NULL, NULL, NULL, NULL, 'fa fa-gear', 'S'),
(112, 'Certificação', 'Certificação de equipes participantes do PMAQ', NULL, 'sistema/certificacao', NULL, 2, '2008-12-15', NULL, 48, 2, 70, NULL, NULL, NULL, NULL, 'fa fa-certificate', 'S'),
(113, 'Relatório Descritivo', 'Relatório Descritivo', NULL, '../pmaq_relatorio/relatorio/recuperarsessao/token:', 108, 1, '2008-12-15', NULL, 48, 2, 70, NULL, NULL, NULL, NULL, 'fa fa-line-chart', 'S'),
(114, 'Certificação', 'Certificação de equipes participantes do PMAQ', NULL, 'sistema/certificacao', NULL, 2, '2008-12-15', NULL, 48, 2, 14, NULL, NULL, NULL, NULL, 'fa fa-certificate', 'S'),
(115, 'Inicial', 'Painel Inicial do PMAQ', NULL, 'sistema', NULL, 1, '2008-12-15', NULL, 48, 2, 14, NULL, NULL, NULL, NULL, 'fa fa-link', 'S'),
(116, 'Relatório Analítico', 'Relatório Analítico', NULL, 'login/acessolinkexterno/b2tDRHJtMDljUkNueVBxSW1YTG1QUEFUem9ScURxMVdpcUxRWlBhZHRHNGF5V1BLSmozWFNZVXNsVEo4NTdCbGJCU3krbXRwYWxQd0c3QXdWV21qYmc9PQ__/', 114, 1, '2008-12-15', NULL, 48, 2, 14, NULL, NULL, NULL, NULL, 'fa fa-line-chart', 'S'),
(117, 'Relatório Descritivo', 'Relatório Descritivo', NULL, '../pmaq_relatorio/relatorio/recuperarsessao/token:', 114, 2, '2008-12-15', NULL, 48, 2, 14, NULL, NULL, NULL, NULL, 'fa fa-line-chart', 'S'),
(118, 'Perfil de Acesso', 'Perfil de Acesso', NULL, 'login/perfil', NULL, 4, '2008-12-15', NULL, 48, 2, 14, NULL, NULL, NULL, NULL, 'fa fa-gear', 'S'),
(119, 'Desenvolvimento', 'Desenvolvimento de equipes participantes do PMAQ', NULL, 'sistema/desenvolvimento', NULL, 3, '2008-12-15', NULL, 48, 2, 14, NULL, NULL, NULL, NULL, 'fa fa-pencil', 'S'),
(120, 'AMAQ', 'Autoavaliação para Melhoria do Acesso e Qualidade da Atenção Básica', NULL, 'sistema/desenvolvimento', 119, 1, '2008-12-15', NULL, 48, 2, 14, NULL, NULL, NULL, NULL, 'fa fa-check-square-o', 'S'),
(8, 'Certificação', 'Certificação de equipes participantes do PMAQ', NULL, 'sistema/certificacao', NULL, 3, '2029-09-15', NULL, 48, 2, 8, NULL, NULL, NULL, NULL, 'fa fa-certificate', 'S'),
(9, 'Desenvolvimento', 'Desenvolvimento de equipes participantes do PMAQ', NULL, 'sistema/desenvolvimento', NULL, 4, '2029-09-15', NULL, 48, 2, 8, NULL, NULL, NULL, NULL, 'fa fa-pencil', 'S'),
(10, 'Relatório Analítico', 'Relatório Analítico', NULL, 'login/acessolinkexterno/b2tDRHJtMDljUkNueVBxSW1YTG1QUEFUem9ScURxMVdpcUxRWlBhZHRHNGF5V1BLSmozWFNZVXNsVEo4NTdCbGJCU3krbXRwYWxQd0c3QXdWV21qYmc9PQ__/', 8, 1, '2029-09-15', NULL, 48, 2, 8, NULL, NULL, NULL, NULL, 'fa fa-line-chart', 'S'),
(11, 'Relatório Descritivo', 'Relatório Descritivo', NULL, '../pmaq_relatorio/relatorio/recuperarsessao/token:', 8, 2, '2029-09-15', NULL, 48, 2, 8, NULL, NULL, NULL, NULL, 'fa fa-line-chart', 'S'),
(15, 'CEO', 'Adesão de equipes de CEO', NULL, 'adesaoceo', 2, 3, '2023-10-15', NULL, 48, 2, 8, NULL, NULL, NULL, NULL, 'fa fa-thumbs-o-up', 'S'),
(16, 'Microdados', 'Microdados', NULL, 'sistema/microdados', 8, 3, '2023-10-15', NULL, 48, 2, 8, NULL, NULL, NULL, NULL, 'fa fa-database', 'S'),
(17, 'Inicial', 'Painel Inicial do PMAQ', NULL, 'sistema', NULL, 1, '2023-10-15', NULL, 48, 2, 4, NULL, NULL, NULL, NULL, 'fa fa-link', 'S'),
(18, 'Adesão', 'Adesão do PMAQ', NULL, 'sistema/adesao', NULL, 2, '2023-10-15', NULL, 48, 2, 4, NULL, NULL, NULL, NULL, 'fa fa-thumbs-o-up', 'S'),
(19, 'CEO', 'Adesão de equipes de CEO', NULL, 'adesaoceo', 18, 1, '2023-10-15', NULL, 48, 2, 4, NULL, NULL, NULL, NULL, 'fa fa-thumbs-o-up', 'S'),
(20, 'Perfil de Acesso', 'Perfil de Acesso', NULL, 'login/perfil', NULL, 3, '2023-10-15', NULL, 48, 2, 4, NULL, NULL, NULL, NULL, 'fa fa-gear', 'S'),
(21, 'Inicial', 'Painel Inicial do PMAQ', NULL, 'sistema', NULL, 1, '2023-10-15', NULL, 48, 2, 71, NULL, NULL, NULL, NULL, 'fa fa-link', 'S'),
(22, 'Adesão', 'Adesão do PMAQ', NULL, 'sistema/adesao', NULL, 2, '2023-10-15', NULL, 48, 2, 71, NULL, NULL, NULL, NULL, 'fa fa-thumbs-o-up', 'S'),
(23, 'CEO', 'Adesão de equipes de CEO', NULL, 'adesaoceo', 22, 1, '2023-10-15', NULL, 48, 2, 71, NULL, NULL, NULL, NULL, 'fa fa-thumbs-o-up', 'S'),
(24, 'Perfil de Acesso', 'Perfil de Acesso', NULL, 'login/perfil', NULL, 3, '2023-10-15', NULL, 48, 2, 71, NULL, NULL, NULL, NULL, 'fa fa-gear', 'S'),
(121, 'Inicial', 'Painel Inicial do PMAQ', NULL, 'sistema', NULL, 1, '2015-12-15', NULL, 48, 2, 72, NULL, NULL, NULL, NULL, 'fa fa-link', 'S'),
(122, 'Certificação', 'Certificação de equipes participantes do PMAQ', NULL, 'sistema/certificacao', NULL, 2, '2015-12-15', NULL, 48, 2, 72, NULL, NULL, NULL, NULL, 'fa fa-certificate', 'S'),
(123, 'Relatório Descritivo', 'Relatório Descritivo', NULL, '../pmaq_relatorio/relatorio/recuperarsessao/token:', 122, 1, '2015-12-15', NULL, 48, 2, 72, NULL, NULL, NULL, NULL, 'fa fa-line-chart', 'S'),
(124, 'Perfil de Acesso', 'Perfil de Acesso', NULL, 'login/perfil', NULL, 3, '2015-12-15', NULL, 48, 2, 72, NULL, NULL, NULL, NULL, 'fa fa-gear', 'S'),
(125, 'Inicial', 'Painel Inicial do PMAQ', NULL, 'sistema', NULL, 1, '2015-12-15', NULL, 48, 2, 66, NULL, NULL, NULL, NULL, 'fa fa-link', 'S'),
(126, 'Certificação', 'Certificação de equipes participantes do PMAQ', NULL, 'sistema/certificacao', NULL, 2, '2015-12-15', NULL, 48, 2, 66, NULL, NULL, NULL, NULL, 'fa fa-certificate', 'S'),
(127, 'Relatório Descritivo', 'Relatório Descritivo', NULL, '../pmaq_relatorio/relatorio/recuperarsessao/token:', 126, 1, '2015-12-15', NULL, 48, 2, 66, NULL, NULL, NULL, NULL, 'fa fa-line-chart', 'S'),
(128, 'Perfil de Acesso', 'Perfil de Acesso', NULL, 'login/perfil', NULL, 3, '2015-12-15', NULL, 48, 2, 66, NULL, NULL, NULL, NULL, 'fa fa-gear', 'S'),
(129, 'Processamento/Validação', 'Relatótios de processamento/validação da fichas enviadas a base federal do eSUSAB', NULL, '#', NULL, 4, '2028-01-16', NULL, 73, NULL, 2, NULL, NULL, NULL, NULL, 'fa   fa-database', 'S'),
(130, 'Dados Recebidos', 'Relatótios de fichas processadas na base federal do eSUSAB', NULL, 'paginas/acessoRestrito/relatorio/federal/processadoValidado/RelFedProValFichaProcessada.xhtml', 129, 1, '2028-01-16', NULL, 73, NULL, 2, NULL, NULL, NULL, NULL, 'fa   fa-database', 'S'),
(131, 'Fichas Processadas', 'Relatótios de fichas validadas no eSUSAB.', NULL, 'paginas/acessoRestrito/relatorio/federal/processadoValidado/RelFedProValFichaValidada.xhtml', 129, 2, '2028-01-16', NULL, 73, NULL, 2, NULL, NULL, NULL, NULL, 'fa   fa-database', 'S'),
(132, 'Fichas Válidas', 'Relatótios de fichas validadas com sucesso (detalhamento)', NULL, 'paginas/acessoRestrito/relatorio/federal/processadoValidado/RelFedProValFichaFaseValidada.xhtml', 129, 3, '2028-01-16', NULL, 73, NULL, 2, NULL, NULL, NULL, NULL, 'fa   fa-database', 'S'),
(133, 'Processamento/Validação', 'Relatótios de processamento/validação da fichas enviadas a base federal do eSUSAB', NULL, '#', NULL, 4, '2028-01-16', NULL, 73, NULL, 4, NULL, NULL, NULL, NULL, 'fa   fa-database', 'S'),
(134, 'Dados Recebidos', 'Relatótios de fichas processadas na base federal do eSUSAB', NULL, 'paginas/acessoRestrito/relatorio/estado/processadoValidado/RelEstProValFichaProcessada.xhtml', 133, 1, '2028-01-16', NULL, 73, NULL, 4, NULL, NULL, NULL, NULL, 'fa   fa-database', 'S'),
(135, 'Fichas Processadas', 'Relatótios de fichas validadas no eSUSAB.', NULL, 'paginas/acessoRestrito/relatorio/estado/processadoValidado/RelEstProValFichaValidada.xhtml', 133, 2, '2028-01-16', NULL, 73, NULL, 4, NULL, NULL, NULL, NULL, 'fa   fa-database', 'S'),
(136, 'Fichas Válidas', 'Relatótios de fichas validadas com sucesso (detalhamento)', NULL, 'paginas/acessoRestrito/relatorio/estado/processadoValidado/RelEstProValFichaFaseValidada.xhtml', 133, 3, '2028-01-16', NULL, 73, NULL, 4, NULL, NULL, NULL, NULL, 'fa   fa-database', 'S'),
(137, 'Processamento/Validação', 'Relatótios de processamento/validação da fichas enviadas a base federal do eSUSAB', NULL, '#', NULL, 4, '2028-01-16', NULL, 73, NULL, 8, NULL, NULL, NULL, NULL, 'fa   fa-database', 'S'),
(138, 'Dados Recebidos', 'Relatótios de fichas processadas na base federal do eSUSAB', NULL, 'paginas/acessoRestrito/relatorio/municipio/processadoValidado/RelMunProValFichaProcessada.xhtml', 137, 1, '2028-01-16', NULL, 73, NULL, 8, NULL, NULL, NULL, NULL, 'fa   fa-database', 'S'),
(139, 'Fichas Processadas', 'Relatótios de fichas validadas no eSUSAB.', NULL, 'paginas/acessoRestrito/relatorio/municipio/processadoValidado/RelMunProValFichaValidada.xhtml', 137, 2, '2028-01-16', NULL, 73, NULL, 8, NULL, NULL, NULL, NULL, 'fa   fa-database', 'S'),
(140, 'Fichas Válidas', 'Relatótios de fichas validadas com sucesso (detalhamento)', NULL, 'paginas/acessoRestrito/relatorio/municipio/processadoValidado/RelMunProValFichaFaseValidada.xhtml', 137, 3, '2028-01-16', NULL, 73, NULL, 8, NULL, NULL, NULL, NULL, 'fa   fa-database', 'S'),
(143, 'Desenvolvimento', 'Desenvolvimento de equipes participantes do PMAQ', NULL, 'sistema/desenvolvimento', NULL, 1, '2029-02-16', NULL, 48, 2, 48, NULL, NULL, NULL, NULL, 'fa fa-pencil', 'S'),
(144, 'AMAQ', 'Autoavaliação para Melhoria do Acesso e Qualidade da Atenção Básica', NULL, 'sistema/desenvolvimento', 143, 1, '2029-02-16', NULL, 48, 2, 48, NULL, NULL, NULL, NULL, 'fa fa-check-square-o', 'S'),
(164, 'Inicial', 'Painel Inicial do PSE', NULL, 'sistema', NULL, 1, '2023-06-16', NULL, 74, 28, 8, NULL, NULL, NULL, NULL, 'fa fa-link', 'S'),
(165, 'Adesão', 'Adesão do PSE', NULL, 'adesao', NULL, 2, '2023-06-16', NULL, 74, 28, 8, NULL, NULL, NULL, NULL, 'fa fa-thumbs-o-up', 'S'),
(166, 'Representantes', 'Cadastro de Representantes', NULL, 'representante', NULL, 3, '2023-06-16', NULL, 74, 28, 8, NULL, NULL, NULL, NULL, 'fa fa-users', 'S'),
(167, 'Consultas', 'Consultas do PSE', NULL, 'consulta', NULL, 4, '2023-06-16', NULL, 74, 28, 8, NULL, NULL, NULL, NULL, 'fa fa-file-excel-o', 'S'),
(168, 'Documentos', 'Documentos do PSE', NULL, 'documento', NULL, 5, '2023-06-16', NULL, 74, 28, 8, NULL, NULL, NULL, NULL, 'fa fa-folder-open', 'S'),
(169, 'Escolas', 'Consulta por Escolas', NULL, 'consulta/escolas', 167, 1, '2023-06-16', NULL, 74, 28, 8, NULL, NULL, NULL, NULL, 'fa fa-file-excel-o', 'S'),
(170, 'Equipes', 'Consulta por Equipes', NULL, 'consulta/equipes', 167, 2, '2023-06-16', NULL, 74, 28, 8, NULL, NULL, NULL, NULL, 'fa fa-file-excel-o', 'S'),
(171, 'Perfil de Acesso', 'Perfil de Acesso', NULL, 'paginas/acessoRestrito/perfilAcesso.xhtml', NULL, 1, '2003-10-16', NULL, 77, NULL, 75, NULL, NULL, NULL, NULL, 'fa fa-user', 'S'),
(174, 'Certificação', 'Certificação de equipes participantes do PMAQ', NULL, 'sistema/certificacao', NULL, 2, '2003-11-16', NULL, 48, 2, 48, NULL, NULL, NULL, NULL, 'fa fa-certificate', 'S'),
(175, 'Relatório Descritivo CEO', 'Relatório Descritivo CEO', NULL, '../pmaq_relatorio_ceo/relatorio/recuperarsessao/token:', 174, 1, '2003-11-16', NULL, 48, 2, 48, NULL, NULL, NULL, NULL, 'fa fa-line-chart', 'S'),
(1, 'Inicial', 'Painel Inicial do PMAQ', NULL, 'sistema', NULL, 1, '2010-09-15', NULL, 48, 2, 8, NULL, NULL, NULL, NULL, 'fa fa-link', 'S'),
(2, 'Adesão', 'Adesão do PMAQ', NULL, 'sistema/adesao', NULL, 2, '2010-09-15', NULL, 48, 2, 8, NULL, NULL, NULL, NULL, 'fa fa-thumbs-o-up', 'S'),
(3, 'AB/SB', 'Adesão de equipes de Atenção Básica e Saúde Bucal', NULL, 'adesaoab', 2, 1, '2010-09-15', NULL, 48, 2, 8, NULL, NULL, NULL, NULL, 'fa fa-thumbs-o-up', 'S'),
(4, 'NASF', 'Adesão de equipes de NASF', NULL, 'adesaonasf', 2, 2, '2010-09-15', NULL, 48, 2, 8, NULL, NULL, NULL, NULL, 'fa fa-thumbs-o-up', 'S'),
(25, 'Envio', 'Relatótios de envio de dados do eSUSAB', NULL, '#', NULL, 1, '2003-12-15', NULL, 73, NULL, 2, NULL, NULL, NULL, NULL, 'fa  fa-thumbs-o-up', 'S'),
(26, 'Equipe', 'Relatótios de envio por equipe', NULL, 'paginas/acessoRestrito/relatorio/federal/envio/RelFedEnvCompEquipe.xhtml', 25, 1, '2003-12-15', NULL, 73, NULL, 2, NULL, NULL, NULL, NULL, 'fa fa-check-square-o', 'S'),
(27, 'UBS', 'Relatótios de envio por UBS', NULL, 'paginas/acessoRestrito/relatorio/federal/envio/RelFedEnvCompUbs.xhtml', 25, 2, '2003-12-15', NULL, 73, NULL, 2, NULL, NULL, NULL, NULL, 'fa fa-check-square-o', 'N'),
(28, 'Produção Enviada', 'Relatótios de envio por produção', NULL, 'paginas/acessoRestrito/relatorio/federal/envio/RelFedEnvCompProdEnviada.xhtml', 25, 3, '2003-12-15', NULL, 73, NULL, 2, NULL, NULL, NULL, NULL, 'fa fa-check-square-o', 'S'),
(29, 'Aplicação utilizada por UBS', 'Relatótios de envio por aplicação utilizada', NULL, 'paginas/acessoRestrito/relatorio/federal/envio/RelFedEnvCompAppUtilUbs.xhtml', 25, 4, '2003-12-15', NULL, 73, NULL, 2, NULL, NULL, NULL, NULL, 'fa fa-check-square-o', 'S'),
(30, 'Saúde', 'Relatótios de dados da saúde do eSUSAB', NULL, '#', NULL, 2, '2003-12-15', NULL, 73, NULL, 2, NULL, NULL, NULL, NULL, 'fa fa-heartbeat', 'S'),
(31, 'Cadastro', 'Relatórios de cadastro', NULL, 'paginas/acessoRestrito/relatorio/federal/saude/RelFedSauCadastro.xhtml', 30, 1, '2003-12-15', NULL, 73, NULL, 2, NULL, NULL, NULL, NULL, 'fa fa-check-square-o', 'N'),
(32, 'Produção', 'Relatórios de produção de dados saúde do eSUSAB', NULL, 'paginas/acessoRestrito/relatorio/federal/saude/RelSauProducao.xhtml', 30, 2, '2003-12-15', NULL, 73, NULL, 2, NULL, NULL, NULL, NULL, 'fa fa-check-square-o', 'S'),
(33, 'Atividade Coletiva', 'Relatórios de produção das atividades coletivas eSUSAB', NULL, 'paginas/acessoRestrito/relatorio/federal/saude/RelFedSauAtivColetiva.xhtml', 30, 3, '2003-12-15', NULL, 73, NULL, 2, NULL, NULL, NULL, NULL, 'fa fa-check-square-o', 'S'),
(34, 'Atenção domiciliar', 'Relatórios de produção da atenção domiciliar do eSUSAB', NULL, 'paginas/acessoRestrito/relatorio/federal/saude/RelFedSauAtenDomiciliar.xhtml', 30, 4, '2003-12-15', NULL, 73, NULL, 2, NULL, NULL, NULL, NULL, 'fa fa-check-square-o', 'N'),
(35, 'Indicadores', 'Relatótios de indicadores da saúde do eSUSAB', NULL, '#', NULL, 3, '2003-12-15', NULL, 73, NULL, 2, NULL, NULL, NULL, NULL, 'fa fa-line-chart', 'N'),
(36, 'Indicadores AB', 'Relatótios de indicadores dos dados da saúde do eSUSAB', NULL, 'paginas/acessoRestrito/relatorio/federal/indicadores/RelFedIndicadores.xhtml', 35, 1, '2003-12-15', NULL, 73, NULL, 2, NULL, NULL, NULL, NULL, 'fa fa-check-square-o', 'N'),
(37, 'Envio', 'Relatótios de envio de dados do eSUSAB', NULL, '#', NULL, 1, '2003-12-15', NULL, 73, NULL, 4, NULL, NULL, NULL, NULL, 'fa  fa-thumbs-o-up', 'S'),
(38, 'Equipe', 'Relatótios de envio por equipe', NULL, 'paginas/acessoRestrito/relatorio/estado/envio/RelEstEnvCompEquipe.xhtml', 37, 1, '2003-12-15', NULL, 73, NULL, 4, NULL, NULL, NULL, NULL, 'fa fa-check-square-o', 'S'),
(39, 'UBS', 'Relatótios de envio por UBS', NULL, 'paginas/acessoRestrito/relatorio/estado/envio/RelEstEnvCompUbs.xhtml', 37, 2, '2003-12-15', NULL, 73, NULL, 4, NULL, NULL, NULL, NULL, 'fa fa-check-square-o', 'N'),
(40, 'Produção Enviada', 'Relatótios de envio por produção', NULL, 'paginas/acessoRestrito/relatorio/estado/envio/RelEstEnvCompProdEnviada.xhtml', 37, 3, '2003-12-15', NULL, 73, NULL, 4, NULL, NULL, NULL, NULL, 'fa fa-check-square-o', 'S'),
(41, 'Aplicação utilizada por UBS', 'Relatótios de envio por aplicação utilizada', NULL, 'paginas/acessoRestrito/relatorio/estado/envio/RelEstEnvCompAppUtilUbs.xhtml', 37, 4, '2003-12-15', NULL, 73, NULL, 4, NULL, NULL, NULL, NULL, 'fa fa-check-square-o', 'S'),
(42, 'Saúde', 'Relatótios de dados da saúde do eSUSAB', NULL, '#', NULL, 2, '2003-12-15', NULL, 73, NULL, 4, NULL, NULL, NULL, NULL, 'fa fa-heartbeat', 'S'),
(43, 'Cadastro', 'Relatórios de cadastro', NULL, 'paginas/acessoRestrito/relatorio/estado/saude/RelEstSauCadastro.xhtml', 42, 1, '2003-12-15', NULL, 73, NULL, 4, NULL, NULL, NULL, NULL, 'fa fa-check-square-o', 'N'),
(44, 'Produção', 'Relatórios de produção de dados saúde do eSUSAB', NULL, 'paginas/acessoRestrito/relatorio/estado/saude/RelSauProducao.xhtml', 42, 2, '2003-12-15', NULL, 73, NULL, 4, NULL, NULL, NULL, NULL, 'fa fa-check-square-o', 'S'),
(45, 'Atividade Coletiva', 'Relatórios de produção das atividades coletivas eSUSAB', NULL, 'paginas/acessoRestrito/relatorio/estado/saude/RelEstSauAtivColetiva.xhtml', 42, 3, '2003-12-15', NULL, 73, NULL, 4, NULL, NULL, NULL, NULL, 'fa fa-check-square-o', 'S'),
(46, 'Atenção domiciliar', 'Relatórios de produção da atenção domiciliar do eSUSAB', NULL, 'paginas/acessoRestrito/relatorio/estado/saude/RelEstSauAtenDomiciliar.xhtml', 42, 4, '2003-12-15', NULL, 73, NULL, 4, NULL, NULL, NULL, NULL, 'fa fa-check-square-o', 'N'),
(47, 'Indicadores', 'Relatótios de indicadores da saúde do eSUSAB', NULL, '#', NULL, 3, '2003-12-15', NULL, 73, NULL, 2, NULL, NULL, NULL, NULL, 'fa fa-line-chart', 'N'),
(48, 'Indicadores AB', 'Relatótios de indicadores dos dados da saúde do eSUSAB', NULL, 'paginas/acessoRestrito/relatorio/estado/indicadores/RelEstIndicadores.xhtml', 47, 1, '2003-12-15', NULL, 73, NULL, 4, NULL, NULL, NULL, NULL, 'fa fa-check-square-o', 'N'),
(49, 'Envio', 'Relatótios de envio de dados do eSUSAB', NULL, '#', NULL, 1, '2003-12-15', NULL, 73, NULL, 8, NULL, NULL, NULL, NULL, 'fa  fa-thumbs-o-up', 'S'),
(50, 'Equipe', 'Relatótios de envio por equipe', NULL, 'paginas/acessoRestrito/relatorio/municipio/envio/RelMunEnvCompEquipe.xhtml', 49, 1, '2003-12-15', NULL, 73, NULL, 8, NULL, NULL, NULL, NULL, 'fa fa-check-square-o', 'S'),
(51, 'UBS', 'Relatótios de envio por UBS', NULL, 'paginas/acessoRestrito/relatorio/municipio/envio/RelMunEnvCompUbs.xhtml', 49, 2, '2003-12-15', NULL, 73, NULL, 8, NULL, NULL, NULL, NULL, 'fa fa-check-square-o', 'N'),
(52, 'Produção Enviada', 'Relatótios de envio por produção', NULL, 'paginas/acessoRestrito/relatorio/municipio/envio/RelMunEnvCompProdEnviada.xhtml', 49, 3, '2003-12-15', NULL, 73, NULL, 8, NULL, NULL, NULL, NULL, 'fa fa-check-square-o', 'S'),
(53, 'Aplicação utilizada por UBS', 'Relatótios de envio por aplicação utilizada', NULL, 'paginas/acessoRestrito/relatorio/municipio/envio/RelMunEnvCompAppUtilUbs.xhtml', 49, 4, '2003-12-15', NULL, 73, NULL, 8, NULL, NULL, NULL, NULL, 'fa fa-check-square-o', 'S'),
(54, 'Saúde', 'Relatótios de dados da saúde do eSUSAB', NULL, '#', NULL, 2, '2003-12-15', NULL, 73, NULL, 8, NULL, NULL, NULL, NULL, 'fa fa-heartbeat', 'S'),
(55, 'Cadastro', 'Relatórios de cadastro', NULL, 'paginas/acessoRestrito/relatorio/municipio/saude/RelMunSauCadastro.xhtml', 54, 1, '2003-12-15', NULL, 73, NULL, 8, NULL, NULL, NULL, NULL, 'fa fa-check-square-o', 'N'),
(56, 'Produção', 'Relatórios de produção de dados saúde do eSUSAB', NULL, 'paginas/acessoRestrito/relatorio/municipio/saude/RelSauProducao.xhtml', 54, 2, '2003-12-15', NULL, 73, NULL, 8, NULL, NULL, NULL, NULL, 'fa fa-check-square-o', 'S'),
(57, 'Atividade Coletiva', 'Relatórios de produção das atividades coletivas eSUSAB', NULL, 'paginas/acessoRestrito/relatorio/municipio/saude/RelMunSauAtivColetiva.xhtml', 54, 3, '2003-12-15', NULL, 73, NULL, 8, NULL, NULL, NULL, NULL, 'fa fa-check-square-o', 'S'),
(58, 'Atenção domiciliar', 'Relatórios de produção da atenção domiciliar do eSUSAB', NULL, 'paginas/acessoRestrito/relatorio/municipio/saude/RelMunSauAtenDomiciliar.xhtml', 54, 4, '2003-12-15', NULL, 73, NULL, 8, NULL, NULL, NULL, NULL, 'fa fa-check-square-o', 'N'),
(59, 'Indicadores', 'Relatótios de indicadores da saúde do eSUSAB', NULL, '#', NULL, 3, '2003-12-15', NULL, 73, NULL, 8, NULL, NULL, NULL, NULL, 'fa fa-line-chart', 'N'),
(60, 'Indicadores AB', 'Relatótios de indicadores dos dados da saúde do eSUSAB', NULL, 'paginas/acessoRestrito/relatorio/municipio/indicadores/RelMunIndicadores.xhtml', 59, 1, '2003-12-15', NULL, 73, NULL, 8, NULL, NULL, NULL, NULL, 'fa fa-check-square-o', 'N'),
(141, 'Envio', 'Relatótios de envio de dados do eSUSAB', NULL, '#', NULL, 2, '2029-01-16', NULL, 73, NULL, 75, NULL, NULL, NULL, NULL, 'fa  fa-thumbs-o-up', 'N'),
(142, 'Status de Envio', 'Relatórios do status de envio de dados por equipe no eSUSAB', NULL, 'paginas/acessoPublico/relatorio/envio/RelPubEnvStatusEnvio.xhtml', 141, 4, '2029-01-16', NULL, 73, NULL, 75, NULL, NULL, NULL, NULL, 'fa fa-check-square-o', 'N'),
(152, 'Desenvolvimento', 'Desenvolvimento de equipes participantes do PMAQ', NULL, 'sistema/desenvolvimento', NULL, 1, '2029-02-16', NULL, 48, 2, 78, NULL, NULL, NULL, NULL, 'fa fa-pencil', 'S'),
(153, 'AMAQ', 'Autoavaliação para Melhoria do Acesso e Qualidade da Atenção Básica', NULL, 'sistema/desenvolvimento', 152, 1, '2029-02-16', NULL, 48, 2, 78, NULL, NULL, NULL, NULL, 'fa fa-check-square-o', 'S'),
(163, 'Relatório Descritivo CEO', 'Relatório Descritivo CEO', NULL, '../pmaq_relatorio_ceo/relatorio/recuperarsessao/token:', 78, 2, '2003-06-16', NULL, 48, 2, 4, NULL, NULL, NULL, NULL, 'fa fa-line-chart', 'S'),
(13, 'AMAQ', 'Autoavaliação para Melhoria do Acesso e Qualidade da Atenção Básica', NULL, 'sistema/desenvolvimento', 9, 1, '2029-09-15', '2015-10-15', 48, 2, 8, NULL, NULL, NULL, NULL, 'fa fa-check-square-o', 'S'),
(14, 'Perfil de Acesso', 'Perfil de Acesso', NULL, 'login/perfil', NULL, 5, '2015-10-15', NULL, 48, 2, 8, NULL, NULL, NULL, NULL, 'fa fa-gear', 'S'),
(145, 'Processamento', 'Rotinas que realizam processamento de dados do eSUSAB/SISAB', NULL, '#', NULL, 1, '2009-03-16', NULL, 73, NULL, 1, NULL, NULL, NULL, NULL, 'fa   fa-database', 'S'),
(146, 'Monitoramento', 'Monitoramento dos dados do eSUSAB/SISAB', NULL, '#', NULL, 2, '2009-03-16', NULL, 73, NULL, 1, NULL, NULL, NULL, NULL, 'fa fa-bar-chart-o', 'S'),
(147, 'Consulta', 'Consultas dos dados do eSUSAB/SISAB', NULL, '#', NULL, 3, '2009-03-16', NULL, 73, NULL, 1, NULL, NULL, NULL, NULL, 'fa  fa-thumbs-o-up', 'S'),
(148, 'Validação', 'Monitorar e Iniciar o processo de validação dos dados da base eSUSAB', NULL, 'paginas/acessoRestrito/relatorio/admin/validacaoProcessamento/MonitorarValidacaoFicha.xhtml', 145, 1, '2009-03-16', NULL, 73, NULL, 1, NULL, NULL, NULL, NULL, 'fa   fa-database', 'S'),
(149, 'Carga Relatórios', 'Carga de relatorios do SISAB', NULL, 'paginas/acessoRestrito/relatorio/admin/carga/CargaRelatorio.xhtml', 145, 2, '2009-03-16', NULL, 73, NULL, 1, NULL, NULL, NULL, NULL, 'fa   fa-database', 'S'),
(150, 'Base Federal', 'Monitorar processamento na Base Federal', NULL, 'paginas/acessoRestrito/relatorio/admin/validacaoProcessamento/MonitorarRecebProcesFicha.xhtml', 146, 1, '2009-03-16', NULL, 73, NULL, 1, NULL, NULL, NULL, NULL, 'fa fa-bar-chart-o', 'S'),
(151, 'CNS', 'Realizar consultas de CNS por individuo', NULL, 'paginas/acessoRestrito/relatorio/admin/validacaoCns/consultarCNS.xhtml', 147, 1, '2009-03-16', NULL, 73, NULL, 1, NULL, NULL, NULL, NULL, 'fa  fa-thumbs-o-up', 'S'),
(173, 'Importação', 'Iniciar processo de importação dos atendimentos do eSUSAB para o SISAB', NULL, 'paginas/acessoRestrito/relatorio/admin/validacaoProcessamento/MonitorarImportacao.xhtml', 145, 3, '2010-10-16', NULL, 73, NULL, 1, NULL, NULL, NULL, NULL, 'fa   fa-database', 'S'),
(445, 'Acesso Administrativo', 'Acesso Administrativo', NULL, '#', NULL, 1, '2017-01-17', NULL, 77, NULL, 1, NULL, NULL, NULL, NULL, 'fa fa-wrench', 'S'),
(446, 'Relatórios', 'Relatórios', NULL, 'paginas/acessoRestrito/relatorios/relIndexAdmin.xhtml', 445, 6, '2011-01-17', NULL, 77, NULL, 1, NULL, NULL, NULL, NULL, 'fa fa-bar-chart', 'S'),
(447, 'Hierarquia de Perfis', 'Hierarquia de Perfis', NULL, 'paginas/acessoRestrito/visualizaHierarquiaPerfil.xhtml', 445, 3, '2012-01-17', NULL, 77, NULL, 1, NULL, NULL, NULL, NULL, 'fa fa-sitemap', 'S'),
(448, 'Cadastro de Usuários', 'Cadastro de Usuários', NULL, 'paginas/acessoRestrito/cadastroPessoaFisica.xhtml', 445, 4, '2012-01-17', NULL, 77, NULL, 1, NULL, NULL, NULL, NULL, 'fa fa-user', 'S'),
(449, 'FES / FMS', 'FES / FMS', NULL, 'paginas/acessoRestrito/cadastroEstadualMunicipal.xhtml', 445, 5, '2012-01-17', NULL, 77, NULL, 1, NULL, NULL, NULL, NULL, 'fa fa-lock', 'N'),
(450, 'Gestores Federais', 'Gestores Federais', NULL, 'paginas/acessoRestrito/gerenciaResponsaveisAB.xhtml', 445, 1, '2012-01-17', NULL, 77, NULL, 1, NULL, NULL, NULL, NULL, 'fa fa-user-circle', 'S'),
(451, 'Coordenações', 'Coordenações', NULL, 'paginas/acessoRestrito/listaCoordenacoes.xhtml', 445, 2, '2012-01-17', NULL, 77, NULL, 1, NULL, NULL, NULL, NULL, 'fa fa-users', 'S'),
(455, 'Demandas', 'Demandas', NULL, 'paginas/acessoRestrito/relatorios/relGeralDemandas.xhtml', 481, 2, '2024-01-17', NULL, 70, NULL, 3, '530010', NULL, NULL, NULL, 'fa fa-line-chart', 'S'),
(456, 'Localizar Demanda', 'Controle das Demandas', NULL, 'paginas/acessoRestrito/localizarDemanda.xhtml', 479, 3, '2022-03-17', NULL, 70, NULL, 3, NULL, NULL, NULL, NULL, 'fa fa-search', 'S'),
(463, 'Inicial', 'Painel Inicial do PSE', NULL, 'sistema', NULL, 1, '2002-05-17', NULL, 74, 28, 2, NULL, NULL, NULL, NULL, 'fa fa-link', 'S'),
(464, 'Relatórios', 'Relatórios Adessão do PSE', NULL, 'adesao/relatorio', NULL, 2, '2002-05-17', NULL, 74, 28, 2, NULL, NULL, NULL, NULL, 'fa fa-list-alt', 'S'),
(465, 'Inicial', 'Painel Inicial do PSE', NULL, 'sistema', NULL, 1, '2002-05-17', NULL, 74, 28, 4, NULL, NULL, NULL, NULL, 'fa fa-link', 'S'),
(466, 'Relatórios', 'Relatórios Adessão do PSE', NULL, 'adesao/relatorio', NULL, 2, '2002-05-17', NULL, 74, 28, 4, NULL, NULL, NULL, NULL, 'fa fa-list-alt', 'S'),
(467, 'Inicial', 'Painel Inicial do PSE', NULL, 'sistema', NULL, 1, '2002-05-17', NULL, 74, 28, 14, NULL, NULL, NULL, NULL, 'fa fa-link', 'S'),
(468, 'Relatórios', 'Relatórios Adessão do PSE', NULL, 'adesao/relatorio', NULL, 2, '2002-05-17', NULL, 74, 28, 14, NULL, NULL, NULL, NULL, 'fa fa-list-alt', 'S'),
(485, 'Módulo Eletrônico', 'Módulo Eletrônico', NULL, 'sistema/certificacao', 8, 5, '2025-07-17', NULL, 48, 2, 8, NULL, NULL, NULL, NULL, 'fa fa-bar-chart-o', 'S'),
(534, 'Vitamina A', 'Micronutriente Vitamina A', NULL, '#', NULL, 1, '2001-11-17', NULL, 3, 1, 2, NULL, NULL, NULL, NULL, 'fa fa-folder', 'S'),
(535, 'Ferro', 'Micronutriente Ferro', NULL, '#', NULL, 2, '2001-11-17', NULL, 3, 2, 2, NULL, NULL, NULL, NULL, 'fa fa-folder', 'S'),
(536, 'NutriSus', 'Micronutriente Nutrisus', NULL, '#', NULL, 3, '2001-11-17', NULL, 3, 3, 2, NULL, NULL, NULL, NULL, 'fa fa-folder', 'S'),
(537, 'Início', 'Micronutriente Vitamina A', NULL, 'vitaminaa', 534, 1, '2001-11-17', NULL, 3, 1, 2, NULL, NULL, NULL, NULL, 'fa fa-home', 'S'),
(538, 'Dose 100.000 UI', 'Micronutriente Vitamina A', NULL, 'vitaminaa/dose/1', 534, 2, '2001-11-17', NULL, 3, 1, 2, NULL, NULL, NULL, NULL, 'fa fa-check-square-o', 'S'),
(539, 'Dose 200.000 U', 'Micronutriente Vitamina A', NULL, 'vitaminaa/dose/2', 534, 3, '2001-11-17', NULL, 3, 1, 2, NULL, NULL, NULL, NULL, 'fa fa-check-square-o', 'S'),
(540, 'Perda de Cápsulas', 'Micronutriente Vitamina A', NULL, 'vitaminaa/perda/1', 534, 4, '2001-11-17', NULL, 3, 1, 2, NULL, NULL, NULL, NULL, 'fa fa-check-square-o', 'S'),
(541, 'Relatórios', 'Micronutriente Vitamina A', NULL, 'vitaminaa/relatorio', 534, 5, '2001-11-17', NULL, 3, 1, 2, NULL, NULL, NULL, NULL, 'fa fa-check-square-o', 'S'),
(542, 'Início', 'Micronutriente ferro', NULL, 'ferro', 535, 1, '2001-11-17', NULL, 3, 2, 2, NULL, NULL, NULL, NULL, 'fa fa-home', 'S'),
(543, 'Dose Crianças', 'Micronutriente ferro', NULL, 'ferro/dose/1', 535, 2, '2001-11-17', NULL, 3, 2, 2, NULL, NULL, NULL, NULL, 'fa fa-check-square-o', 'S'),
(544, 'Dose Gestantes', 'Micronutriente ferro', NULL, 'ferro/dose/2', 535, 3, '2001-11-17', NULL, 3, 2, 2, NULL, NULL, NULL, NULL, 'fa fa-check-square-o', 'S'),
(545, 'Relatórios', 'Micronutriente ferro', NULL, 'ferro/relatorio', 535, 4, '2001-11-17', NULL, 3, 2, 2, NULL, NULL, NULL, NULL, 'fa fa-check-square-o', 'S'),
(546, 'Início', 'Micronutriente NutriSus', NULL, 'nutrisus', 536, 1, '2001-11-17', NULL, 3, 3, 2, NULL, NULL, NULL, NULL, 'fa fa-home', 'S'),
(547, 'Dose Crianças', 'Micronutriente NutriSus', NULL, 'nutrisus/dose/1', 536, 2, '2001-11-17', NULL, 3, 3, 2, NULL, NULL, NULL, NULL, 'fa fa-check-square-o', 'S'),
(548, 'Relatórios', 'Micronutriente NutriSus', NULL, 'nutrisus/relatorio', 536, 3, '2001-11-17', NULL, 3, 3, 2, NULL, NULL, NULL, NULL, 'fa fa-check-square-o', 'S'),
(663, 'Nova Demanda', 'Nova Demanda', NULL, 'paginas/acessoRestrito/indexGestorFederal.xhtml', 641, 1, '2009-11-18', NULL, 70, NULL, 2, NULL, NULL, NULL, NULL, 'fa fa-cube', 'S'),
(682, 'Atualizar Demanda', 'Atualizar Demanda', NULL, 'paginas/acessoRestrito/gerenciarInfoDemandas.xhtml', 475, 3, '2025-01-19', NULL, 70, NULL, 1, NULL, NULL, NULL, NULL, 'fa fa-refresh', 'S'),
(702, 'Atendimento ao Usuário', 'Atendimento ao Usuário', NULL, 'paginas/acessoRestrito/gerenciarDemandasSuporte.xhtml', 477, 2, '2026-02-19', NULL, 70, NULL, 1, NULL, NULL, NULL, NULL, 'fa fa-phone', 'S'),
(457, 'Demanda de Suporte', 'Demanda de Suporte', NULL, 'paginas/acessoRestrito/cadastrarDemandaSuporte.xhtml', 479, 2, '2006-04-17', NULL, 70, NULL, 57, NULL, NULL, NULL, NULL, 'fa fa-wrench', 'N'),
(458, 'Demanda de Suporte', 'Demanda de Suporte', NULL, 'paginas/acessoRestrito/cadastrarDemandaSuporte.xhtml', 477, 2, '2006-04-17', NULL, 70, NULL, 1, NULL, NULL, NULL, NULL, 'fa fa-wrench', 'N'),
(459, 'Atendimento ao Usuário', 'Atendimento ao Usuário', NULL, 'paginas/acessoRestrito/gerenciarDemandasSuporte.xhtml', 478, 1, '2006-04-17', NULL, 70, NULL, 79, NULL, NULL, NULL, NULL, 'fa fa-wrench', 'S'),
(460, 'Acesso Administrativo', 'Acesso Administrativo', NULL, '#', NULL, 1, '2011-04-17', NULL, 77, NULL, 43, NULL, NULL, NULL, NULL, 'fa fa-wrench', 'S'),
(461, 'Relatórios', 'Relatórios', NULL, 'paginas/acessoRestrito/relatorios/relAcessosEGestor.xhtml', 460, 1, '2011-04-17', NULL, 77, NULL, 43, NULL, NULL, NULL, NULL, 'fa fa-bar-chart', 'S'),
(462, 'Calendário de Ausências', 'Calendário de Ausências', NULL, 'paginas/acessoRestrito/visualizarAusencias.xhtml', 483, 1, '2012-04-17', NULL, 70, NULL, 79, NULL, NULL, NULL, NULL, 'fa fa-calendar-times-o', 'S'),
(581, 'Ajuste da Adesão - 2017', 'Ajuste da Adesão - 2017', NULL, 'ajuste/adesao/painel', NULL, 2, '2025-04-18', NULL, 74, 28, 8, NULL, NULL, NULL, NULL, 'fa fa-clipboard', 'N'),
(582, 'Ajuste Adesão 2017 - 2018', 'Relatórios Adesão do PSE 2017 -2018', NULL, 'ajuste/adesao/relatorio', NULL, 3, '2025-04-18', NULL, 74, 28, 2, NULL, NULL, NULL, NULL, 'fa fa-list-alt', 'S'),
(601, 'Ajuste Adesão 2017 - 2018', 'Relatórios Adesão do PSE 2017 -2018', NULL, 'ajuste/adesao/relatorio', NULL, 3, '2025-04-18', NULL, 74, 28, 14, NULL, NULL, NULL, NULL, 'fa fa-list-alt', 'N'),
(473, 'Acesso Administrativo', 'Acesso Administrativo', NULL, '#', NULL, 2, '2018-05-17', NULL, 77, NULL, 4, NULL, NULL, NULL, NULL, 'fa fa-wrench', 'S'),
(474, 'Relatórios', 'Relatórios', NULL, 'paginas/acessoRestrito/relatorios/relAcessosEGestor.xhtml', 473, 1, '2018-02-17', NULL, 77, NULL, 4, NULL, NULL, NULL, NULL, 'fa fa-bar-chart', 'S'),
(475, 'Acesso Administrativo', 'Acesso Administrativo', NULL, '#', NULL, 1, '2020-06-17', NULL, 70, NULL, 1, NULL, NULL, NULL, NULL, 'fa fa-cogs', 'S'),
(477, 'Gerenciar Demanda', 'Gerenciar Demanda', NULL, '#', NULL, 2, '2020-06-17', NULL, 70, NULL, 1, NULL, NULL, NULL, NULL, 'fa fa-edit', 'S'),
(478, 'Gerenciar Demanda', 'Gerenciar Demanda', NULL, '#', NULL, 2, '2020-06-17', NULL, 70, NULL, 79, NULL, NULL, NULL, NULL, 'fa fa-edit', 'S'),
(479, 'Gerenciar Demanda', 'Gerenciar Demanda', NULL, '#', NULL, 2, '2020-06-17', NULL, 70, NULL, 57, NULL, NULL, NULL, NULL, 'fa fa-edit', 'S'),
(480, 'Acesso Administrativo', 'Acesso Administrativo', NULL, '#', NULL, 1, '2020-06-17', NULL, 70, NULL, 57, NULL, NULL, NULL, NULL, 'fa fa-cogs', 'S'),
(481, 'Relatórios', 'Relatórios', NULL, '#', NULL, 1, '2020-06-17', NULL, 70, NULL, 3, NULL, NULL, NULL, NULL, 'fa fa-bar-chart', 'S'),
(482, 'Gerenciar Demanda', 'Gerenciar Demanda', NULL, '#', NULL, 1, '2020-06-17', NULL, 70, NULL, 1, NULL, NULL, NULL, NULL, 'fa fa-edit', 'N'),
(484, 'Gerenciar Arquivos', 'Gerenciar Arquivos', NULL, 'paginas/acessoRestrito/gerenciarArquivos.xhtml', 475, 2, '2004-07-17', NULL, 70, NULL, 1, NULL, NULL, NULL, NULL, 'fa fa-file-o', 'S'),
(470, 'Documentos', 'Documentos', NULL, 'paginas/acessoRestrito/documentos.xhtml', NULL, 6, '2004-05-17', NULL, 70, NULL, 1, NULL, NULL, NULL, NULL, 'fa fa-files-o', 'N'),
(471, 'Documentos', 'Documentos', NULL, 'paginas/acessoRestrito/documentos.xhtml', NULL, 6, '2004-05-17', NULL, 70, NULL, 57, NULL, NULL, NULL, NULL, 'fa fa-files-o', 'N'),
(472, 'Calendário de Demandas', 'Calendário de Demandas', NULL, 'paginas/acessoRestrito/calendarioDemandas.xhtml', 483, 4, '2004-05-17', NULL, 70, NULL, 79, NULL, NULL, NULL, NULL, 'fa fa-calendar-check-o', 'S'),
(621, 'Coordenações', 'Coordenações', NULL, 'paginas/acessoRestrito/listaCoordenacoes.xhtml', 453, 11, '2003-10-18', NULL, 77, NULL, 2, NULL, NULL, NULL, NULL, 'fa fa-users', 'S'),
(452, 'Relatórios', 'Relatórios', NULL, 'paginas/acessoRestrito/relatorios/relIndexAdmin.xhtml', 475, 4, '2024-01-17', NULL, 70, NULL, 1, '530010', NULL, NULL, NULL, 'fa fa-bar-chart', 'S'),
(453, 'Acesso Administrativo', 'Acesso Administrativo', NULL, '#', NULL, 2, '2008-02-17', NULL, 77, NULL, 2, NULL, NULL, NULL, NULL, 'fa fa-wrench', 'S'),
(454, 'Relatórios', 'Relatórios', NULL, 'paginas/acessoRestrito/relatorios/relIndexGestorFederal.xhtml', 453, 1, '2008-02-17', NULL, 77, NULL, 2, NULL, NULL, NULL, NULL, 'fa fa-bar-chart', 'S'),
(504, 'Vitamina A', 'Micronutriente Vitamina A', NULL, '#', NULL, 1, '2005-10-17', NULL, 3, 1, 8, NULL, NULL, NULL, NULL, 'fa fa-folder', 'S'),
(505, 'Ferro', 'Micronutriente Ferro', NULL, '#', NULL, 2, '2005-10-17', NULL, 3, 2, 8, NULL, NULL, NULL, NULL, 'fa fa-folder', 'S'),
(506, 'NutriSus', 'Micronutriente Nutrisus', NULL, '#', NULL, 3, '2005-10-17', NULL, 3, 3, 8, NULL, NULL, NULL, NULL, 'fa fa-folder', 'S'),
(507, 'Vitamina A', 'Micronutriente Vitamina A', NULL, '#', NULL, 1, '2005-10-17', NULL, 3, 1, 34, NULL, NULL, NULL, NULL, 'fa fa-folder', 'S'),
(508, 'Ferro', 'Micronutriente Ferro', NULL, '#', NULL, 2, '2005-10-17', NULL, 3, 2, 34, NULL, NULL, NULL, NULL, 'fa fa-folder', 'S'),
(509, 'NutriSus', 'Micronutriente Nutrisus', NULL, '#', NULL, 3, '2005-10-17', NULL, 3, 3, 34, NULL, NULL, NULL, NULL, 'fa fa-folder', 'S'),
(510, 'Início', 'Micronutriente Vitamina A', NULL, 'vitaminaa', 504, 1, '2005-10-17', NULL, 3, 1, 8, NULL, NULL, NULL, NULL, 'fa fa-home', 'S'),
(511, 'Dose 100.000 UI', 'Micronutriente Vitamina A', NULL, 'vitaminaa/dose/1', 504, 2, '2005-10-17', NULL, 3, 1, 8, NULL, NULL, NULL, NULL, 'fa fa-check-square-o', 'S'),
(512, 'Dose 200.000 U', 'Micronutriente Vitamina A', NULL, 'vitaminaa/dose/2', 504, 3, '2005-10-17', NULL, 3, 1, 8, NULL, NULL, NULL, NULL, 'fa fa-check-square-o', 'S'),
(513, 'Perda de Cápsulas', 'Micronutriente Vitamina A', NULL, 'vitaminaa/perda/1', 504, 4, '2005-10-17', NULL, 3, 1, 8, NULL, NULL, NULL, NULL, 'fa fa-check-square-o', 'S'),
(514, 'Relatórios', 'Micronutriente Vitamina A', NULL, 'vitaminaa/relatorio', 504, 5, '2005-10-17', NULL, 3, 1, 8, NULL, NULL, NULL, NULL, 'fa fa-check-square-o', 'S'),
(515, 'Início', 'Micronutriente ferro', NULL, 'ferro', 505, 1, '2005-10-17', NULL, 3, 2, 8, NULL, NULL, NULL, NULL, 'fa fa-home', 'S'),
(516, 'Dose Crianças', 'Micronutriente ferro', NULL, 'ferro/dose/1', 505, 2, '2005-10-17', NULL, 3, 2, 8, NULL, NULL, NULL, NULL, 'fa fa-check-square-o', 'S'),
(517, 'Dose Gestantes', 'Micronutriente ferro', NULL, 'ferro/dose/2', 505, 3, '2005-10-17', NULL, 3, 2, 8, NULL, NULL, NULL, NULL, 'fa fa-check-square-o', 'S'),
(518, 'Relatórios', 'Micronutriente ferro', NULL, 'ferro/relatorio', 505, 4, '2005-10-17', NULL, 3, 2, 8, NULL, NULL, NULL, NULL, 'fa fa-check-square-o', 'S'),
(519, 'Início', 'Micronutriente NutriSus', NULL, 'nutrisus', 506, 1, '2005-10-17', NULL, 3, 3, 8, NULL, NULL, NULL, NULL, 'fa fa-home', 'S'),
(520, 'Dose Crianças', 'Micronutriente NutriSus', NULL, 'nutrisus/dose/1', 506, 2, '2005-10-17', NULL, 3, 3, 8, NULL, NULL, NULL, NULL, 'fa fa-check-square-o', 'S'),
(521, 'Relatórios', 'Micronutriente NutriSus', NULL, 'nutrisus/relatorio', 506, 3, '2005-10-17', NULL, 3, 3, 8, NULL, NULL, NULL, NULL, 'fa fa-check-square-o', 'S'),
(522, 'Início', 'Micronutriente Vitamina A', NULL, 'vitaminaa', 507, 1, '2005-10-17', NULL, 3, 1, 34, NULL, NULL, NULL, NULL, 'fa fa-home', 'S'),
(523, 'Dose 100.000 UI', 'Micronutriente Vitamina A', NULL, 'vitaminaa/dose/1', 507, 2, '2005-10-17', NULL, 3, 1, 34, NULL, NULL, NULL, NULL, 'fa fa-check-square-o', 'S'),
(524, 'Dose 200.000 U', 'Micronutriente Vitamina A', NULL, 'vitaminaa/dose/2', 507, 3, '2005-10-17', NULL, 3, 1, 34, NULL, NULL, NULL, NULL, 'fa fa-check-square-o', 'S'),
(525, 'Perda de Cápsulas', 'Micronutriente Vitamina A', NULL, 'vitaminaa/perda/1', 507, 4, '2005-10-17', NULL, 3, 1, 34, NULL, NULL, NULL, NULL, 'fa fa-check-square-o', 'S'),
(526, 'Relatórios', 'Micronutriente Vitamina A', NULL, 'vitaminaa/relatorio', 507, 5, '2005-10-17', NULL, 3, 1, 34, NULL, NULL, NULL, NULL, 'fa fa-check-square-o', 'S'),
(527, 'Início', 'Micronutriente ferro', NULL, 'ferro', 508, 1, '2005-10-17', NULL, 3, 2, 34, NULL, NULL, NULL, NULL, 'fa fa-home', 'S'),
(528, 'Dose Crianças', 'Micronutriente ferro', NULL, 'ferro/dose/1', 508, 2, '2005-10-17', NULL, 3, 2, 34, NULL, NULL, NULL, NULL, 'fa fa-check-square-o', 'S'),
(529, 'Dose Gestantes', 'Micronutriente ferro', NULL, 'ferro/dose/2', 508, 3, '2005-10-17', NULL, 3, 2, 34, NULL, NULL, NULL, NULL, 'fa fa-check-square-o', 'S'),
(530, 'Relatórios', 'Micronutriente ferro', NULL, 'ferro/relatorio', 508, 4, '2005-10-17', NULL, 3, 2, 34, NULL, NULL, NULL, NULL, 'fa fa-check-square-o', 'S'),
(531, 'Início', 'Micronutriente NutriSus', NULL, 'nutrisus', 509, 1, '2005-10-17', NULL, 3, 3, 34, NULL, NULL, NULL, NULL, 'fa fa-home', 'S'),
(532, 'Dose Crianças', 'Micronutriente NutriSus', NULL, 'nutrisus/dose/1', 509, 2, '2005-10-17', NULL, 3, 3, 34, NULL, NULL, NULL, NULL, 'fa fa-check-square-o', 'S'),
(533, 'Relatórios', 'Micronutriente NutriSus', NULL, 'nutrisus/relatorio', 509, 3, '2005-10-17', NULL, 3, 3, 34, NULL, NULL, NULL, NULL, 'fa fa-check-square-o', 'S'),
(550, 'Estatísticas', 'Estatísticas de Acesso', NULL, 'paginas/acessoRestrito/relatorios/relCadastrosEGestor.xhtml', 445, 7, '2014-11-17', NULL, 77, NULL, 1, NULL, NULL, NULL, NULL, 'fa fa-area-chart', 'N'),
(551, 'Vitamina A', 'Micronutriente Vitamina A', NULL, '#', NULL, 1, '2014-12-17', NULL, 3, 1, 4, NULL, NULL, NULL, NULL, 'fa fa-folder', 'S');
INSERT INTO `tb_menu` (`CO_SEQ_MENU`, `NO_MENU`, `DS_MENU`, `IM_MENU`, `DS_URL`, `CO_MENU`, `NU_ORDEM`, `DT_CADASTRO`, `DT_ATUALIZACAO`, `CO_PROGRAMA`, `CO_PROGRAMA_MODULO`, `CO_GRUPO`, `CO_MUNICIPIO_IBGE`, `CO_UNIDADE`, `CO_CNES`, `CO_EQUIPE`, `NO_CLASSECSS`, `ST_REGISTRO_ATIVO`) VALUES
(552, 'Ferro', 'Micronutriente Ferro', NULL, '#', NULL, 2, '2014-12-17', NULL, 3, 2, 4, NULL, NULL, NULL, NULL, 'fa fa-folder', 'S'),
(553, 'NutriSus', 'Micronutriente Nutrisus', NULL, '#', NULL, 3, '2014-12-17', NULL, 3, 3, 4, NULL, NULL, NULL, NULL, 'fa fa-folder', 'S'),
(554, 'Início', 'Micronutriente Vitamina A', NULL, 'vitaminaa', 551, 1, '2014-12-17', NULL, 3, 1, 4, NULL, NULL, NULL, NULL, 'fa fa-home', 'S'),
(555, 'Dose 100.000 UI', 'Micronutriente Vitamina A', NULL, 'vitaminaa/dose/1', 551, 2, '2014-12-17', NULL, 3, 1, 4, NULL, NULL, NULL, NULL, 'fa fa-check-square-o', 'S'),
(556, 'Dose 200.000 U', 'Micronutriente Vitamina A', NULL, 'vitaminaa/dose/2', 551, 3, '2014-12-17', NULL, 3, 1, 4, NULL, NULL, NULL, NULL, 'fa fa-check-square-o', 'S'),
(557, 'Perda de Cápsulas', 'Micronutriente Vitamina A', NULL, 'vitaminaa/perda/1', 551, 4, '2014-12-17', NULL, 3, 1, 4, NULL, NULL, NULL, NULL, 'fa fa-check-square-o', 'S'),
(558, 'Relatórios', 'Micronutriente Vitamina A', NULL, 'vitaminaa/relatorio', 551, 5, '2014-12-17', NULL, 3, 1, 4, NULL, NULL, NULL, NULL, 'fa fa-check-square-o', 'S'),
(559, 'Início', 'Micronutriente ferro', NULL, 'ferro', 552, 1, '2014-12-17', NULL, 3, 2, 4, NULL, NULL, NULL, NULL, 'fa fa-home', 'S'),
(560, 'Dose Crianças', 'Micronutriente ferro', NULL, 'ferro/dose/1', 552, 2, '2014-12-17', NULL, 3, 2, 4, NULL, NULL, NULL, NULL, 'fa fa-check-square-o', 'S'),
(561, 'Dose Gestantes', 'Micronutriente ferro', NULL, 'ferro/dose/2', 552, 3, '2014-12-17', NULL, 3, 2, 4, NULL, NULL, NULL, NULL, 'fa fa-check-square-o', 'S'),
(562, 'Relatórios', 'Micronutriente ferro', NULL, 'ferro/relatorio', 552, 4, '2014-12-17', NULL, 3, 2, 4, NULL, NULL, NULL, NULL, 'fa fa-check-square-o', 'S'),
(563, 'Início', 'Micronutriente NutriSus', NULL, 'nutrisus', 553, 1, '2014-12-17', NULL, 3, 3, 4, NULL, NULL, NULL, NULL, 'fa fa-home', 'S'),
(564, 'Dose Crianças', 'Micronutriente NutriSus', NULL, 'nutrisus/dose/1', 553, 2, '2014-12-17', NULL, 3, 3, 4, NULL, NULL, NULL, NULL, 'fa fa-check-square-o', 'S'),
(565, 'Relatórios', 'Micronutriente NutriSus', NULL, 'nutrisus/relatorio', 553, 3, '2014-12-17', NULL, 3, 3, 4, NULL, NULL, NULL, NULL, 'fa fa-check-square-o', 'S'),
(566, 'Vitamina A', 'Micronutriente Vitamina A', NULL, '#', NULL, 1, '2014-12-17', NULL, 3, 1, 15, NULL, NULL, NULL, NULL, 'fa fa-folder', 'S'),
(567, 'Ferro', 'Micronutriente Ferro', NULL, '#', NULL, 2, '2014-12-17', NULL, 3, 2, 15, NULL, NULL, NULL, NULL, 'fa fa-folder', 'S'),
(568, 'NutriSus', 'Micronutriente Nutrisus', NULL, '#', NULL, 3, '2014-12-17', NULL, 3, 3, 15, NULL, NULL, NULL, NULL, 'fa fa-folder', 'S'),
(569, 'Início', 'Micronutriente Vitamina A', NULL, 'vitaminaa', 566, 1, '2014-12-17', NULL, 3, 1, 15, NULL, NULL, NULL, NULL, 'fa fa-home', 'S'),
(570, 'Dose 100.000 UI', 'Micronutriente Vitamina A', NULL, 'vitaminaa/dose/1', 566, 2, '2014-12-17', NULL, 3, 1, 15, NULL, NULL, NULL, NULL, 'fa fa-check-square-o', 'S'),
(571, 'Dose 200.000 U', 'Micronutriente Vitamina A', NULL, 'vitaminaa/dose/2', 566, 3, '2014-12-17', NULL, 3, 1, 15, NULL, NULL, NULL, NULL, 'fa fa-check-square-o', 'S'),
(572, 'Perda de Cápsulas', 'Micronutriente Vitamina A', NULL, 'vitaminaa/perda/1', 566, 4, '2014-12-17', NULL, 3, 1, 15, NULL, NULL, NULL, NULL, 'fa fa-check-square-o', 'S'),
(573, 'Relatórios', 'Micronutriente Vitamina A', NULL, 'vitaminaa/relatorio', 566, 5, '2014-12-17', NULL, 3, 1, 15, NULL, NULL, NULL, NULL, 'fa fa-check-square-o', 'S'),
(574, 'Início', 'Micronutriente ferro', NULL, 'ferro', 567, 1, '2014-12-17', NULL, 3, 2, 15, NULL, NULL, NULL, NULL, 'fa fa-home', 'S'),
(575, 'Dose Crianças', 'Micronutriente ferro', NULL, 'ferro/dose/1', 567, 2, '2014-12-17', NULL, 3, 2, 15, NULL, NULL, NULL, NULL, 'fa fa-check-square-o', 'S'),
(576, 'Dose Gestantes', 'Micronutriente ferro', NULL, 'ferro/dose/2', 567, 3, '2014-12-17', NULL, 3, 2, 15, NULL, NULL, NULL, NULL, 'fa fa-check-square-o', 'S'),
(577, 'Relatórios', 'Micronutriente ferro', NULL, 'ferro/relatorio', 567, 4, '2014-12-17', NULL, 3, 2, 15, NULL, NULL, NULL, NULL, 'fa fa-check-square-o', 'S'),
(578, 'Início', 'Micronutriente NutriSus', NULL, 'nutrisus', 568, 1, '2014-12-17', NULL, 3, 3, 15, NULL, NULL, NULL, NULL, 'fa fa-home', 'S'),
(579, 'Dose Crianças', 'Micronutriente NutriSus', NULL, 'nutrisus/dose/1', 568, 2, '2014-12-17', NULL, 3, 3, 15, NULL, NULL, NULL, NULL, 'fa fa-check-square-o', 'S'),
(580, 'Relatórios', 'Micronutriente NutriSus', NULL, 'nutrisus/relatorio', 568, 3, '2014-12-17', NULL, 3, 3, 15, NULL, NULL, NULL, NULL, 'fa fa-check-square-o', 'S'),
(641, 'Minhas solicitações', 'Minhas solicitações', NULL, '#', NULL, 1, '2011-10-18', NULL, 70, NULL, 2, NULL, NULL, NULL, NULL, 'fa fa-list', 'S'),
(642, 'Localizar Demanda', 'Localizar Demanda', NULL, 'paginas/acessoRestrito/relatorios/relGestorFederal.xhtml', 641, 2, '2011-10-18', NULL, 70, NULL, 2, NULL, NULL, NULL, NULL, 'fa fa-search', 'S'),
(438, 'Nova Demanda', 'Nova Demanda', NULL, 'paginas/acessoRestrito/cadNovaDemanda.xhtml', 477, 1, '2011-01-17', NULL, 70, NULL, 1, NULL, NULL, NULL, NULL, 'fa fa-cube', 'S'),
(439, 'Cadastrar Demanda', 'Cadastro de Demandas', NULL, 'paginas/acessoRestrito/cadastrarDemanda.xhtml', 479, 1, '2011-01-17', NULL, 70, NULL, 57, NULL, NULL, NULL, NULL, 'fa fa-edit', 'N'),
(440, 'Localizar Demanda', 'Controle das Demandas', NULL, 'paginas/acessoRestrito/localizarDemanda.xhtml', 478, 2, '2011-01-17', NULL, 70, NULL, 79, NULL, NULL, NULL, NULL, 'fa fa-search', 'S'),
(441, 'Localizar Demanda', 'Controle das Demandas', NULL, 'paginas/acessoRestrito/localizarDemanda.xhtml', 477, 3, '2011-01-17', NULL, 70, NULL, 1, NULL, NULL, NULL, NULL, 'fa fa-search', 'S'),
(442, 'Localizar Demanda', 'Controle das Demandas', NULL, 'paginas/acessoRestrito/localizarDemanda.xhtml', 479, 5, '2011-01-17', NULL, 70, NULL, 57, NULL, NULL, NULL, NULL, 'fa fa-search', 'S'),
(443, 'Gerenciar Analistas', 'Gerenciar Analistas', NULL, 'paginas/acessoRestrito/gerenciarAnalistas.xhtml', 475, 1, '2011-01-17', NULL, 70, NULL, 1, NULL, NULL, NULL, NULL, 'fa fa-users', 'S'),
(444, 'Gerenciar Analistas', 'Gerenciar Analistas', NULL, 'paginas/acessoRestrito/gerenciarAnalistas.xhtml', 480, 2, '2011-01-17', NULL, 70, NULL, 57, NULL, NULL, NULL, NULL, 'fa fa-users', 'S');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_municipio`
--

CREATE TABLE IF NOT EXISTS `tb_municipio` (
  `CO_MUNICIPIO_IBGE` varchar(6) DEFAULT NULL,
  `CO_REGIONAL_SAUDE` varchar(4) DEFAULT NULL,
  `SG_UF` varchar(2) DEFAULT NULL,
  `CO_MACRORREGIONAL` varchar(4) DEFAULT NULL,
  `CO_MESORREGIAO` varchar(4) DEFAULT NULL,
  `CO_MICRORREGIAO` varchar(10) DEFAULT NULL,
  `CO_UF_IBGE` varchar(10) DEFAULT NULL,
  `NO_MUNICIPIO` varchar(60) DEFAULT NULL,
  `SG_MUNICIPIO` varchar(3) DEFAULT NULL,
  `NU_DDD` varchar(4) DEFAULT NULL,
  `NU_CEP` varchar(8) DEFAULT NULL,
  `DV_MUNICIPIO_IBGE` varchar(1) DEFAULT NULL,
  `CO_MUNICIPIO_SIAFI` varchar(4) DEFAULT NULL,
  `CO_MUNICIPIO_SIAPE` varchar(10) DEFAULT NULL,
  `CO_SINPAS` varchar(20) DEFAULT NULL,
  `CO_REGIAO_CORREIO` varchar(10) DEFAULT NULL,
  `ST_MUNICIPIO` varchar(10) DEFAULT NULL,
  `ST_AMAZONIA` varchar(10) DEFAULT NULL,
  `ST_FRONTEIRA` varchar(10) DEFAULT NULL,
  `CO_SUCESSOR` varchar(10) DEFAULT NULL,
  `NO_ANTERIOR` varchar(60) DEFAULT NULL,
  `ST_COMUNIDADE_SOLIDARIA` varchar(10) DEFAULT NULL,
  `ST_SECA` varchar(10) DEFAULT NULL,
  `ST_SEMI_ARIDO` varchar(10) DEFAULT NULL,
  `ST_PRMI` varchar(10) DEFAULT NULL,
  `ST_CALAMIDADE` varchar(10) DEFAULT NULL,
  `ST_INDIGENA` varchar(10) DEFAULT NULL,
  `NU_DISTANCIA_CAPITAL` varchar(10) DEFAULT NULL,
  `ST_CAPITAL` varchar(10) DEFAULT NULL,
  `NU_AREA` varchar(10) DEFAULT NULL,
  `NU_LATITUDE` varchar(10) DEFAULT NULL,
  `NU_LONGITUDE` varchar(10) DEFAULT NULL,
  `NU_ALTITUDE` varchar(10) DEFAULT NULL,
  `ST_REGISTRO_ATIVO` varchar(10) DEFAULT NULL,
  `NU_IDH` varchar(10) DEFAULT NULL,
  `CO_MUNICIPIO_CORREIO` varchar(10) DEFAULT NULL,
  `CO_MUNICIPIO_INSS` varchar(10) DEFAULT NULL,
  `CO_MICRORREGIONAL_SAUDE` varchar(10) DEFAULT NULL,
  `ST_PITS` varchar(10) DEFAULT NULL,
  `ST_QUILOMBOLA` varchar(10) DEFAULT NULL,
  `CO_SEQ_ANTIGO` varchar(10) DEFAULT NULL,
  `NO_POPULAR` varchar(100) DEFAULT NULL,
  `CO_REGIAO_METROPOLITANA` varchar(10) DEFAULT NULL,
  `CO_AGLOMERADO_URBANO` varchar(10) DEFAULT NULL,
  `NU_ANO_EXTINCAO` varchar(10) DEFAULT NULL,
  `NU_ANO_INSTALACAO` varchar(10) DEFAULT NULL,
  `ST_IBGE` varchar(10) DEFAULT NULL,
  `CO_MUNICIPIO_SVS` varchar(10) DEFAULT NULL,
  `NO_MUNICIPIO_ACENTUADO` varchar(60) DEFAULT NULL,
  `ST_RIDE` varchar(10) DEFAULT NULL,
  `CO_MUNICIPIO_CNES` varchar(10) DEFAULT NULL,
  `ST_SUDAM` varchar(10) DEFAULT NULL,
  `ST_SUDENE` varchar(10) DEFAULT NULL,
  `ST_CADSUS` varchar(10) DEFAULT NULL,
  `CO_MUNICIPIO_ORIGEM` varchar(10) DEFAULT NULL,
  `CO_TERRITORIO_CIDADANIA` varchar(10) DEFAULT NULL,
  `ST_PSE` varchar(10) DEFAULT NULL,
  `ST_PAN` varchar(10) DEFAULT NULL,
  `ST_PACTO_RMINAL` varchar(10) DEFAULT NULL,
  `CO_MUNICIPIO_TABNET_RJ` varchar(10) DEFAULT NULL,
  `TP_TIPOLOGIA_PNDR` varchar(20) DEFAULT NULL,
  `CO_GRUPO_PAC2` varchar(10) DEFAULT NULL,
  `ST_CNES` varchar(10) DEFAULT NULL,
  `CO_REGIAO_SAUDE` varchar(10) DEFAULT NULL,
  `ST_PACTO` varchar(10) DEFAULT NULL,
  `ST_CIB_SAS` varchar(10) DEFAULT NULL,
  `DT_MANUTENCAO` varchar(10) DEFAULT NULL,
  `FSDFSD` varchar(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `tb_municipio`
--

INSERT INTO `tb_municipio` (`CO_MUNICIPIO_IBGE`, `CO_REGIONAL_SAUDE`, `SG_UF`, `CO_MACRORREGIONAL`, `CO_MESORREGIAO`, `CO_MICRORREGIAO`, `CO_UF_IBGE`, `NO_MUNICIPIO`, `SG_MUNICIPIO`, `NU_DDD`, `NU_CEP`, `DV_MUNICIPIO_IBGE`, `CO_MUNICIPIO_SIAFI`, `CO_MUNICIPIO_SIAPE`, `CO_SINPAS`, `CO_REGIAO_CORREIO`, `ST_MUNICIPIO`, `ST_AMAZONIA`, `ST_FRONTEIRA`, `CO_SUCESSOR`, `NO_ANTERIOR`, `ST_COMUNIDADE_SOLIDARIA`, `ST_SECA`, `ST_SEMI_ARIDO`, `ST_PRMI`, `ST_CALAMIDADE`, `ST_INDIGENA`, `NU_DISTANCIA_CAPITAL`, `ST_CAPITAL`, `NU_AREA`, `NU_LATITUDE`, `NU_LONGITUDE`, `NU_ALTITUDE`, `ST_REGISTRO_ATIVO`, `NU_IDH`, `CO_MUNICIPIO_CORREIO`, `CO_MUNICIPIO_INSS`, `CO_MICRORREGIONAL_SAUDE`, `ST_PITS`, `ST_QUILOMBOLA`, `CO_SEQ_ANTIGO`, `NO_POPULAR`, `CO_REGIAO_METROPOLITANA`, `CO_AGLOMERADO_URBANO`, `NU_ANO_EXTINCAO`, `NU_ANO_INSTALACAO`, `ST_IBGE`, `CO_MUNICIPIO_SVS`, `NO_MUNICIPIO_ACENTUADO`, `ST_RIDE`, `CO_MUNICIPIO_CNES`, `ST_SUDAM`, `ST_SUDENE`, `ST_CADSUS`, `CO_MUNICIPIO_ORIGEM`, `CO_TERRITORIO_CIDADANIA`, `ST_PSE`, `ST_PAN`, `ST_PACTO_RMINAL`, `CO_MUNICIPIO_TABNET_RJ`, `TP_TIPOLOGIA_PNDR`, `CO_GRUPO_PAC2`, `ST_CNES`, `CO_REGIAO_SAUDE`, `ST_PACTO`, `ST_CIB_SAS`, `DT_MANUTENCAO`, `FSDFSD`) VALUES
('312470', '3115', 'MG', '3105', '3106', '31026', '31', 'ESTRELA DO INDAIA', NULL, '37', '35613000', '8', '4493', '4493', '11247', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'S', 'N', NULL, 'N', '635,364', '-19,52200', '-45,78800', '721', 'S', '0,676', NULL, NULL, '31028', 'N', 'N', '1699', NULL, '3190', '3190', NULL, '1948', 'S', '1632', 'ESTRELA DO INDAIÁ', 'N', '312470', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '277', 'ESTAGNADA', '03', 'N', '613', NULL, NULL, NULL, NULL),
('351535', '3511', 'SP', '3532', '3508', '35036', '35', 'EUCLIDES DA CUNHA PAULISTA', NULL, '18', '19275000', '0', '7255', '7255', '21579', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'S', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '577,122', '-22,56100', '-52,59000', '265', 'S', '0,704', NULL, NULL, '35115', 'N', 'N', '1705', NULL, '3590', '3590', NULL, '1993', 'S', '4919', 'EUCLIDES DA CUNHA PAULISTA', 'N', '351535', 'N', 'N', 'S', NULL, '73', 'N', 'N', 'N', '178', 'ALTA RENDA', '03', 'N', '331', NULL, NULL, NULL, NULL),
('120020', '1203', 'AC', '1201', '1201', '12001', '12', 'CRUZEIRO DO SUL', NULL, '68', '69980000', '3', '0107', '0107', '24004', NULL, 'ATIVO', 'S', 'S', NULL, NULL, 'S', 'N', 'N', 'S', 'N', 'S', NULL, 'N', '7924,943', '-7,63100', '-72,67000', '182', 'S', '0,664', NULL, NULL, '12900', 'N', 'N', '1465', NULL, '1290', '1290', NULL, '1904', 'S', '6', 'CRUZEIRO DO SUL', 'N', '120020', 'S', 'N', 'S', NULL, '106', 'S', 'N', 'S', '6', 'DINÂMICA', '01', 'N', '225', NULL, NULL, NULL, NULL),
('351350', '3504', 'SP', '3520', '3515', '35063', '35', 'CUBATAO', NULL, '13', '11510970', '4', '6371', '6371', '21136', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '142,281', '-23,89500', '-46,42500', '4', 'S', '0,737', NULL, NULL, '35041', 'N', 'N', '1469', NULL, '3502', '3502', NULL, '1948', 'S', '4892', 'CUBATÃO', 'N', '351350', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '151', 'ALTA RENDA', '01', 'N', '92', NULL, NULL, NULL, NULL),
('250520', '2502', 'PB', '2503', '2503', '25016', '25', 'CUITEGI', NULL, '83', '58208000', '4', '2005', '2005', '13053', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'S', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '39,302', '-6,89300', '-35,52300', '90', 'S', '0,57', NULL, NULL, '25900', 'S', 'N', '1474', NULL, '2503', '2590', NULL, '1961', 'S', '2623', 'CUITEGI', 'N', '250520', 'N', 'S', 'S', NULL, NULL, 'S', 'N', 'N', '68', 'BAIXA RENDA', '03', 'N', '420', NULL, NULL, NULL, NULL),
('280190', '2802', 'SE', '2801', '2802', '28003', '28', 'CUMBE', NULL, '79', '49660000', '0', '3137', '3137', '22019', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'S', 'N', 'S', 'N', 'N', 'N', NULL, 'N', '129,196', '-10,35500', '-37,18300', '187', 'S', '0,604', NULL, NULL, '28900', 'S', 'N', '1479', NULL, '2890', '2890', NULL, '1953', 'S', '4683', 'CUMBE', 'N', '280190', 'N', 'S', 'S', NULL, NULL, 'N', 'N', 'N', '17', 'DINÂMICA', '03', 'N', '381', NULL, NULL, NULL, NULL),
('290990', '2915', 'BA', '2913', '2902', '29004', '29', 'CURACA', NULL, '74', '48930000', '1', '3497', '3497', '04099', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'S', 'S', 'S', 'N', NULL, 'N', '6442,19', '-8,99200', '-39,90800', '330', 'S', '0,581', NULL, NULL, '29061', 'N', 'N', '1485', NULL, '2602', '2990', NULL, '1832', 'S', '317', 'CURAÇÁ', 'N', '290990', 'N', 'S', 'S', NULL, '143', 'N', 'N', 'N', '117', 'ESTAGNADA', '03', 'N', '113', NULL, NULL, NULL, NULL),
('420480', '4209', 'SC', '4212', '4203', '42009', '42', 'CURITIBANOS', NULL, '49', '89520000', '6', '8093', '8093', '20047', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'S', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '952,283', '-27,28300', '-50,58400', '987', 'S', '0,721', NULL, NULL, '42900', 'N', 'N', '1489', NULL, '4214', '4290', NULL, '1869', 'S', '4451', 'CURITIBANOS', 'N', '420480', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '80', 'ESTAGNADA', '03', 'N', '489', NULL, NULL, NULL, NULL),
('240310', '2404', 'RN', '2402', '2402', '24012', '24', 'CURRAIS NOVOS', NULL, '84', '59380000', '3', '1661', '1661', '18031', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'S', 'N', 'N', 'N', NULL, 'N', '864,341', '-6,26100', '-36,51500', '341', 'S', '0,691', NULL, NULL, '24900', 'N', 'N', '1492', NULL, '2490', '2490', NULL, '1890', 'S', '3708', 'CURRAIS NOVOS', 'N', '240310', 'N', 'S', 'S', NULL, '76', 'N', 'N', 'S', '34', 'DINÂMICA', '03', 'N', '83', NULL, NULL, NULL, NULL),
('220325', '2204', 'PI', '2208', '2202', '22003', '22', 'CURRALINHOS', NULL, '86', '64453000', '5', '0310', '0310', '16173', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'S', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '362,793', '-5,58300', '-42,77800', '126', 'S', '0,555', NULL, NULL, '22900', 'S', 'N', '1498', NULL, '2201', '2290', NULL, '1997', 'S', '3032', 'CURRALINHOS', 'N', '220325', 'N', 'S', 'S', NULL, '45', 'S', 'N', 'N', '71', 'ESTAGNADA', '03', 'N', '27', NULL, NULL, NULL, NULL),
('210370', '2112', 'MA', '2110', '2101', '21001', '21', 'CURURUPU', NULL, '98', '65268000', '3', '0771', '0771', '09036', NULL, 'ATIVO', 'S', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '935,586', '-1,82800', '-44,86800', '12', 'S', '0,612', NULL, NULL, '21900', 'S', 'N', '1501', NULL, '2190', '2190', NULL, '1841', 'S', '1202', 'CURURUPU', 'N', '210370', 'S', 'S', 'S', NULL, '115', 'N', 'N', 'S', '64', 'BAIXA RENDA', '03', 'N', '239', NULL, NULL, NULL, NULL),
('520670', '5217', 'GO', '5207', '5204', '52011', '52', 'DAMIANOPOLIS', NULL, '62', '73980000', '1', '9335', '9335', '08068', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'S', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '415,349', '-14,56400', '-46,17700', '746', 'S', '0,654', NULL, NULL, '52900', 'S', 'N', '1505', NULL, '5290', '5290', NULL, '1958', 'S', '971', 'DAMIANÓPOLIS', 'N', '520670', 'N', 'N', 'S', NULL, '125', 'N', 'N', 'N', '76', 'DINÂMICA', '03', 'N', '184', NULL, NULL, NULL, NULL),
('170650', '1712', 'TO', '1701', '1701', '17001', '17', 'DARCINOPOLIS', NULL, '63', '77910000', '6', '0179', '0179', '28093', NULL, 'ATIVO', 'S', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '1548,89', '-6,71300', '-47,76000', '0', 'S', '0,581', NULL, NULL, '17900', 'S', 'N', '1508', NULL, '1790', '1790', NULL, '1993', 'S', '5431', 'DARCINÓPOLIS', 'N', '170650', 'S', 'N', 'S', NULL, '22', 'N', 'N', 'N', '45', 'BAIXA RENDA', '03', 'N', '386', NULL, NULL, NULL, NULL),
('312110', '3110', 'MG', '3101', '3110', '31056', '31', 'DELFIM MOREIRA', NULL, '35', '37514000', '0', '4421', '4421', '11211', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '408,181', '-22,50900', '-45,28000', '1200', 'S', '0,669', NULL, NULL, '31003', 'N', 'N', '1514', NULL, '3190', '3190', NULL, '1938', 'S', '1590', 'DELFIM MOREIRA', 'N', '312110', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '235', 'ESTAGNADA', '03', 'N', '630', NULL, NULL, NULL, NULL),
('270240', '2710', 'AL', '2703', '2701', '27002', '27', 'DELMIRO GOUVEIA', NULL, '82', '57480000', '5', '2747', '2747', '02024', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'S', 'S', 'N', 'N', NULL, 'N', '605,395', '-9,38600', '-37,99600', '256', 'S', '0,612', NULL, NULL, '27007', 'N', 'N', '1516', NULL, '2790', '2790', NULL, '1952', 'S', '48', 'DELMIRO GOUVEIA', 'N', '270240', 'N', 'S', 'S', NULL, '40', 'N', 'N', 'S', '26', 'BAIXA RENDA', '03', 'N', '226', NULL, NULL, NULL, NULL),
('500345', '5004', 'MS', '5006', '5004', '50011', '50', 'DEODAPOLIS', NULL, '67', '79790000', '4', '9175', '9175', '06087', NULL, 'ATIVO', 'N', 'S', NULL, NULL, 'S', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '831,263', '-22,27600', '-54,16500', '418', 'S', '0,694', NULL, NULL, '50031', 'N', 'N', '1520', NULL, '5090', '5090', NULL, '1976', 'S', '2237', 'DEODÁPOLIS', 'N', '500345', 'N', 'N', 'S', NULL, '47', 'N', 'N', 'N', '29', 'DINÂMICA', '03', 'N', '296', NULL, NULL, NULL, NULL),
('410710', '4114', 'PR', '4106', '4101', '41001', '41', 'DIAMANTE DO NORTE', NULL, '44', '87990000', '8', '7539', '7539', '14070', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '242,894', '-22,65600', '-52,86000', '378', 'S', '0,723', NULL, NULL, '41900', 'N', 'N', '1533', NULL, '4190', '4190', NULL, '1963', 'S', '3280', 'DIAMANTE DO NORTE', 'N', '410710', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '98', 'ESTAGNADA', '03', 'N', '367', NULL, NULL, NULL, NULL),
('312160', '3104', 'MG', '3104', '3103', '31010', '31', 'DIAMANTINA', NULL, '38', '39100000', '5', '4431', '4431', '11216', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'S', 'N', 'N', 'N', 'N', NULL, 'N', '3869,83', '-18,24900', '-43,60000', '1113', 'S', '0,716', NULL, NULL, '31026', 'N', 'N', '1535', NULL, '3190', '3190', NULL, '1831', 'S', '1596', 'DIAMANTINA', 'N', '312160', 'N', 'S', 'S', NULL, '5', 'N', 'N', 'N', '241', 'ESTAGNADA', '03', 'N', '621', NULL, NULL, NULL, NULL),
('170700', '1714', 'TO', '1702', '1702', '17008', '17', 'DIANOPOLIS', NULL, '63', '77300000', '9', '9341', '9341', '28026', NULL, 'ATIVO', 'S', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '3217,179', '-11,62800', '-46,82100', '693', 'S', '0,701', NULL, NULL, '17900', 'S', 'N', '1537', NULL, '1790', '1790', NULL, '1989', 'S', '5432', 'DIANÓPOLIS', 'N', '170700', 'S', 'N', 'S', NULL, '124', 'N', 'N', 'S', '46', 'DINÂMICA', '03', 'N', '218', NULL, NULL, NULL, NULL),
('520710', '5211', 'GO', '5208', '5201', '52003', '52', 'DIORAMA', NULL, '64', '76260000', '5', '9343', '9343', '08072', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '687,339', '-16,23400', '-51,25600', '506', 'S', '0,729', NULL, NULL, '52900', 'N', 'N', '1543', NULL, '5290', '5290', NULL, '1958', 'S', '974', 'DIORAMA', 'N', '520710', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '79', 'DINÂMICA', '03', 'N', '352', NULL, NULL, NULL, NULL),
('312200', '3124', 'MG', '3107', '3112', '31063', '31', 'DIVINO', NULL, '32', '36820000', '9', '4439', '4439', '11220', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '338,716', '-20,61400', '-42,14900', '660', 'S', '0,605', NULL, NULL, '31042', 'S', 'N', '1548', NULL, '3190', '3190', NULL, '1938', 'S', '1600', 'DIVINO', 'N', '312200', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '245', 'ESTAGNADA', '03', 'N', '615', NULL, NULL, NULL, NULL),
('312220', '3116', 'MG', '3106', '3108', '31035', '31', 'DIVINOLANDIA DE MINAS', NULL, '33', '39735000', '7', '4443', '4443', '11222', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '132,754', '-18,80400', '-42,59800', '748', 'S', '0,623', NULL, NULL, '31036', 'N', 'N', '1552', NULL, '3190', '3190', NULL, '1962', 'S', '1602', 'DIVINOLÂNDIA DE MINAS', 'N', '312220', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '247', 'ESTAGNADA', '03', 'N', '625', NULL, NULL, NULL, NULL),
('170710', '1706', 'TO', '1702', '1701', '17003', '17', 'DIVINOPOLIS DO TOCANTINS', NULL, '63', '77670000', '8', '9719', '9719', '28027', NULL, 'ATIVO', 'S', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '2347,421', '-9,80000', '-49,21400', '270', 'S', '0,683', NULL, NULL, '17900', 'S', 'N', '1555', NULL, '1790', '1790', NULL, '1989', 'S', '5433', 'DIVINÓPOLIS DO TOCANTINS', 'N', '170710', 'S', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '47', 'ESTAGNADA', '03', 'N', '216', NULL, NULL, NULL, NULL),
('312240', '3121', 'MG', '3101', '3110', '31049', '31', 'DIVISA NOVA', NULL, '35', '37134000', '5', '4447', '4447', '11224', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '216,697', '-21,51100', '-46,19600', '877', 'S', '0,67', NULL, NULL, '31001', 'N', 'N', '1557', NULL, '3190', '3190', NULL, '1938', 'S', '1605', 'DIVISA NOVA', 'N', '312240', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '250', 'ALTA RENDA', '03', 'N', '607', NULL, NULL, NULL, NULL),
('170720', '1706', 'TO', '1702', '1701', '17003', '17', 'DOIS IRMAOS DO TOCANTINS', NULL, '63', '77685000', '7', '9345', '9345', '28028', NULL, 'ATIVO', 'S', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '3757,015', '-9,25800', '-49,06400', '241', 'S', '0,583', NULL, NULL, '17900', 'S', 'N', '1564', NULL, '1790', '1790', NULL, '1989', 'S', '5434', 'DOIS IRMÃOS DO TOCANTINS', 'N', '170720', 'S', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '48', 'ESTAGNADA', '03', 'N', '216', NULL, NULL, NULL, NULL),
('351420', '3515', 'SP', '3531', '3501', '35001', '35', 'DOLCINOPOLIS', NULL, '17', '15740000', '5', '6385', '6385', '21143', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '78,144', '-20,12300', '-50,51300', '463', 'S', '0,742', NULL, NULL, '35153', 'N', 'N', '1568', NULL, '3590', '3590', NULL, '1959', 'S', '4900', 'DOLCINÓPOLIS', 'N', '351420', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '159', 'ESTAGNADA', '03', 'N', '436', NULL, NULL, NULL, NULL),
('312250', '3123', 'MG', '3114', '3108', '31040', '31', 'DOM CAVATI', NULL, '33', '35148000', '4', '4449', '4449', '11225', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '69,088', '-19,37400', '-42,10600', '358', 'S', '0,688', NULL, NULL, '31037', 'N', 'N', '1572', NULL, '3104', '3190', NULL, '1962', 'S', '1608', 'DOM CAVATI', 'N', '312250', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '253', 'ESTAGNADA', '03', 'N', '628', NULL, NULL, NULL, NULL),
('220345', '2208', 'PI', '2210', '2203', '22011', '22', 'DOM INOCENCIO', NULL, '89', '64790000', '3', '1289', '1289', '16121', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'S', 'N', 'S', 'N', NULL, 'N', '4024,385', '-9,00200', '-41,97400', '340', 'S', '0,549', NULL, NULL, '22900', 'S', 'N', '1576', NULL, '2290', '2290', NULL, '1989', 'S', '3036', 'DOM INOCÊNCIO', 'N', '220345', 'N', 'S', 'S', NULL, '77', 'N', 'N', 'N', '75', 'DINÂMICA', '03', 'N', '140', NULL, NULL, NULL, NULL),
('351230', '3506', 'SP', '3518', '3504', '35023', '35', 'CONCHAS', NULL, '14', '18570000', '8', '6347', '6347', '21124', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '468,243', '-23,01500', '-48,01100', '503', 'S', '0,736', NULL, NULL, '35063', 'N', 'N', '1330', NULL, '3590', '3590', NULL, '1916', 'S', '4880', 'CONCHAS', 'N', '351230', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '139', 'ALTA RENDA', '03', 'N', '384', NULL, NULL, NULL, NULL),
('250450', '2506', 'PB', '2501', '2501', '25003', '25', 'CONDADO', NULL, '83', '58714000', '4', '1991', '1991', '13046', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'S', 'N', 'N', 'N', NULL, 'N', '280,913', '-6,91000', '-37,60100', '253', 'S', '0,594', NULL, NULL, '25900', 'S', 'N', '1334', NULL, '2504', '2590', NULL, '1961', 'S', '2614', 'CONDADO', 'N', '250450', 'N', 'S', 'S', NULL, '59', 'S', 'N', 'N', '59', 'ESTAGNADA', '03', 'N', '254', NULL, NULL, NULL, NULL),
('311783', '3129', 'MG', '3108', '3102', '31003', '31', 'CONEGO MARINHO', NULL, '38', '39489000', '6', '0590', '0590', '11783', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'S', 'N', 'S', 'N', 'N', 'N', NULL, 'N', '1617,916', '-15,29400', '-44,41800', '637', 'S', '0,621', NULL, NULL, '31053', 'S', 'N', '1339', NULL, '3190', '3190', NULL, '1997', 'S', '1552', 'CÔNEGO MARINHO', 'N', '311783', 'N', 'S', 'S', NULL, NULL, 'N', 'N', 'N', '197', 'DINÂMICA', '03', 'N', '635', NULL, NULL, NULL, NULL),
('311790', '3110', 'MG', '3101', '3110', '31052', '31', 'CONGONHAL', NULL, '35', '37557000', '0', '4357', '4357', '11179', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '205,756', '-22,15300', '-46,03900', '862', 'S', '0,712', NULL, NULL, '31007', 'N', 'N', '1343', NULL, '3190', '3190', NULL, '1953', 'S', '1554', 'CONGONHAL', 'N', '311790', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '199', 'ALTA RENDA', '03', 'N', '654', NULL, NULL, NULL, NULL),
('311830', '3103', 'MG', '3102', '3107', '31034', '31', 'CONSELHEIRO LAFAIETE', NULL, '31', '36400000', '4', '4365', '4365', '11183', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '369,544', '-20,66000', '-43,78600', '995', 'S', '0,761', NULL, NULL, '31014', 'N', 'N', '1348', NULL, '3190', '3190', NULL, '1790', 'S', '1558', 'CONSELHEIRO LAFAIETE', 'N', '311830', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '203', 'ESTAGNADA', '01', 'N', '584', NULL, NULL, NULL, NULL),
('430580', '4315', 'RS', '4311', '4301', '43003', '43', 'CONSTANTINA', NULL, '54', '99680000', '1', '8613', '8613', '19057', NULL, 'ATIVO', 'N', 'S', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'S', NULL, 'N', '202,999', '-27,73500', '-52,99200', '501', 'S', '0,754', NULL, NULL, '43900', 'N', 'N', '1352', NULL, '4390', '4390', NULL, '1959', 'S', '4011', 'CONSTANTINA', 'N', '430580', 'N', 'N', 'S', NULL, '56', 'N', 'N', 'N', '114', 'ESTAGNADA', '03', 'N', '476', NULL, NULL, NULL, NULL),
('311870', '3111', 'MG', '3101', '3110', '31050', '31', 'COQUEIRAL', NULL, '35', '37235000', '0', '4373', '4373', '11187', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '296,556', '-21,18900', '-45,44100', '867', 'S', '0,694', NULL, NULL, '31011', 'N', 'N', '1356', NULL, '3190', '3190', NULL, '1948', 'S', '1562', 'COQUEIRAL', 'N', '311870', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '207', 'ALTA RENDA', '03', 'N', '663', NULL, NULL, NULL, NULL),
('290900', '2920', 'BA', '2911', '2906', '29027', '29', 'CORDEIROS', NULL, '77', '46280000', '0', '3479', '3479', '04090', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'S', 'N', 'S', 'S', 'N', 'N', NULL, 'N', '554,511', '-15,03900', '-41,93500', '710', 'S', '0,579', NULL, NULL, '29084', 'S', 'N', '1364', NULL, '2990', '2990', NULL, '1961', 'S', '308', 'CORDEIROS', 'N', '290900', 'N', 'S', 'S', NULL, NULL, 'S', 'N', 'N', '108', 'ESTAGNADA', '03', 'N', '335', NULL, NULL, NULL, NULL),
('316110', '3129', 'MG', '3108', '3102', '31003', '31', 'SAO FRANCISCO', NULL, '38', '39300000', '6', '5221', '5221', '11611', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'S', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '3299,801', '-15,94900', '-44,86400', '695', 'S', '0,638', NULL, NULL, '31049', 'N', 'N', '4583', NULL, '3190', '3190', NULL, '1831', 'S', '2068', 'SÃO FRANCISCO', 'N', '316110', 'N', 'S', 'S', NULL, NULL, 'N', 'N', 'N', '713', 'DINÂMICA', '02', 'N', '614', NULL, NULL, NULL, NULL),
('220965', '2207', 'PI', '2207', '2204', '22015', '22', 'SAO FRANCISCO DE ASSIS DO PIAUI', NULL, '89', '64745000', '8', '0380', '0380', '16208', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'S', 'N', 'S', 'N', 'N', 'N', NULL, 'N', '842,453', '-8,23800', '-41,68600', '415', 'S', '0,485', NULL, NULL, '22900', 'S', 'N', '4585', NULL, '2290', '2290', NULL, '1997', 'S', '3145', 'SÃO FRANCISCO DE ASSIS DO PIAUÍ', 'N', '220965', 'N', 'S', 'S', NULL, '133', 'S', 'N', 'N', '186', 'DINÂMICA', '03', 'N', '75', NULL, NULL, NULL, NULL),
('330475', '3309', 'RJ', '3310', '3302', '33003', '33', 'SAO FRANCISCO DE ITABAPOANA', NULL, '22', '28230000', '5', '0782', '0782', '17088', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'S', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '1111,335', '-21,47000', '-41,11900', '8', 'S', '0,639', NULL, NULL, '33900', 'N', 'N', '4587', NULL, '3390', '3390', NULL, '1997', 'S', '3653', 'SÃO FRANCISCO DE ITABAPOANA', 'N', '330475', 'N', 'N', 'S', NULL, '65', 'N', 'N', 'N', '72', 'DINÂMICA', '03', 'N', '82', NULL, NULL, NULL, NULL),
('292920', '2901', 'BA', '2915', '2905', '29021', '29', 'SAO FRANCISCO DO CONDE', NULL, '71', '43900000', '6', '3883', '3883', '04292', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'S', 'N', 'N', NULL, 'N', '266,631', '-12,62800', '-38,68000', '11', 'S', '0,674', NULL, NULL, '29043', 'N', 'N', '4592', NULL, '2901', '2901', NULL, '1697', 'S', '556', 'SÃO FRANCISCO DO CONDE', 'N', '292920', 'N', 'S', 'S', NULL, NULL, 'S', 'N', 'N', '357', 'ALTA RENDA', '01', 'N', '178', NULL, NULL, NULL, NULL),
('316140', '3118', 'MG', '3107', '3112', '31063', '31', 'SAO FRANCISCO DO GLORIA', NULL, '32', '36810000', '3', '5227', '5227', '11614', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '164,023', '-20,78900', '-42,26800', '729', 'S', '0,663', NULL, NULL, '31045', 'S', 'N', '4593', NULL, '3190', '3190', NULL, '1953', 'S', '2071', 'SÃO FRANCISCO DO GLÓRIA', 'N', '316140', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '716', 'ESTAGNADA', '03', 'N', '643', NULL, NULL, NULL, NULL),
('211090', '2117', 'MA', '2111', '2104', '21018', '21', 'SAO FRANCISCO DO MARANHAO', NULL, '99', '65650000', '6', '0915', '0915', '09108', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '2745,804', '-6,25100', '-42,85700', '76', 'S', '0,528', NULL, NULL, '21900', 'S', 'N', '4595', NULL, '2190', '2190', NULL, '1835', 'S', '1316', 'SÃO FRANCISCO DO MARANHÃO', 'N', '211090', 'S', 'S', 'S', NULL, NULL, 'S', 'N', 'N', '178', 'BAIXA RENDA', '03', 'N', '186', NULL, NULL, NULL, NULL),
('231220', '2311', 'CE', '2309', '2301', '23007', '23', 'SANTA QUITERIA', NULL, '88', '62280000', '5', '1545', '1545', '05123', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'S', 'S', 'S', 'N', NULL, 'N', '4260,681', '-4,33200', '-40,15700', '197', 'S', '0,616', NULL, NULL, '23900', 'N', 'N', '4391', NULL, '2390', '2390', NULL, '1856', 'S', '774', 'SANTA QUITÉRIA', 'N', '231220', 'N', 'S', 'S', NULL, '49', 'N', 'N', 'N', '158', 'DINÂMICA', '03', 'N', '284', NULL, NULL, NULL, NULL),
('211020', '2114', 'MA', '2110', '2101', '21003', '21', 'SANTA RITA', NULL, '98', '65145000', '3', '0901', '0901', '09101', NULL, 'ATIVO', 'S', 'N', NULL, NULL, 'S', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '786,081', '-3,14400', '-44,32600', '28', 'S', '0,609', NULL, NULL, '21900', 'S', 'N', '4393', NULL, '2190', '2190', NULL, '1961', 'S', '1305', 'SANTA RITA', 'N', '211020', 'S', 'S', 'S', NULL, '97', 'S', 'N', 'N', '167', 'BAIXA RENDA', '03', 'N', '123', NULL, NULL, NULL, NULL),
('292840', '2925', 'BA', '2912', '2901', '29002', '29', 'SANTA RITA DE CASSIA', NULL, '77', '47150000', '6', '3549', '3549', '04125', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'S', 'N', 'N', 'S', 'N', 'N', NULL, 'N', '6071,116', '-11,00900', '-44,51900', '440', 'S', '0,605', NULL, NULL, '29071', 'S', 'N', '4397', NULL, '2990', '2990', NULL, '1840', 'S', '543', 'SANTA RITA DE CÁSSIA', 'N', '292840', 'N', 'S', 'S', NULL, NULL, 'N', 'N', 'N', '344', 'DINÂMICA', '03', 'N', '287', NULL, NULL, NULL, NULL),
('521940', '5214', 'GO', '5206', '5205', '52013', '52', 'SANTA RITA DO ARAGUAIA', NULL, '64', '75840000', '7', '9583', '9583', '08192', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '1361,764', '-17,32600', '-53,20500', '691', 'S', '0,714', NULL, NULL, '52900', 'N', 'N', '4400', NULL, '5290', '5290', NULL, '1953', 'S', '1098', 'SANTA RITA DO ARAGUAIA', 'N', '521940', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '206', 'ALTA RENDA', '03', 'N', '185', NULL, NULL, NULL, NULL),
('500755', '5010', 'MS', '5005', '5003', '50007', '50', 'SANTA RITA DO PARDO', NULL, '67', '79690000', '4', '9745', '9806', '06126', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '6141,615', '-21,30300', '-52,83100', '360', 'S', '0,642', NULL, NULL, '50042', 'N', 'N', '4404', NULL, '5090', '5090', NULL, '1989', 'S', '2275', 'SANTA RITA DO PARDO', 'N', '500755', 'N', 'N', 'S', NULL, '127', 'N', 'N', 'N', '69', 'ESTAGNADA', '03', 'N', '200', NULL, NULL, NULL, NULL),
('315970', '3107', 'MG', '3109', '3105', '31020', '31', 'SANTA ROSA DA SERRA', NULL, '34', '38805000', '4', '5193', '5193', '11597', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '296,342', '-19,53000', '-45,96600', '1011', 'S', '0,705', NULL, NULL, '31057', 'N', 'N', '4409', NULL, '3190', '3190', NULL, '1962', 'S', '2041', 'SANTA ROSA DA SERRA', 'N', '315970', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '686', 'ALTA RENDA', '03', 'N', '587', NULL, NULL, NULL, NULL),
('280650', '2801', 'SE', '2801', '2803', '28008', '28', 'SANTA ROSA DE LIMA', NULL, '79', '49640000', '3', '3229', '3229', '22065', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'S', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '67,607', '-10,64600', '-37,19400', '39', 'S', '0,592', NULL, NULL, '28900', 'S', 'N', '4411', NULL, '2890', '2890', NULL, '1953', 'S', '4729', 'SANTA ROSA DE LIMA', 'N', '280650', 'N', 'S', 'S', NULL, NULL, 'S', 'N', 'N', '63', 'DINÂMICA', '03', 'N', '104', NULL, NULL, NULL, NULL),
('220937', '2207', 'PI', '2207', '2204', '22013', '22', 'SANTA ROSA DO PIAUI', NULL, '89', '64518000', '7', '2261', '2261', '16145', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'S', 'N', 'S', 'N', 'S', 'N', NULL, 'N', '356,237', '-6,79900', '-42,28800', '0', 'S', '0,567', NULL, NULL, '22900', 'S', 'N', '4414', NULL, '2290', '2290', NULL, '1993', 'S', '3138', 'SANTA ROSA DO PIAUÍ', 'N', '220937', 'N', 'S', 'S', NULL, '133', 'N', 'N', 'N', '179', 'ESTAGNADA', '03', 'N', '75', NULL, NULL, NULL, NULL),
('320460', '3201', 'ES', '3207', '3203', '32008', '32', 'SANTA TERESA', NULL, '27', '29650000', '9', '5691', '5691', '07046', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'S', 'S', 'N', NULL, 'N', '694,532', '-19,93600', '-40,60000', '655', 'S', '0,714', NULL, NULL, '32005', 'N', 'N', '4419', NULL, '3290', '3290', NULL, '1890', 'S', '882', 'SANTA TERESA', 'N', '320460', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '64', 'ESTAGNADA', '03', 'N', '173', NULL, NULL, NULL, NULL),
('421568', '4201', 'SC', '4213', '4201', '42002', '42', 'SANTA TEREZINHA DO PROGRESSO', NULL, '49', '89983000', '7', '0938', '0938', '20288', NULL, 'ATIVO', 'N', 'S', NULL, NULL, 'S', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '118,997', '-26,61900', '-53,20200', '400', 'S', '0,682', NULL, NULL, '42900', 'N', 'N', '4431', NULL, '4290', '4290', NULL, '1997', 'S', '4606', 'SANTA TEREZINHA DO PROGRESSO', 'N', '421568', 'N', 'N', 'S', NULL, NULL, 'S', 'N', 'N', '235', 'ALTA RENDA', '03', 'N', '491', NULL, NULL, NULL, NULL),
('431730', '4303', 'RS', '4309', '4307', '43035', '43', 'SANTA VITORIA DO PALMAR', NULL, '53', '96230000', '1', '8849', '8849', '19174', NULL, 'ATIVO', 'N', 'S', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '5244,177', '-33,51900', '-53,36800', '23', 'S', '0,712', NULL, NULL, '43900', 'N', 'N', '4434', NULL, '4390', '4390', NULL, '1872', 'S', '4250', 'SANTA VITÓRIA DO PALMAR', 'N', '431730', 'N', 'N', 'S', NULL, '104', 'N', 'N', 'N', '371', 'ALTA RENDA', '03', 'N', '477', NULL, NULL, NULL, NULL),
('315850', '3114', 'MG', '3103', '3107', '31027', '31', 'SANTANA DE PIRAPAMA', NULL, '31', '35785000', '8', '5169', '5169', '11585', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '1220,985', '-19,00600', '-44,04300', '628', 'S', '0,628', NULL, NULL, '31024', 'S', 'N', '4444', NULL, '3190', '3190', NULL, '1948', 'S', '2045', 'SANTANA DE PIRAPAMA', 'N', '315850', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '690', 'ESTAGNADA', '03', 'N', '661', NULL, NULL, NULL, NULL),
('231210', '2320', 'CE', '2308', '2307', '23032', '23', 'SANTANA DO CARIRI', NULL, '88', '63190000', '6', '1543', '1543', '05122', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'S', 'S', 'N', 'N', NULL, 'N', '768,768', '-7,18800', '-39,73700', '500', 'S', '0,612', NULL, NULL, '23900', 'S', 'N', '4447', NULL, '2302', '2390', NULL, '1885', 'S', '776', 'SANTANA DO CARIRI', 'N', '231210', 'N', 'S', 'S', NULL, '131', 'N', 'N', 'N', '160', 'ESTAGNADA', '03', 'N', '339', NULL, NULL, NULL, NULL),
('270800', '2709', 'AL', '2703', '2701', '27003', '27', 'SANTANA DO IPANEMA', NULL, '82', '57500000', '6', '2859', '2859', '02080', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'S', 'N', 'S', 'S', 'S', 'N', NULL, 'N', '437,847', '-9,37800', '-37,24500', '250', 'S', '0,591', NULL, NULL, '27008', 'N', 'N', '4450', NULL, '2790', '2790', NULL, '1875', 'S', '107', 'SANTANA DO IPANEMA', 'N', '270800', 'N', 'S', 'S', NULL, '42', 'S', 'N', 'S', '86', 'DINÂMICA', '03', 'N', '46', NULL, NULL, NULL, NULL),
('315890', '3124', 'MG', '3110', '3112', '31061', '31', 'SANTANA DO MANHUACU', NULL, '33', '36940000', '4', '5177', '5177', '11589', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '346,964', '-20,10800', '-41,92500', '650', 'S', '0,621', NULL, NULL, '31059', 'S', 'N', '4454', NULL, '3190', '3190', NULL, '1962', 'S', '2049', 'SANTANA DO MANHUAÇU', 'N', '315890', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '694', 'ESTAGNADA', '03', 'N', '641', NULL, NULL, NULL, NULL),
('270810', '2703', 'AL', '2704', '2703', '27008', '27', 'SANTANA DO MUNDAU', NULL, '82', '57840000', '5', '2861', '2861', '02081', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'S', 'N', 'N', NULL, 'N', '223,615', '-9,16800', '-36,22200', '221', 'S', '0,519', NULL, NULL, '27011', 'S', 'N', '4457', NULL, '2790', '2790', NULL, '1960', 'S', '108', 'SANTANA DO MUNDAÚ', 'N', '270810', 'N', 'S', 'S', NULL, '126', 'S', 'N', 'N', '87', 'DINÂMICA', '03', 'N', '169', NULL, NULL, NULL, NULL),
('251360', '2507', 'PB', '2501', '2501', '25005', '25', 'SANTANA DOS GARROTES', NULL, '83', '58795000', '4', '2173', '2173', '13137', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'S', 'N', 'N', 'N', NULL, 'N', '353,813', '-7,38400', '-37,98600', '322', 'S', '0,594', NULL, NULL, '25900', 'S', 'N', '4463', NULL, '2590', '2590', NULL, '1961', 'S', '2727', 'SANTANA DOS GARROTES', 'N', '251360', 'N', 'S', 'S', NULL, NULL, 'N', 'N', 'N', '174', 'BAIXA RENDA', '03', 'N', '73', NULL, NULL, NULL, NULL),
('150680', '1509', 'PA', '1510', '1501', '15002', '15', 'SANTAREM', NULL, '93', '68001970', '7', '0535', '0535', '12068', NULL, 'ATIVO', 'S', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '22887,08', '-2,44300', '-54,70800', '51', 'S', '0,691', NULL, NULL, '15900', 'N', 'S', '4467', NULL, '1590', '1590', NULL, '1755', 'S', '2524', 'SANTARÉM', 'N', '150680', 'S', 'N', 'S', NULL, '18', 'S', 'S', 'S', '114', 'ESTAGNADA', '01', 'N', '446', NULL, NULL, NULL, NULL),
('421570', '4207', 'SC', '4214', '4205', '42016', '42', 'SANTO AMARO DA IMPERATRIZ', NULL, '48', '88140000', '3', '8309', '8309', '20155', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '310,735', '-27,68800', '-48,77900', '18', 'S', '0,781', NULL, NULL, '42900', 'N', 'N', '4473', NULL, '4201', '4201', NULL, '1958', 'S', '4608', 'SANTO AMARO DA IMPERATRIZ', 'N', '421570', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '237', 'ALTA RENDA', '03', 'N', '494', NULL, NULL, NULL, NULL),
('354790', '3513', 'SP', '3530', '3502', '35015', '35', 'SANTO ANTONIO DA ALEGRIA', NULL, '16', '14390000', '8', '7059', '7059', '21480', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '309,677', '-21,08700', '-47,15100', '791', 'S', '0,702', NULL, NULL, '35133', 'N', 'N', '4481', NULL, '3590', '3590', NULL, '1885', 'S', '5279', 'SANTO ANTÔNIO DA ALEGRIA', 'N', '354790', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '538', 'ALTA RENDA', '03', 'N', '166', NULL, NULL, NULL, NULL),
('412410', '4119', 'PR', '4105', '4104', '41016', '41', 'SANTO ANTONIO DA PLATINA', NULL, '43', '86430000', '3', '7859', '7859', '14230', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '721,625', '-23,29500', '-50,07700', '505', 'S', '0,718', NULL, NULL, '41900', 'N', 'N', '4484', NULL, '4190', '4190', NULL, '1914', 'S', '3518', 'SANTO ANTÔNIO DA PLATINA', 'N', '412410', 'N', 'N', 'S', NULL, '146', 'N', 'N', 'N', '336', 'ESTAGNADA', '03', 'N', '427', NULL, NULL, NULL, NULL),
('315990', '3115', 'MG', '3105', '3109', '31046', '31', 'SANTO ANTONIO DO AMPARO', NULL, '35', '37262000', '2', '5197', '5197', '11599', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '491,725', '-20,94600', '-44,91900', '1013', 'S', '0,672', NULL, NULL, '31033', 'N', 'N', '4491', NULL, '3190', '3190', NULL, '1938', 'S', '2053', 'SANTO ANTÔNIO DO AMPARO', 'N', '315990', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '698', 'ESTAGNADA', '03', 'N', '593', NULL, NULL, NULL, NULL),
('431647', '4312', 'RS', '4312', '4301', '43006', '43', 'SALVADOR DAS MISSOES', NULL, '55', '97940000', '7', '6061', '6061', '19401', NULL, 'ATIVO', 'N', 'S', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '94,044', '-28,12600', '-54,83500', '216', 'S', '0,753', NULL, NULL, '43900', 'N', 'N', '4279', NULL, '4390', '4390', NULL, '1993', 'S', '4240', 'SALVADOR DAS MISSÕES', 'N', '431647', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '358', 'ESTAGNADA', '03', 'N', '467', NULL, NULL, NULL, NULL),
('210970', '2106', 'MA', '2109', '2105', '21021', '21', 'SAMBAIBA', NULL, '99', '65830000', '0', '0893', '0893', '09097', NULL, 'ATIVO', 'S', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '2478,569', '-7,14000', '-45,34600', '212', 'S', '0,565', NULL, NULL, '21900', 'S', 'N', '4282', NULL, '2190', '2190', NULL, '1953', 'S', '1298', 'SAMBAÍBA', 'N', '210970', 'S', 'S', 'S', NULL, NULL, 'S', 'N', 'N', '160', 'DINÂMICA', '03', 'N', '355', NULL, NULL, NULL, NULL),
('431660', '4306', 'RS', '4311', '4301', '43005', '43', 'SANANDUVA', NULL, '54', '99840000', '0', '8835', '8835', '19167', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '504,551', '-27,95000', '-51,80700', '636', 'S', '0,747', NULL, NULL, '43900', 'N', 'N', '4284', NULL, '4390', '4390', NULL, '1954', 'S', '4242', 'SANANDUVA', 'N', '431660', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '360', 'ESTAGNADA', '03', 'N', '474', NULL, NULL, NULL, NULL),
('354550', '3511', 'SP', '3532', '3508', '35036', '35', 'SANDOVALINA', NULL, '18', '19250000', '6', '7011', '7011', '21456', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'S', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '455,393', '-22,45600', '-51,76300', '424', 'S', '0,709', NULL, NULL, '35112', 'N', 'N', '4287', NULL, '3590', '3590', NULL, '1959', 'S', '5254', 'SANDOVALINA', 'N', '354550', 'N', 'N', 'S', NULL, '73', 'N', 'N', 'N', '513', 'ALTA RENDA', '03', 'N', '323', NULL, NULL, NULL, NULL),
('412310', '4118', 'PR', '4105', '4104', '41015', '41', 'SANTA AMELIA', NULL, '43', '86370000', '5', '7839', '7839', '14220', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'S', NULL, 'N', '77,903', '-23,26600', '-50,42400', '500', 'S', '0,653', NULL, NULL, '41900', 'N', 'N', '4292', NULL, '4190', '4190', NULL, '1951', 'S', '3503', 'SANTA AMÉLIA', 'N', '412310', 'N', 'N', 'S', NULL, '146', 'N', 'N', 'N', '321', 'ESTAGNADA', '03', 'N', '31', NULL, NULL, NULL, NULL),
('315725', '3123', 'MG', '3114', '3108', '31040', '31', 'SANTA BARBARA DO LESTE', NULL, '33', '35328000', '2', '2667', '2667', '11756', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'S', 'N', NULL, 'N', '110,789', '-19,97800', '-42,14000', '850', 'S', '0,613', NULL, NULL, '31034', 'N', 'N', '4297', NULL, '3190', '3190', NULL, '1993', 'S', '2020', 'SANTA BÁRBARA DO LESTE', 'N', '315725', 'N', 'N', 'S', NULL, NULL, 'S', 'N', 'N', '665', 'ESTAGNADA', '03', 'N', '616', NULL, NULL, NULL, NULL),
('430673', '4314', 'RS', '4312', '4301', '43002', '43', 'DOUTOR MAURICIO CARDOSO', NULL, '55', '98925000', '4', '8425', '8425', '19268', NULL, 'ATIVO', 'N', 'S', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '256,323', '-27,50600', '-54,36100', '282', 'S', '0,706', NULL, NULL, '43900', 'N', 'N', '1603', NULL, '4390', '4390', NULL, '1989', 'S', '4033', 'DOUTOR MAURÍCIO CARDOSO', 'N', '430673', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '139', 'ESTAGNADA', '03', 'N', '470', NULL, NULL, NULL, NULL),
('170730', '1709', 'TO', '1702', '1701', '17004', '17', 'DUERE', NULL, '63', '77485000', '6', '9347', '9347', '28029', NULL, 'ATIVO', 'S', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '3424,836', '-11,34400', '-49,27100', '235', 'S', '0,679', NULL, NULL, '17900', 'S', 'N', '1613', NULL, '1790', '1790', NULL, '1989', 'S', '5435', 'DUERÉ', 'N', '170730', 'S', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '49', 'ESTAGNADA', '03', 'N', '505', NULL, NULL, NULL, NULL),
('520735', '5202', 'GO', '5210', '5205', '52014', '52', 'EDEALINA', NULL, '64', '75945000', '2', '9795', '9795', '08260', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '603,652', '-17,42600', '-49,66500', '578', 'S', '0,702', NULL, NULL, '52900', 'N', 'N', '1620', NULL, '5290', '5290', NULL, '1989', 'S', '977', 'EDEALINA', 'N', '520735', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '82', 'ESTAGNADA', '03', 'N', '60', NULL, NULL, NULL, NULL),
('351480', '3512', 'SP', '3520', '3514', '35055', '35', 'ELDORADO', NULL, '13', '11960000', '9', '6397', '6397', '21149', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'S', 'N', 'N', 'N', 'S', 'N', NULL, 'N', '1656,728', '-24,52000', '-48,10800', '62', 'S', '0,691', NULL, NULL, '35121', 'N', 'N', '1623', NULL, '3590', '3590', NULL, '1842', 'S', '4906', 'ELDORADO', 'N', '351480', 'N', 'N', 'S', NULL, '100', 'N', 'N', 'N', '165', 'ESTAGNADA', '03', 'N', '222', NULL, NULL, NULL, NULL),
('291030', '2929', 'BA', '2915', '2903', '29012', '29', 'ELISIO MEDRADO', NULL, '75', '45305000', '5', '3505', '3505', '04103', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'S', 'S', 'N', 'N', NULL, 'N', '199,541', '-12,94600', '-39,52200', '390', 'S', '0,623', NULL, NULL, '29044', 'S', 'N', '1631', NULL, '2990', '2990', NULL, '1962', 'S', '322', 'ELÍSIO MEDRADO', 'N', '291030', 'N', 'S', 'S', NULL, NULL, 'S', 'N', 'N', '122', 'ESTAGNADA', '03', 'N', '106', NULL, NULL, NULL, NULL),
('351512', '3511', 'SP', '3532', '3508', '35036', '35', 'EMILIANOPOLIS', NULL, '18', '19350000', '9', '2961', '2961', '21598', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '223,311', '-21,83300', '-51,48300', '354', 'S', '0,727', NULL, NULL, '35112', 'N', 'N', '1637', NULL, '3590', '3590', NULL, '1993', 'S', '4912', 'EMILIANÓPOLIS', 'N', '351512', 'N', 'N', 'S', NULL, '73', 'S', 'N', 'N', '171', 'ALTA RENDA', '03', 'N', '323', NULL, NULL, NULL, NULL),
('430690', '4308', 'RS', '4308', '4307', '43032', '43', 'ENCRUZILHADA DO SUL', NULL, '51', '96610000', '8', '8635', '8635', '19068', NULL, 'ATIVO', 'N', 'S', NULL, NULL, 'S', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '3438,503', '-30,54400', '-52,52200', '432', 'S', '0,657', NULL, NULL, '43900', 'N', 'N', '1641', NULL, '4390', '4390', NULL, '1849', 'S', '4037', 'ENCRUZILHADA DO SUL', 'N', '430690', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '143', 'ESTAGNADA', '03', 'N', '483', NULL, NULL, NULL, NULL),
('410750', '4111', 'PR', '4106', '4102', '41005', '41', 'ENGENHEIRO BELTRAO', NULL, '44', '87270000', '4', '7547', '7547', '14074', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '467,257', '-23,79700', '-52,26900', '470', 'S', '0,73', NULL, NULL, '41900', 'N', 'N', '1643', NULL, '4190', '4190', NULL, '1954', 'S', '3288', 'ENGENHEIRO BELTRÃO', 'N', '410750', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '105', 'ESTAGNADA', '03', 'N', '141', NULL, NULL, NULL, NULL),
('351515', '3510', 'SP', '3529', '3507', '35031', '35', 'ENGENHEIRO COELHO', NULL, '19', '13165000', '2', '2949', '2949', '21599', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '109,798', '-22,48800', '-47,21500', '655', 'S', '0,732', NULL, NULL, '35102', 'N', 'N', '1645', NULL, '3503', '3503', NULL, '1993', 'S', '4913', 'ENGENHEIRO COELHO', 'N', '351515', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '172', 'ALTA RENDA', '01', 'N', '327', NULL, NULL, NULL, NULL),
('312385', '3123', 'MG', '3114', '3108', '31040', '31', 'ENTRE FOLHAS', NULL, '33', '35324000', '8', '2663', '2663', '11733', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '85,87', '-19,62500', '-42,23100', '495', 'S', '0,634', NULL, NULL, '31034', 'N', 'N', '1649', NULL, '3104', '3190', NULL, '1993', 'S', '1623', 'ENTRE FOLHAS', 'N', '312385', 'N', 'N', 'S', NULL, NULL, 'S', 'N', 'N', '268', 'ESTAGNADA', '03', 'N', '616', NULL, NULL, NULL, NULL),
('291050', '2903', 'BA', '2914', '2904', '29018', '29', 'ENTRE RIOS', NULL, '75', '48180000', '3', '3509', '3509', '04105', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'S', 'S', 'N', NULL, 'N', '1235,821', '-11,94200', '-38,08400', '162', 'S', '0,615', NULL, NULL, '29051', 'N', 'N', '1651', NULL, '2990', '2990', NULL, '1872', 'S', '324', 'ENTRE RIOS', 'N', '291050', 'N', 'S', 'S', NULL, NULL, 'N', 'N', 'N', '124', 'BAIXA RENDA', '03', 'N', '400', NULL, NULL, NULL, NULL),
('312390', '3120', 'MG', '3102', '3107', '31034', '31', 'ENTRE RIOS DE MINAS', NULL, '31', '35490000', '8', '4477', '4477', '11239', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'S', 'N', NULL, 'N', '462,816', '-20,67100', '-44,06600', '957', 'S', '0,672', NULL, NULL, '31014', 'N', 'N', '1652', NULL, '3190', '3190', NULL, '1875', 'S', '1624', 'ENTRE RIOS DE MINAS', 'N', '312390', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '269', 'ESTAGNADA', '03', 'N', '583', NULL, NULL, NULL, NULL),
('430695', '4311', 'RS', '4311', '4301', '43004', '43', 'ENTRE RIOS DO SUL', NULL, '54', '99645000', '7', '8421', '8421', '19271', NULL, 'ATIVO', 'N', 'S', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '120,444', '-27,52800', '-52,73300', '605', 'S', '0,703', NULL, NULL, '43900', 'N', 'N', '1654', NULL, '4390', '4390', NULL, '1989', 'S', '4039', 'ENTRE RIOS DO SUL', 'N', '430695', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '145', 'ESTAGNADA', '03', 'N', '472', NULL, NULL, NULL, NULL),
('120025', '1202', 'AC', '1201', '1202', '12005', '12', 'EPITACIOLANDIA', NULL, '68', '69934000', '2', '0651', '0651', '24006', NULL, 'ATIVO', 'S', 'S', NULL, NULL, 'S', 'N', 'N', 'S', 'N', 'N', NULL, 'N', '1659,131', '-11,02900', '-68,74100', '0', 'S', '0,653', NULL, NULL, '12900', 'S', 'N', '1657', NULL, '1290', '1290', NULL, '1993', 'S', '7', 'EPITACIOLÂNDIA', 'N', '120025', 'S', 'N', 'S', NULL, '4', 'S', 'N', 'N', '7', 'ESTAGNADA', '03', 'N', '168', NULL, NULL, NULL, NULL),
('230427', '2310', 'CE', '2306', '2305', '23025', '23', 'ERERE', NULL, '88', '63470000', '7', '1245', '1245', '05159', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'S', 'N', 'S', 'S', 'N', 'N', NULL, 'N', '382,73', '-6,03200', '-38,34900', '200', 'S', '0,61', NULL, NULL, '23900', 'S', 'N', '1661', NULL, '2390', '2390', NULL, '1989', 'S', '671', 'ERERÊ', 'N', '230427', 'N', 'S', 'S', NULL, NULL, 'S', 'N', 'N', '55', 'BAIXA RENDA', '03', 'N', '336', NULL, NULL, NULL, NULL),
('430730', '4319', 'RS', '4311', '4301', '43003', '43', 'ERVAL SECO', NULL, '55', '98390000', '2', '8643', '8643', '19072', NULL, 'ATIVO', 'N', 'S', NULL, NULL, 'S', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '363,892', '-27,54900', '-53,50400', '425', 'S', '0,685', NULL, NULL, '43900', 'N', 'N', '1666', NULL, '4390', '4390', NULL, '1963', 'S', '4045', 'ERVAL SECO', 'N', '430730', 'N', 'N', 'S', NULL, '56', 'N', 'N', 'N', '151', 'ESTAGNADA', '03', 'N', '471', NULL, NULL, NULL, NULL),
('250600', '2503', 'PB', '2502', '2503', '25014', '25', 'ESPERANCA', NULL, '83', '58135000', '4', '2021', '2021', '13061', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'S', 'S', 'S', 'N', NULL, 'N', '165,189', '-7,02300', '-35,86000', '631', 'S', '0,623', NULL, NULL, '25900', 'S', 'N', '1673', NULL, '2502', '2590', NULL, '1925', 'S', '2632', 'ESPERANÇA', 'N', '250600', 'N', 'S', 'S', NULL, '24', 'N', 'N', 'S', '77', 'ESTAGNADA', '03', 'N', '310', NULL, NULL, NULL, NULL),
('410754', '4110', 'PR', '4108', '4108', '41029', '41', 'ESPIGAO ALTO DO IGUACU', NULL, '46', '85465000', '6', '0852', '0852', '14400', NULL, 'ATIVO', 'N', 'S', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'S', NULL, 'N', '326,446', '-25,42400', '-52,83600', '618', 'S', '0,636', NULL, NULL, '41900', 'N', 'N', '1679', NULL, '4190', '4190', NULL, '1997', 'S', '3291', 'ESPIGÃO ALTO DO IGUAÇU', 'N', '410754', 'N', 'N', 'S', NULL, '25', 'N', 'N', 'N', '108', 'ESTAGNADA', '03', 'N', '258', NULL, NULL, NULL, NULL),
('430755', '4311', 'RS', '4311', '4301', '43004', '43', 'ESTACAO', NULL, '54', '99930000', '9', '7301', '7301', '19274', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '100,266', '-27,91100', '-52,26000', '680', 'S', '0,753', NULL, NULL, '43900', 'N', 'N', '1688', NULL, '4390', '4390', NULL, '1989', 'S', '4049', 'ESTAÇÃO', 'N', '430755', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '155', 'ESTAGNADA', '03', 'N', '472', NULL, NULL, NULL, NULL),
('430783', '4312', 'RS', '4312', '4301', '43007', '43', 'EUGENIO DE CASTRO', NULL, '55', '98860000', '1', '8413', '8413', '19275', NULL, 'ATIVO', 'N', 'S', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '419,376', '-28,52500', '-54,14900', '315', 'S', '0,712', NULL, NULL, '43900', 'N', 'N', '1706', NULL, '4390', '4390', NULL, '1989', 'S', '4054', 'EUGÊNIO DE CASTRO', 'N', '430783', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '160', 'ESTAGNADA', '03', 'N', '467', NULL, NULL, NULL, NULL),
('312510', '3110', 'MG', '3101', '3110', '31052', '31', 'EXTREMA', NULL, '35', '37640000', '1', '4501', '4501', '11251', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '243,099', '-22,85500', '-46,31800', '973', 'S', '0,732', NULL, NULL, '31007', 'N', 'N', '1711', NULL, '3190', '3190', NULL, '1901', 'S', '1636', 'EXTREMA', 'N', '312510', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '281', 'ALTA RENDA', '03', 'N', '654', NULL, NULL, NULL, NULL),
('260530', '2609', 'PE', '2605', '2601', '26001', '26', 'EXU', NULL, '87', '56230000', '1', '2405', '2405', '15053', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'S', 'N', 'S', 'N', 'N', 'N', NULL, 'N', '1473,958', '-7,51200', '-39,72400', '523', 'S', '0,576', NULL, NULL, '26900', 'N', 'N', '1713', NULL, '2690', '2690', NULL, '1907', 'S', '2836', 'EXU', 'N', '260530', 'N', 'S', 'S', NULL, '81', 'S', 'N', 'N', '59', 'DINÂMICA', '03', 'N', '260', NULL, NULL, NULL, NULL),
('520753', '5210', 'GO', '5208', '5201', '52002', '52', 'FAINA', NULL, '62', '76740000', '5', '9797', '9797', '08261', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'S', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '1944,953', '-15,44600', '-50,36100', '360', 'S', '0,65', NULL, NULL, '52900', 'N', 'N', '1716', NULL, '5290', '5290', NULL, '1989', 'S', '980', 'FAINA', 'N', '520753', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '85', 'DINÂMICA', '03', 'N', '236', NULL, NULL, NULL, NULL),
('410657', '4108', 'PR', '4108', '4107', '41026', '41', 'CRUZEIRO DO IGUACU', NULL, '46', '85598000', '1', '5473', '5473', '14330', NULL, 'ATIVO', 'N', 'S', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '161,493', '-25,61600', '-53,12800', '535', 'S', '0,709', NULL, NULL, '41900', 'N', 'N', '1461', NULL, '4190', '4190', NULL, '1993', 'S', '3274', 'CRUZEIRO DO IGUAÇU', 'N', '410657', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '91', 'ESTAGNADA', '03', 'N', '34', NULL, NULL, NULL, NULL),
('410670', '4114', 'PR', '4106', '4101', '41001', '41', 'CRUZEIRO DO SUL', NULL, '44', '87650000', '4', '7531', '7531', '14066', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '258,78', '-22,96200', '-52,16100', '358', 'S', '0,713', NULL, NULL, '41900', 'N', 'N', '1463', NULL, '4190', '4190', NULL, '1955', 'S', '3276', 'CRUZEIRO DO SUL', 'N', '410670', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '93', 'ESTAGNADA', '03', 'N', '367', NULL, NULL, NULL, NULL),
('410685', '4122', 'PR', '4105', '4103', '41012', '41', 'CRUZMALTINA', NULL, '43', '86855000', '2', '0848', '0848', '14399', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '312,299', '-24,01300', '-51,45900', '690', 'S', '0,666', NULL, NULL, '41900', 'S', 'N', '1468', NULL, '4190', '4190', NULL, '1997', 'S', '3277', 'CRUZMALTINA', 'N', '410685', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '94', 'ESTAGNADA', '03', 'N', '316', NULL, NULL, NULL, NULL),
('250523', '2501', 'PB', '2503', '2504', '25020', '25', 'CUITE DE MAMANGUAPE', NULL, '83', '58289000', '8', '0474', '0474', '13190', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'S', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '109,806', '-6,91500', '-35,25200', '75', 'S', '0,524', NULL, NULL, '25900', 'S', 'N', '1473', NULL, '2590', '2590', NULL, '1997', 'S', '2622', 'CUITÉ DE MAMANGUAPE', 'N', '250523', 'N', 'S', 'S', NULL, '103', 'S', 'N', 'N', '67', 'BAIXA RENDA', '03', 'N', '252', NULL, NULL, NULL, NULL),
('410690', '4102', 'PR', '4107', '4110', '41037', '41', 'CURITIBA', NULL, '41', '80001970', '2', '7535', '7535', '14068', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'S', 'N', 'N', 'N', 'N', 'S', NULL, 'S', '434,967', '-25,42800', '-49,27300', '934', 'S', '0,823', NULL, NULL, '41900', 'N', 'N', '1488', NULL, '4101', '4101', NULL, '1693', 'S', '3278', 'CURITIBA', 'N', '410690', 'N', 'N', 'S', NULL, NULL, 'S', 'S', 'N', '95', 'ALTA RENDA', '01', 'N', '204', NULL, NULL, NULL, NULL),
('150280', '1508', 'PA', '1512', '1502', '15005', '15', 'CURRALINHO', NULL, '91', '68815000', '6', '0455', '0455', '12028', NULL, 'ATIVO', 'S', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '3617,24', '-1,81400', '-49,79500', '15', 'S', '0,502', NULL, NULL, '15900', 'S', 'N', '1497', NULL, '1590', '1590', NULL, '1865', 'S', '2454', 'CURRALINHO', 'N', '150280', 'S', 'N', 'S', NULL, '129', 'N', 'N', 'N', '43', 'DINÂMICA', '03', 'N', '509', NULL, NULL, NULL, NULL);
INSERT INTO `tb_municipio` (`CO_MUNICIPIO_IBGE`, `CO_REGIONAL_SAUDE`, `SG_UF`, `CO_MACRORREGIONAL`, `CO_MESORREGIAO`, `CO_MICRORREGIAO`, `CO_UF_IBGE`, `NO_MUNICIPIO`, `SG_MUNICIPIO`, `NU_DDD`, `NU_CEP`, `DV_MUNICIPIO_IBGE`, `CO_MUNICIPIO_SIAFI`, `CO_MUNICIPIO_SIAPE`, `CO_SINPAS`, `CO_REGIAO_CORREIO`, `ST_MUNICIPIO`, `ST_AMAZONIA`, `ST_FRONTEIRA`, `CO_SUCESSOR`, `NO_ANTERIOR`, `ST_COMUNIDADE_SOLIDARIA`, `ST_SECA`, `ST_SEMI_ARIDO`, `ST_PRMI`, `ST_CALAMIDADE`, `ST_INDIGENA`, `NU_DISTANCIA_CAPITAL`, `ST_CAPITAL`, `NU_AREA`, `NU_LATITUDE`, `NU_LONGITUDE`, `NU_ALTITUDE`, `ST_REGISTRO_ATIVO`, `NU_IDH`, `CO_MUNICIPIO_CORREIO`, `CO_MUNICIPIO_INSS`, `CO_MICRORREGIONAL_SAUDE`, `ST_PITS`, `ST_QUILOMBOLA`, `CO_SEQ_ANTIGO`, `NO_POPULAR`, `CO_REGIAO_METROPOLITANA`, `CO_AGLOMERADO_URBANO`, `NU_ANO_EXTINCAO`, `NU_ANO_INSTALACAO`, `ST_IBGE`, `CO_MUNICIPIO_SVS`, `NO_MUNICIPIO_ACENTUADO`, `ST_RIDE`, `CO_MUNICIPIO_CNES`, `ST_SUDAM`, `ST_SUDENE`, `ST_CADSUS`, `CO_MUNICIPIO_ORIGEM`, `CO_TERRITORIO_CIDADANIA`, `ST_PSE`, `ST_PAN`, `ST_PACTO_RMINAL`, `CO_MUNICIPIO_TABNET_RJ`, `TP_TIPOLOGIA_PNDR`, `CO_GRUPO_PAC2`, `ST_CNES`, `CO_REGIAO_SAUDE`, `ST_PACTO`, `ST_CIB_SAS`, `DT_MANUTENCAO`, `FSDFSD`) VALUES
('250535', '2504', 'PB', '2502', '2503', '25012', '25', 'DAMIAO', NULL, '83', '58173000', '2', '0478', '0478', '13192', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'S', 'N', 'S', 'N', NULL, 'N', '109,76', '-6,63200', '-35,91000', '0', 'S', '0,521', NULL, NULL, '25900', 'S', 'N', '1506', NULL, '2590', '2590', NULL, '1997', 'S', '2626', 'DAMIÃO', 'N', '250535', 'N', 'S', 'S', NULL, '160', 'N', 'N', 'N', '71', 'BAIXA RENDA', '03', 'N', '137', NULL, NULL, NULL, NULL),
('520690', '5216', 'GO', '5210', '5205', '52017', '52', 'DAVINOPOLIS', NULL, '64', '75730000', '9', '9339', '9339', '08070', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'S', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '520,04', '-18,15300', '-47,56200', '771', 'S', '0,716', NULL, NULL, '52900', 'N', 'N', '1513', NULL, '5290', '5290', NULL, '1963', 'S', '973', 'DAVINÓPOLIS', 'N', '520690', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '78', 'ALTA RENDA', '03', 'N', '351', NULL, NULL, NULL, NULL),
('510345', '5105', 'MT', '5105', '5103', '51013', '51', 'DENISE', NULL, '65', '78380000', '2', '9833', '9833', '10121', NULL, 'ATIVO', 'S', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '1300,924', '-14,74000', '-57,05400', '211', 'S', '0,683', NULL, NULL, '51900', 'S', 'N', '1519', NULL, '5190', '5190', NULL, '1982', 'S', '2321', 'DENISE', 'N', '510345', 'S', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '40', 'ESTAGNADA', '03', 'N', '77', NULL, NULL, NULL, NULL),
('430632', '4319', 'RS', '4311', '4301', '43002', '43', 'DERRUBADAS', NULL, '55', '98528000', '0', '6073', '6073', '19356', NULL, 'ATIVO', 'N', 'S', NULL, NULL, 'S', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '361,284', '-27,26500', '-53,86100', '485', 'S', '0,707', NULL, NULL, '43900', 'N', 'N', '1522', NULL, '4390', '4390', NULL, '1993', 'S', '4023', 'DERRUBADAS', 'N', '430632', 'N', 'N', 'S', NULL, '147', 'N', 'N', 'N', '129', 'ESTAGNADA', '03', 'N', '471', NULL, NULL, NULL, NULL),
('250540', '2506', 'PB', '2501', '2501', '25007', '25', 'DESTERRO', NULL, '83', '58695000', '2', '2009', '2009', '13055', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'S', 'N', 'S', 'N', 'N', 'N', NULL, 'N', '179,388', '-7,29100', '-37,09400', '591', 'S', '0,58', NULL, NULL, '25900', 'S', 'N', '1526', NULL, '2504', '2590', NULL, '1959', 'S', '2627', 'DESTERRO', 'N', '250540', 'N', 'S', 'S', NULL, '59', 'S', 'N', 'N', '72', 'DINÂMICA', '03', 'N', '254', NULL, NULL, NULL, NULL),
('430635', '4312', 'RS', '4312', '4301', '43007', '43', 'DEZESSEIS DE NOVEMBRO', NULL, '55', '97845000', '3', '8429', '8429', '19266', NULL, 'ATIVO', 'N', 'S', NULL, NULL, 'S', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '216,848', '-28,21300', '-55,06800', '178', 'S', '0,654', NULL, NULL, '43900', 'N', 'N', '1529', NULL, '4390', '4390', NULL, '1989', 'S', '4024', 'DEZESSEIS DE NOVEMBRO', 'N', '430635', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '130', 'ESTAGNADA', '03', 'N', '467', NULL, NULL, NULL, NULL),
('410712', '4110', 'PR', '4108', '4106', '41023', '41', 'DIAMANTE DO SUL', NULL, '45', '85408000', '4', '5465', '5465', '14331', NULL, 'ATIVO', 'N', 'S', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '359,945', '-25,04300', '-52,68000', '620', 'S', '0,608', NULL, NULL, '41900', 'S', 'N', '1534', NULL, '4190', '4190', NULL, '1993', 'S', '3281', 'DIAMANTE DO SUL', 'N', '410712', 'N', 'N', 'S', NULL, '25', 'N', 'N', 'N', '99', 'ALTA RENDA', '03', 'N', '258', NULL, NULL, NULL, NULL),
('354580', '3507', 'SP', '3528', '3507', '35032', '35', 'SANTA BARBARA D''OESTE', NULL, '19', '13450000', '3', '7017', '7017', '21459', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '271,492', '-22,75400', '-47,41400', '565', 'S', '0,781', NULL, NULL, '35072', 'N', 'N', '4295', NULL, '3503', '3503', NULL, '1869', 'S', '5257', 'SANTA BÁRBARA D''OESTE', 'N', '354580', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '516', 'ALTA RENDA', '01', 'N', '515', NULL, NULL, NULL, NULL),
('315730', '3103', 'MG', '3102', '3111', '31059', '31', 'SANTA BARBARA DO TUGURIO', NULL, '32', '36215000', '2', '5145', '5145', '11573', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'S', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '159,907', '-21,24600', '-43,55900', '605', 'S', '0,637', NULL, NULL, '31013', 'S', 'N', '4301', NULL, '3190', '3190', NULL, '1962', 'S', '2022', 'SANTA BÁRBARA DO TUGÚRIO', 'N', '315730', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '667', 'ESTAGNADA', '03', 'N', '610', NULL, NULL, NULL, NULL),
('292760', '2910', 'BA', '2913', '2904', '29013', '29', 'SANTA BRIGIDA', NULL, '75', '48570000', '6', '3853', '3853', '04277', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'S', 'N', 'S', 'S', 'N', 'N', NULL, 'N', '848,873', '-9,73600', '-38,12600', '317', 'S', '0,546', NULL, NULL, '29062', 'S', 'N', '4303', NULL, '2990', '2990', NULL, '1962', 'S', '537', 'SANTA BRÍGIDA', 'N', '292760', 'N', 'S', 'S', NULL, '162', 'S', 'N', 'N', '338', 'DINÂMICA', '03', 'N', '345', NULL, NULL, NULL, NULL),
('412320', '4118', 'PR', '4105', '4104', '41014', '41', 'SANTA CECILIA DO PAVAO', NULL, '43', '86225000', '4', '7841', '7841', '14221', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'S', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '110,2', '-23,51700', '-50,78400', '660', 'S', '0,723', NULL, NULL, '41900', 'N', 'N', '4307', NULL, '4190', '4190', NULL, '1960', 'S', '3504', 'SANTA CECÍLIA DO PAVÃO', 'N', '412320', 'N', 'N', 'S', NULL, '146', 'N', 'N', 'N', '322', 'ESTAGNADA', '03', 'N', '31', NULL, NULL, NULL, NULL),
('150640', '1507', 'PA', '1512', '1502', '15006', '15', 'SANTA CRUZ DO ARARI', NULL, '91', '68850000', '1', '0527', '0527', '12064', NULL, 'ATIVO', 'S', 'N', NULL, NULL, 'S', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '1074,854', '-0,66400', '-49,16300', '6', 'S', '0,557', NULL, NULL, '15900', 'S', 'N', '4323', NULL, '1590', '1590', NULL, '1961', 'S', '2518', 'SANTA CRUZ DO ARARI', 'N', '150640', 'S', 'N', 'S', NULL, '129', 'N', 'N', 'N', '108', 'DINÂMICA', '03', 'N', '508', NULL, NULL, NULL, NULL),
('210980', '2112', 'MA', '2110', '2101', '21005', '21', 'SANTA HELENA', NULL, '98', '65208000', '9', '0895', '0895', '09098', NULL, 'ATIVO', 'S', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '2308,403', '-2,23100', '-45,30000', '29', 'S', '0,571', NULL, NULL, '21900', 'S', 'N', '4344', NULL, '2190', '2190', NULL, '1935', 'S', '1300', 'SANTA HELENA', 'N', '210980', 'S', 'S', 'S', NULL, '115', 'S', 'N', 'N', '162', 'BAIXA RENDA', '03', 'N', '239', NULL, NULL, NULL, NULL),
('292790', '2913', 'BA', '2910', '2906', '29024', '29', 'SANTA INES', NULL, '73', '45320000', '3', '3859', '3859', '04280', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'S', 'N', 'S', 'S', 'N', 'N', NULL, 'N', '356,193', '-13,29200', '-39,81900', '398', 'S', '0,574', NULL, NULL, '29093', 'S', 'N', '4348', NULL, '2990', '2990', NULL, '1924', 'S', '540', 'SANTA INÊS', 'N', '292790', 'N', 'S', 'S', NULL, NULL, 'S', 'N', 'N', '341', 'ESTAGNADA', '03', 'N', '290', NULL, NULL, NULL, NULL),
('412360', '4115', 'PR', '4106', '4103', '41006', '41', 'SANTA INES', NULL, '44', '86660000', '0', '7847', '7847', '14224', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'S', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '138,48', '-22,63800', '-51,90300', '360', 'S', '0,717', NULL, NULL, '41900', 'N', 'N', '4350', NULL, '4190', '4190', NULL, '1961', 'S', '3508', 'SANTA INÊS', 'N', '412360', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '326', 'ESTAGNADA', '03', 'N', '315', NULL, NULL, NULL, NULL),
('354680', '3501', 'SP', '3525', '3515', '35059', '35', 'SANTA ISABEL', NULL, '11', '07500000', '1', '7037', '7037', '21469', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '361,494', '-23,31600', '-46,22100', '655', 'S', '0,738', NULL, NULL, '35011', 'N', 'N', '4352', NULL, '3501', '3501', NULL, '1832', 'S', '5267', 'SANTA ISABEL', 'N', '354680', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '526', 'ALTA RENDA', '01', 'N', '39', NULL, NULL, NULL, NULL),
('150650', '1502', 'PA', '1511', '1503', '15008', '15', 'SANTA IZABEL DO PARA', NULL, '91', '68790000', '0', '0529', '0529', '12065', NULL, 'ATIVO', 'S', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '717,615', '-1,29900', '-48,16100', '24', 'S', '0,659', NULL, NULL, '15900', 'S', 'N', '4354', NULL, '1501', '1590', NULL, '1933', 'S', '2519', 'SANTA IZABEL DO PARÁ', 'N', '150650', 'S', 'N', 'S', NULL, NULL, 'S', 'N', 'N', '109', 'ESTAGNADA', '01', 'N', '451', NULL, NULL, NULL, NULL),
('412380', '4108', 'PR', '4108', '4107', '41025', '41', 'SANTA IZABEL DO OESTE', NULL, '46', '85650000', '8', '7851', '7851', '14226', NULL, 'ATIVO', 'N', 'S', NULL, NULL, 'S', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '321,169', '-25,82100', '-53,48400', '518', 'S', '0,696', NULL, NULL, '41900', 'N', 'N', '4356', NULL, '4190', '4190', NULL, '1963', 'S', '3510', 'SANTA IZABEL DO OESTE', 'N', '412380', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '328', 'ESTAGNADA', '03', 'N', '34', NULL, NULL, NULL, NULL),
('320450', '3201', 'ES', '3207', '3203', '32008', '32', 'SANTA LEOPOLDINA', NULL, '27', '29640000', '0', '5689', '5689', '07045', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'S', 'N', 'N', 'S', 'N', 'N', NULL, 'N', '716,441', '-20,10100', '-40,53000', '16', 'S', '0,626', NULL, NULL, '32004', 'N', 'N', '4358', NULL, '3290', '3290', NULL, '1884', 'S', '880', 'SANTA LEOPOLDINA', 'N', '320450', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '62', 'ESTAGNADA', '03', 'N', '173', NULL, NULL, NULL, NULL),
('354690', '3503', 'SP', '3530', '3505', '35024', '35', 'SANTA LUCIA', NULL, '16', '14825000', '0', '7039', '7039', '21470', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '152,314', '-21,68500', '-48,08400', '705', 'S', '0,737', NULL, NULL, '35031', 'N', 'N', '4360', NULL, '3590', '3590', NULL, '1959', 'S', '5268', 'SANTA LÚCIA', 'N', '354690', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '527', 'ALTA RENDA', '03', 'N', '40', NULL, NULL, NULL, NULL),
('292805', '2906', 'BA', '2910', '2907', '29031', '29', 'SANTA LUZIA', NULL, '73', '45865000', '9', '3987', '3987', '04362', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'S', 'N', 'N', NULL, 'N', '785,193', '-15,42900', '-39,33400', '195', 'S', '0,556', NULL, NULL, '29091', 'S', 'N', '4362', NULL, '2990', '2990', NULL, '1986', 'S', '541', 'SANTA LUZIA', 'N', '292805', 'N', 'S', 'S', NULL, '90', 'S', 'N', 'N', '342', 'ESTAGNADA', '03', 'N', '112', NULL, NULL, NULL, NULL),
('315780', '3101', 'MG', '3103', '3107', '31030', '31', 'SANTA LUZIA', NULL, '31', '33010970', '7', '5155', '5155', '11578', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '233,759', '-19,77000', '-43,85100', '751', 'S', '0,715', NULL, NULL, '31016', 'N', 'N', '4364', NULL, '3101', '3101', NULL, '1856', 'S', '2030', 'SANTA LUZIA', 'N', '315780', 'N', 'N', 'S', NULL, NULL, 'S', 'S', 'N', '675', 'ALTA RENDA', '01', 'N', '611', NULL, NULL, NULL, NULL),
('270790', '2701', 'AL', '2704', '2703', '27011', '27', 'SANTA LUZIA DO NORTE', NULL, '82', '57130000', '9', '2857', '2857', '02079', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'S', 'N', 'N', NULL, 'N', '28,541', '-9,60300', '-35,82200', '32', 'S', '0,597', NULL, NULL, '27001', 'S', 'N', '4368', NULL, '2701', '2701', NULL, '1962', 'S', '106', 'SANTA LUZIA DO NORTE', 'N', '270790', 'N', 'S', 'S', NULL, NULL, 'S', 'N', 'N', '85', 'ALTA RENDA', '03', 'N', '44', NULL, NULL, NULL, NULL),
('240933', '2405', 'RN', '2402', '2403', '24015', '24', 'SANTA MARIA', NULL, '84', '59464000', '2', '0424', '0424', '18162', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'S', 'N', 'N', 'N', NULL, 'N', '219,572', '-5,84000', '-35,69500', '115', 'S', '0,59', NULL, NULL, '24900', 'S', 'N', '4373', NULL, '2490', '2490', NULL, '1997', 'S', '3793', 'SANTA MARIA', 'N', '240933', 'N', 'S', 'S', NULL, '123', 'S', 'N', 'N', '121', 'DINÂMICA', '03', 'N', '270', NULL, NULL, NULL, NULL),
('150658', '1512', 'PA', '1509', '1506', '15022', '15', 'SANTA MARIA DAS BARREIRAS', NULL, '94', '68565000', '3', '0599', '0599', '12100', NULL, 'ATIVO', 'S', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'S', NULL, 'N', '10330,17', '-8,85500', '-49,72200', '150', 'S', '0,544', NULL, NULL, '15900', 'S', 'N', '4377', NULL, '1590', '1590', NULL, '1989', 'S', '2521', 'SANTA MARIA DAS BARREIRAS', 'N', '150658', 'S', 'N', 'S', NULL, '92', 'N', 'N', 'N', '111', 'DINÂMICA', '03', 'N', '445', NULL, NULL, NULL, NULL),
('315810', '3119', 'MG', '3111', '3103', '31014', '31', 'SANTA MARIA DO SALTO', NULL, '33', '39928000', '2', '5161', '5161', '11581', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'S', 'S', 'S', 'N', 'N', 'N', NULL, 'N', '442,101', '-16,24900', '-40,14900', '200', 'S', '0,613', NULL, NULL, '31063', 'S', 'N', '4384', NULL, '3190', '3190', NULL, '1962', 'S', '2033', 'SANTA MARIA DO SALTO', 'N', '315810', 'N', 'S', 'S', NULL, '117', 'S', 'N', 'N', '678', 'DINÂMICA', '03', 'N', '599', NULL, NULL, NULL, NULL),
('292670', '2919', 'BA', '2911', '2906', '29023', '29', 'RIO DE CONTAS', NULL, '77', '46170000', '7', '3835', '3835', '04268', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'S', 'S', 'N', 'N', NULL, 'N', '1052,302', '-13,57900', '-41,81100', '999', 'S', '0,605', NULL, NULL, '29081', 'S', 'N', '4154', NULL, '2990', '2990', NULL, '1723', 'S', '528', 'RIO DE CONTAS', 'N', '292670', 'N', 'S', 'S', NULL, '31', 'N', 'N', 'N', '329', 'DINÂMICA', '03', 'N', '288', NULL, NULL, NULL, NULL),
('240895', '2403', 'RN', '2402', '2404', '24016', '24', 'RIO DO FOGO', NULL, '84', '59578000', '3', '0422', '0422', '18161', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'S', 'N', NULL, 'N', '150,282', '-5,27300', '-35,38300', '30', 'S', '0,569', NULL, NULL, '24900', 'S', 'N', '4158', NULL, '2490', '2490', NULL, '1997', 'S', '3789', 'RIO DO FOGO', 'N', '240895', 'N', 'S', 'S', NULL, '55', 'S', 'N', 'N', '117', 'BAIXA RENDA', '03', 'N', '84', NULL, NULL, NULL, NULL),
('171870', '1703', 'TO', '1702', '1701', '17003', '17', 'RIO DOS BOIS', NULL, '63', '77655000', '9', '0359', '0359', '28112', NULL, 'ATIVO', 'S', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '845,062', '-9,29300', '-48,46600', '230', 'S', '0,616', NULL, NULL, '17900', 'S', 'N', '4164', NULL, '1790', '1790', NULL, '1993', 'S', '5498', 'RIO DOS BOIS', 'N', '171870', 'S', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '112', 'ESTAGNADA', '03', 'N', '163', NULL, NULL, NULL, NULL),
('261190', '2603', 'PE', '2607', '2604', '26015', '26', 'RIO FORMOSO', NULL, '81', '55570000', '3', '2537', '2537', '15119', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '239,814', '-8,66400', '-35,15900', '5', 'S', '0,613', NULL, NULL, '26900', 'S', 'N', '4168', NULL, '2690', '2690', NULL, '1833', 'S', '2913', 'RIO FORMOSO', 'N', '261190', 'N', 'S', 'S', NULL, '54', 'N', 'N', 'N', '136', 'BAIXA RENDA', '03', 'N', '368', NULL, NULL, NULL, NULL),
('431560', '4303', 'RS', '4309', '4307', '43035', '43', 'RIO GRANDE', NULL, '53', '96200970', '2', '8815', '8815', '19157', NULL, 'ATIVO', 'N', 'S', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'S', NULL, 'N', '2813,907', '-32,03500', '-52,09900', '5', 'S', '0,744', NULL, NULL, '43900', 'N', 'N', '4170', NULL, '4304', '4303', NULL, '1809', 'S', '4227', 'RIO GRANDE', 'N', '431560', 'N', 'N', 'S', NULL, '104', 'N', 'N', 'N', '344', 'ALTA RENDA', '01', 'N', '477', NULL, NULL, NULL, NULL),
('315530', '3101', 'MG', '3103', '3107', '31032', '31', 'RIO MANSO', NULL, '31', '35525000', '6', '5105', '5105', '11553', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '232,102', '-20,26500', '-44,30800', '890', 'S', '0,648', NULL, NULL, '31017', 'N', 'N', '4174', NULL, '3101', '3101', NULL, '1962', 'S', '1999', 'RIO MANSO', 'N', '315530', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '644', 'ESTAGNADA', '01', 'N', '612', NULL, NULL, NULL, NULL),
('500730', '5002', 'MS', '5008', '5002', '50004', '50', 'RIO NEGRO', NULL, '67', '79470000', '7', '9145', '9145', '06073', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'S', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '1807,665', '-19,44900', '-54,98700', '279', 'S', '0,709', NULL, NULL, '50012', 'N', 'N', '4177', NULL, '5090', '5090', NULL, '1964', 'S', '2272', 'RIO NEGRO', 'N', '500730', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '66', 'ALTA RENDA', '03', 'N', '441', NULL, NULL, NULL, NULL),
('315580', '3118', 'MG', '3107', '3112', '31064', '31', 'RIO POMBA', NULL, '32', '36180000', '1', '5115', '5115', '11558', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '251,76', '-21,27500', '-43,17900', '441', 'S', '0,714', NULL, NULL, '31048', 'N', 'N', '4185', NULL, '3190', '3190', NULL, '1831', 'S', '2004', 'RIO POMBA', 'N', '315580', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '649', 'ESTAGNADA', '03', 'N', '665', NULL, NULL, NULL, NULL),
('292700', '2903', 'BA', '2914', '2904', '29017', '29', 'RIO REAL', NULL, '75', '48330000', '2', '3841', '3841', '04271', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'S', 'N', 'N', NULL, 'N', '675,911', '-11,48500', '-37,93300', '169', 'S', '0,572', NULL, NULL, '29051', 'N', 'N', '4189', NULL, '2990', '2990', NULL, '1880', 'S', '531', 'RIO REAL', 'N', '292700', 'N', 'S', 'S', NULL, NULL, 'N', 'N', 'N', '332', 'ESTAGNADA', '03', 'N', '400', NULL, NULL, NULL, NULL),
('251290', '2501', 'PB', '2503', '2504', '25020', '25', 'RIO TINTO', NULL, '83', '58297000', '3', '2159', '2159', '13130', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'S', 'S', NULL, 'N', '466,397', '-6,80300', '-35,08100', '11', 'S', '0,585', NULL, NULL, '25900', 'S', 'N', '4192', NULL, '2501', '2590', NULL, '1956', 'S', '2716', 'RIO TINTO', 'N', '251290', 'N', 'S', 'S', NULL, '103', 'S', 'N', 'N', '163', 'BAIXA RENDA', '03', 'N', '252', NULL, NULL, NULL, NULL),
('354420', '3515', 'SP', '3531', '3501', '35003', '35', 'RIOLANDIA', NULL, '17', '15495000', '2', '6985', '6985', '21443', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'S', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '630,681', '-19,99000', '-49,68100', '438', 'S', '0,703', NULL, NULL, '35157', 'N', 'N', '4196', NULL, '3590', '3590', NULL, '1953', 'S', '5238', 'RIOLÂNDIA', 'N', '354420', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '497', 'ALTA RENDA', '03', 'N', '162', NULL, NULL, NULL, NULL),
('354350', '3516', 'SP', '3519', '3511', '35041', '35', 'RIVERSUL', NULL, '15', '18470000', '1', '6971', '6971', '21436', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'S', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '386,204', '-23,82800', '-49,42900', '587', 'S', '0,664', NULL, NULL, '35162', 'S', 'N', '4200', NULL, '3590', '3590', NULL, '1953', 'S', '5239', 'RIVERSUL', 'N', '354350', 'N', 'N', 'S', NULL, '89', 'N', 'N', 'N', '498', 'ESTAGNADA', '03', 'N', '159', NULL, NULL, NULL, NULL),
('421520', '4201', 'SC', '4213', '4201', '42001', '42', 'ROMELANDIA', NULL, '49', '89908000', '8', '8299', '8299', '20150', NULL, 'ATIVO', 'N', 'S', NULL, NULL, 'S', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '223,749', '-26,67600', '-53,31400', '425', 'S', '0,692', NULL, NULL, '42900', 'N', 'N', '4214', NULL, '4290', '4290', NULL, '1963', 'S', '4596', 'ROMELÂNDIA', 'N', '421520', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '225', 'ESTAGNADA', '03', 'N', '491', NULL, NULL, NULL, NULL),
('431630', '4312', 'RS', '4312', '4301', '43006', '43', 'ROQUE GONZALES', NULL, '55', '97970000', '3', '8829', '8829', '19164', NULL, 'ATIVO', 'N', 'S', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '346,622', '-28,13100', '-55,02600', '151', 'S', '0,688', NULL, NULL, '43900', 'N', 'N', '4221', NULL, '4390', '4390', NULL, '1965', 'S', '4235', 'ROQUE GONZALES', 'N', '431630', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '353', 'ESTAGNADA', '03', 'N', '467', NULL, NULL, NULL, NULL),
('315645', '3118', 'MG', '3107', '3112', '31063', '31', 'ROSARIO DA LIMEIRA', NULL, '32', '36878000', '2', '0698', '0698', '11755', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '112,319', '-20,97900', '-42,51200', '680', 'S', '0,662', NULL, NULL, '31045', 'N', 'N', '4225', NULL, '3190', '3190', NULL, '1997', 'S', '2011', 'ROSÁRIO DA LIMEIRA', 'N', '315645', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '656', 'ESTAGNADA', '03', 'N', '643', NULL, NULL, NULL, NULL),
('270780', '2705', 'AL', '2704', '2703', '27012', '27', 'ROTEIRO', NULL, '82', '57246000', '0', '2855', '2855', '02078', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'S', 'N', 'N', NULL, 'N', '129,288', '-9,83300', '-35,97800', '32', 'S', '0,505', NULL, NULL, '27003', 'S', 'N', '4231', NULL, '2790', '2790', NULL, '1963', 'S', '105', 'ROTEIRO', 'N', '270780', 'N', 'S', 'S', NULL, NULL, 'N', 'N', 'N', '84', 'BAIXA RENDA', '03', 'N', '394', NULL, NULL, NULL, NULL),
('521890', '5208', 'GO', '5209', '5203', '52006', '52', 'RUBIATABA', NULL, '62', '76350000', '4', '9573', '9573', '08187', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'S', NULL, 'N', '748,273', '-15,16400', '-49,80300', '632', 'S', '0,719', NULL, NULL, '52900', 'N', 'N', '4234', NULL, '5290', '5290', NULL, '1953', 'S', '1091', 'RUBIATABA', 'N', '521890', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '199', 'ESTAGNADA', '03', 'N', '119', NULL, NULL, NULL, NULL),
('311900', '3111', 'MG', '3101', '3110', '31053', '31', 'CORDISLANDIA', NULL, '35', '37498000', '5', '4379', '4379', '11190', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '179,22', '-21,79300', '-45,70100', '819', 'S', '0,66', NULL, NULL, '31012', 'N', 'N', '1367', NULL, '3190', '3190', NULL, '1962', 'S', '1565', 'CORDISLÂNDIA', 'N', '311900', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '210', 'ESTAGNADA', '03', 'N', '669', NULL, NULL, NULL, NULL),
('351250', '3502', 'SP', '3531', '3503', '35018', '35', 'COROADOS', NULL, '18', '16260000', '6', '6351', '6351', '21126', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '246,544', '-21,35200', '-50,28100', '409', 'S', '0,719', NULL, NULL, '35023', 'N', 'N', '1375', NULL, '3590', '3590', NULL, '1928', 'S', '4882', 'COROADOS', 'N', '351250', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '141', 'ALTA RENDA', '03', 'N', '157', NULL, NULL, NULL, NULL),
('430587', '4317', 'RS', '4312', '4301', '43008', '43', 'CORONEL BARROS', NULL, '55', '98735000', '1', '6055', '6055', '19354', NULL, 'ATIVO', 'N', 'S', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '162,949', '-28,38300', '-54,06600', '311', 'S', '0,744', NULL, NULL, '43900', 'N', 'N', '1378', NULL, '4390', '4390', NULL, '1993', 'S', '4013', 'CORONEL BARROS', 'N', '430587', 'N', 'N', 'S', NULL, '147', 'N', 'N', 'N', '117', 'ALTA RENDA', '03', 'N', '469', NULL, NULL, NULL, NULL),
('520570', '5212', 'GO', '5208', '5203', '52008', '52', 'CORREGO DO OURO', NULL, '64', '76145000', '3', '9315', '9315', '08058', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '462,302', '-16,29400', '-50,54800', '563', 'S', '0,686', NULL, NULL, '52900', 'N', 'N', '1396', NULL, '5290', '5290', NULL, '1953', 'S', '963', 'CÓRREGO DO OURO', 'N', '520570', 'N', 'N', 'S', NULL, '67', 'N', 'N', 'N', '68', 'ESTAGNADA', '03', 'N', '353', NULL, NULL, NULL, NULL),
('220290', '2211', 'PI', '2210', '2203', '22012', '22', 'CORRENTE', NULL, '89', '64980000', '1', '1057', '1057', '16029', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'S', 'N', NULL, 'N', '3051,161', '-10,44300', '-45,16200', '438', 'S', '0,642', NULL, NULL, '22900', 'S', 'N', '1400', NULL, '2290', '2290', NULL, '1872', 'S', '3026', 'CORRENTE', 'N', '220290', 'N', 'S', 'S', NULL, NULL, 'S', 'N', 'S', '65', 'DINÂMICA', '03', 'N', '199', NULL, NULL, NULL, NULL),
('500320', '5012', 'MS', '5007', '5001', '50001', '50', 'CORUMBA', NULL, '67', '79301970', '7', '9063', '9063', '06032', NULL, 'ATIVO', 'N', 'S', NULL, NULL, 'S', 'N', 'N', 'N', 'N', 'S', NULL, 'N', '64960,863', '-19,009', '-57,653', '118', 'S', '0,7', NULL, NULL, '50021', 'N', 'N', '1404', NULL, '5090', '5090', NULL, '1871', 'S', '2234', 'CORUMBÁ', 'N', '500320', 'N', 'N', 'S', NULL, NULL, 'S', 'N', 'N', '26', 'ESTAGNADA', '01', 'N', '442', NULL, NULL, NULL, NULL),
('420450', '4211', 'SC', '4211', '4202', '42008', '42', 'CORUPA', NULL, '47', '89278000', '9', '8087', '8087', '20044', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '405,003', '-26,42500', '-49,24300', '75', 'S', '0,78', NULL, NULL, '42900', 'N', 'N', '1410', NULL, '4206', '4205', NULL, '1958', 'S', '4447', 'CORUPÁ', 'N', '420450', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '76', 'ALTA RENDA', '03', 'N', '498', NULL, NULL, NULL, NULL),
('351290', '3515', 'SP', '3531', '3501', '35003', '35', 'COSMORAMA', NULL, '17', '15530000', '2', '6359', '6359', '21130', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '441,326', '-20,47800', '-49,77800', '540', 'S', '0,722', NULL, NULL, '35157', 'N', 'N', '1413', NULL, '3590', '3590', NULL, '1948', 'S', '4886', 'COSMORAMA', 'N', '351290', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '145', 'ALTA RENDA', '03', 'N', '162', NULL, NULL, NULL, NULL),
('290940', '2925', 'BA', '2912', '2901', '29002', '29', 'COTEGIPE', NULL, '77', '47900000', '6', '3487', '3487', '04094', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'S', 'N', 'N', NULL, 'N', '4018,594', '-12,02800', '-44,25800', '472', 'S', '0,59', NULL, NULL, '29071', 'S', 'N', '1416', NULL, '2990', '2990', NULL, '1820', 'S', '312', 'COTEGIPE', 'N', '290940', 'N', 'S', 'S', NULL, NULL, 'N', 'N', 'N', '112', 'DINÂMICA', '03', 'N', '287', NULL, NULL, NULL, NULL),
('430597', '4306', 'RS', '4311', '4301', '43010', '43', 'COXILHA', NULL, '54', '99145000', '5', '5797', '5797', '19355', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '422,79', '-28,12700', '-52,29600', '721', 'S', '0,706', NULL, NULL, '43900', 'N', 'N', '1422', NULL, '4390', '4390', NULL, '1993', 'S', '4016', 'COXILHA', 'N', '430597', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '121', 'ALTA RENDA', '03', 'N', '473', NULL, NULL, NULL, NULL),
('270235', '2707', 'AL', '2703', '2702', '27006', '27', 'CRAIBAS', NULL, '82', '57320000', '5', '2889', '2889', '02095', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'S', 'S', 'N', 'N', NULL, 'N', '275,325', '-9,61800', '-36,76800', '252', 'S', '0,525', NULL, NULL, '27005', 'S', 'N', '1425', NULL, '2702', '2790', NULL, '1982', 'S', '47', 'CRAÍBAS', 'N', '270235', 'N', 'S', 'S', NULL, '39', 'S', 'N', 'N', '25', 'BAIXA RENDA', '03', 'N', '45', NULL, NULL, NULL, NULL),
('290950', '2913', 'BA', '2910', '2906', '29024', '29', 'CRAVOLANDIA', NULL, '73', '45330000', '5', '3489', '3489', '04095', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'S', 'N', 'S', 'S', 'N', 'N', NULL, 'N', '159,645', '-13,35900', '-39,81500', '477', 'S', '0,599', NULL, NULL, '29093', 'S', 'N', '1429', NULL, '2990', '2990', NULL, '1962', 'S', '313', 'CRAVOLÂNDIA', 'N', '290950', 'N', 'S', 'S', NULL, NULL, 'S', 'N', 'N', '113', 'ESTAGNADA', '03', 'N', '290', NULL, NULL, NULL, NULL),
('312020', '3115', 'MG', '3105', '3109', '31045', '31', 'CRISTAIS', NULL, '35', '37275000', '1', '4403', '4403', '11202', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '627,704', '-20,87600', '-45,51900', '873', 'S', '0,692', NULL, NULL, '31033', 'N', 'N', '1434', NULL, '3190', '3190', NULL, '1948', 'S', '1579', 'CRISTAIS', 'N', '312020', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '224', 'ESTAGNADA', '03', 'N', '594', NULL, NULL, NULL, NULL),
('430607', '4319', 'RS', '4311', '4301', '43003', '43', 'CRISTAL DO SUL', NULL, '55', '98368000', '2', '0972', '0972', '19441', NULL, 'ATIVO', 'N', 'S', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '97,716', '-27,45400', '-53,24600', '369', 'S', '0,66', NULL, NULL, '43900', 'N', 'N', '1437', NULL, '4390', '4390', NULL, '1997', 'S', '4019', 'CRISTAL DO SUL', 'N', '430607', 'N', 'N', 'S', NULL, '56', 'N', 'N', 'N', '124', 'ESTAGNADA', '03', 'N', '471', NULL, NULL, NULL, NULL),
('410680', '4106', 'PR', '4107', '4109', '41033', '41', 'CRUZ MACHADO', NULL, '42', '84620000', '3', '7533', '7533', '14067', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'S', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '1478,351', '-26,01700', '-51,34700', '940', 'S', '0,664', NULL, NULL, '41900', 'N', 'N', '1457', NULL, '4190', '4190', NULL, '1951', 'S', '3273', 'CRUZ MACHADO', 'N', '410680', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '90', 'ESTAGNADA', '03', 'N', '33', NULL, NULL, NULL, NULL),
('290760', '2921', 'BA', '2918', '2903', '29009', '29', 'CENTRAL', NULL, '74', '44940000', '8', '3451', '3451', '04076', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'S', 'S', 'N', 'N', NULL, 'N', '606,999', '-11,13600', '-42,11300', '698', 'S', '0,596', NULL, NULL, '29021', 'S', 'N', '1203', NULL, '2990', '2990', NULL, '1958', 'S', '294', 'CENTRAL', 'N', '290760', 'N', 'S', 'S', NULL, '50', 'N', 'N', 'N', '94', 'ESTAGNADA', '03', 'N', '401', NULL, NULL, NULL, NULL),
('210315', '2119', 'MA', '2110', '2102', '21007', '21', 'CENTRO DO GUILHERME', NULL, '98', '65288000', '8', '0146', '0146', '09158', NULL, 'ATIVO', 'S', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '1074,039', '-2,36900', '-46,00200', '0', 'S', '0,542', NULL, NULL, '21900', 'S', 'N', '1207', NULL, '2190', '2190', NULL, '1997', 'S', '1193', 'CENTRO DO GUILHERME', 'N', '210315', 'S', 'S', 'S', NULL, '139', 'S', 'N', 'N', '55', 'BAIXA RENDA', '03', 'N', '299', NULL, NULL, NULL, NULL),
('351140', '3506', 'SP', '3518', '3504', '35022', '35', 'CERQUEIRA CESAR', NULL, '14', '18760000', '9', '6329', '6329', '21115', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '503,64', '-23,03600', '-49,16600', '737', 'S', '0,729', NULL, NULL, '35061', 'N', 'N', '1211', NULL, '3590', '3590', NULL, '1917', 'S', '4871', 'CERQUEIRA CÉSAR', 'N', '351140', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '130', 'ALTA RENDA', '03', 'N', '102', NULL, NULL, NULL, NULL),
('430513', '4308', 'RS', '4308', '4304', '43022', '43', 'CERRO BRANCO', NULL, '51', '96535000', '2', '8439', '8439', '19261', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '154,105', '-29,65400', '-52,93400', '83', 'S', '0,661', NULL, NULL, '43900', 'N', 'N', '1215', NULL, '4390', '4390', NULL, '1989', 'S', '3996', 'CERRO BRANCO', 'N', '430513', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '99', 'ESTAGNADA', '03', 'N', '483', NULL, NULL, NULL, NULL),
('420417', '4213', 'SC', '4212', '4203', '42010', '42', 'CERRO NEGRO', NULL, '49', '88585000', '8', '5567', '5567', '20220', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'S', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '416,774', '-27,79500', '-50,87600', '996', 'S', '0,621', NULL, NULL, '42900', 'S', 'N', '1220', NULL, '4214', '4290', NULL, '1993', 'S', '4438', 'CERRO NEGRO', 'N', '420417', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '67', 'ALTA RENDA', '03', 'N', '501', NULL, NULL, NULL, NULL),
('260440', '2601', 'PE', '2607', '2604', '26014', '26', 'CHA DE ALEGRIA', NULL, '81', '55835000', '3', '2387', '2387', '15044', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '48,453', '-8,00100', '-35,21300', '160', 'S', '0,604', NULL, NULL, '26002', 'S', 'N', '1224', NULL, '2690', '2690', NULL, '1963', 'S', '2826', 'CHÃ DE ALEGRIA', 'N', '260440', 'N', 'S', 'S', NULL, NULL, 'S', 'N', 'N', '49', 'ESTAGNADA', '03', 'N', '314', NULL, NULL, NULL, NULL),
('270190', '2704', 'AL', '2704', '2703', '27008', '27', 'CHA PRETA', NULL, '82', '57760000', '2', '2737', '2737', '02019', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'S', 'N', 'N', NULL, 'N', '200,802', '-9,25500', '-36,29600', '463', 'S', '0,575', NULL, NULL, '27010', 'S', 'N', '1226', NULL, '2790', '2790', NULL, '1962', 'S', '42', 'CHÃ PRETA', 'N', '270190', 'N', 'S', 'S', NULL, '126', 'S', 'N', 'N', '20', 'DINÂMICA', '03', 'N', '393', NULL, NULL, NULL, NULL),
('430530', '4315', 'RS', '4311', '4301', '43009', '43', 'CHAPADA', NULL, '54', '99530000', '6', '8603', '8603', '19052', NULL, 'ATIVO', 'N', 'S', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '684,04', '-28,05500', '-53,06800', '436', 'S', '0,757', NULL, NULL, '43900', 'N', 'N', '1229', NULL, '4390', '4390', NULL, '1959', 'S', '4000', 'CHAPADA', 'N', '430530', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '103', 'ESTAGNADA', '03', 'N', '476', NULL, NULL, NULL, NULL),
('170460', '1706', 'TO', '1702', '1701', '17004', '17', 'CHAPADA DE AREIA', NULL, '63', '77575000', '0', '0078', '0078', '28129', NULL, 'ATIVO', 'S', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '659,244', '-10,14400', '-49,14000', '240', 'S', '0,619', NULL, NULL, '17900', 'S', 'N', '1231', NULL, '1790', '1790', NULL, '1997', 'S', '5422', 'CHAPADA DE AREIA', 'N', '170460', 'S', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '37', 'ESTAGNADA', '03', 'N', '216', NULL, NULL, NULL, NULL),
('520547', '5214', 'GO', '5206', '5205', '52013', '52', 'CHAPADAO DO CEU', NULL, '64', '75828000', '1', '0073', '0073', '08297', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '2354,822', '-18,40800', '-52,54900', '725', 'S', '0,742', NULL, NULL, '52900', 'N', 'N', '1235', NULL, '5290', '5290', NULL, '1993', 'S', '959', 'CHAPADÃO DO CÉU', 'N', '520547', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '64', 'ALTA RENDA', '03', 'N', '185', NULL, NULL, NULL, NULL),
('430535', '4302', 'RS', '4313', '4305', '43025', '43', 'CHARQUEADAS', NULL, '51', '96745000', '5', '8693', '8693', '19236', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '216,513', '-29,95500', '-51,62500', '30', 'S', '0,747', NULL, NULL, '43900', 'N', 'N', '1241', NULL, '4301', '4301', NULL, '1982', 'S', '4001', 'CHARQUEADAS', 'N', '430535', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '104', 'ESTAGNADA', '01', 'N', '465', NULL, NULL, NULL, NULL),
('230390', '2316', 'CE', '2309', '2301', '23001', '23', 'CHAVAL', NULL, '88', '62420000', '7', '1377', '1377', '05039', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'S', 'N', 'N', NULL, 'N', '238,228', '-3,03400', '-41,24400', '12', 'S', '0,586', NULL, NULL, '23900', 'S', 'N', '1243', NULL, '2390', '2390', NULL, '1951', 'S', '662', 'CHAVAL', 'N', '230390', 'N', 'S', 'S', NULL, NULL, 'N', 'N', 'N', '46', 'BAIXA RENDA', '03', 'N', '338', NULL, NULL, NULL, NULL),
('355720', '3509', 'SP', '3533', '3510', '35040', '35', 'CHAVANTES', NULL, '14', '18970000', '4', '6337', '6337', '21119', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '188,212', '-23,03900', '-49,70900', '563', 'S', '0,729', NULL, NULL, '35094', 'N', 'N', '1244', NULL, '3590', '3590', NULL, '1922', 'S', '4875', 'CHAVANTES', 'N', '355720', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '134', 'ESTAGNADA', '03', 'N', '329', NULL, NULL, NULL, NULL),
('311620', '3105', 'MG', '3107', '3112', '31065', '31', 'CHIADOR', NULL, '32', '36630000', '9', '4323', '4323', '11162', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '252,346', '-22,00300', '-43,05800', '332', 'S', '0,711', NULL, NULL, '31043', 'N', 'N', '1246', NULL, '3190', '3190', NULL, '1953', 'S', '1534', 'CHIADOR', 'N', '311620', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '179', 'ALTA RENDA', '03', 'N', '602', NULL, NULL, NULL, NULL),
('230395', '2322', 'CE', '2310', '2302', '23014', '23', 'CHOROZINHO', NULL, '85', '62875000', '6', '1239', '1239', '05158', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'S', 'S', 'N', 'N', NULL, 'N', '278,4', '-4,30000', '-38,49700', '48', 'S', '0,604', NULL, NULL, '23900', 'S', 'N', '1250', NULL, '2301', '2390', NULL, '1989', 'S', '664', 'CHOROZINHO', 'N', '230395', 'N', 'S', 'S', NULL, NULL, 'S', 'N', 'N', '48', 'DINÂMICA', '01', 'N', '340', NULL, NULL, NULL, NULL),
('430550', '4306', 'RS', '4311', '4301', '43010', '43', 'CIRIACO', NULL, '54', '99970000', '4', '8607', '8607', '19054', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'S', 'N', 'N', 'N', 'N', 'S', NULL, 'N', '273,872', '-28,34400', '-51,87600', '753', 'S', '0,719', NULL, NULL, '43900', 'N', 'N', '1263', NULL, '4390', '4390', NULL, '1965', 'S', '4007', 'CIRÍACO', 'N', '430550', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '110', 'ALTA RENDA', '03', 'N', '473', NULL, NULL, NULL, NULL),
('311660', '3115', 'MG', '3105', '3109', '31043', '31', 'CLAUDIO', NULL, '37', '35530000', '5', '4331', '4331', '11166', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '630,278', '-20,44300', '-44,76600', '832', 'S', '0,709', NULL, NULL, '31029', 'N', 'N', '1267', NULL, '3190', '3190', NULL, '1911', 'S', '1538', 'CLÁUDIO', 'N', '311660', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '183', 'ALTA RENDA', '03', 'N', '591', NULL, NULL, NULL, NULL),
('130120', '1308', 'AM', '1304', '1303', '13006', '13', 'COARI', NULL, '97', '69460000', '9', '0225', '0225', '03013', NULL, 'ATIVO', 'S', 'N', NULL, NULL, 'N', 'N', 'N', 'S', 'N', 'S', NULL, 'N', '57921,646', '-4,08500', '-63,14100', '10', 'S', '0,586', NULL, NULL, '13081', 'N', 'N', '1271', NULL, '1390', '1390', NULL, '1874', 'S', '143', 'COARI', 'N', '130120', 'S', 'N', 'S', NULL, NULL, 'N', 'N', 'S', '20', 'DINÂMICA', '01', 'N', '282', NULL, NULL, NULL, NULL),
('420425', '4215', 'SC', '4210', '4206', '42019', '42', 'COCAL DO SUL', NULL, '48', '88845000', '1', '5543', '5543', '20221', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '71,21', '-28,60100', '-49,32600', '58', 'S', '0,78', NULL, NULL, '42900', 'N', 'N', '1274', NULL, '4209', '4203', NULL, '1993', 'S', '4441', 'COCAL DO SUL', 'N', '420425', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '70', 'ALTA RENDA', '03', 'N', '490', NULL, NULL, NULL, NULL),
('290810', '2926', 'BA', '2912', '2901', '29003', '29', 'COCOS', NULL, '77', '47680000', '1', '3461', '3461', '04081', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'S', 'S', 'N', 'N', NULL, 'N', '10084,274', '-14,18400', '-44,53400', '559', 'S', '0,596', NULL, NULL, '29073', 'S', 'N', '1278', NULL, '2990', '2990', NULL, '1958', 'S', '299', 'COCOS', 'N', '290810', 'N', 'S', 'S', NULL, NULL, 'N', 'N', 'N', '99', 'DINÂMICA', '03', 'N', '402', NULL, NULL, NULL, NULL),
('351200', '3505', 'SP', '3530', '3502', '35009', '35', 'COLINA', NULL, '17', '14770000', '1', '6341', '6341', '21121', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '423,963', '-20,71300', '-48,54100', '595', 'S', '0,757', NULL, NULL, '35051', 'N', 'N', '1288', NULL, '3590', '3590', NULL, '1925', 'S', '4877', 'COLINA', 'N', '351200', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '136', 'ALTA RENDA', '03', 'N', '42', NULL, NULL, NULL, NULL),
('520552', '5207', 'GO', '5209', '5202', '52005', '52', 'COLINAS DO SUL', NULL, '62', '73740000', '1', '9791', '9791', '08257', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'S', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '1708,215', '-14,15100', '-48,07800', '535', 'S', '0,658', NULL, NULL, '52900', 'S', 'N', '1291', NULL, '5290', '5290', NULL, '1989', 'S', '962', 'COLINAS DO SUL', 'N', '520552', 'N', 'N', 'S', NULL, '121', 'N', 'N', 'N', '67', 'DINÂMICA', '03', 'N', '9', NULL, NULL, NULL, NULL),
('251315', '2503', 'PB', '2502', '2503', '25019', '25', 'SANTA CECILIA', NULL, '83', '58463000', '8', '0510', '0510', '13208', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'S', 'N', 'N', 'N', NULL, 'N', '227,838', '-7,73900', '-35,87900', '0', 'S', '0,525', NULL, NULL, '25900', 'S', 'N', '4306', NULL, '2502', '2590', NULL, '1997', 'S', '2719', 'SANTA CECÍLIA', 'N', '251315', 'N', 'S', 'S', NULL, NULL, 'S', 'N', 'N', '166', 'BAIXA RENDA', '03', 'N', '72', NULL, NULL, NULL, NULL),
('354610', '3515', 'SP', '3531', '3501', '35001', '35', 'SANTA CLARA D''OESTE', NULL, '17', '15785000', '8', '7023', '7023', '21462', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'S', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '183,399', '-20,08900', '-50,95400', '401', 'S', '0,733', NULL, NULL, '35152', 'N', 'N', '4308', NULL, '3590', '3590', NULL, '1964', 'S', '5259', 'SANTA CLARA D''OESTE', 'N', '354610', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '518', 'ESTAGNADA', '03', 'N', '219', NULL, NULL, NULL, NULL),
('261247', '2611', 'PE', '2606', '2601', '26003', '26', 'SANTA CRUZ DA BAIXA VERDE', NULL, '87', '56895000', '1', '2639', '2639', '15176', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'S', 'N', 'N', 'N', NULL, 'N', '114,931', '-7,82100', '-38,15300', '852', 'S', '0,612', NULL, NULL, '26900', 'S', 'N', '4314', NULL, '2690', '2690', NULL, '1993', 'S', '2920', 'SANTA CRUZ DA BAIXA VERDE', 'N', '261247', 'N', 'S', 'S', NULL, '82', 'N', 'N', 'N', '143', 'DINÂMICA', '03', 'N', '261', NULL, NULL, NULL, NULL),
('315733', '3120', 'MG', '3102', '3111', '31058', '31', 'SANTA CRUZ DE MINAS', NULL, '32', '36328000', '6', '0702', '0702', '11833', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '2,859', '-21,12000', '-44,22300', '911', 'S', '0,706', NULL, NULL, '31015', 'N', 'N', '4320', NULL, '3190', '3190', NULL, '1997', 'S', '2023', 'SANTA CRUZ DE MINAS', 'N', '315733', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '668', 'ESTAGNADA', '03', 'N', '657', NULL, NULL, NULL, NULL),
('315737', '3106', 'MG', '3108', '3102', '31005', '31', 'SANTA CRUZ DE SALINAS', NULL, '38', '39563000', '7', '0704', '0704', '11834', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'S', 'N', 'N', 'N', NULL, 'N', '587,268', '-16,09800', '-41,74600', '761', 'S', '0,577', NULL, NULL, '31056', 'S', 'N', '4322', NULL, '3190', '3190', NULL, '1997', 'S', '2024', 'SANTA CRUZ DE SALINAS', 'N', '315737', 'N', 'S', 'S', NULL, '7', 'N', 'N', 'N', '669', 'DINÂMICA', '03', 'N', '603', NULL, NULL, NULL, NULL),
('261250', '2604', 'PE', '2608', '2603', '26009', '26', 'SANTA CRUZ DO CAPIBARIBE', NULL, '81', '55190000', '5', '2549', '2549', '15125', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'S', 'N', 'N', 'N', NULL, 'N', '335,526', '-7,95700', '-36,20500', '438', 'S', '0,648', NULL, NULL, '26009', 'N', 'N', '4324', NULL, '2690', '2690', NULL, '1953', 'S', '2921', 'SANTA CRUZ DO CAPIBARIBE', 'N', '261250', 'N', 'S', 'S', NULL, NULL, 'N', 'N', 'S', '144', 'ESTAGNADA', '01', 'N', '139', NULL, NULL, NULL, NULL),
('315740', '3108', 'MG', '3110', '3112', '31060', '31', 'SANTA CRUZ DO ESCALVADO', NULL, '31', '35384000', '1', '5147', '5147', '11574', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '258,335', '-20,23600', '-42,81400', '412', 'S', '0,625', NULL, NULL, '31060', 'S', 'N', '4325', NULL, '3190', '3190', NULL, '1948', 'S', '2025', 'SANTA CRUZ DO ESCALVADO', 'N', '315740', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '670', 'ESTAGNADA', '03', 'N', '653', NULL, NULL, NULL, NULL),
('220915', '2205', 'PI', '2207', '2202', '22006', '22', 'SANTA CRUZ DOS MILAGRES', NULL, '89', '64315000', '3', '1295', '1295', '16143', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'S', 'N', 'N', 'N', NULL, 'N', '984,084', '-5,80400', '-41,95600', '160', 'S', '0,577', NULL, NULL, '22900', 'S', 'N', '4329', NULL, '2290', '2290', NULL, '1993', 'S', '3135', 'SANTA CRUZ DOS MILAGRES', 'N', '220915', 'N', 'S', 'S', NULL, NULL, 'N', 'N', 'N', '176', 'BAIXA RENDA', '03', 'N', '366', NULL, NULL, NULL, NULL),
('354650', '3503', 'SP', '3530', '3502', '35013', '35', 'SANTA ERNESTINA', NULL, '16', '15970000', '4', '7031', '7031', '21466', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '134,964', '-21,46300', '-48,39100', '570', 'S', '0,738', NULL, NULL, '35033', 'N', 'N', '4331', NULL, '3590', '3590', NULL, '1964', 'S', '5264', 'SANTA ERNESTINA', 'N', '354650', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '523', 'ALTA RENDA', '03', 'N', '97', NULL, NULL, NULL, NULL),
('521925', '5210', 'GO', '5208', '5201', '52002', '52', 'SANTA FE DE GOIAS', NULL, '62', '76265000', '8', '9743', '9743', '08279', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '1160,8', '-15,76900', '-51,10600', '362', 'S', '0,713', NULL, NULL, '52900', 'N', 'N', '4333', NULL, '5290', '5290', NULL, '1989', 'S', '1095', 'SANTA FÉ DE GOIÁS', 'N', '521925', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '203', 'DINÂMICA', '03', 'N', '236', NULL, NULL, NULL, NULL),
('171886', '1710', 'TO', '1701', '1701', '17002', '17', 'SANTA FE DO ARAGUAIA', NULL, '63', '77848000', '5', '0195', '0195', '28114', NULL, 'ATIVO', 'S', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'S', NULL, 'N', '1676,945', '-7,15700', '-48,72100', '190', 'S', '0,616', NULL, NULL, '17900', 'S', 'N', '4335', NULL, '1790', '1790', NULL, '1993', 'S', '5502', 'SANTA FÉ DO ARAGUAIA', 'N', '171886', 'S', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '116', 'ESTAGNADA', '03', 'N', '386', NULL, NULL, NULL, NULL),
('354660', '3515', 'SP', '3531', '3501', '35001', '35', 'SANTA FE DO SUL', NULL, '17', '15775000', '3', '7033', '7033', '21467', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '208,245', '-20,21100', '-50,92600', '370', 'S', '0,784', NULL, NULL, '35152', 'N', 'N', '4336', NULL, '3590', '3590', NULL, '1953', 'S', '5265', 'SANTA FÉ DO SUL', 'N', '354660', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '524', 'ESTAGNADA', '03', 'N', '219', NULL, NULL, NULL, NULL),
('220920', '2211', 'PI', '2210', '2203', '22007', '22', 'SANTA FILOMENA', NULL, '89', '64945000', '3', '1183', '1183', '16092', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'S', 'N', NULL, 'N', '5285,447', '-9,11200', '-45,92200', '277', 'S', '0,544', NULL, NULL, '22900', 'S', 'N', '4337', NULL, '2290', '2290', NULL, '1938', 'S', '3136', 'SANTA FILOMENA', 'N', '220920', 'N', 'S', 'S', NULL, NULL, 'S', 'N', 'N', '177', 'DINÂMICA', '03', 'N', '199', NULL, NULL, NULL, NULL),
('210975', '2113', 'MA', '2111', '2103', '21011', '21', 'SANTA FILOMENA DO MARANHAO', NULL, '99', '65768000', '9', '0222', '0222', '09196', NULL, 'ATIVO', 'S', 'N', NULL, NULL, 'S', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '403,849', '-5,50100', '-44,56100', '180', 'S', '0,525', NULL, NULL, '21900', 'S', 'N', '4339', NULL, '2190', '2190', NULL, '1997', 'S', '1299', 'SANTA FILOMENA DO MARANHÃO', 'N', '210975', 'S', 'S', 'S', NULL, NULL, 'N', 'N', 'N', '161', 'BAIXA RENDA', '03', 'N', '11', NULL, NULL, NULL, NULL),
('251330', '2509', 'PB', '2501', '2501', '25002', '25', 'SANTA HELENA', NULL, '83', '58925000', '7', '2167', '2167', '13134', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'S', 'S', 'N', 'N', NULL, 'N', '210,317', '-6,72000', '-38,63800', '287', 'S', '0,609', NULL, NULL, '25900', 'S', 'N', '4343', NULL, '2590', '2590', NULL, '1961', 'S', '2721', 'SANTA HELENA', 'N', '251330', 'N', 'S', 'S', NULL, NULL, 'S', 'N', 'N', '168', 'ESTAGNADA', '03', 'N', '74', NULL, NULL, NULL, NULL),
('210990', '2115', 'MA', '2110', '2102', '21008', '21', 'SANTA INES', NULL, '98', '65300000', '8', '0957', '0957', '09129', NULL, 'ATIVO', 'S', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '407,681', '-3,66700', '-45,38000', '24', 'S', '0,674', NULL, NULL, '21900', 'N', 'N', '4349', NULL, '2190', '2190', NULL, '1966', 'S', '1301', 'SANTA INÊS', 'N', '210990', 'S', 'S', 'S', NULL, NULL, 'N', 'N', 'S', '163', 'BAIXA RENDA', '01', 'N', '356', NULL, NULL, NULL, NULL),
('412370', '4114', 'PR', '4106', '4101', '41001', '41', 'SANTA ISABEL DO IVAI', NULL, '44', '87910000', '9', '7849', '7849', '14225', NULL, 'ATIVO', 'N', 'S', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '349,497', '-23,00300', '-53,19700', '424', 'S', '0,72', NULL, NULL, '41900', 'N', 'N', '4353', NULL, '4190', '4190', NULL, '1954', 'S', '3509', 'SANTA ISABEL DO IVAÍ', 'N', '412370', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '327', 'ESTAGNADA', '03', 'N', '367', NULL, NULL, NULL, NULL),
('412382', '4110', 'PR', '4108', '4106', '41023', '41', 'SANTA LUCIA', NULL, '45', '85795000', '4', '5469', '5469', '14353', NULL, 'ATIVO', 'N', 'S', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '116,857', '-25,40700', '-53,56600', '441', 'S', '0,687', NULL, NULL, '41900', 'N', 'N', '4359', NULL, '4190', '4190', NULL, '1993', 'S', '3511', 'SANTA LÚCIA', 'N', '412382', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '329', 'ALTA RENDA', '03', 'N', '258', NULL, NULL, NULL, NULL),
('220930', '2211', 'PI', '2210', '2203', '22010', '22', 'SANTA LUZ', NULL, '89', '64910000', '2', '1185', '1185', '16093', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'S', 'N', 'S', 'N', 'N', 'N', NULL, 'N', '1186,831', '-8,95400', '-44,12900', '345', 'S', '0,588', NULL, NULL, '22900', 'S', 'N', '4361', NULL, '2290', '2290', NULL, '1962', 'S', '3137', 'SANTA LUZ', 'N', '220930', 'N', 'S', 'S', NULL, NULL, 'S', 'N', 'N', '178', 'DINÂMICA', '03', 'N', '199', NULL, NULL, NULL, NULL),
('315790', '3124', 'MG', '3110', '3112', '31061', '31', 'SANTA MARGARIDA', NULL, '31', '36910000', '6', '5157', '5157', '11579', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '256,183', '-20,38400', '-42,25100', '720', 'S', '0,61', NULL, NULL, '31059', 'S', 'N', '4371', NULL, '3190', '3190', NULL, '1948', 'S', '2031', 'SANTA MARGARIDA', 'N', '315790', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '676', 'ESTAGNADA', '03', 'N', '641', NULL, NULL, NULL, NULL);
INSERT INTO `tb_municipio` (`CO_MUNICIPIO_IBGE`, `CO_REGIONAL_SAUDE`, `SG_UF`, `CO_MACRORREGIONAL`, `CO_MESORREGIAO`, `CO_MICRORREGIAO`, `CO_UF_IBGE`, `NO_MUNICIPIO`, `SG_MUNICIPIO`, `NU_DDD`, `NU_CEP`, `DV_MUNICIPIO_IBGE`, `CO_MUNICIPIO_SIAFI`, `CO_MUNICIPIO_SIAPE`, `CO_SINPAS`, `CO_REGIAO_CORREIO`, `ST_MUNICIPIO`, `ST_AMAZONIA`, `ST_FRONTEIRA`, `CO_SUCESSOR`, `NO_ANTERIOR`, `ST_COMUNIDADE_SOLIDARIA`, `ST_SECA`, `ST_SEMI_ARIDO`, `ST_PRMI`, `ST_CALAMIDADE`, `ST_INDIGENA`, `NU_DISTANCIA_CAPITAL`, `ST_CAPITAL`, `NU_AREA`, `NU_LATITUDE`, `NU_LONGITUDE`, `NU_ALTITUDE`, `ST_REGISTRO_ATIVO`, `NU_IDH`, `CO_MUNICIPIO_CORREIO`, `CO_MUNICIPIO_INSS`, `CO_MICRORREGIONAL_SAUDE`, `ST_PITS`, `ST_QUILOMBOLA`, `CO_SEQ_ANTIGO`, `NO_POPULAR`, `CO_REGIAO_METROPOLITANA`, `CO_AGLOMERADO_URBANO`, `NU_ANO_EXTINCAO`, `NU_ANO_INSTALACAO`, `ST_IBGE`, `CO_MUNICIPIO_SVS`, `NO_MUNICIPIO_ACENTUADO`, `ST_RIDE`, `CO_MUNICIPIO_CNES`, `ST_SUDAM`, `ST_SUDENE`, `ST_CADSUS`, `CO_MUNICIPIO_ORIGEM`, `CO_TERRITORIO_CIDADANIA`, `ST_PSE`, `ST_PAN`, `ST_PACTO_RMINAL`, `CO_MUNICIPIO_TABNET_RJ`, `TP_TIPOLOGIA_PNDR`, `CO_GRUPO_PAC2`, `ST_CNES`, `CO_REGIAO_SAUDE`, `ST_PACTO`, `ST_CIB_SAS`, `DT_MANUTENCAO`, `FSDFSD`) VALUES
('261260', '2608', 'PE', '2605', '2602', '26005', '26', 'SANTA MARIA DA BOA VISTA', NULL, '87', '56380000', '4', '2551', '2551', '15126', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'S', 'N', 'S', 'N', NULL, 'N', '3001,168', '-8,80900', '-39,82500', '361', 'S', '0,59', NULL, NULL, '26900', 'N', 'N', '4374', NULL, '2602', '2690', NULL, '1872', 'S', '2923', 'SANTA MARIA DA BOA VISTA', 'N', '261260', 'N', 'S', 'S', NULL, '83', 'N', 'N', 'N', '146', 'ESTAGNADA', '03', 'N', '313', NULL, NULL, NULL, NULL),
('150660', '1505', 'PA', '1511', '1504', '15010', '15', 'SANTA MARIA DO PARA', NULL, '91', '68738000', '9', '0531', '0531', '12066', NULL, 'ATIVO', 'S', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '457,717', '-1,35200', '-47,57600', '51', 'S', '0,598', NULL, NULL, '15900', 'S', 'N', '4383', NULL, '1590', '1590', NULL, '1961', 'S', '2522', 'SANTA MARIA DO PARÁ', 'N', '150660', 'S', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '112', 'ESTAGNADA', '03', 'N', '452', NULL, NULL, NULL, NULL),
('354390', '3510', 'SP', '3529', '3506', '35026', '35', 'RIO CLARO', NULL, '19', '11350970', '7', '6979', '6979', '21440', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '498,008', '-22,41100', '-47,56100', '625', 'S', '0,803', NULL, NULL, '35104', 'N', 'N', '4146', NULL, '3590', '3508', NULL, '1845', 'S', '5235', 'RIO CLARO', 'N', '354390', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '494', 'ALTA RENDA', '01', 'N', '43', NULL, NULL, NULL, NULL),
('171865', '1714', 'TO', '1702', '1702', '17008', '17', 'RIO DA CONCEICAO', NULL, '63', '77303000', '9', '0323', '0323', '28111', NULL, 'ATIVO', 'S', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '771,112', '-11,40000', '-46,88300', '496', 'S', '0,608', NULL, NULL, '17900', 'S', 'N', '4149', NULL, '1790', '1790', NULL, '1993', 'S', '5497', 'RIO DA CONCEIÇÃO', 'N', '171865', 'S', 'N', 'S', NULL, '124', 'N', 'N', 'N', '111', 'DINÂMICA', '03', 'N', '218', NULL, NULL, NULL, NULL),
('330450', '3305', 'RJ', '3312', '3305', '33012', '33', 'RIO DAS FLORES', NULL, '24', '27660000', '8', '5889', '5889', '17045', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'S', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '477,662', '-22,16800', '-43,58600', '525', 'S', '0,68', NULL, NULL, '33900', 'N', 'N', '4151', NULL, '3390', '3390', NULL, '1890', 'S', '3647', 'RIO DAS FLORES', 'N', '330450', 'N', 'N', 'S', NULL, NULL, 'S', 'N', 'N', '66', 'ESTAGNADA', '03', 'N', '205', NULL, NULL, NULL, NULL),
('315510', '3119', 'MG', '3111', '3103', '31014', '31', 'RIO DO PRADO', NULL, '33', '39940000', '8', '5101', '5101', '11551', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'S', 'S', 'N', 'N', 'S', 'N', NULL, 'N', '479,424', '-16,60800', '-40,57000', '350', 'S', '0,605', NULL, NULL, '31063', 'S', 'N', '4161', NULL, '3190', '3190', NULL, '1953', 'S', '1996', 'RIO DO PRADO', 'N', '315510', 'N', 'S', 'S', NULL, '117', 'S', 'N', 'N', '641', 'DINÂMICA', '03', 'N', '599', NULL, NULL, NULL, NULL),
('315520', '3103', 'MG', '3102', '3112', '31062', '31', 'RIO ESPERA', NULL, '31', '36460000', '7', '5103', '5103', '11552', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'S', 'N', 'N', 'N', 'S', 'N', NULL, 'N', '239,688', '-20,85500', '-43,47400', '712', 'S', '0,602', NULL, NULL, '31014', 'S', 'N', '4167', NULL, '3190', '3190', NULL, '1911', 'S', '1998', 'RIO ESPERA', 'N', '315520', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '643', 'ESTAGNADA', '03', 'N', '584', NULL, NULL, NULL, NULL),
('270770', '2701', 'AL', '2704', '2703', '27011', '27', 'RIO LARGO', NULL, '82', '57100000', '1', '2853', '2853', '02077', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'S', 'N', 'N', NULL, 'N', '309,425', '-9,47800', '-35,85300', '39', 'S', '0,643', NULL, NULL, '27001', 'N', 'N', '4173', NULL, '2701', '2701', NULL, '1915', 'S', '104', 'RIO LARGO', 'N', '270770', 'N', 'S', 'S', NULL, NULL, 'N', 'N', 'S', '83', 'ALTA RENDA', '02', 'N', '44', NULL, NULL, NULL, NULL),
('320440', '3202', 'ES', '3205', '3203', '32010', '32', 'RIO NOVO DO SUL', NULL, '28', '29290000', '1', '5687', '5687', '07044', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'S', 'S', 'N', NULL, 'N', '203,721', '-20,86300', '-40,93600', '70', 'S', '0,711', NULL, NULL, '32007', 'N', 'N', '4180', NULL, '3290', '3290', NULL, '1893', 'S', '879', 'RIO NOVO DO SUL', 'N', '320440', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '61', 'ALTA RENDA', '03', 'N', '52', NULL, NULL, NULL, NULL),
('315570', '3109', 'MG', '3103', '3107', '31031', '31', 'RIO PIRACICABA', NULL, '31', '35940000', '2', '5113', '5113', '11557', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '370,355', '-19,92900', '-43,17400', '639', 'S', '0,685', NULL, NULL, '31023', 'N', 'N', '4184', NULL, '3190', '3190', NULL, '1911', 'S', '2003', 'RIO PIRACICABA', 'N', '315570', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '648', 'ESTAGNADA', '03', 'N', '636', NULL, NULL, NULL, NULL),
('521878', '5216', 'GO', '5210', '5205', '52015', '52', 'RIO QUENTE', NULL, '64', '75695000', '9', '9995', '9995', '08293', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '256,739', '-17,77400', '-48,77300', '663', 'S', '0,731', NULL, NULL, '52900', 'N', 'N', '4188', NULL, '5290', '5290', NULL, '1989', 'S', '1089', 'RIO QUENTE', 'N', '521878', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '197', 'ALTA RENDA', '03', 'N', '351', NULL, NULL, NULL, NULL),
('431575', '4301', 'RS', '4313', '4305', '43024', '43', 'RIOZINHO', NULL, '51', '95695000', '0', '7353', '7353', '19309', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'S', 'N', 'N', 'N', 'N', 'S', NULL, 'N', '239,34', '-29,64100', '-50,45300', '90', 'S', '0,661', NULL, NULL, '43900', 'N', 'N', '4197', NULL, '4390', '4390', NULL, '1989', 'S', '4229', 'RIOZINHO', 'N', '431575', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '346', 'ALTA RENDA', '03', 'N', '462', NULL, NULL, NULL, NULL),
('315610', '3120', 'MG', '3102', '3111', '31058', '31', 'RITAPOLIS', NULL, '32', '36335000', '6', '5121', '5121', '11561', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '391,839', '-21,02200', '-44,31800', '1051', 'S', '0,653', NULL, NULL, '31015', 'N', 'N', '4199', NULL, '3190', '3190', NULL, '1962', 'S', '2007', 'RITÁPOLIS', 'N', '315610', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '652', 'ESTAGNADA', '03', 'N', '657', NULL, NULL, NULL, NULL),
('431590', '4319', 'RS', '4311', '4301', '43003', '43', 'RODEIO BONITO', NULL, '55', '98360000', '9', '8821', '8821', '19160', NULL, 'ATIVO', 'N', 'S', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'S', NULL, 'N', '83,198', '-27,47100', '-53,16900', '371', 'S', '0,732', NULL, NULL, '43900', 'N', 'N', '4205', NULL, '4390', '4390', NULL, '1963', 'S', '4231', 'RODEIO BONITO', 'N', '431590', 'N', 'N', 'S', NULL, '56', 'N', 'N', 'N', '348', 'ESTAGNADA', '03', 'N', '471', NULL, NULL, NULL, NULL),
('120042', '1203', 'AC', '1201', '1201', '12001', '12', 'RODRIGUES ALVES', NULL, '68', '69985000', '7', '0659', '0659', '24031', NULL, 'ATIVO', 'S', 'S', NULL, NULL, 'S', 'N', 'N', 'S', 'N', 'S', NULL, 'N', '3304,559', '-7,74200', '-72,64700', '0', 'S', '0,567', NULL, NULL, '12900', 'S', 'N', '4209', NULL, '1290', '1290', NULL, '1993', 'S', '17', 'RODRIGUES ALVES', 'N', '120042', 'S', 'N', 'S', NULL, '106', 'N', 'N', 'N', '17', 'DINÂMICA', '03', 'N', '225', NULL, NULL, NULL, NULL),
('312170', '3108', 'MG', '3110', '3107', '31033', '31', 'DIOGO DE VASCONCELOS', NULL, '31', '35437000', '4', '4433', '4433', '11217', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '165,035', '-20,48800', '-43,19800', '592', 'S', '0,601', NULL, NULL, '31060', 'S', 'N', '1540', NULL, '3190', '3190', NULL, '1962', 'S', '1597', 'DIOGO DE VASCONCELOS', 'N', '312170', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '242', 'ESTAGNADA', '03', 'N', '653', NULL, NULL, NULL, NULL),
('312190', '3118', 'MG', '3107', '3112', '31064', '31', 'DIVINESIA', NULL, '32', '36546000', '2', '4437', '4437', '11219', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '118,361', '-20,99000', '-43,00400', '753', 'S', '0,657', NULL, NULL, '31048', 'N', 'N', '1547', NULL, '3190', '3190', NULL, '1962', 'S', '1599', 'DIVINÉSIA', 'N', '312190', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '244', 'ESTAGNADA', '03', 'N', '665', NULL, NULL, NULL, NULL),
('351390', '3514', 'SP', '3528', '3507', '35030', '35', 'DIVINOLANDIA', NULL, '19', '13780000', '0', '6379', '6379', '21140', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '222,257', '-21,66100', '-46,73900', '1040', 'S', '0,734', NULL, NULL, '35143', 'N', 'N', '1551', NULL, '3590', '3590', NULL, '1953', 'S', '4897', 'DIVINOLÂNDIA', 'N', '351390', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '156', 'ALTA RENDA', '03', 'N', '279', NULL, NULL, NULL, NULL),
('312230', '3115', 'MG', '3105', '3109', '31043', '31', 'DIVINOPOLIS', NULL, '37', '35500970', '6', '4445', '4445', '11223', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '708,909', '-20,13900', '-44,88400', '712', 'S', '0,764', NULL, NULL, '31029', 'N', 'N', '1553', NULL, '3190', '3190', NULL, '1911', 'S', '1603', 'DIVINÓPOLIS', 'N', '312230', 'N', 'N', 'S', NULL, NULL, 'N', 'S', 'N', '248', 'ALTA RENDA', '01', 'N', '591', NULL, NULL, NULL, NULL),
('312245', '3119', 'MG', '3111', '3103', '31014', '31', 'DIVISOPOLIS', NULL, '33', '39912000', '4', '2657', '2657', '11731', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'S', 'S', 'N', 'N', 'N', NULL, 'N', '566,07', '-15,72600', '-41,00000', '910', 'S', '0,609', NULL, NULL, '31063', 'S', 'N', '1558', NULL, '3190', '3190', NULL, '1993', 'S', '1606', 'DIVISÓPOLIS', 'N', '312245', 'N', 'S', 'S', NULL, '117', 'N', 'N', 'N', '251', 'DINÂMICA', '03', 'N', '650', NULL, NULL, NULL, NULL),
('351340', '3517', 'SP', '3526', '3513', '35051', '35', 'CRUZEIRO', NULL, '12', '12700000', '5', '6369', '6369', '21135', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '304,572', '-22,57600', '-44,96300', '517', 'S', '0,788', NULL, NULL, '35172', 'N', 'N', '1459', NULL, '3590', '3590', NULL, '1871', 'S', '4891', 'CRUZEIRO', 'N', '351340', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '150', 'ALTA RENDA', '02', 'N', '433', NULL, NULL, NULL, NULL),
('410720', '4108', 'PR', '4108', '4107', '41026', '41', 'DOIS VIZINHOS', NULL, '46', '85660000', '7', '7541', '7541', '14071', NULL, 'ATIVO', 'N', 'S', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '418,32', '-25,73400', '-53,05700', '509', 'S', '0,767', NULL, NULL, '41900', 'N', 'N', '1567', NULL, '4190', '4190', NULL, '1960', 'S', '3283', 'DOIS VIZINHOS', 'N', '410720', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '100', 'ESTAGNADA', '03', 'N', '34', NULL, NULL, NULL, NULL),
('312247', '3126', 'MG', '3109', '3101', '31001', '31', 'DOM BOSCO', NULL, '38', '38654000', '0', '0606', '0606', '11790', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '821,755', '-16,65200', '-46,27100', '610', 'S', '0,673', NULL, NULL, '31058', 'N', 'N', '1571', NULL, '3190', '3190', NULL, '1997', 'S', '1607', 'DOM BOSCO', 'N', '312247', 'N', 'N', 'S', NULL, '63', 'N', 'N', 'N', '252', 'DINÂMICA', '03', 'N', '668', NULL, NULL, NULL, NULL),
('430660', '4307', 'RS', '4309', '4306', '43031', '43', 'DOM PEDRITO', NULL, '53', '96450000', '1', '8629', '8629', '19065', NULL, 'ATIVO', 'N', 'S', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '5192,105', '-30,98300', '-54,67300', '141', 'S', '0,708', NULL, NULL, '43900', 'N', 'N', '1579', NULL, '4390', '4390', NULL, '1872', 'S', '4030', 'DOM PEDRITO', 'N', '430660', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '136', 'ALTA RENDA', '03', 'N', '478', NULL, NULL, NULL, NULL),
('210380', '2113', 'MA', '2111', '2103', '21012', '21', 'DOM PEDRO', NULL, '99', '65765000', '2', '0773', '0773', '09037', NULL, 'ATIVO', 'S', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '369,964', '-5,03300', '-44,43600', '142', 'S', '0,622', NULL, NULL, '21900', 'S', 'N', '1580', NULL, '2190', '2190', NULL, '1952', 'S', '1204', 'DOM PEDRO', 'N', '210380', 'S', 'S', 'S', NULL, NULL, 'N', 'N', 'N', '66', 'BAIXA RENDA', '03', 'N', '11', NULL, NULL, NULL, NULL),
('312270', '3108', 'MG', '3110', '3112', '31060', '31', 'DOM SILVERIO', NULL, '31', '35440000', '2', '4453', '4453', '11227', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '194,956', '-20,16000', '-42,96800', '519', 'S', '0,709', NULL, NULL, '31060', 'N', 'N', '1582', NULL, '3190', '3190', NULL, '1938', 'S', '1610', 'DOM SILVÉRIO', 'N', '312270', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '255', 'ESTAGNADA', '03', 'N', '653', NULL, NULL, NULL, NULL),
('312280', '3111', 'MG', '3101', '3110', '31056', '31', 'DOM VICOSO', NULL, '35', '37474000', '1', '4455', '4455', '11228', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '113,178', '-22,25400', '-45,16100', '923', 'S', '0,687', NULL, NULL, '31008', 'N', 'N', '1583', NULL, '3190', '3190', NULL, '1953', 'S', '1611', 'DOM VIÇOSO', 'N', '312280', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '256', 'ESTAGNADA', '03', 'N', '659', NULL, NULL, NULL, NULL),
('320190', '3201', 'ES', '3207', '3203', '32007', '32', 'DOMINGOS MARTINS', NULL, '27', '29260000', '2', '5637', '5637', '07019', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'S', 'S', 'N', NULL, 'N', '1225,327', '-20,36300', '-40,65900', '620', 'S', '0,669', NULL, NULL, '32006', 'N', 'N', '1584', NULL, '3290', '3290', NULL, '1893', 'S', '842', 'DOMINGOS MARTINS', 'N', '320190', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '23', 'ESTAGNADA', '03', 'N', '173', NULL, NULL, NULL, NULL),
('220342', '2202', 'PI', '2209', '2202', '22004', '22', 'DOMINGOS MOURAO', NULL, '86', '64250000', '0', '1141', '1141', '16071', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'S', 'N', 'S', 'N', NULL, 'N', '846,831', '-4,25400', '-41,27000', '150', 'S', '0,55', NULL, NULL, '22900', 'S', 'N', '1585', NULL, '2290', '2290', NULL, '1962', 'S', '3037', 'DOMINGOS MOURÃO', 'N', '220342', 'N', 'S', 'S', NULL, '161', 'S', 'N', 'N', '76', 'DINÂMICA', '03', 'N', '196', NULL, NULL, NULL, NULL),
('312290', '3127', 'MG', '3107', '3112', '31066', '31', 'DONA EUSEBIA', NULL, '32', '36784000', '0', '4457', '4457', '11229', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '54,466', '-21,31600', '-42,81100', '222', 'S', '0,701', NULL, NULL, '31044', 'N', 'N', '1587', NULL, '3190', '3190', NULL, '1962', 'S', '1612', 'DONA EUSÉBIA', 'N', '312290', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '257', 'ESTAGNADA', '03', 'N', '639', NULL, NULL, NULL, NULL),
('420430', '4210', 'SC', '4212', '4201', '42005', '42', 'CONCORDIA', NULL, '49', '89700000', '1', '8083', '8083', '20042', NULL, 'ATIVO', 'N', 'S', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '797,26', '-27,23400', '-52,02800', '569', 'S', '0,8', NULL, NULL, '42900', 'N', 'N', '1331', NULL, '4290', '4290', NULL, '1934', 'S', '4442', 'CONCÓRDIA', 'N', '420430', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '71', 'ALTA RENDA', '02', 'N', '487', NULL, NULL, NULL, NULL),
('260460', '2612', 'PE', '2607', '2604', '26013', '26', 'CONDADO', NULL, '81', '55940000', '1', '2391', '2391', '15046', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '89,643', '-7,58600', '-35,10600', '129', 'S', '0,602', NULL, NULL, '26900', 'S', 'N', '1333', NULL, '2690', '2690', NULL, '1958', 'S', '2828', 'CONDADO', 'N', '260460', 'N', 'S', 'S', NULL, NULL, 'S', 'N', 'N', '51', 'ESTAGNADA', '03', 'N', '259', NULL, NULL, NULL, NULL),
('430570', '4317', 'RS', '4312', '4301', '43008', '43', 'CONDOR', NULL, '55', '98290000', '2', '8611', '8611', '19056', NULL, 'ATIVO', 'N', 'S', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '465,188', '-28,20800', '-53,48700', '451', 'S', '0,747', NULL, NULL, '43900', 'N', 'N', '1338', NULL, '4390', '4390', NULL, '1965', 'S', '4010', 'CONDOR', 'N', '430570', 'N', 'N', 'S', NULL, '147', 'N', 'N', 'N', '113', 'ALTA RENDA', '03', 'N', '469', NULL, NULL, NULL, NULL),
('250470', '2505', 'PB', '2502', '2502', '25010', '25', 'CONGO', NULL, '83', '58535000', '2', '1995', '1995', '13048', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'S', 'N', 'S', 'N', 'S', 'N', NULL, 'N', '274,075', '-7,79700', '-36,66000', '480', 'S', '0,581', NULL, NULL, '25900', 'S', 'N', '1342', NULL, '2590', '2590', NULL, '1959', 'S', '2616', 'CONGO', 'N', '250470', 'N', 'S', 'S', NULL, '27', 'N', 'N', 'N', '61', 'DINÂMICA', '03', 'N', '253', NULL, NULL, NULL, NULL),
('410610', '4119', 'PR', '4105', '4104', '41017', '41', 'CONSELHEIRO MAIRINCK', NULL, '43', '86480000', '0', '7519', '7519', '14060', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'S', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '204,705', '-23,63000', '-50,16900', '520', 'S', '0,707', NULL, NULL, '41900', 'N', 'N', '1349', NULL, '4190', '4190', NULL, '1960', 'S', '3266', 'CONSELHEIRO MAIRINCK', 'N', '410610', 'N', 'N', 'S', NULL, '146', 'N', 'N', 'N', '83', 'ESTAGNADA', '03', 'N', '427', NULL, NULL, NULL, NULL),
('311860', '3101', 'MG', '3103', '3107', '31030', '31', 'CONTAGEM', NULL, '31', '32161970', '1', '4371', '4371', '11186', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '194,586', '-19,93200', '-44,05400', '902', 'S', '0,756', NULL, NULL, '31018', 'N', 'N', '1353', NULL, '3101', '3101', NULL, '1948', 'S', '1561', 'CONTAGEM', 'N', '311860', 'N', 'N', 'S', NULL, NULL, 'S', 'S', 'N', '206', 'ALTA RENDA', '01', 'N', '617', NULL, NULL, NULL, NULL),
('311880', '3106', 'MG', '3108', '3102', '31007', '31', 'CORACAO DE JESUS', NULL, '38', '39340000', '9', '4375', '4375', '11188', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '2236,236', '-16,68500', '-44,36500', '760', 'S', '0,642', NULL, NULL, '31050', 'S', 'N', '1359', NULL, '3190', '3190', NULL, '1911', 'S', '1563', 'CORAÇÃO DE JESUS', 'N', '311880', 'N', 'S', 'S', NULL, NULL, 'N', 'N', 'N', '208', 'ESTAGNADA', '03', 'N', '618', NULL, NULL, NULL, NULL),
('351240', '3510', 'SP', '3529', '3506', '35027', '35', 'CORDEIROPOLIS', NULL, '19', '13490000', '7', '6349', '6349', '21125', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '137,337', '-22,48200', '-47,45700', '668', 'S', '0,758', NULL, NULL, '35102', 'N', 'N', '1363', NULL, '3590', '3508', NULL, '1948', 'S', '4881', 'CORDEIRÓPOLIS', 'N', '351240', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '140', 'ALTA RENDA', '03', 'N', '327', NULL, NULL, NULL, NULL),
('500310', '5011', 'MS', '5008', '5002', '50004', '50', 'CORGUINHO', NULL, '67', '79460000', '8', '9061', '9061', '06031', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'S', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '2640,814', '-19,83200', '-54,82900', '320', 'S', '0,671', NULL, NULL, '50012', 'N', 'S', '1370', NULL, '5090', '5090', NULL, '1953', 'S', '2232', 'CORGUINHO', 'N', '500310', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '24', 'ALTA RENDA', '03', 'N', '441', NULL, NULL, NULL, NULL),
('430590', '4315', 'RS', '4311', '4301', '43008', '43', 'CORONEL BICACO', NULL, '55', '98580000', '0', '8615', '8615', '19058', NULL, 'ATIVO', 'N', 'S', NULL, NULL, 'S', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '492,124', '-27,71600', '-53,70100', '468', 'S', '0,665', NULL, NULL, '43900', 'N', 'N', '1379', NULL, '4390', '4390', NULL, '1963', 'S', '4014', 'CORONEL BICACO', 'N', '430590', 'N', 'N', 'S', NULL, '147', 'S', 'N', 'N', '118', 'ALTA RENDA', '03', 'N', '476', NULL, NULL, NULL, NULL),
('420445', '4203', 'SC', '4213', '4201', '42003', '42', 'CORONEL MARTINS', NULL, '49', '89837000', '9', '5735', '5735', '20252', NULL, 'ATIVO', 'N', 'S', NULL, NULL, 'S', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '107,408', '-26,51200', '-52,66900', '695', 'S', '0,696', NULL, NULL, '42900', 'N', 'N', '1388', NULL, '4290', '4290', NULL, '1993', 'S', '4445', 'CORONEL MARTINS', 'N', '420445', 'N', 'N', 'S', NULL, '33', 'S', 'N', 'N', '74', 'ALTA RENDA', '03', 'N', '502', NULL, NULL, NULL, NULL),
('311960', '3105', 'MG', '3107', '3112', '31065', '31', 'CORONEL PACHECO', NULL, '32', '36155000', '9', '4391', '4391', '11196', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'S', 'N', NULL, 'N', '130,287', '-21,58800', '-43,26600', '484', 'S', '0,669', NULL, NULL, '31043', 'N', 'N', '1390', NULL, '3190', '3190', NULL, '1962', 'S', '1571', 'CORONEL PACHECO', 'N', '311960', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '216', 'ALTA RENDA', '03', 'N', '602', NULL, NULL, NULL, NULL),
('311970', '3120', 'MG', '3102', '3111', '31058', '31', 'CORONEL XAVIER CHAVES', NULL, '32', '36330000', '8', '4393', '4393', '11197', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '141,137', '-21,02400', '-44,22300', '931', 'S', '0,677', NULL, NULL, '31015', 'N', 'N', '1393', NULL, '3190', '3190', NULL, '1962', 'S', '1572', 'CORONEL XAVIER CHAVES', 'N', '311970', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '217', 'ESTAGNADA', '03', 'N', '657', NULL, NULL, NULL, NULL),
('311995', '3115', 'MG', '3105', '3109', '31044', '31', 'CORREGO FUNDO', NULL, '37', '35578000', '5', '0594', '0594', '11785', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '105,387', '-20,44900', '-45,55500', '844', 'S', '0,678', NULL, NULL, '31030', 'N', 'N', '1397', NULL, '3190', '3190', NULL, '1997', 'S', '1575', 'CÓRREGO FUNDO', 'N', '311995', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '220', 'ESTAGNADA', '03', 'N', '622', NULL, NULL, NULL, NULL),
('260470', '2605', 'PE', '2608', '2603', '26011', '26', 'CORRENTES', NULL, '87', '55315000', '0', '2393', '2393', '15047', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'S', 'S', 'N', 'N', NULL, 'N', '339,303', '-9,12900', '-36,33000', '391', 'S', '0,536', NULL, NULL, '26900', 'S', 'N', '1401', NULL, '2690', '2690', NULL, '1879', 'S', '2829', 'CORRENTES', 'N', '260470', 'N', 'S', 'S', NULL, NULL, 'S', 'N', 'N', '52', 'ESTAGNADA', '03', 'N', '257', NULL, NULL, NULL, NULL),
('351280', '3507', 'SP', '3528', '3507', '35032', '35', 'COSMOPOLIS', NULL, '19', '13150000', '3', '6357', '6357', '21129', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '154,73', '-22,64600', '-47,19600', '652', 'S', '0,769', NULL, NULL, '35072', 'N', 'N', '1412', NULL, '3503', '3503', NULL, '1944', 'S', '4885', 'COSMÓPOLIS', 'N', '351280', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '144', 'ALTA RENDA', '01', 'N', '515', NULL, NULL, NULL, NULL),
('351300', '3501', 'SP', '3523', '3515', '35060', '35', 'COTIA', NULL, '11', '06700000', '9', '6361', '6361', '21131', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '323,891', '-23,60400', '-46,91900', '853', 'S', '0,78', NULL, NULL, '35013', 'N', 'N', '1417', NULL, '3501', '3501', NULL, '1856', 'S', '4887', 'COTIA', 'N', '351300', 'N', 'N', 'S', NULL, NULL, 'S', 'N', 'N', '146', 'ALTA RENDA', '01', 'N', '161', NULL, NULL, NULL, NULL),
('500330', '5002', 'MS', '5008', '5002', '50003', '50', 'COXIM', NULL, '67', '79400000', '6', '9065', '9065', '06033', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '6411,552', '-18,507', '-54,76', '238', 'S', '0,703', NULL, NULL, '50013', 'N', 'N', '1423', NULL, '5090', '5090', NULL, '1898', 'S', '2236', 'COXIM', 'N', '500330', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '28', 'ESTAGNADA', '03', 'N', '441', NULL, NULL, NULL, NULL),
('351310', '3513', 'SP', '3530', '3502', '35014', '35', 'CRAVINHOS', NULL, '16', '14140000', '8', '6363', '6363', '21132', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '311,341', '-21,34000', '-47,72900', '788', 'S', '0,756', NULL, NULL, '35132', 'N', 'N', '1428', NULL, '3590', '3510', NULL, '1897', 'S', '4888', 'CRAVINHOS', 'N', '351310', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '147', 'ALTA RENDA', '03', 'N', '273', NULL, NULL, NULL, NULL),
('311780', '3110', 'MG', '3101', '3110', '31053', '31', 'CONCEICAO DOS OUROS', NULL, '35', '37548000', '1', '4355', '4355', '11178', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '182,673', '-22,41300', '-45,79800', '863', 'S', '0,703', NULL, NULL, '31007', 'N', 'N', '1328', NULL, '3190', '3190', NULL, '1948', 'S', '1551', 'CONCEIÇÃO DOS OUROS', 'N', '311780', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '196', 'ESTAGNADA', '03', 'N', '654', NULL, NULL, NULL, NULL),
('312040', '3103', 'MG', '3102', '3107', '31034', '31', 'CRISTIANO OTONI', NULL, '31', '36426000', '9', '4407', '4407', '11204', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '132,869', '-20,83200', '-43,80600', '1005', 'S', '0,695', NULL, NULL, '31014', 'N', 'N', '1442', NULL, '3190', '3190', NULL, '1962', 'S', '1581', 'CRISTIANO OTONI', 'N', '312040', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '226', 'ESTAGNADA', '03', 'N', '584', NULL, NULL, NULL, NULL),
('231180', '2309', 'CE', '2306', '2305', '23023', '23', 'RUSSAS', NULL, '88', '62900000', '1', '1537', '1537', '05119', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'S', 'S', 'N', 'N', NULL, 'N', '1588,105', '-4,94000', '-37,97600', '20', 'S', '0,674', NULL, NULL, '23900', 'N', 'N', '4238', NULL, '2390', '2390', NULL, '1859', 'S', '771', 'RUSSAS', 'N', '231180', 'N', 'S', 'S', NULL, NULL, 'N', 'N', 'N', '155', 'ESTAGNADA', '02', 'N', '341', NULL, NULL, NULL, NULL),
('315690', '3113', 'MG', '3112', '3105', '31023', '31', 'SACRAMENTO', NULL, '34', '38190000', '8', '5137', '5137', '11569', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '3071,454', '-19,86500', '-47,44000', '832', 'S', '0,732', NULL, NULL, '31072', 'N', 'N', '4246', NULL, '3190', '3190', NULL, '1870', 'S', '2016', 'SACRAMENTO', 'N', '315690', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '661', 'ALTA RENDA', '03', 'N', '666', NULL, NULL, NULL, NULL),
('431643', '4309', 'RS', '4312', '4301', '43011', '43', 'SALDANHA MARINHO', NULL, '55', '98250000', '6', '7339', '7339', '19310', NULL, 'ATIVO', 'N', 'S', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '221,605', '-28,39300', '-53,09500', '525', 'S', '0,762', NULL, NULL, '43900', 'N', 'N', '4250', NULL, '4390', '4390', NULL, '1989', 'S', '4238', 'SALDANHA MARINHO', 'N', '431643', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '356', 'ALTA RENDA', '03', 'N', '468', NULL, NULL, NULL, NULL),
('421530', '4204', 'SC', '4216', '4204', '42011', '42', 'SALETE', NULL, '47', '89196000', '7', '8301', '8301', '20151', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '179,308', '-26,98000', '-50,00000', '500', 'S', '0,744', NULL, NULL, '42900', 'N', 'N', '4254', NULL, '4218', '4290', NULL, '1961', 'S', '4597', 'SALETE', 'N', '421530', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '226', 'ALTA RENDA', '03', 'N', '488', NULL, NULL, NULL, NULL),
('261230', '2605', 'PE', '2608', '2603', '26011', '26', 'SALOA', NULL, '87', '55350000', '7', '2545', '2545', '15123', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'S', 'N', 'S', 'N', 'N', 'N', NULL, 'N', '252,08', '-8,97600', '-36,68800', '745', 'S', '0,559', NULL, NULL, '26900', 'S', 'N', '4266', NULL, '2690', '2690', NULL, '1963', 'S', '2917', 'SALOÁ', 'N', '261230', 'N', 'S', 'S', NULL, '2', 'S', 'N', 'N', '140', 'ESTAGNADA', '03', 'N', '257', NULL, NULL, NULL, NULL),
('330414', '3306', 'RJ', '3311', '3306', '33018', '33', 'QUEIMADOS', NULL, '21', '26300000', '4', '2911', '2911', '17074', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'S', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '76,921', '-22,71600', '-43,55500', '30', 'S', '0,68', NULL, NULL, '33900', 'N', 'N', '4021', NULL, '3301', '3301', NULL, '1993', 'S', '3642', 'QUEIMADOS', 'N', '330414', 'N', 'N', 'S', NULL, NULL, 'S', 'N', 'N', '61', 'ALTA RENDA', '01', 'N', '81', NULL, NULL, NULL, NULL),
('510706', '5103', 'MT', '5104', '5102', '51010', '51', 'QUERENCIA', NULL, '66', '78643000', '5', '0097', '0097', '10172', NULL, 'ATIVO', 'S', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'S', NULL, 'N', '17850,249', '-12,47600', '-52,37800', '0', 'S', '0,692', NULL, NULL, '51900', 'S', 'N', '4025', NULL, '5190', '5190', NULL, '1993', 'S', '2380', 'QUERÊNCIA', 'N', '510706', 'S', 'N', 'S', NULL, '19', 'N', 'N', 'N', '104', 'DINÂMICA', '03', 'N', '144', NULL, NULL, NULL, NULL),
('431535', '4309', 'RS', '4312', '4301', '43011', '43', 'QUINZE DE NOVEMBRO', NULL, '54', '98230000', '4', '7357', '7357', '19307', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '223,638', '-28,74200', '-53,09500', '355', 'S', '0,756', NULL, NULL, '43900', 'N', 'N', '4032', NULL, '4390', '4390', NULL, '1989', 'S', '4222', 'QUINZE DE NOVEMBRO', 'N', '431535', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '339', 'ALTA RENDA', '03', 'N', '468', NULL, NULL, NULL, NULL),
('412120', '4102', 'PR', '4107', '4110', '41039', '41', 'QUITANDINHA', NULL, '41', '83840000', '8', '7801', '7801', '14201', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'S', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '447,023', '-25,87200', '-49,49800', '845', 'S', '0,68', NULL, NULL, '41900', 'N', 'N', '4036', NULL, '4101', '4101', NULL, '1961', 'S', '3478', 'QUITANDINHA', 'N', '412120', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '296', 'DINÂMICA', '01', 'N', '204', NULL, NULL, NULL, NULL),
('231140', '2308', 'CE', '2307', '2304', '23019', '23', 'QUIXERAMOBIM', NULL, '88', '63800000', '5', '1529', '1529', '05115', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'S', 'S', 'S', 'N', NULL, 'N', '3275,838', '-5,19900', '-39,29300', '191', 'S', '0,642', NULL, NULL, '23900', 'N', 'N', '4043', NULL, '2390', '2390', NULL, '1856', 'S', '767', 'QUIXERAMOBIM', 'N', '231140', 'N', 'S', 'S', NULL, '80', 'N', 'N', 'N', '151', 'DINÂMICA', '01', 'N', '51', NULL, NULL, NULL, NULL),
('292595', '2902', 'BA', '2917', '2903', '29012', '29', 'RAFAEL JAMBEIRO', NULL, '75', '44520000', '6', '3985', '3985', '04361', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'S', 'N', 'S', 'S', 'N', 'N', NULL, 'N', '1234,248', '-12,40800', '-39,50100', '238', 'S', '0,564', NULL, NULL, '29011', 'S', 'N', '4047', NULL, '2990', '2990', NULL, '1986', 'S', '519', 'RAFAEL JAMBEIRO', 'N', '292595', 'N', 'S', 'S', NULL, NULL, 'S', 'N', 'N', '320', 'ESTAGNADA', '03', 'N', '54', NULL, NULL, NULL, NULL),
('421430', '4207', 'SC', '4214', '4205', '42017', '42', 'RANCHO QUEIMADO', NULL, '48', '88470000', '0', '8281', '8281', '20141', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'S', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '286,432', '-27,67300', '-49,02200', '810', 'S', '0,753', NULL, NULL, '42900', 'N', 'N', '4053', NULL, '4202', '4201', NULL, '1962', 'S', '4585', 'RANCHO QUEIMADO', 'N', '421430', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '214', 'ESTAGNADA', '03', 'N', '494', NULL, NULL, NULL, NULL),
('412140', '4108', 'PR', '4108', '4107', '41025', '41', 'REALEZA', NULL, '46', '85770000', '6', '7805', '7805', '14203', NULL, 'ATIVO', 'N', 'S', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '353,415', '-25,76700', '-53,52700', '520', 'S', '0,722', NULL, NULL, '41900', 'N', 'N', '4057', NULL, '4190', '4190', NULL, '1961', 'S', '3482', 'REALEZA', 'N', '412140', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '300', 'ESTAGNADA', '03', 'N', '34', NULL, NULL, NULL, NULL),
('315410', '3127', 'MG', '3107', '3112', '31066', '31', 'RECREIO', NULL, '32', '36740000', '1', '5081', '5081', '11541', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'S', 'N', NULL, 'N', '234,24', '-21,52500', '-42,46900', '193', 'S', '0,692', NULL, NULL, '31044', 'N', 'N', '4060', NULL, '3190', '3190', NULL, '1938', 'S', '1985', 'RECREIO', 'N', '315410', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '630', 'ESTAGNADA', '03', 'N', '639', NULL, NULL, NULL, NULL),
('231160', '2303', 'CE', '2310', '2302', '23013', '23', 'REDENCAO', NULL, '85', '62790000', '3', '1533', '1533', '05117', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'S', 'S', 'N', 'N', NULL, 'N', '225,626', '-4,22600', '-38,73100', '88', 'S', '0,626', NULL, NULL, '23900', 'S', 'N', '4062', NULL, '2390', '2390', NULL, '1889', 'S', '769', 'REDENÇÃO', 'N', '231160', 'N', 'S', 'S', NULL, NULL, 'N', 'N', 'N', '153', 'BAIXA RENDA', '03', 'N', '228', NULL, NULL, NULL, NULL),
('150613', '1512', 'PA', '1509', '1506', '15021', '15', 'REDENCAO', NULL, '94', '68550970', '8', '0567', '0567', '12084', NULL, 'ATIVO', 'S', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'S', NULL, 'N', '3823,787', '-8,02900', '-50,03100', '227', 'S', '0,672', NULL, NULL, '15900', 'N', 'N', '4063', NULL, '1590', '1590', NULL, '1982', 'S', '2511', 'REDENÇÃO', 'N', '150613', 'S', 'N', 'S', NULL, '92', 'N', 'N', 'N', '101', 'ESTAGNADA', '01', 'N', '445', NULL, NULL, NULL, NULL),
('220870', '2211', 'PI', '2210', '2203', '22010', '22', 'REDENCAO DO GURGUEIA', NULL, '89', '64915000', '0', '1173', '1173', '16087', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'S', 'N', 'N', 'N', NULL, 'N', '2468,006', '-9,48700', '-44,58600', '292', 'S', '0,589', NULL, NULL, '22900', 'S', 'N', '4065', NULL, '2290', '2290', NULL, '1962', 'S', '3128', 'REDENÇÃO DO GURGUÉIA', 'N', '220870', 'N', 'S', 'S', NULL, NULL, 'S', 'N', 'N', '169', 'DINÂMICA', '03', 'N', '199', NULL, NULL, NULL, NULL),
('315415', '3124', 'MG', '3110', '3112', '31061', '31', 'REDUTO', NULL, '33', '36920000', '0', '0696', '0696', '11831', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'S', 'N', NULL, 'N', '151,308', '-20,24000', '-41,98300', '610', 'S', '0,629', NULL, NULL, '31059', 'N', 'N', '4067', NULL, '3190', '3190', NULL, '1997', 'S', '1986', 'REDUTO', 'N', '315415', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '631', 'ESTAGNADA', '03', 'N', '641', NULL, NULL, NULL, NULL),
('354240', '3511', 'SP', '3532', '3508', '35036', '35', 'REGENTE FEIJO', NULL, '18', '19570000', '4', '6949', '6949', '21425', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '265,087', '-22,22100', '-51,30300', '504', 'S', '0,768', NULL, NULL, '35112', 'N', 'N', '4069', NULL, '3590', '3590', NULL, '1935', 'S', '5219', 'REGENTE FEIJÓ', 'N', '354240', 'N', 'N', 'S', NULL, '73', 'N', 'N', 'N', '478', 'ALTA RENDA', '03', 'N', '323', NULL, NULL, NULL, NULL),
('354260', '3512', 'SP', '3520', '3514', '35055', '35', 'REGISTRO', NULL, '13', '11900000', '2', '6953', '6953', '21427', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'S', 'S', NULL, 'N', '716,331', '-24,48800', '-47,84400', '25', 'S', '0,754', NULL, NULL, '35121', 'N', 'N', '4071', NULL, '3590', '3590', NULL, '1944', 'S', '5221', 'REGISTRO', 'N', '354260', 'N', 'N', 'S', NULL, '100', 'N', 'N', 'N', '480', 'ESTAGNADA', '02', 'N', '222', NULL, NULL, NULL, NULL),
('315430', '3116', 'MG', '3106', '3108', '31041', '31', 'RESPLENDOR', NULL, '33', '35230000', '9', '5085', '5085', '11543', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'S', NULL, 'N', '1072,112', '-19,32600', '-41,25500', '100', 'S', '0,67', NULL, NULL, '31040', 'N', 'N', '4082', NULL, '3190', '3190', NULL, '1938', 'S', '1988', 'RESPLENDOR', 'N', '315430', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '633', 'ESTAGNADA', '03', 'N', '655', NULL, NULL, NULL, NULL),
('354270', '3508', 'SP', '3530', '3502', '35012', '35', 'RESTINGA', NULL, '16', '14430000', '1', '6955', '6955', '21428', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '245,599', '-20,60300', '-47,48300', '910', 'S', '0,705', NULL, NULL, '35081', 'N', 'N', '4084', NULL, '3590', '3590', NULL, '1964', 'S', '5222', 'RESTINGA', 'N', '354270', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '481', 'ALTA RENDA', '03', 'N', '101', NULL, NULL, NULL, NULL),
('292610', '2912', 'BA', '2917', '2904', '29016', '29', 'RETIROLANDIA', NULL, '75', '48750000', '3', '3823', '3823', '04262', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'S', 'S', 'N', 'N', NULL, 'N', '203,786', '-11,49500', '-39,42600', '325', 'S', '0,636', NULL, NULL, '29014', 'S', 'N', '4086', NULL, '2990', '2990', NULL, '1962', 'S', '521', 'RETIROLÂNDIA', 'N', '292610', 'N', 'S', 'S', NULL, '43', 'S', 'N', 'N', '322', 'ESTAGNADA', '03', 'N', '47', NULL, NULL, NULL, NULL),
('210950', '2106', 'MA', '2109', '2105', '21020', '21', 'RIACHAO', NULL, '99', '65990000', '2', '0887', '0887', '09094', NULL, 'ATIVO', 'S', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '6373,153', '-7,36200', '-46,61700', '383', 'S', '0,576', NULL, NULL, '21900', 'S', 'N', '4087', NULL, '2190', '2190', NULL, '1835', 'S', '1295', 'RIACHÃO', 'N', '210950', 'S', 'S', 'S', NULL, NULL, 'S', 'N', 'N', '157', 'DINÂMICA', '03', 'N', '355', NULL, NULL, NULL, NULL),
('292630', '2902', 'BA', '2917', '2904', '29016', '29', 'RIACHAO DO JACUIPE', NULL, '75', '44640000', '1', '3827', '3827', '04264', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'S', 'S', 'S', 'N', NULL, 'N', '1199,201', '-11,81000', '-39,38200', '219', 'S', '0,628', NULL, NULL, '29011', 'S', 'N', '4091', NULL, '2903', '2990', NULL, '1878', 'S', '523', 'RIACHÃO DO JACUÍPE', 'N', '292630', 'N', 'S', 'S', NULL, NULL, 'N', 'N', 'N', '324', 'ESTAGNADA', '03', 'N', '54', NULL, NULL, NULL, NULL),
('241070', '2406', 'RN', '2401', '2401', '24006', '24', 'RIACHO DA CRUZ', NULL, '84', '59820000', '2', '1811', '1811', '18106', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'S', 'N', 'S', 'N', NULL, 'N', '127,221', '-5,93600', '-37,94600', '163', 'S', '0,584', NULL, NULL, '24900', 'S', 'N', '4095', NULL, '2490', '2490', NULL, '1962', 'S', '3786', 'RIACHO DA CRUZ', 'N', '241070', 'N', 'S', 'S', NULL, '134', 'S', 'N', 'N', '114', 'DINÂMICA', '03', 'N', '85', NULL, NULL, NULL, NULL),
('220885', '2211', 'PI', '2210', '2203', '22012', '22', 'RIACHO FRIO', NULL, '89', '64975000', '8', '0374', '0374', '16205', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'S', 'N', NULL, 'N', '2221,95', '-10,12500', '-44,95300', '400', 'S', '0,541', NULL, NULL, '22900', 'S', 'N', '4102', NULL, '2290', '2290', NULL, '1997', 'S', '3130', 'RIACHO FRIO', 'N', '220885', 'N', 'S', 'S', NULL, NULL, 'S', 'N', 'N', '171', 'DINÂMICA', '03', 'N', '199', NULL, NULL, NULL, NULL),
('521860', '5208', 'GO', '5209', '5203', '52006', '52', 'RIALMA', NULL, '62', '76310000', '7', '9565', '9565', '08183', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '268,958', '-15,31500', '-49,58400', '582', 'S', '0,727', NULL, NULL, '52900', 'N', 'N', '4105', NULL, '5290', '5290', NULL, '1953', 'S', '1087', 'RIALMA', 'N', '521860', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '195', 'ESTAGNADA', '03', 'N', '119', NULL, NULL, NULL, NULL),
('354280', '3516', 'SP', '3519', '3511', '35044', '35', 'RIBEIRA', NULL, '15', '18380000', '0', '6957', '6957', '21429', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'S', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '335,029', '-24,65700', '-49,00900', '167', 'S', '0,698', NULL, NULL, '35162', 'S', 'N', '4109', NULL, '3590', '3590', NULL, '1910', 'S', '5223', 'RIBEIRA', 'N', '354280', 'N', 'N', 'S', NULL, '100', 'N', 'N', 'N', '482', 'ESTAGNADA', '03', 'N', '159', NULL, NULL, NULL, NULL),
('354290', '3503', 'SP', '3530', '3505', '35025', '35', 'RIBEIRAO BONITO', NULL, '16', '13580000', '9', '6959', '6959', '21430', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '471,498', '-22,06700', '-48,17600', '590', 'S', '0,712', NULL, NULL, '35034', 'N', 'N', '4114', NULL, '3590', '3590', NULL, '1890', 'S', '5224', 'RIBEIRÃO BONITO', 'N', '354290', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '483', 'ALTA RENDA', '03', 'N', '434', NULL, NULL, NULL, NULL),
('315460', '3101', 'MG', '3103', '3107', '31030', '31', 'RIBEIRAO DAS NEVES', NULL, '31', '33805970', '6', '5091', '5091', '11546', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '154,18', '-19,76700', '-44,08700', '800', 'S', '0,684', NULL, NULL, '31016', 'N', 'N', '4119', NULL, '3101', '3101', NULL, '1953', 'S', '1992', 'RIBEIRÃO DAS NEVES', 'N', '315460', 'N', 'N', 'S', NULL, NULL, 'S', 'S', 'N', '637', 'ALTA RENDA', '01', 'N', '611', NULL, NULL, NULL, NULL),
('354330', '3501', 'SP', '3534', '3515', '35061', '35', 'RIBEIRAO PIRES', NULL, '11', '10940000', '3', '6967', '6967', '21434', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '99,175', '-23,71100', '-46,41300', '763', 'S', '0,784', NULL, NULL, '35015', 'N', 'N', '4125', NULL, '3501', '3501', NULL, '1953', 'S', '5230', 'RIBEIRÃO PIRES', 'N', '354330', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '489', 'ALTA RENDA', '01', 'N', '94', NULL, NULL, NULL, NULL),
('315470', '3111', 'MG', '3101', '3111', '31057', '31', 'RIBEIRAO VERMELHO', NULL, '35', '37264000', '5', '5093', '5093', '11547', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '40,21', '-21,19100', '-45,06200', '808', 'S', '0,737', NULL, NULL, '31004', 'N', 'N', '4127', NULL, '3190', '3190', NULL, '1948', 'S', '1993', 'RIBEIRÃO VERMELHO', 'N', '315470', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '638', 'ALTA RENDA', '03', 'N', '638', NULL, NULL, NULL, NULL),
('412220', '4102', 'PR', '4107', '4110', '41037', '41', 'RIO BRANCO DO SUL', NULL, '41', '83540000', '6', '7821', '7821', '14211', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '814,361', '-25,19000', '-49,31400', '1053', 'S', '0,679', NULL, NULL, '41900', 'N', 'N', '4143', NULL, '4101', '4101', NULL, '1947', 'S', '3493', 'RIO BRANCO DO SUL', 'N', '412220', 'N', 'N', 'S', NULL, '101', 'N', 'N', 'N', '311', 'ALTA RENDA', '01', 'N', '204', NULL, NULL, NULL, NULL),
('521810', '5214', 'GO', '5206', '5205', '52013', '52', 'PORTELANDIA', NULL, '64', '75835000', '2', '9557', '9557', '08179', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '550,646', '-17,35400', '-52,67900', '858', 'S', '0,654', NULL, NULL, '52900', 'N', 'N', '3894', NULL, '5290', '5290', NULL, '1963', 'S', '1083', 'PORTELÂNDIA', 'N', '521810', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '191', 'ALTA RENDA', '03', 'N', '185', NULL, NULL, NULL, NULL),
('431490', '4302', 'RS', '4313', '4305', '43026', '43', 'PORTO ALEGRE', NULL, '51', '90001970', '2', '8801', '8801', '19150', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'S', 'N', 'N', 'N', 'N', 'S', NULL, 'S', '496,827', '-30,03300', '-51,23000', '3', 'S', '0,805', NULL, NULL, '43900', 'N', 'N', '3897', NULL, '4301', '4301', NULL, '1809', 'S', '4210', 'PORTO ALEGRE', 'N', '431490', 'N', 'N', 'S', NULL, NULL, 'S', 'S', 'N', '326', 'ALTA RENDA', '01', 'N', '466', NULL, NULL, NULL, NULL),
('412015', '4105', 'PR', '4107', '4108', '41029', '41', 'PORTO BARREIRO', NULL, '42', '85345000', '0', '0872', '0872', '14408', NULL, 'ATIVO', 'N', 'S', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '361,982', '-25,54700', '-52,40800', '830', 'S', '0,688', NULL, NULL, '41900', 'N', 'N', '3902', NULL, '4190', '4190', NULL, '1997', 'S', '3464', 'PORTO BARREIRO', 'N', '412015', 'N', 'N', 'S', NULL, '25', 'N', 'N', 'N', '281', 'ESTAGNADA', '03', 'N', '32', NULL, NULL, NULL, NULL),
('220275', '2211', 'PI', '2210', '2203', '22008', '22', 'COLONIA DO GURGUEIA', NULL, '89', '64885000', '2', '2249', '2249', '16132', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'S', 'N', 'S', 'N', NULL, 'N', '430,613', '-8,18200', '-43,79200', '216', 'S', '0,628', NULL, NULL, '22900', 'S', 'N', '1296', NULL, '2290', '2290', NULL, '1993', 'S', '3022', 'COLÔNIA DO GURGUÉIA', 'N', '220275', 'N', 'S', 'S', NULL, NULL, 'S', 'N', 'N', '61', 'DINÂMICA', '03', 'N', '199', NULL, NULL, NULL, NULL),
('250440', '2507', 'PB', '2501', '2501', '25006', '25', 'CONCEICAO', NULL, '83', '58970000', '5', '1989', '1989', '13045', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'S', 'S', 'N', 'N', NULL, 'N', '579,432', '-7,56200', '-38,50900', '376', 'S', '0,592', NULL, NULL, '25900', 'S', 'N', '1308', NULL, '2590', '2590', NULL, '1881', 'S', '2613', 'CONCEIÇÃO', 'N', '250440', 'N', 'S', 'S', NULL, NULL, 'S', 'N', 'N', '58', 'DINÂMICA', '03', 'N', '73', NULL, NULL, NULL, NULL),
('290820', '2931', 'BA', '2915', '2903', '29012', '29', 'CONCEICAO DA FEIRA', NULL, '75', '44320000', '0', '3463', '3463', '04082', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'S', 'N', 'N', NULL, 'N', '159,776', '-12,50600', '-38,99900', '227', 'S', '0,634', NULL, NULL, '29042', 'S', 'N', '1312', NULL, '2902', '2990', NULL, '1926', 'S', '300', 'CONCEIÇÃO DA FEIRA', 'N', '290820', 'N', 'S', 'S', NULL, NULL, 'S', 'N', 'N', '100', 'ESTAGNADA', '03', 'N', '344', NULL, NULL, NULL, NULL),
('170560', '1715', 'TO', '1702', '1702', '17008', '17', 'CONCEICAO DO TOCANTINS', NULL, '63', '77305000', '7', '9313', '9313', '28023', NULL, 'ATIVO', 'S', 'N', NULL, 'CONCEICAO DO NORTE', 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '2500,733', '-12,21900', '-47,29800', '400', 'S', '0,592', NULL, NULL, '17900', 'S', 'N', '1327', NULL, '1790', '1790', NULL, '1989', 'S', '5427', 'CONCEIÇÃO DO TOCANTINS', 'N', '170560', 'S', 'N', 'S', NULL, '124', 'N', 'N', 'N', '41', 'DINÂMICA', '03', 'N', '218', NULL, NULL, NULL, NULL),
('260380', '2605', 'PE', '2608', '2603', '26008', '26', 'CAPOEIRAS', NULL, '87', '55365000', '1', '2375', '2375', '15038', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'S', 'N', 'N', 'N', NULL, 'N', '335,258', '-8,73500', '-36,62700', '888', 'S', '0,549', NULL, NULL, '26900', 'S', 'N', '1068', NULL, '2690', '2690', NULL, '1963', 'S', '2818', 'CAPOEIRAS', 'N', '260380', 'N', 'S', 'S', NULL, '2', 'S', 'N', 'N', '41', 'ESTAGNADA', '03', 'N', '257', NULL, NULL, NULL, NULL),
('220250', '2208', 'PI', '2210', '2203', '22011', '22', 'CARACOL', NULL, '89', '64795000', '5', '1049', '1049', '16025', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'S', 'N', 'N', 'N', NULL, 'N', '449,465', '-9,27900', '-43,33000', '566', 'S', '0,552', NULL, NULL, '22900', 'S', 'N', '1072', NULL, '2290', '2290', NULL, '1947', 'S', '3013', 'CARACOL', 'N', '220250', 'N', 'S', 'S', NULL, '77', 'N', 'N', 'N', '52', 'DINÂMICA', '03', 'N', '140', NULL, NULL, NULL, NULL),
('290689', '2920', 'BA', '2911', '2906', '29027', '29', 'CARAIBAS', NULL, '77', '45177000', '9', '3271', '3271', '04373', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'S', 'S', 'N', 'N', NULL, 'N', '1125,474', '-14,60000', '-41,33500', '401', 'S', '0,555', NULL, NULL, '29084', 'S', 'N', '1076', NULL, '2990', '2990', NULL, '1990', 'S', '285', 'CARAÍBAS', 'N', '290689', 'N', 'S', 'S', NULL, NULL, 'S', 'N', 'N', '85', 'ESTAGNADA', '03', 'N', '335', NULL, NULL, NULL, NULL),
('311330', '3124', 'MG', '3107', '3112', '31063', '31', 'CARANGOLA', NULL, '32', '36800000', '5', '4265', '4265', '11133', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '352,51', '-20,73300', '-42,02900', '408', 'S', '0,695', NULL, NULL, '31042', 'N', 'N', '1080', NULL, '3190', '3190', NULL, '1878', 'S', '1501', 'CARANGOLA', 'N', '311330', 'N', 'N', 'S', NULL, NULL, 'S', 'N', 'N', '146', 'ESTAGNADA', '03', 'N', '615', NULL, NULL, NULL, NULL),
('311340', '3123', 'MG', '3114', '3108', '31040', '31', 'CARATINGA', NULL, '33', '35300970', '4', '4267', '4267', '11134', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'S', 'N', NULL, 'N', '1250,874', '-19,79000', '-42,13900', '578', 'S', '0,706', NULL, NULL, '31034', 'N', 'N', '1083', NULL, '3190', '3190', NULL, '1890', 'S', '1502', 'CARATINGA', 'N', '311340', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '147', 'ESTAGNADA', '02', 'N', '616', NULL, NULL, NULL, NULL),
('220253', '2201', 'PI', '2209', '2201', '22002', '22', 'CARAUBAS DO PIAUI', NULL, '86', '64233000', '9', '0298', '0298', '16167', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '471,447', '-3,47600', '-41,84300', '50', 'S', '0,505', NULL, NULL, '22900', 'S', 'N', '1087', NULL, '2290', '2290', NULL, '1997', 'S', '3014', 'CARAÚBAS DO PIAUÍ', 'N', '220253', 'N', 'S', 'S', NULL, NULL, 'N', 'N', 'N', '53', 'ESTAGNADA', '03', 'N', '365', NULL, NULL, NULL, NULL),
('290700', '2903', 'BA', '2914', '2904', '29018', '29', 'CARDEAL DA SILVA', NULL, '75', '48390000', '4', '3439', '3439', '04070', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'S', 'N', 'N', NULL, 'N', '184,859', '-11,94200', '-37,94900', '60', 'S', '0,552', NULL, NULL, '29051', 'S', 'N', '1091', NULL, '2990', '2990', NULL, '1962', 'S', '287', 'CARDEAL DA SILVA', 'N', '290700', 'N', 'S', 'S', NULL, NULL, 'S', 'N', 'N', '87', 'BAIXA RENDA', '03', 'N', '400', NULL, NULL, NULL, NULL),
('130110', '1303', 'AM', '1304', '1303', '13007', '13', 'CAREIRO', NULL, '92', '69250000', '0', '0223', '0223', '03012', NULL, 'ATIVO', 'S', 'N', NULL, NULL, 'N', 'N', 'N', 'S', 'N', 'N', NULL, 'N', '6091,547', '-3,76800', '-60,36900', '27', 'S', '0,557', NULL, NULL, '13031', 'S', 'N', '1095', NULL, '1390', '1390', NULL, '1955', 'S', '141', 'CAREIRO', 'N', '130110', 'S', 'N', 'S', NULL, '44', 'S', 'N', 'N', '18', 'DINÂMICA', '03', 'N', '334', NULL, NULL, NULL, NULL),
('290710', '2930', 'BA', '2911', '2902', '29007', '29', 'CARINHANHA', NULL, '77', '46445000', '3', '3441', '3441', '04071', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'S', 'S', 'N', 'N', NULL, 'N', '2751,856', '-14,30500', '-43,76500', '440', 'S', '0,576', NULL, NULL, '29082', 'S', 'S', '1100', NULL, '2990', '2990', NULL, '1832', 'S', '288', 'CARINHANHA', 'N', '290710', 'N', 'S', 'S', NULL, '102', 'N', 'N', 'N', '88', 'BAIXA RENDA', '03', 'N', '7', NULL, NULL, NULL, NULL);
INSERT INTO `tb_municipio` (`CO_MUNICIPIO_IBGE`, `CO_REGIONAL_SAUDE`, `SG_UF`, `CO_MACRORREGIONAL`, `CO_MESORREGIAO`, `CO_MICRORREGIAO`, `CO_UF_IBGE`, `NO_MUNICIPIO`, `SG_MUNICIPIO`, `NU_DDD`, `NU_CEP`, `DV_MUNICIPIO_IBGE`, `CO_MUNICIPIO_SIAFI`, `CO_MUNICIPIO_SIAPE`, `CO_SINPAS`, `CO_REGIAO_CORREIO`, `ST_MUNICIPIO`, `ST_AMAZONIA`, `ST_FRONTEIRA`, `CO_SUCESSOR`, `NO_ANTERIOR`, `ST_COMUNIDADE_SOLIDARIA`, `ST_SECA`, `ST_SEMI_ARIDO`, `ST_PRMI`, `ST_CALAMIDADE`, `ST_INDIGENA`, `NU_DISTANCIA_CAPITAL`, `ST_CAPITAL`, `NU_AREA`, `NU_LATITUDE`, `NU_LONGITUDE`, `NU_ALTITUDE`, `ST_REGISTRO_ATIVO`, `NU_IDH`, `CO_MUNICIPIO_CORREIO`, `CO_MUNICIPIO_INSS`, `CO_MICRORREGIONAL_SAUDE`, `ST_PITS`, `ST_QUILOMBOLA`, `CO_SEQ_ANTIGO`, `NO_POPULAR`, `CO_REGIAO_METROPOLITANA`, `CO_AGLOMERADO_URBANO`, `NU_ANO_EXTINCAO`, `NU_ANO_INSTALACAO`, `ST_IBGE`, `CO_MUNICIPIO_SVS`, `NO_MUNICIPIO_ACENTUADO`, `ST_RIDE`, `CO_MUNICIPIO_CNES`, `ST_SUDAM`, `ST_SUDENE`, `ST_CADSUS`, `CO_MUNICIPIO_ORIGEM`, `CO_TERRITORIO_CIDADANIA`, `ST_PSE`, `ST_PAN`, `ST_PACTO_RMINAL`, `CO_MUNICIPIO_TABNET_RJ`, `TP_TIPOLOGIA_PNDR`, `CO_GRUPO_PAC2`, `ST_CNES`, `CO_REGIAO_SAUDE`, `ST_PACTO`, `ST_CIB_SAS`, `DT_MANUTENCAO`, `FSDFSD`) VALUES
('170386', '1709', 'TO', '1702', '1701', '17005', '17', 'CARIRI DO TOCANTINS', NULL, '63', '77453000', '7', '0327', '0327', '28089', NULL, 'ATIVO', 'S', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '1128,596', '-11,89100', '-49,16100', '295', 'S', '0,662', NULL, NULL, '17900', 'S', 'N', '1103', NULL, '1790', '1790', NULL, '1993', 'S', '5417', 'CARIRI DO TOCANTINS', 'N', '170386', 'S', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '31', 'ESTAGNADA', '03', 'N', '505', NULL, NULL, NULL, NULL),
('410470', '4119', 'PR', '4105', '4104', '41018', '41', 'CARLOPOLIS', NULL, '43', '86420000', '9', '7491', '7491', '14046', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '447,857', '-23,42500', '-49,72100', '521', 'S', '0,713', NULL, NULL, '41900', 'N', 'N', '1107', NULL, '4190', '4190', NULL, '1907', 'S', '3252', 'CARLÓPOLIS', 'N', '410470', 'N', 'N', 'S', NULL, '146', 'N', 'N', 'N', '69', 'ESTAGNADA', '03', 'N', '427', NULL, NULL, NULL, NULL),
('311390', '3111', 'MG', '3101', '3110', '31050', '31', 'CARMO DA CACHOEIRA', NULL, '35', '37225000', '9', '4277', '4277', '11139', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '505,947', '-21,46100', '-45,22400', '945', 'S', '0,655', NULL, NULL, '31010', 'N', 'N', '1113', NULL, '3190', '3190', NULL, '1938', 'S', '1507', 'CARMO DA CACHOEIRA', 'N', '311390', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '152', 'ALTA RENDA', '03', 'N', '662', NULL, NULL, NULL, NULL),
('260392', '2611', 'PE', '2606', '2602', '26006', '26', 'CARNAUBEIRA DA PENHA', NULL, '87', '56420000', '6', '2635', '2635', '15170', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'S', 'N', 'N', 'S', NULL, 'N', '1010,171', '-8,32200', '-38,74400', '446', 'S', '0,573', NULL, NULL, '26900', 'S', 'N', '1127', NULL, '2690', '2690', NULL, '1993', 'S', '2820', 'CARNAUBEIRA DA PENHA', 'N', '260392', 'N', 'S', 'S', NULL, '118', 'N', 'N', 'N', '43', 'DINÂMICA', '03', 'N', '261', NULL, NULL, NULL, NULL),
('210280', '2106', 'MA', '2109', '2105', '21019', '21', 'CAROLINA', NULL, '99', '65980000', '4', '0753', '0753', '09027', NULL, 'ATIVO', 'S', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '6441,559', '-7,33300', '-47,46900', '167', 'S', '0,634', NULL, NULL, '21900', 'S', 'N', '1131', NULL, '2190', '2190', NULL, '1831', 'S', '1188', 'CAROLINA', 'N', '210280', 'S', 'S', 'S', NULL, NULL, 'N', 'N', 'S', '50', 'ESTAGNADA', '03', 'N', '298', NULL, NULL, NULL, NULL),
('170389', '1713', 'TO', '1701', '1701', '17001', '17', 'CARRASCO BONITO', NULL, '63', '77985000', '1', '0177', '0177', '28091', NULL, 'ATIVO', 'S', 'N', NULL, NULL, 'S', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '195,017', '-5,32200', '-48,03500', '285', 'S', '0,594', NULL, NULL, '17900', 'S', 'N', '1135', NULL, '1790', '1790', NULL, '1993', 'S', '5419', 'CARRASCO BONITO', 'N', '170389', 'S', 'N', 'S', NULL, '22', 'N', 'N', 'N', '33', 'BAIXA RENDA', '03', 'N', '387', NULL, NULL, NULL, NULL),
('351080', '3514', 'SP', '3528', '3507', '35030', '35', 'CASA BRANCA', NULL, '19', '13700000', '7', '6317', '6317', '21109', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '865,544', '-21,77400', '-47,08600', '684', 'S', '0,73', NULL, NULL, '35143', 'N', 'N', '1140', NULL, '3590', '3590', NULL, '1841', 'S', '4865', 'CASA BRANCA', 'N', '351080', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '124', 'ALTA RENDA', '03', 'N', '279', NULL, NULL, NULL, NULL),
('311500', '3112', 'MG', '3113', '3105', '31018', '31', 'CASCALHO RICO', NULL, '34', '38460000', '3', '4299', '4299', '11150', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '367,732', '-18,57600', '-47,87700', '709', 'S', '0,721', NULL, NULL, '31075', 'N', 'N', '1144', NULL, '3190', '3190', NULL, '1948', 'S', '1519', 'CASCALHO RICO', 'N', '311500', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '164', 'ALTA RENDA', '03', 'N', '667', NULL, NULL, NULL, NULL),
('430495', '4306', 'RS', '4311', '4301', '43010', '43', 'CASEIROS', NULL, '54', '95315000', '2', '8441', '8441', '19260', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '235,679', '-28,26900', '-51,69000', '786', 'S', '0,703', NULL, NULL, '43900', 'N', 'N', '1148', NULL, '4390', '4390', NULL, '1989', 'S', '3991', 'CASEIROS', 'N', '430495', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '94', 'ALTA RENDA', '03', 'N', '474', NULL, NULL, NULL, NULL),
('250415', '2502', 'PB', '2503', '2503', '25013', '25', 'CASSERENGUE', NULL, '83', '58238000', '7', '0468', '0468', '13187', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'S', 'S', 'N', 'N', NULL, 'N', '201,379', '-6,78300', '-35,82100', '0', 'S', '0,514', NULL, NULL, '25900', 'S', 'N', '1151', NULL, '2590', '2590', NULL, '1997', 'S', '2609', 'CASSERENGUE', 'N', '250415', 'N', 'S', 'S', NULL, '24', 'S', 'N', 'N', '54', 'BAIXA RENDA', '03', 'N', '420', NULL, NULL, NULL, NULL),
('510285', '5109', 'MT', '5105', '5101', '51001', '51', 'CASTANHEIRA', NULL, '66', '78345000', '0', '9783', '9783', '10153', NULL, 'ATIVO', 'S', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'S', 'N', NULL, 'N', '3948,861', '-11,13300', '-58,60300', '400', 'S', '0,665', NULL, NULL, '51900', 'S', 'N', '1156', NULL, '5190', '5190', NULL, '1989', 'S', '2312', 'CASTANHEIRA', 'N', '510285', 'S', 'N', 'S', NULL, '163', 'N', 'N', 'N', '28', 'ESTAGNADA', '03', 'N', '423', NULL, NULL, NULL, NULL),
('320140', '3202', 'ES', '3205', '3204', '32012', '32', 'CASTELO', NULL, '28', '29360000', '7', '5627', '5627', '07014', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'S', 'S', 'N', NULL, 'N', '668,971', '-20,60400', '-41,18500', '100', 'S', '0,726', NULL, NULL, '32007', 'N', 'N', '1159', NULL, '3290', '3290', NULL, '1928', 'S', '837', 'CASTELO', 'N', '320140', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '18', 'ALTA RENDA', '03', 'N', '52', NULL, NULL, NULL, NULL),
('290730', '2904', 'BA', '2915', '2905', '29020', '29', 'CASTRO ALVES', NULL, '75', '44500000', '1', '3445', '3445', '04073', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'S', 'N', 'S', 'S', 'N', 'N', NULL, 'N', '762,981', '-12,76600', '-39,42800', '278', 'S', '0,613', NULL, NULL, '29044', 'S', 'N', '1163', NULL, '2990', '2990', NULL, '1880', 'S', '290', 'CASTRO ALVES', 'N', '290730', 'N', 'S', 'S', NULL, NULL, 'N', 'N', 'N', '90', 'ESTAGNADA', '03', 'N', '106', NULL, NULL, NULL, NULL),
('420400', '4208', 'SC', '4212', '4201', '42004', '42', 'CATANDUVAS', NULL, '49', '89670000', '4', '8077', '8077', '20039', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'S', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '198,033', '-27,07100', '-51,66200', '945', 'S', '0,714', NULL, NULL, '42900', 'N', 'N', '1168', NULL, '4290', '4290', NULL, '1963', 'S', '4435', 'CATANDUVAS', 'N', '420400', 'N', 'N', 'S', NULL, '33', 'N', 'N', 'N', '64', 'ALTA RENDA', '03', 'N', '497', NULL, NULL, NULL, NULL),
('351040', '3510', 'SP', '3529', '3506', '35028', '35', 'CAPIVARI', NULL, '19', '13360000', '1', '6309', '6309', '21105', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '323,198', '-22,99500', '-47,50800', '636', 'S', '0,75', NULL, NULL, '35103', 'N', 'N', '1064', NULL, '3590', '3590', NULL, '1832', 'S', '4861', 'CAPIVARI', 'N', '351040', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '120', 'ALTA RENDA', '03', 'N', '100', NULL, NULL, NULL, NULL),
('260420', '2603', 'PE', '2607', '2604', '26015', '26', 'CATENDE', NULL, '81', '55400000', '5', '2383', '2383', '15042', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'S', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '206,923', '-8,66700', '-35,71700', '168', 'S', '0,609', NULL, NULL, '26900', 'N', 'N', '1172', NULL, '2690', '2690', NULL, '1928', 'S', '2824', 'CATENDE', 'N', '260420', 'N', 'S', 'S', NULL, '54', 'S', 'N', 'N', '47', 'BAIXA RENDA', '03', 'N', '368', NULL, NULL, NULL, NULL),
('430510', '4305', 'RS', '4310', '4302', '43016', '43', 'CAXIAS DO SUL', NULL, '54', '95001970', '8', '8599', '8599', '19050', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '1643,913', '-29,16800', '-51,17900', '817', 'S', '0,782', NULL, NULL, '43900', 'N', 'N', '1190', NULL, '4303', '4302', NULL, '1890', 'S', '3993', 'CAXIAS DO SUL', 'N', '430510', 'N', 'N', 'S', NULL, NULL, 'N', 'S', 'N', '96', 'ALTA RENDA', '01', 'N', '479', NULL, NULL, NULL, NULL),
('210310', '2112', 'MA', '2110', '2101', '21001', '21', 'CEDRAL', NULL, '98', '65260000', '9', '0759', '0759', '09030', NULL, 'ATIVO', 'S', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '262,278', '-2,00000', '-44,53600', '30', 'S', '0,605', NULL, NULL, '21900', 'S', 'N', '1194', NULL, '2190', '2190', NULL, '1964', 'S', '1191', 'CEDRAL', 'N', '210310', 'S', 'S', 'S', NULL, '115', 'N', 'N', 'N', '53', 'BAIXA RENDA', '03', 'N', '239', NULL, NULL, NULL, NULL),
('230380', '2317', 'CE', '2308', '2306', '23026', '23', 'CEDRO', NULL, '88', '63400000', '8', '1375', '1375', '05038', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'S', 'S', 'N', 'N', NULL, 'N', '725,786', '-6,60700', '-39,06200', '250', 'S', '0,627', NULL, NULL, '23900', 'S', 'N', '1196', NULL, '2390', '2390', NULL, '1920', 'S', '661', 'CEDRO', 'N', '230380', 'N', 'S', 'S', NULL, NULL, 'S', 'N', 'N', '45', 'DINÂMICA', '03', 'N', '48', NULL, NULL, NULL, NULL),
('280160', '2807', 'SE', '2801', '2803', '28007', '28', 'CEDRO DE SAO JOAO', NULL, '79', '49930000', '3', '3131', '3131', '22016', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'S', 'N', 'S', 'N', NULL, 'N', '79,594', '-10,25200', '-36,88400', '32', 'S', '0,623', NULL, NULL, '28900', 'S', 'N', '1197', NULL, '2890', '2890', NULL, '1928', 'S', '4681', 'CEDRO DE SÃO JOÃO', 'N', '280160', 'N', 'S', 'S', NULL, '135', 'S', 'N', 'N', '15', 'ESTAGNADA', '03', 'N', '430', NULL, NULL, NULL, NULL),
('520465', '5206', 'GO', '5209', '5202', '52004', '52', 'CAMPINACU', NULL, '62', '76440000', '6', '9687', '9687', '08239', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'S', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '1974,367', '-13,79000', '-48,57100', '690', 'S', '0,631', NULL, NULL, '52900', 'N', 'N', '937', NULL, '5290', '5290', NULL, '1982', 'S', '947', 'CAMPINAÇU', 'N', '520465', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '51', 'ESTAGNADA', '03', 'N', '406', NULL, NULL, NULL, NULL),
('420330', '4212', 'SC', '4211', '4202', '42007', '42', 'CAMPO ALEGRE', NULL, '47', '89294000', '3', '8063', '8063', '20032', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '496,146', '-26,19300', '-49,26600', '870', 'S', '0,714', NULL, NULL, '42900', 'N', 'N', '943', NULL, '4206', '4205', NULL, '1896', 'S', '4426', 'CAMPO ALEGRE', 'N', '420330', 'N', 'N', 'S', NULL, '70', 'N', 'N', 'N', '55', 'ALTA RENDA', '03', 'N', '500', NULL, NULL, NULL, NULL),
('220211', '2208', 'PI', '2210', '2204', '22015', '22', 'CAMPO ALEGRE DO FIDALGO', NULL, '89', '64767000', '7', '0290', '0290', '16163', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'S', 'N', 'N', 'N', NULL, 'N', '755,529', '-8,37600', '-41,83600', '330', 'S', '0,537', NULL, NULL, '22900', 'S', 'N', '947', NULL, '2290', '2290', NULL, '1997', 'S', '3005', 'CAMPO ALEGRE DO FIDALGO', 'N', '220211', 'N', 'S', 'S', NULL, '77', 'S', 'N', 'N', '44', 'DINÂMICA', '03', 'N', '140', NULL, NULL, NULL, NULL),
('110028', '1102', 'RO', '1101', '1102', '11006', '11', 'ROLIM DE MOURA', NULL, '69', '76940000', '8', '0029', '0029', '26015', NULL, 'ATIVO', 'S', 'S', NULL, NULL, 'S', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '1457,885', '-11,73300', '-61,77800', '290', 'S', '0,7', NULL, NULL, '11900', 'S', 'N', '4212', NULL, '1190', '1190', NULL, '1983', 'S', '3880', 'ROLIM DE MOURA', 'N', '110028', 'S', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '41', 'ESTAGNADA', '02', 'N', '150', NULL, NULL, NULL, NULL),
('510760', '5107', 'MT', '5101', '5105', '51021', '51', 'RONDONOPOLIS', NULL, '66', '78700970', '2', '9151', '9151', '10076', NULL, 'ATIVO', 'S', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'S', NULL, 'N', '4165,232', '-16,47100', '-54,63600', '227', 'S', '0,755', NULL, NULL, '51900', 'N', 'N', '4220', NULL, '5190', '5190', NULL, '1953', 'S', '2385', 'RONDONÓPOLIS', 'N', '510760', 'S', 'N', 'S', NULL, NULL, 'N', 'N', 'S', '110', 'ESTAGNADA', '01', 'N', '371', NULL, NULL, NULL, NULL),
('280610', '2802', 'SE', '2801', '2803', '28010', '28', 'ROSARIO DO CATETE', NULL, '79', '49760000', '7', '3221', '3221', '22061', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '105,413', '-10,69600', '-37,03100', '22', 'S', '0,631', NULL, NULL, '28900', 'S', 'N', '4226', NULL, '2890', '2890', NULL, '1836', 'S', '4726', 'ROSÁRIO DO CATETE', 'N', '280610', 'N', 'S', 'S', NULL, NULL, 'S', 'N', 'N', '60', 'BAIXA RENDA', '03', 'N', '381', NULL, NULL, NULL, NULL),
('315650', '3106', 'MG', '3108', '3102', '31005', '31', 'RUBELITA', NULL, '38', '39565000', '2', '5129', '5129', '11565', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'S', 'N', 'S', 'N', 'N', 'N', NULL, 'N', '1109,229', '-16,40800', '-42,26300', '391', 'S', '0,582', NULL, NULL, '31056', 'S', 'N', '4232', NULL, '3190', '3190', NULL, '1962', 'S', '2012', 'RUBELITA', 'N', '315650', 'N', 'S', 'S', NULL, '7', 'N', 'N', 'N', '657', 'DINÂMICA', '03', 'N', '603', NULL, NULL, NULL, NULL),
('150619', '1509', 'PA', '1510', '1505', '15014', '15', 'RUROPOLIS', NULL, '93', '68165000', '5', '0597', '0597', '12099', NULL, 'ATIVO', 'S', 'N', NULL, NULL, 'S', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '7021,294', '-4,09600', '-54,91000', '170', 'S', '0,548', NULL, NULL, '15900', 'S', 'N', '4237', NULL, '1590', '1590', NULL, '1989', 'S', '2514', 'RURÓPOLIS', 'N', '150619', 'S', 'N', 'S', NULL, '114', 'N', 'N', 'N', '104', 'ESTAGNADA', '03', 'N', '454', NULL, NULL, NULL, NULL),
('231190', '2318', 'CE', '2308', '2304', '23020', '23', 'SABOEIRO', NULL, '88', '63590000', '0', '1539', '1539', '05120', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'S', 'N', 'S', 'S', 'S', 'N', NULL, 'N', '1383,472', '-6,54200', '-39,90700', '291', 'S', '0,575', NULL, NULL, '23900', 'S', 'N', '4245', NULL, '2390', '2390', NULL, '1935', 'S', '772', 'SABOEIRO', 'N', '231190', 'N', 'S', 'S', NULL, NULL, 'S', 'N', 'N', '156', 'BAIXA RENDA', '03', 'N', '108', NULL, NULL, NULL, NULL),
('261200', '2604', 'PE', '2608', '2603', '26012', '26', 'SAIRE', NULL, '81', '55695000', '0', '2539', '2539', '15120', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'S', 'N', 'N', 'N', NULL, 'N', '195,457', '-8,32800', '-35,70600', '663', 'S', '0,585', NULL, NULL, '26007', 'S', 'N', '4249', NULL, '2690', '2690', NULL, '1963', 'S', '2914', 'SAIRÉ', 'N', '261200', 'N', 'S', 'S', NULL, NULL, 'N', 'N', 'N', '137', 'BAIXA RENDA', '03', 'N', '139', NULL, NULL, NULL, NULL),
('261210', '2602', 'PE', '2607', '2603', '26010', '26', 'SALGADINHO', NULL, '81', '55675000', '9', '2541', '2541', '15121', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'S', 'N', 'S', 'N', 'N', 'N', NULL, 'N', '88,812', '-7,93600', '-35,63300', '232', 'S', '0,534', NULL, NULL, '26004', 'S', 'N', '4256', NULL, '2690', '2690', NULL, '1963', 'S', '2915', 'SALGADINHO', 'N', '261210', 'N', 'S', 'S', NULL, NULL, 'S', 'N', 'N', '138', 'BAIXA RENDA', '03', 'N', '421', NULL, NULL, NULL, NULL),
('251310', '2512', 'PB', '2503', '2503', '25018', '25', 'SALGADO DE SAO FELIX', NULL, '83', '58370000', '9', '2163', '2163', '13132', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'S', 'N', 'S', 'N', 'N', 'N', NULL, 'N', '196,092', '-7,35700', '-35,44100', '58', 'S', '0,568', NULL, NULL, '25900', 'S', 'N', '4258', NULL, '2590', '2590', NULL, '1961', 'S', '2718', 'SALGADO DE SÃO FÉLIX', 'N', '251310', 'N', 'S', 'S', NULL, NULL, 'S', 'N', 'N', '165', 'BAIXA RENDA', '03', 'N', '309', NULL, NULL, NULL, NULL),
('412290', '4119', 'PR', '4105', '4104', '41018', '41', 'SALTO DO ITARARE', NULL, '43', '84945000', '9', '7835', '7835', '14218', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '200,517', '-23,60100', '-49,62600', '502', 'S', '0,704', NULL, NULL, '41900', 'S', 'N', '4273', NULL, '4190', '4190', NULL, '1960', 'S', '3501', 'SALTO DO ITARARÉ', 'N', '412290', 'N', 'N', 'S', NULL, '146', 'N', 'N', 'N', '319', 'ESTAGNADA', '03', 'N', '427', NULL, NULL, NULL, NULL),
('431645', '4309', 'RS', '4312', '4301', '43011', '43', 'SALTO DO JACUI', NULL, '55', '99440000', '1', '8975', '8975', '19246', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'S', NULL, 'N', '519,197', '-29,08800', '-53,21300', '322', 'S', '0,687', NULL, NULL, '43900', 'N', 'N', '4274', NULL, '4390', '4390', NULL, '1982', 'S', '4239', 'SALTO DO JACUÍ', 'N', '431645', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '357', 'ALTA RENDA', '03', 'N', '468', NULL, NULL, NULL, NULL),
('412300', '4108', 'PR', '4108', '4107', '41026', '41', 'SALTO DO LONTRA', NULL, '46', '85670000', '6', '7837', '7837', '14219', NULL, 'ATIVO', 'N', 'S', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '313,29', '-25,78400', '-53,30900', '538', 'S', '0,718', NULL, NULL, '41900', 'N', 'N', '4275', NULL, '4190', '4190', NULL, '1964', 'S', '3502', 'SALTO DO LONTRA', 'N', '412300', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '320', 'ESTAGNADA', '03', 'N', '34', NULL, NULL, NULL, NULL),
('292740', '2901', 'BA', '2915', '2905', '29021', '29', 'SALVADOR', NULL, '71', '40011970', '8', '3849', '3849', '04275', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'S', 'N', 'N', 'S', 'N', 'S', NULL, 'S', '706,799', '-12,97100', '-38,51100', '8', 'S', '0,759', NULL, NULL, '29043', 'N', 'N', '4278', NULL, '2901', '2901', NULL, '1549', 'S', '535', 'SALVADOR', 'N', '292740', 'N', 'S', 'S', NULL, NULL, 'S', 'S', 'S', '336', 'ALTA RENDA', '01', 'N', '178', NULL, NULL, NULL, NULL),
('412090', '4110', 'PR', '4108', '4108', '41029', '41', 'QUEDAS DO IGUACU', NULL, '46', '85460000', '3', '7955', '7955', '14278', NULL, 'ATIVO', 'N', 'S', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'S', NULL, 'N', '821,503', '-25,45000', '-52,90800', '562', 'S', '0,681', NULL, NULL, '41900', 'N', 'N', '4017', NULL, '4190', '4190', NULL, '1967', 'S', '3475', 'QUEDAS DO IGUAÇU', 'N', '412090', 'N', 'N', 'S', NULL, '25', 'N', 'N', 'N', '293', 'ESTAGNADA', '03', 'N', '258', NULL, NULL, NULL, NULL),
('354180', '3509', 'SP', '3533', '3509', '35037', '35', 'QUEIROZ', NULL, '14', '17590000', '2', '6937', '6937', '21419', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '235,496', '-21,79900', '-50,24000', '431', 'S', '0,715', NULL, NULL, '35095', 'N', 'N', '4022', NULL, '3590', '3590', NULL, '1964', 'S', '5213', 'QUEIROZ', 'N', '354180', 'N', 'N', 'S', NULL, NULL, 'S', 'N', 'N', '472', 'ALTA RENDA', '03', 'N', '221', NULL, NULL, NULL, NULL),
('315380', '3103', 'MG', '3102', '3107', '31034', '31', 'QUELUZITO', NULL, '31', '36424000', '6', '5075', '5075', '11538', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '153,038', '-20,74000', '-43,88400', '952', 'S', '0,682', NULL, NULL, '31014', 'N', 'N', '4024', NULL, '3190', '3190', NULL, '1962', 'S', '1982', 'QUELUZITO', 'N', '315380', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '627', 'ESTAGNADA', '03', 'N', '584', NULL, NULL, NULL, NULL),
('431532', '4304', 'RS', '4314', '4303', '43017', '43', 'QUEVEDOS', NULL, '55', '98140000', '1', '5789', '5789', '19398', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '543,36', '-29,35300', '-54,07200', '410', 'S', '0,665', NULL, NULL, '43900', 'N', 'N', '4027', NULL, '4390', '4390', NULL, '1993', 'S', '4221', 'QUEVEDOS', 'N', '431532', 'N', 'N', 'S', NULL, '75', 'N', 'N', 'N', '338', 'ESTAGNADA', '03', 'N', '457', NULL, NULL, NULL, NULL),
('354200', '3509', 'SP', '3533', '3509', '35037', '35', 'QUINTANA', NULL, '14', '17670000', '8', '6941', '6941', '21421', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '319,759', '-22,07300', '-50,30800', '595', 'S', '0,732', NULL, NULL, '35093', 'N', 'N', '4031', NULL, '3590', '3590', NULL, '1944', 'S', '5215', 'QUINTANA', 'N', '354200', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '474', 'ALTA RENDA', '03', 'N', '96', NULL, NULL, NULL, NULL),
('330415', '3309', 'RJ', '3310', '3302', '33004', '33', 'QUISSAMA', NULL, '22', '28735000', '1', '6007', '6007', '17070', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'S', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '715,877', '-22,10700', '-41,47200', '19', 'S', '0,704', NULL, NULL, '33900', 'N', 'N', '4035', NULL, '3390', '3390', NULL, '1990', 'S', '3643', 'QUISSAMÃ', 'N', '330415', 'N', 'N', 'S', NULL, '65', 'N', 'N', 'N', '62', 'ALTA RENDA', '03', 'N', '82', NULL, NULL, NULL, NULL),
('231130', '2308', 'CE', '2307', '2304', '23019', '23', 'QUIXADA', NULL, '88', '63900000', '6', '1527', '1527', '05114', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'S', 'S', 'S', 'N', NULL, 'N', '2019,816', '-4,97100', '-39,01500', '189', 'S', '0,659', NULL, NULL, '23900', 'N', 'N', '4041', NULL, '2390', '2390', NULL, '1870', 'S', '765', 'QUIXADÁ', 'N', '231130', 'N', 'S', 'S', NULL, '80', 'N', 'N', 'S', '149', 'DINÂMICA', '01', 'N', '51', NULL, NULL, NULL, NULL),
('241060', '2406', 'RN', '2401', '2401', '24007', '24', 'RAFAEL GODEIRO', NULL, '84', '59740000', '3', '1893', '1893', '18147', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'S', 'N', 'N', 'N', NULL, 'N', '100,073', '-6,07600', '-37,71700', '193', 'S', '0,654', NULL, NULL, '24900', 'S', 'N', '4046', NULL, '2490', '2490', NULL, '1963', 'S', '3785', 'RAFAEL GODEIRO', 'N', '241060', 'N', 'S', 'S', NULL, '32', 'N', 'N', 'N', '113', 'DINÂMICA', '03', 'N', '85', NULL, NULL, NULL, NULL),
('412135', '4111', 'PR', '4106', '4102', '41004', '41', 'RANCHO ALEGRE D''OESTE', NULL, '44', '87395000', '6', '5513', '5513', '14351', NULL, 'ATIVO', 'N', 'S', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '241,416', '-24,30700', '-52,95400', '528', 'S', '0,704', NULL, NULL, '41900', 'S', 'N', '4052', NULL, '4190', '4190', NULL, '1993', 'S', '3481', 'RANCHO ALEGRE D''OESTE', 'N', '412135', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '299', 'ESTAGNADA', '03', 'N', '141', NULL, NULL, NULL, NULL),
('261160', '2601', 'PE', '2607', '2605', '26017', '26', 'RECIFE', NULL, '81', '50001970', '6', '2531', '2531', '15116', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'S', 'N', 'N', 'N', 'N', 'S', NULL, 'S', '217,494', '-8,05400', '-34,88100', '4', 'S', '0,772', NULL, NULL, '26001', 'N', 'N', '4059', NULL, '2601', '2601', NULL, '1709', 'S', '2910', 'RECIFE', 'N', '261160', 'N', 'S', 'S', NULL, NULL, 'S', 'S', 'S', '133', 'ALTA RENDA', '01', 'N', '314', NULL, NULL, NULL, NULL),
('431540', '4315', 'RS', '4311', '4301', '43002', '43', 'REDENTORA', NULL, '55', '98550000', '4', '8811', '8811', '19155', NULL, 'ATIVO', 'N', 'S', NULL, NULL, 'S', 'N', 'N', 'N', 'N', 'S', NULL, 'N', '302,64', '-27,66400', '-53,63800', '545', 'S', '0,631', NULL, NULL, '43900', 'S', 'N', '4066', NULL, '4390', '4390', NULL, '1964', 'S', '4223', 'REDENTORA', 'N', '431540', 'N', 'N', 'S', NULL, '147', 'N', 'N', 'N', '340', 'ESTAGNADA', '03', 'N', '476', NULL, NULL, NULL, NULL),
('292600', '2915', 'BA', '2913', '2902', '29004', '29', 'REMANSO', NULL, '74', '47200000', '4', '3821', '3821', '04261', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'S', 'S', 'S', 'N', NULL, 'N', '4693,505', '-9,62200', '-42,08100', '388', 'S', '0,579', NULL, NULL, '29061', 'N', 'N', '4073', NULL, '2990', '2990', NULL, '1857', 'S', '520', 'REMANSO', 'N', '292600', 'N', 'S', 'S', NULL, '143', 'S', 'N', 'N', '321', 'ESTAGNADA', '03', 'N', '113', NULL, NULL, NULL, NULL),
('412160', '4108', 'PR', '4108', '4107', '41026', '41', 'RENASCENCA', NULL, '46', '85610000', '4', '7809', '7809', '14205', NULL, 'ATIVO', 'N', 'S', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '425,082', '-26,15800', '-52,96900', '688', 'S', '0,733', NULL, NULL, '41900', 'N', 'N', '4075', NULL, '4190', '4190', NULL, '1960', 'S', '3484', 'RENASCENÇA', 'N', '412160', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '302', 'ESTAGNADA', '03', 'N', '34', NULL, NULL, NULL, NULL),
('315420', '3120', 'MG', '3102', '3111', '31058', '31', 'RESENDE COSTA', NULL, '32', '36340000', '0', '5083', '5083', '11542', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '631,561', '-20,92200', '-44,23800', '1032', 'S', '0,685', NULL, NULL, '31015', 'N', 'N', '4078', NULL, '3190', '3190', NULL, '1911', 'S', '1987', 'RESENDE COSTA', 'N', '315420', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '632', 'ESTAGNADA', '03', 'N', '657', NULL, NULL, NULL, NULL),
('412175', '4105', 'PR', '4107', '4108', '41029', '41', 'RESERVA DO IGUACU', NULL, '42', '85195000', '2', '0878', '0878', '14411', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'S', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '834,232', '-25,83900', '-52,02800', '1020', 'S', '0,648', NULL, NULL, '41900', 'N', 'N', '4081', NULL, '4190', '4190', NULL, '1997', 'S', '3486', 'RESERVA DO IGUAÇU', 'N', '412175', 'N', 'N', 'S', NULL, '25', 'N', 'N', 'N', '304', 'ESTAGNADA', '03', 'N', '32', NULL, NULL, NULL, NULL),
('251276', '2501', 'PB', '2503', '2504', '25021', '25', 'RIACHAO DO POCO', NULL, '83', '58348000', '2', '0506', '0506', '13206', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'S', 'N', 'N', NULL, 'N', '39,067', '-7,14200', '-35,29100', '82', 'S', '0,555', NULL, NULL, '25900', 'S', 'N', '4092', NULL, '2590', '2590', NULL, '1997', 'S', '2713', 'RIACHÃO DO POÇO', 'N', '251276', 'N', 'S', 'S', NULL, '103', 'N', 'N', 'N', '160', 'BAIXA RENDA', '03', 'N', '26', NULL, NULL, NULL, NULL),
('315450', '3106', 'MG', '3108', '3102', '31004', '31', 'RIACHO DOS MACHADOS', NULL, '38', '39529000', '7', '5089', '5089', '11545', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'S', 'N', 'S', 'N', 'N', 'N', NULL, 'N', '1308,545', '-16,00600', '-43,04900', '821', 'S', '0,627', NULL, NULL, '31052', 'S', 'N', '4101', NULL, '3190', '3190', NULL, '1962', 'S', '1991', 'RIACHO DOS MACHADOS', 'N', '315450', 'N', 'S', 'S', NULL, '79', 'N', 'N', 'N', '636', 'DINÂMICA', '03', 'N', '634', NULL, NULL, NULL, NULL),
('292660', '2911', 'BA', '2914', '2904', '29015', '29', 'RIBEIRA DO POMBAL', NULL, '75', '48400000', '8', '3833', '3833', '04267', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'S', 'S', 'N', 'N', NULL, 'N', '807,137', '-10,83400', '-38,53600', '228', 'S', '0,601', NULL, NULL, '29052', 'N', 'N', '4112', NULL, '2990', '2990', NULL, '1758', 'S', '526', 'RIBEIRA DO POMBAL', 'N', '292660', 'N', 'S', 'S', NULL, '162', 'S', 'N', 'S', '327', 'BAIXA RENDA', '03', 'N', '56', NULL, NULL, NULL, NULL),
('412180', '4119', 'PR', '4105', '4104', '41016', '41', 'RIBEIRAO CLARO', NULL, '43', '86410000', '2', '7813', '7813', '14207', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '632,782', '-23,19400', '-49,75800', '690', 'S', '0,716', NULL, NULL, '41900', 'N', 'N', '4117', NULL, '4190', '4190', NULL, '1900', 'S', '3487', 'RIBEIRÃO CLARO', 'N', '412180', 'N', 'N', 'S', NULL, '146', 'N', 'N', 'N', '305', 'ESTAGNADA', '03', 'N', '427', NULL, NULL, NULL, NULL),
('354320', '3509', 'SP', '3533', '3510', '35040', '35', 'RIBEIRAO DO SUL', NULL, '14', '19930000', '4', '6965', '6965', '21433', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '203,356', '-22,78400', '-49,93400', '479', 'S', '0,747', NULL, NULL, '35094', 'N', 'N', '4122', NULL, '3590', '3590', NULL, '1964', 'S', '5227', 'RIBEIRÃO DO SUL', 'N', '354320', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '486', 'ESTAGNADA', '03', 'N', '329', NULL, NULL, NULL, NULL),
('354340', '3513', 'SP', '3530', '3502', '35014', '35', 'RIBEIRAO PRETO', NULL, '16', '14001970', '2', '6969', '6969', '21435', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '650,366', '-21,17800', '-47,81000', '546', 'S', '0,8', NULL, NULL, '35132', 'N', 'N', '4126', NULL, '3590', '3510', NULL, '1871', 'S', '5231', 'RIBEIRÃO PRETO', 'N', '354340', 'N', 'N', 'S', NULL, NULL, 'N', 'S', 'N', '490', 'ALTA RENDA', '01', 'N', '273', NULL, NULL, NULL, NULL),
('354370', '3503', 'SP', '3530', '3505', '35024', '35', 'RINCAO', NULL, '16', '14830000', '9', '6975', '6975', '21438', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '313,422', '-21,58700', '-48,07100', '530', 'S', '0,734', NULL, NULL, '35031', 'N', 'N', '4132', NULL, '3590', '3590', NULL, '1948', 'S', '5233', 'RINCÃO', 'N', '354370', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '492', 'ALTA RENDA', '03', 'N', '40', NULL, NULL, NULL, NULL),
('412200', '4104', 'PR', '4107', '4109', '41032', '41', 'RIO AZUL', NULL, '42', '84560000', '8', '7817', '7817', '14209', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '629,739', '-25,73300', '-50,79600', '925', 'S', '0,687', NULL, NULL, '41900', 'N', 'N', '4135', NULL, '4190', '4190', NULL, '1930', 'S', '3489', 'RIO AZUL', 'N', '412200', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '307', 'ESTAGNADA', '03', 'N', '79', NULL, NULL, NULL, NULL),
('220310', '2211', 'PI', '2210', '2203', '22010', '22', 'CRISTINO CASTRO', NULL, '89', '64920000', '7', '1061', '1061', '16031', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'S', 'N', 'S', 'N', NULL, 'N', '1848,69', '-8,81800', '-44,22400', '239', 'S', '0,566', NULL, NULL, '22900', 'S', 'N', '1446', NULL, '2290', '2290', NULL, '1953', 'S', '3028', 'CRISTINO CASTRO', 'N', '220310', 'N', 'S', 'S', NULL, NULL, 'S', 'N', 'N', '67', 'DINÂMICA', '03', 'N', '199', NULL, NULL, NULL, NULL),
('170625', '1709', 'TO', '1702', '1701', '17005', '17', 'CRIXAS DO TOCANTINS', NULL, '63', '77463000', '8', '0082', '0082', '28131', NULL, 'ATIVO', 'S', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '986,689', '-11,10000', '-48,91900', '250', 'S', '0,644', NULL, NULL, '17900', 'S', 'N', '1449', NULL, '1790', '1790', NULL, '1997', 'S', '5430', 'CRIXÁS DO TOCANTINS', 'N', '170625', 'S', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '44', 'ESTAGNADA', '03', 'N', '505', NULL, NULL, NULL, NULL),
('312060', '3101', 'MG', '3103', '3107', '31032', '31', 'CRUCILANDIA', NULL, '31', '35520000', '7', '4411', '4411', '11206', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '166,451', '-20,38400', '-44,33700', '908', 'S', '0,651', NULL, NULL, '31017', 'N', 'N', '1452', NULL, '3190', '3190', NULL, '1948', 'S', '1583', 'CRUCILÂNDIA', 'N', '312060', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '228', 'ESTAGNADA', '03', 'N', '612', NULL, NULL, NULL, NULL),
('410510', '4117', 'PR', '4105', '4103', '41006', '41', 'CENTENARIO DO SUL', NULL, '43', '86630000', '2', '7499', '7499', '14050', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '371,835', '-22,82100', '-51,59500', '560', 'S', '0,668', NULL, NULL, '41900', 'N', 'N', '1202', NULL, '4190', '4190', NULL, '1951', 'S', '3256', 'CENTENÁRIO DO SUL', 'N', '410510', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '73', 'ESTAGNADA', '03', 'N', '374', NULL, NULL, NULL, NULL),
('311580', '3125', 'MG', '3113', '3105', '31018', '31', 'CENTRALINA', NULL, '34', '38390000', '5', '4315', '4315', '11158', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '321,985', '-18,58400', '-49,19900', '531', 'S', '0,678', NULL, NULL, '31073', 'N', 'N', '1206', NULL, '3190', '3190', NULL, '1953', 'S', '1529', 'CENTRALINA', 'N', '311580', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '174', 'ALTA RENDA', '03', 'N', '633', NULL, NULL, NULL, NULL),
('351150', '3516', 'SP', '3519', '3511', '35043', '35', 'CERQUILHO', NULL, '15', '18520000', '8', '6331', '6331', '21116', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '127,758', '-23,16500', '-47,74400', '595', 'S', '0,782', NULL, NULL, '35161', 'N', 'N', '1212', NULL, '3590', '3590', NULL, '1948', 'S', '4872', 'CERQUILHO', 'N', '351150', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '131', 'ALTA RENDA', '03', 'N', '158', NULL, NULL, NULL, NULL),
('240270', '2404', 'RN', '2402', '2402', '24010', '24', 'CERRO CORA', NULL, '84', '59395000', '9', '1653', '1653', '18027', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'S', 'N', 'N', 'N', NULL, 'N', '393,569', '-6,04600', '-36,34600', '575', 'S', '0,607', NULL, NULL, '24900', 'S', 'N', '1216', NULL, '2490', '2490', NULL, '1953', 'S', '3704', 'CERRO CORÁ', 'N', '240270', 'N', 'S', 'S', NULL, '76', 'N', 'N', 'N', '30', 'DINÂMICA', '03', 'N', '83', NULL, NULL, NULL, NULL),
('520545', '5202', 'GO', '5210', '5205', '52014', '52', 'CEZARINA', NULL, '64', '76195000', '5', '9785', '9785', '08256', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '415,809', '-16,97200', '-49,77600', '596', 'S', '0,711', NULL, NULL, '52900', 'N', 'N', '1223', NULL, '5290', '5290', NULL, '1989', 'S', '958', 'CEZARINA', 'N', '520545', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '63', 'ESTAGNADA', '03', 'N', '60', NULL, NULL, NULL, NULL),
('311590', '3105', 'MG', '3107', '3112', '31065', '31', 'CHACARA', NULL, '32', '36110000', '4', '4317', '4317', '11159', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '152,874', '-21,67200', '-43,22200', '800', 'S', '0,664', NULL, NULL, '31043', 'N', 'N', '1227', NULL, '3190', '3190', NULL, '1962', 'S', '1530', 'CHÁCARA', 'N', '311590', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '175', 'ALTA RENDA', '03', 'N', '602', NULL, NULL, NULL, NULL),
('311615', '3126', 'MG', '3109', '3102', '31003', '31', 'CHAPADA GAUCHA', NULL, '38', '39314000', '9', '0588', '0588', '11782', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'S', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '3214,698', '-15,30600', '-45,61800', '858', 'S', '0,635', NULL, NULL, '31058', 'S', 'N', '1234', NULL, '3190', '3190', NULL, '1997', 'S', '1533', 'CHAPADA GAÚCHA', 'N', '311615', 'N', 'S', 'S', NULL, '63', 'N', 'N', 'N', '178', 'DINÂMICA', '03', 'N', '668', NULL, NULL, NULL, NULL),
('210320', '2107', 'MA', '2110', '2104', '21014', '21', 'CHAPADINHA', NULL, '98', '65500000', '8', '0761', '0761', '09031', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '3247,159', '-3,74200', '-43,36000', '105', 'S', '0,604', NULL, NULL, '21900', 'N', 'N', '1238', NULL, '2190', '2190', NULL, '1890', 'S', '1195', 'CHAPADINHA', 'N', '210320', 'S', 'S', 'S', NULL, '20', 'N', 'N', 'S', '57', 'BAIXA RENDA', '01', 'N', '408', NULL, NULL, NULL, NULL),
('230393', '2308', 'CE', '2307', '2304', '23019', '23', 'CHORO', NULL, '88', '63950000', '1', '0993', '0993', '05185', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'S', 'S', 'N', 'N', NULL, 'N', '815,759', '-4,84300', '-39,14100', '237', 'S', '0,585', NULL, NULL, '23900', 'S', 'N', '1249', NULL, '2390', '2390', NULL, '1993', 'S', '663', 'CHORÓ', 'N', '230393', 'N', 'S', 'S', NULL, '80', 'N', 'N', 'N', '47', 'DINÂMICA', '03', 'N', '51', NULL, NULL, NULL, NULL),
('410550', '4113', 'PR', '4106', '4101', '41003', '41', 'CIANORTE', NULL, '44', '87200000', '8', '7505', '7505', '14053', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '811,666', '-23,66300', '-52,60500', '543', 'S', '0,755', NULL, NULL, '41900', 'N', 'N', '1255', NULL, '4190', '4190', NULL, '1955', 'S', '3260', 'CIANORTE', 'N', '410550', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '77', 'ESTAGNADA', '02', 'N', '142', NULL, NULL, NULL, NULL),
('410560', '4113', 'PR', '4106', '4101', '41003', '41', 'CIDADE GAUCHA', NULL, '44', '87820000', '7', '7507', '7507', '14054', NULL, 'ATIVO', 'N', 'S', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '403,044', '-23,38000', '-52,94500', '404', 'S', '0,718', NULL, NULL, '41900', 'N', 'N', '1257', NULL, '4190', '4190', NULL, '1960', 'S', '3261', 'CIDADE GAÚCHA', 'N', '410560', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '78', 'ESTAGNADA', '03', 'N', '142', NULL, NULL, NULL, NULL),
('430545', '4318', 'RS', '4313', '4305', '43027', '43', 'CIDREIRA', NULL, '51', '95595000', '4', '8433', '8433', '19264', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '246,362', '-30,16100', '-50,23400', '60', 'S', '0,729', NULL, NULL, '43900', 'N', 'N', '1260', NULL, '4302', '4390', NULL, '1989', 'S', '4006', 'CIDREIRA', 'N', '430545', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '109', 'ESTAGNADA', '03', 'N', '461', NULL, NULL, NULL, NULL),
('510305', '5114', 'MT', '5103', '5101', '51007', '51', 'CLAUDIA', NULL, '66', '78540000', '6', '9789', '9789', '10154', NULL, 'ATIVO', 'S', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '3820,948', '-11,51500', '-54,89100', '368', 'S', '0,699', NULL, NULL, '51900', 'S', 'N', '1266', NULL, '5190', '5190', NULL, '1989', 'S', '2314', 'CLÁUDIA', 'N', '510305', 'S', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '30', 'ALTA RENDA', '03', 'N', '248', NULL, NULL, NULL, NULL),
('351190', '3502', 'SP', '3531', '3503', '35018', '35', 'CLEMENTINA', NULL, '18', '16250000', '4', '6339', '6339', '21120', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '168,739', '-21,56000', '-50,44900', '465', 'S', '0,725', NULL, NULL, '35023', 'N', 'N', '1268', NULL, '3590', '3590', NULL, '1953', 'S', '4876', 'CLEMENTINA', 'N', '351190', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '135', 'ALTA RENDA', '03', 'N', '157', NULL, NULL, NULL, NULL),
('510310', '5103', 'MT', '5104', '5102', '51011', '51', 'COCALINHO', NULL, '66', '78680000', '6', '9865', '9865', '10127', NULL, 'ATIVO', 'S', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'S', NULL, 'N', '16538,832', '-14,39700', '-50,99600', '241', 'S', '0,66', NULL, NULL, '51900', 'S', 'N', '1276', NULL, '5190', '5190', NULL, '1986', 'S', '2315', 'COCALINHO', 'N', '510310', 'S', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '31', 'ESTAGNADA', '03', 'N', '144', NULL, NULL, NULL, NULL),
('520551', '5209', 'GO', '5209', '5204', '52012', '52', 'COCALZINHO DE GOIAS', NULL, '62', '72975000', '3', '0055', '0055', '08299', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '1787,994', '-15,79400', '-48,77600', '1152', 'S', '0,657', NULL, NULL, '52900', 'N', 'N', '1277', NULL, '5301', '5301', NULL, '1993', 'S', '961', 'COCALZINHO DE GOIÁS', 'S', '520551', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '66', 'ESTAGNADA', '01', 'N', '61', NULL, NULL, NULL, NULL),
('210330', '2108', 'MA', '2111', '2104', '21015', '21', 'CODO', NULL, '99', '65400000', '7', '0763', '0763', '09032', NULL, 'ATIVO', 'S', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '4364,499', '-4,45500', '-43,88600', '47', 'S', '0,595', NULL, NULL, '21900', 'N', 'N', '1280', NULL, '2190', '2190', NULL, '1833', 'S', '1197', 'CODÓ', 'N', '210330', 'S', 'S', 'S', NULL, '34', 'S', 'N', 'S', '59', 'BAIXA RENDA', '01', 'N', '297', NULL, NULL, NULL, NULL),
('510320', '5115', 'MT', '5103', '5101', '51003', '51', 'COLIDER', NULL, '66', '78500000', '5', '8979', '8979', '10099', NULL, 'ATIVO', 'S', 'N', NULL, NULL, 'S', 'N', 'N', 'N', 'N', 'S', NULL, 'N', '3038,249', '-10,81300', '-55,45500', '265', 'S', '0,713', NULL, NULL, '51900', 'S', 'N', '1287', NULL, '5190', '5190', NULL, '1979', 'S', '2316', 'COLÍDER', 'N', '510320', 'S', 'N', 'S', NULL, '74', 'N', 'N', 'N', '32', 'DINÂMICA', '03', 'N', '424', NULL, NULL, NULL, NULL),
('170550', '1708', 'TO', '1701', '1701', '17002', '17', 'COLINAS DO TOCANTINS', NULL, '63', '77760000', '8', '9311', '9311', '28021', NULL, 'ATIVO', 'S', 'N', NULL, 'COLINAS DE GOIAS', 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '843,84', '-8,05900', '-48,47500', '227', 'S', '0,701', NULL, NULL, '17900', 'S', 'N', '1292', NULL, '1790', '1790', NULL, '1989', 'S', '5424', 'COLINAS DO TOCANTINS', 'N', '170550', 'S', 'N', 'S', NULL, NULL, 'N', 'N', 'S', '38', 'ESTAGNADA', '03', 'N', '504', NULL, NULL, NULL, NULL),
('270210', '2703', 'AL', '2704', '2703', '27009', '27', 'COLONIA LEOPOLDINA', NULL, '82', '57975000', '8', '2741', '2741', '02021', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'S', 'N', 'N', NULL, 'N', '287,459', '-8,90900', '-35,72500', '140', 'S', '0,517', NULL, NULL, '27012', 'S', 'N', '1298', NULL, '2790', '2790', NULL, '1901', 'S', '44', 'COLÔNIA LEOPOLDINA', 'N', '270210', 'N', 'S', 'S', NULL, NULL, 'N', 'N', 'N', '22', 'BAIXA RENDA', '03', 'N', '169', NULL, NULL, NULL, NULL),
('330095', '3304', 'RJ', '3312', '3303', '33005', '33', 'COMENDADOR LEVY GASPARIAN', NULL, '24', '25870000', '1', '2927', '2927', '17079', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '107,266', '-22,02900', '-43,20500', '315', 'S', '0,685', NULL, NULL, '33900', 'N', 'N', '1305', NULL, '3390', '3390', NULL, '1993', 'S', '3603', 'COMENDADOR LEVY GASPARIAN', 'N', '330095', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '21', 'ESTAGNADA', '03', 'N', '269', NULL, NULL, NULL, NULL),
('311710', '3121', 'MG', '3101', '3110', '31049', '31', 'CONCEICAO DA APARECIDA', NULL, '35', '37148000', '8', '4341', '4341', '11171', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '349,489', '-21,09400', '-46,20400', '985', 'S', '0,691', NULL, NULL, '31001', 'N', 'N', '1309', NULL, '3190', '3190', NULL, '1943', 'S', '1543', 'CONCEIÇÃO DA APARECIDA', 'N', '311710', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '188', 'ALTA RENDA', '03', 'N', '607', NULL, NULL, NULL, NULL),
('311740', '3124', 'MG', '3110', '3108', '31041', '31', 'CONCEICAO DE IPANEMA', NULL, '33', '36947000', '5', '4347', '4347', '11174', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '254,513', '-19,92800', '-41,69400', '294', 'S', '0,676', NULL, NULL, '31059', 'N', 'N', '1315', NULL, '3190', '3190', NULL, '1953', 'S', '1547', 'CONCEIÇÃO DE IPANEMA', 'N', '311740', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '192', 'ESTAGNADA', '03', 'N', '641', NULL, NULL, NULL, NULL),
('320170', '3201', 'ES', '3207', '3203', '32007', '32', 'CONCEICAO DO CASTELO', NULL, '28', '29370000', '4', '5633', '5633', '07017', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'S', 'S', 'N', NULL, 'N', '364,531', '-20,36800', '-41,24400', '610', 'S', '0,67', NULL, NULL, '32006', 'N', 'N', '1320', NULL, '3290', '3290', NULL, '1963', 'S', '840', 'CONCEIÇÃO DO CASTELO', 'N', '320170', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '21', 'ESTAGNADA', '03', 'N', '173', NULL, NULL, NULL, NULL),
('311750', '3109', 'MG', '3104', '3107', '31028', '31', 'CONCEICAO DO MATO DENTRO', NULL, '31', '35860000', '4', '4349', '4349', '11175', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '1671,465', '-19,03700', '-43,42500', '701', 'S', '0,634', NULL, NULL, '31025', 'S', 'N', '1324', NULL, '3190', '3190', NULL, '1840', 'S', '1548', 'CONCEIÇÃO DO MATO DENTRO', 'N', '311750', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '193', 'ESTAGNADA', '03', 'N', '600', NULL, NULL, NULL, NULL),
('311770', '3111', 'MG', '3101', '3110', '31054', '31', 'CONCEICAO DO RIO VERDE', NULL, '35', '37430000', '2', '4353', '4353', '11177', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '370,04', '-21,88100', '-45,08500', '880', 'S', '0,665', NULL, NULL, '31008', 'N', 'N', '1326', NULL, '3190', '3190', NULL, '1911', 'S', '1550', 'CONCEIÇÃO DO RIO VERDE', 'N', '311770', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '195', 'ESTAGNADA', '03', 'N', '659', NULL, NULL, NULL, NULL),
('311290', '3124', 'MG', '3110', '3112', '31061', '31', 'CAPUTIRA', NULL, '31', '36925000', '1', '4257', '4257', '11129', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '188,112', '-20,17200', '-42,27100', '592', 'S', '0,615', NULL, NULL, '31059', 'S', 'N', '1069', NULL, '3190', '3190', NULL, '1962', 'S', '1497', 'CAPUTIRA', 'N', '311290', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '142', 'ESTAGNADA', '03', 'N', '641', NULL, NULL, NULL, NULL),
('351050', '3517', 'SP', '3526', '3513', '35054', '35', 'CARAGUATATUBA', NULL, '12', '11660970', '0', '6311', '6311', '21106', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '483,95', '-23,62000', '-45,41300', '2', 'S', '0,759', NULL, NULL, '35173', 'N', 'N', '1074', NULL, '3590', '3590', NULL, '1857', 'S', '4862', 'CARAGUATATUBA', 'N', '351050', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '121', 'ALTA RENDA', '01', 'N', '437', NULL, NULL, NULL, NULL),
('351060', '3501', 'SP', '3522', '3515', '35057', '35', 'CARAPICUIBA', NULL, '11', '06320970', '9', '6313', '6313', '21107', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'S', 'N', NULL, 'N', '34,967', '-23,52300', '-46,83600', '770', 'S', '0,749', NULL, NULL, '35014', 'N', 'N', '1082', NULL, '3501', '3501', NULL, '1964', 'S', '4863', 'CARAPICUÍBA', 'N', '351060', 'N', 'N', 'S', NULL, NULL, 'N', 'S', 'N', '122', 'ALTA RENDA', '01', 'N', '391', NULL, NULL, NULL, NULL),
('250407', '2505', 'PB', '2502', '2502', '25011', '25', 'CARAUBAS', NULL, '83', '58595000', '4', '0466', '0466', '13186', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'S', 'S', 'S', 'N', NULL, 'N', '445,575', '-7,72700', '-36,49200', '451', 'S', '0,585', NULL, NULL, '25900', 'S', 'N', '1086', NULL, '2590', '2590', NULL, '1997', 'S', '2607', 'CARAÚBAS', 'N', '250407', 'N', 'S', 'S', NULL, NULL, 'N', 'N', 'N', '52', 'DINÂMICA', '03', 'N', '253', NULL, NULL, NULL, NULL),
('351070', '3515', 'SP', '3531', '3501', '35003', '35', 'CARDOSO', NULL, '17', '15570000', '8', '6315', '6315', '21108', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '637,571', '-20,08200', '-49,91400', '422', 'S', '0,722', NULL, NULL, '35157', 'N', 'N', '1092', NULL, '3590', '3590', NULL, '1948', 'S', '4864', 'CARDOSO', 'N', '351070', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '123', 'ALTA RENDA', '03', 'N', '162', NULL, NULL, NULL, NULL),
('220255', '2206', 'PI', '2207', '2204', '22015', '22', 'CARIDADE DO PIAUI', NULL, '89', '64590000', '4', '0300', '0300', '16168', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'S', 'N', 'S', 'N', NULL, 'N', '423,369', '-7,73300', '-40,99000', '347', 'S', '0,541', NULL, NULL, '22900', 'S', 'N', '1099', NULL, '2290', '2290', NULL, '1997', 'S', '3015', 'CARIDADE DO PIAUÍ', 'N', '220255', 'N', 'S', 'S', NULL, '96', 'S', 'N', 'N', '54', 'DINÂMICA', '03', 'N', '311', NULL, NULL, NULL, NULL),
('230320', '2321', 'CE', '2308', '2307', '23030', '23', 'CARIRIACU', NULL, '88', '63220000', '4', '1363', '1363', '05032', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'S', 'N', 'S', 'S', 'N', 'N', NULL, 'N', '623,823', '-7,04200', '-39,28400', '715', 'S', '0,578', NULL, NULL, '23900', 'S', 'N', '1104', NULL, '2302', '2390', NULL, '1933', 'S', '654', 'CARIRIAÇU', 'N', '230320', 'N', 'S', 'S', NULL, '131', 'S', 'N', 'N', '38', 'BAIXA RENDA', '03', 'N', '109', NULL, NULL, NULL, NULL),
('150590', '1510', 'PA', '1510', '1501', '15003', '15', 'PORTO DE MOZ', NULL, '93', '68330000', '8', '0517', '0517', '12059', NULL, 'ATIVO', 'S', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '17422,876', '-1,74800', '-52,23800', '15', 'S', '0,503', NULL, NULL, '15900', 'S', 'N', '3906', NULL, '1590', '1590', NULL, '1937', 'S', '2507', 'PORTO DE MOZ', 'N', '150590', 'S', 'N', 'S', NULL, '95', 'N', 'N', 'N', '97', 'DINÂMICA', '03', 'N', '456', NULL, NULL, NULL, NULL),
('510680', '5110', 'MT', '5103', '5101', '51005', '51', 'PORTO DOS GAUCHOS', NULL, '66', '78560000', '2', '9135', '9135', '10068', NULL, 'ATIVO', 'S', 'N', NULL, NULL, 'S', 'N', 'N', 'N', 'S', 'N', NULL, 'N', '7011,545', '-11,53500', '-57,41400', '259', 'S', '0,685', NULL, NULL, '51900', 'S', 'N', '3909', NULL, '5190', '5190', NULL, '1963', 'S', '2375', 'PORTO DOS GAÚCHOS', 'N', '510680', 'S', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '99', 'DINÂMICA', '03', 'N', '415', NULL, NULL, NULL, NULL),
('354070', '3503', 'SP', '3530', '3507', '35029', '35', 'PORTO FERREIRA', NULL, '19', '13660000', '5', '6915', '6915', '21408', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '243,906', '-21,85400', '-47,47900', '558', 'S', '0,751', NULL, NULL, '35034', 'N', 'N', '3913', NULL, '3590', '3590', NULL, '1896', 'S', '5198', 'PORTO FERREIRA', 'N', '354070', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '457', 'ALTA RENDA', '02', 'N', '434', NULL, NULL, NULL, NULL),
('431500', '4314', 'RS', '4312', '4301', '43001', '43', 'PORTO LUCENA', NULL, '55', '98980000', '8', '8803', '8803', '19151', NULL, 'ATIVO', 'N', 'S', NULL, NULL, 'S', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '250,078', '-27,85600', '-55,01600', '114', 'S', '0,693', NULL, NULL, '43900', 'N', 'N', '3917', NULL, '4390', '4390', NULL, '1955', 'S', '4211', 'PORTO LUCENA', 'N', '431500', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '327', 'ESTAGNADA', '03', 'N', '470', NULL, NULL, NULL, NULL),
('330411', '3305', 'RJ', '3312', '3305', '33011', '33', 'PORTO REAL', NULL, '24', '27570000', '0', '0780', '0780', '17087', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '50,587', '-22,42000', '-44,29000', '385', 'S', '0,713', NULL, NULL, '33900', 'N', 'N', '3921', NULL, '3390', '3390', NULL, '1997', 'S', '3640', 'PORTO REAL', 'N', '330411', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '59', 'ALTA RENDA', '03', 'N', '205', NULL, NULL, NULL, NULL);
INSERT INTO `tb_municipio` (`CO_MUNICIPIO_IBGE`, `CO_REGIONAL_SAUDE`, `SG_UF`, `CO_MACRORREGIONAL`, `CO_MESORREGIAO`, `CO_MICRORREGIAO`, `CO_UF_IBGE`, `NO_MUNICIPIO`, `SG_MUNICIPIO`, `NU_DDD`, `NU_CEP`, `DV_MUNICIPIO_IBGE`, `CO_MUNICIPIO_SIAFI`, `CO_MUNICIPIO_SIAPE`, `CO_SINPAS`, `CO_REGIAO_CORREIO`, `ST_MUNICIPIO`, `ST_AMAZONIA`, `ST_FRONTEIRA`, `CO_SUCESSOR`, `NO_ANTERIOR`, `ST_COMUNIDADE_SOLIDARIA`, `ST_SECA`, `ST_SEMI_ARIDO`, `ST_PRMI`, `ST_CALAMIDADE`, `ST_INDIGENA`, `NU_DISTANCIA_CAPITAL`, `ST_CAPITAL`, `NU_AREA`, `NU_LATITUDE`, `NU_LONGITUDE`, `NU_ALTITUDE`, `ST_REGISTRO_ATIVO`, `NU_IDH`, `CO_MUNICIPIO_CORREIO`, `CO_MUNICIPIO_INSS`, `CO_MICRORREGIONAL_SAUDE`, `ST_PITS`, `ST_QUILOMBOLA`, `CO_SEQ_ANTIGO`, `NO_POPULAR`, `CO_REGIAO_METROPOLITANA`, `CO_AGLOMERADO_URBANO`, `NU_ANO_EXTINCAO`, `NU_ANO_INSTALACAO`, `ST_IBGE`, `CO_MUNICIPIO_SVS`, `NO_MUNICIPIO_ACENTUADO`, `ST_RIDE`, `CO_MUNICIPIO_CNES`, `ST_SUDAM`, `ST_SUDENE`, `ST_CADSUS`, `CO_MUNICIPIO_ORIGEM`, `CO_TERRITORIO_CIDADANIA`, `ST_PSE`, `ST_PAN`, `ST_PACTO_RMINAL`, `CO_MUNICIPIO_TABNET_RJ`, `TP_TIPOLOGIA_PNDR`, `CO_GRUPO_PAC2`, `ST_CNES`, `CO_REGIAO_SAUDE`, `ST_PACTO`, `ST_CIB_SAS`, `DT_MANUTENCAO`, `FSDFSD`) VALUES
('110020', '1104', 'RO', '1102', '1101', '11001', '11', 'PORTO VELHO', NULL, '69', '78900900', '5', '0003', '0003', '26002', NULL, 'ATIVO', 'S', 'S', NULL, NULL, 'S', 'N', 'N', 'N', 'N', 'S', NULL, 'S', '34082,366', '-8,76200', '-63,90400', '85', 'S', '0,736', NULL, NULL, '11900', 'N', 'N', '3927', NULL, '1190', '1101', NULL, '1943', 'S', '3876', 'PORTO VELHO', 'N', '110020', 'S', 'N', 'S', NULL, '53', 'S', 'S', 'S', '37', 'ALTA RENDA', '01', 'N', '87', NULL, NULL, NULL, NULL),
('431510', '4312', 'RS', '4312', '4301', '43006', '43', 'PORTO XAVIER', NULL, '55', '98995000', '7', '8805', '8805', '19152', NULL, 'ATIVO', 'N', 'S', NULL, NULL, 'S', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '280,511', '-27,90600', '-55,13800', '115', 'S', '0,723', NULL, NULL, '43900', 'N', 'N', '3931', NULL, '4390', '4390', NULL, '1966', 'S', '4214', 'PORTO XAVIER', 'N', '431510', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '330', 'ESTAGNADA', '03', 'N', '467', NULL, NULL, NULL, NULL),
('292540', '2914', 'BA', '2911', '2906', '29029', '29', 'POTIRAGUA', NULL, '73', '45790000', '2', '3809', '3809', '04255', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'S', 'S', 'N', 'N', NULL, 'N', '989,471', '-15,59500', '-39,87700', '181', 'S', '0,625', NULL, NULL, '29083', 'S', 'N', '3936', NULL, '2990', '2990', NULL, '1958', 'S', '511', 'POTIRAGUÁ', 'N', '292540', 'N', 'S', 'S', NULL, NULL, 'S', 'N', 'N', '312', 'ESTAGNADA', '03', 'N', '176', NULL, NULL, NULL, NULL),
('315250', '3110', 'MG', '3101', '3110', '31052', '31', 'POUSO ALEGRE', NULL, '35', '37550000', '1', '5049', '5049', '11525', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '543,883', '-22,23000', '-45,93600', '832', 'S', '0,774', NULL, NULL, '31007', 'N', 'N', '3939', NULL, '3190', '3190', NULL, '1831', 'S', '1970', 'POUSO ALEGRE', 'N', '315250', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '615', 'ALTA RENDA', '01', 'N', '654', NULL, NULL, NULL, NULL),
('150600', '1509', 'PA', '1510', '1501', '15002', '15', 'PRAINHA', NULL, '93', '68130000', '5', '0519', '0519', '12060', NULL, 'ATIVO', 'S', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '12599,481', '-1,80000', '-53,48000', '70', 'S', '0,523', NULL, NULL, '15900', 'S', 'N', '3953', NULL, '1590', '1590', NULL, '1935', 'S', '2508', 'PRAINHA', 'N', '150600', 'S', 'N', 'S', NULL, '18', 'N', 'N', 'N', '98', 'BAIXA RENDA', '03', 'N', '446', NULL, NULL, NULL, NULL),
('315290', '3122', 'MG', '3101', '3110', '31047', '31', 'PRATAPOLIS', NULL, '35', '37970000', '7', '5057', '5057', '11529', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '214,345', '-20,74500', '-46,86100', '742', 'S', '0,729', NULL, NULL, '31009', 'N', 'N', '3959', NULL, '3190', '3190', NULL, '1943', 'S', '1974', 'PRATÁPOLIS', 'N', '315290', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '619', 'ESTAGNADA', '03', 'N', '660', NULL, NULL, NULL, NULL),
('354130', '3511', 'SP', '3532', '3508', '35036', '35', 'PRESIDENTE EPITACIO', NULL, '18', '19470000', '7', '6927', '6927', '21414', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '1281,779', '-21,76300', '-52,11600', '310', 'S', '0,75', NULL, NULL, '35114', 'N', 'N', '3968', NULL, '3590', '3590', NULL, '1948', 'S', '5207', 'PRESIDENTE EPITÁCIO', 'N', '354130', 'N', 'N', 'S', NULL, '73', 'N', 'N', 'N', '466', 'ALTA RENDA', '03', 'N', '435', NULL, NULL, NULL, NULL),
('315320', '3114', 'MG', '3103', '3106', '31025', '31', 'PRESIDENTE JUSCELINO', NULL, '38', '35797000', '2', '5063', '5063', '11532', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '696,639', '-18,63700', '-44,05800', '596', 'S', '0,614', NULL, NULL, '31019', 'S', 'N', '3972', NULL, '3190', '3190', NULL, '1962', 'S', '1977', 'PRESIDENTE JUSCELINO', 'N', '315320', 'N', 'N', 'S', NULL, '48', 'N', 'N', 'N', '622', 'ESTAGNADA', '03', 'N', '620', NULL, NULL, NULL, NULL),
('431514', '4301', 'RS', '4313', '4305', '43024', '43', 'PRESIDENTE LUCENA', NULL, '51', '93945000', '9', '6023', '6023', '19397', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '49,426', '-29,51900', '-51,17800', '75', 'S', '0,757', NULL, NULL, '43900', 'N', 'N', '3977', NULL, '4390', '4390', NULL, '1993', 'S', '4216', 'PRESIDENTE LUCENA', 'N', '431514', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '332', 'ALTA RENDA', '03', 'N', '463', NULL, NULL, NULL, NULL),
('150200', '1507', 'PA', '1512', '1502', '15006', '15', 'CACHOEIRA DO ARARI', NULL, '91', '68840000', '4', '0439', '0439', '12020', NULL, 'ATIVO', 'S', 'N', NULL, NULL, 'S', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '3102,08', '-1,01100', '-48,96300', '20', 'S', '0,546', NULL, NULL, '15900', 'S', 'N', '833', NULL, '1590', '1590', NULL, '1935', 'S', '2442', 'CACHOEIRA DO ARARI', 'N', '150200', 'S', 'N', 'S', NULL, '129', 'N', 'N', 'N', '30', 'DINÂMICA', '03', 'N', '508', NULL, NULL, NULL, NULL),
('430960', '4314', 'RS', '4312', '4301', '43002', '43', 'HORIZONTINA', NULL, '55', '98920000', '5', '8691', '8691', '19096', NULL, 'ATIVO', 'N', 'S', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '228,849', '-27,62600', '-54,30800', '343', 'S', '0,783', NULL, NULL, '43900', 'N', 'N', '2042', NULL, '4390', '4390', NULL, '1954', 'S', '4086', 'HORIZONTINA', 'N', '430960', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '193', 'ESTAGNADA', '03', 'N', '470', NULL, NULL, NULL, NULL),
('430990', '4306', 'RS', '4311', '4301', '43010', '43', 'IBIRAIARAS', NULL, '54', '95305000', '2', '8699', '8699', '19099', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'S', NULL, 'N', '300,65', '-28,37000', '-51,63600', '776', 'S', '0,724', NULL, NULL, '43900', 'N', 'N', '2085', NULL, '4390', '4390', NULL, '1965', 'S', '4091', 'IBIRAIARAS', 'N', '430990', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '198', 'ALTA RENDA', '03', 'N', '474', NULL, NULL, NULL, NULL),
('431085', '4315', 'RS', '4311', '4301', '43009', '43', 'JABOTICABA', NULL, '55', '98350000', '0', '7393', '7393', '19289', NULL, 'ATIVO', 'N', 'S', NULL, NULL, 'S', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '128,053', '-27,63100', '-53,27700', '561', 'S', '0,658', NULL, NULL, '43900', 'N', 'N', '2438', NULL, '4390', '4390', NULL, '1989', 'S', '4111', 'JABOTICABA', 'N', '431085', 'N', 'N', 'S', NULL, '56', 'N', 'N', 'N', '219', 'ESTAGNADA', '03', 'N', '476', NULL, NULL, NULL, NULL),
('431090', '4311', 'RS', '4311', '4301', '43004', '43', 'JACUTINGA', NULL, '54', '99730000', '0', '8719', '8719', '19109', NULL, 'ATIVO', 'N', 'S', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '179,296', '-27,72900', '-52,53500', '577', 'S', '0,726', NULL, NULL, '43900', 'N', 'N', '2459', NULL, '4390', '4390', NULL, '1964', 'S', '4112', 'JACUTINGA', 'N', '431090', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '221', 'ESTAGNADA', '03', 'N', '472', NULL, NULL, NULL, NULL),
('431275', '4306', 'RS', '4311', '4302', '43014', '43', 'NOVA ALVORADA', NULL, '54', '95985000', '7', '7383', '7383', '19294', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '149,362', '-28,67800', '-52,16600', '427', 'S', '0,74', NULL, NULL, '43900', 'N', 'N', '3250', NULL, '4390', '4390', NULL, '1989', 'S', '4160', 'NOVA ALVORADA', 'N', '431275', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '271', 'ALTA RENDA', '03', 'N', '473', NULL, NULL, NULL, NULL),
('431306', '4301', 'RS', '4313', '4305', '43026', '43', 'NOVA HARTZ', NULL, '51', '93890000', '0', '7379', '7379', '19296', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '62,558', '-29,58300', '-50,90200', '36', 'S', '0,689', NULL, NULL, '43900', 'N', 'N', '3290', NULL, '4301', '4301', NULL, '1989', 'S', '4167', 'NOVA HARTZ', 'N', '431306', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '278', 'ALTA RENDA', '01', 'N', '463', NULL, NULL, NULL, NULL),
('431402', '4304', 'RS', '4314', '4304', '43022', '43', 'PARAISO DO SUL', NULL, '55', '96530000', '7', '7373', '7373', '19299', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '342,448', '-29,66900', '-53,14900', '108', 'S', '0,676', NULL, NULL, '43900', 'N', 'N', '3535', NULL, '4390', '4390', NULL, '1989', 'S', '4188', 'PARAÍSO DO SUL', 'N', '431402', 'N', 'N', 'S', NULL, '75', 'N', 'N', 'N', '300', 'ESTAGNADA', '03', 'N', '457', NULL, NULL, NULL, NULL),
('431410', '4306', 'RS', '4311', '4301', '43010', '43', 'PASSO FUNDO', NULL, '54', '99000000', '0', '8785', '8785', '19142', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'S', NULL, 'N', '780,355', '-28,26300', '-52,40700', '687', 'S', '0,776', NULL, NULL, '43900', 'N', 'N', '3594', NULL, '4390', '4390', NULL, '1857', 'S', '4193', 'PASSO FUNDO', 'N', '431410', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '305', 'ALTA RENDA', '01', 'N', '473', NULL, NULL, NULL, NULL),
('431610', '4315', 'RS', '4311', '4301', '43010', '43', 'RONDA ALTA', NULL, '54', '99670000', '5', '8825', '8825', '19162', NULL, 'ATIVO', 'N', 'S', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'S', NULL, 'N', '426,337', '-27,76700', '-52,80200', '450', 'S', '0,724', NULL, NULL, '43900', 'N', 'N', '4216', NULL, '4390', '4390', NULL, '1963', 'S', '4233', 'RONDA ALTA', 'N', '431610', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '351', 'ALTA RENDA', '03', 'N', '476', NULL, NULL, NULL, NULL),
('431673', '4306', 'RS', '4311', '4301', '43010', '43', 'SANTA CECILIA DO SUL', NULL, '54', '99952000', '3', '1166', '1166', '19495', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '195,545', '-28,16150', '-51,92500', '0', 'S', '0,725', NULL, NULL, '43900', 'N', 'N', '5680', NULL, '4390', '4390', NULL, '2001', 'S', '5551', 'SANTA CECÍLIA DO SUL', 'N', '431673', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '363', 'ALTA RENDA', '03', 'N', '474', NULL, NULL, NULL, NULL),
('431695', '4301', 'RS', '4313', '4305', '43024', '43', 'SANTA MARIA DO HERVAL', NULL, '51', '93995000', '6', '7337', '7337', '19311', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '139,224', '-29,49800', '-50,99300', '371', 'S', '0,676', NULL, NULL, '43900', 'N', 'N', '4381', NULL, '4390', '4390', NULL, '1989', 'S', '4247', 'SANTA MARIA DO HERVAL', 'N', '431695', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '368', 'ALTA RENDA', '03', 'N', '463', NULL, NULL, NULL, NULL),
('431770', '4312', 'RS', '4312', '4301', '43007', '43', 'SANTO ANTONIO DAS MISSOES', NULL, '55', '97870000', '7', '8857', '8857', '19178', NULL, 'ATIVO', 'N', 'S', NULL, NULL, 'S', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '1714,239', '-28,51100', '-55,22800', '213', 'S', '0,686', NULL, NULL, '43900', 'N', 'N', '4485', NULL, '4390', '4390', NULL, '1965', 'S', '4256', 'SANTO ANTÔNIO DAS MISSÕES', 'N', '431770', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '376', 'ESTAGNADA', '03', 'N', '467', NULL, NULL, NULL, NULL),
('431775', '4306', 'RS', '4311', '4301', '43009', '43', 'SANTO ANTONIO DO PLANALTO', NULL, '54', '99525000', '6', '5957', '5957', '19405', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '206,507', '-28,39600', '-52,69100', '558', 'S', '0,759', NULL, NULL, '43900', 'N', 'N', '4506', NULL, '4390', '4390', NULL, '1993', 'S', '4258', 'SANTO ANTÔNIO DO PLANALTO', 'N', '431775', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '378', 'ESTAGNADA', '03', 'N', '473', NULL, NULL, NULL, NULL),
('431950', '4301', 'RS', '4313', '4305', '43023', '43', 'SAO SEBASTIAO DO CAI', NULL, '51', '95760000', '5', '8893', '8893', '19196', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '111,452', '-29,58700', '-51,37600', '17', 'S', '0,739', NULL, NULL, '43900', 'N', 'N', '4837', NULL, '4390', '4301', NULL, '1875', 'S', '4290', 'SÃO SEBASTIÃO DO CAÍ', 'N', '431950', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '412', 'ALTA RENDA', '03', 'N', '464', NULL, NULL, NULL, NULL),
('431960', '4304', 'RS', '4314', '4303', '43018', '43', 'SAO SEPE', NULL, '55', '97340000', '4', '8895', '8895', '19197', NULL, 'ATIVO', 'N', 'S', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '2188,832', '-30,16100', '-53,56500', '85', 'S', '0,708', NULL, NULL, '43900', 'N', 'N', '4847', NULL, '4390', '4390', NULL, '1876', 'S', '4291', 'SÃO SEPÉ', 'N', '431960', 'N', 'N', 'S', NULL, '75', 'N', 'N', 'N', '413', 'ALTA RENDA', '03', 'N', '457', NULL, NULL, NULL, NULL),
('432032', '4314', 'RS', '4312', '4301', '43007', '43', 'SENADOR SALGADO FILHO', NULL, '55', '98895000', '1', '1012', '1012', '19461', NULL, 'ATIVO', 'N', 'S', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '147,209', '-28,03100', '-54,54300', '336', 'S', '0,693', NULL, NULL, '43900', 'N', 'N', '4918', NULL, '4390', '4390', NULL, '1997', 'S', '4304', 'SENADOR SALGADO FILHO', 'N', '432032', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '426', 'ESTAGNADA', '03', 'N', '470', NULL, NULL, NULL, NULL),
('432057', '4312', 'RS', '4312', '4301', '43006', '43', 'SETE DE SETEMBRO', NULL, '51', '97960000', '8', '1014', '1014', '19462', NULL, 'ATIVO', 'N', 'S', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '129,995', '-28,13100', '-54,46300', '273', 'S', '0,683', NULL, NULL, '43900', 'N', 'N', '4976', NULL, '4390', '4390', NULL, '1997', 'S', '4310', 'SETE DE SETEMBRO', 'N', '432057', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '432', 'ESTAGNADA', '03', 'N', '467', NULL, NULL, NULL, NULL),
('432132', '4319', 'RS', '4311', '4301', '43003', '43', 'TAQUARUCU DO SUL', NULL, '55', '98410000', '9', '7313', '7313', '19321', NULL, 'ATIVO', 'N', 'S', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '76,848', '-27,40000', '-53,46700', '545', 'S', '0,739', NULL, NULL, '43900', 'N', 'N', '5114', NULL, '4390', '4390', NULL, '1989', 'S', '4322', 'TAQUARUÇU DO SUL', 'N', '432132', 'N', 'N', 'S', NULL, '56', 'N', 'N', 'N', '444', 'ESTAGNADA', '03', 'N', '471', NULL, NULL, NULL, NULL),
('432140', '4319', 'RS', '4311', '4301', '43002', '43', 'TENENTE PORTELA', NULL, '55', '98500000', '2', '8931', '8931', '19215', NULL, 'ATIVO', 'N', 'S', NULL, NULL, 'S', 'N', 'N', 'N', 'N', 'S', NULL, 'N', '338,085', '-27,37100', '-53,75800', '390', 'S', '0,708', NULL, NULL, '43900', 'N', 'N', '5140', NULL, '4390', '4390', NULL, '1955', 'S', '4324', 'TENENTE PORTELA', 'N', '432140', 'N', 'N', 'S', NULL, '147', 'N', 'N', 'N', '446', 'ESTAGNADA', '03', 'N', '471', NULL, NULL, NULL, NULL),
('432185', '4315', 'RS', '4311', '4301', '43003', '43', 'TRES PALMEIRAS', NULL, '54', '99675000', '7', '7327', '7327', '19325', NULL, 'ATIVO', 'N', 'S', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'S', NULL, 'N', '188,7', '-27,61500', '-52,84100', '662', 'S', '0,703', NULL, NULL, '43900', 'N', 'N', '5228', NULL, '4390', '4390', NULL, '1989', 'S', '4337', 'TRÊS PALMEIRAS', 'N', '432185', 'N', 'N', 'S', NULL, '56', 'N', 'N', 'N', '460', 'ESTAGNADA', '03', 'N', '476', NULL, NULL, NULL, NULL),
('432310', '4319', 'RS', '4311', '4301', '43003', '43', 'VICENTE DUTRA', NULL, '55', '98450000', '1', '8965', '8965', '19232', NULL, 'ATIVO', 'N', 'S', NULL, NULL, 'S', 'N', 'N', 'N', 'N', 'S', NULL, 'N', '195,043', '-27,16200', '-53,40500', '289', 'S', '0,638', NULL, NULL, '43900', 'N', 'N', '5428', NULL, '4390', '4390', NULL, '1965', 'S', '4363', 'VICENTE DUTRA', 'N', '432310', 'N', 'N', 'S', NULL, '56', 'N', 'N', 'N', '486', 'ESTAGNADA', '03', 'N', '471', NULL, NULL, NULL, NULL),
('500210', '5005', 'MS', '5008', '5004', '50009', '50', 'BELA VISTA', NULL, '67', '79260000', '0', '9041', '9041', '06021', NULL, 'ATIVO', 'N', 'S', NULL, NULL, 'S', 'N', 'N', 'N', 'N', 'S', NULL, 'N', '4895,543', '-22,10900', '-56,52100', '180', 'S', '0,698', NULL, NULL, '50014', 'N', 'N', '562', NULL, '5090', '5090', NULL, '1908', 'S', '2222', 'BELA VISTA', 'N', '500210', 'N', 'N', 'S', NULL, '37', 'N', 'N', 'N', '14', 'ESTAGNADA', '03', 'N', '441', NULL, NULL, NULL, NULL),
('500510', '5004', 'MS', '5006', '5004', '50011', '50', 'JATEI', NULL, '67', '79720000', '3', '9101', '9101', '06051', NULL, 'ATIVO', 'N', 'S', NULL, NULL, 'S', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '1927,966', '-22,48200', '-54,30300', '396', 'S', '0,708', NULL, NULL, '50031', 'S', 'N', '2523', NULL, '5090', '5090', NULL, '1963', 'S', '2253', 'JATEÍ', 'N', '500510', 'N', 'N', 'S', NULL, '47', 'N', 'N', 'N', '46', 'DINÂMICA', '03', 'N', '296', NULL, NULL, NULL, NULL),
('510170', '5105', 'MT', '5105', '5103', '51013', '51', 'BARRA DO BUGRES', NULL, '65', '78390000', '4', '9033', '9033', '10017', NULL, 'ATIVO', 'S', 'S', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'S', NULL, 'N', '7228,902', '-15,07300', '-57,18100', '171', 'S', '0,693', NULL, NULL, '51900', 'S', 'N', '510', NULL, '5190', '5190', NULL, '1943', 'S', '2301', 'BARRA DO BUGRES', 'N', '510170', 'S', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '16', 'ESTAGNADA', '03', 'N', '77', NULL, NULL, NULL, NULL),
('510250', '5102', 'MT', '5102', '5104', '51018', '51', 'CACERES', NULL, '65', '78200000', '4', '9047', '9047', '10024', NULL, 'ATIVO', 'S', 'S', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '24398,399', '-16,07100', '-57,67900', '118', 'S', '0,708', NULL, NULL, '51900', 'N', 'N', '826', NULL, '5190', '5190', NULL, '1859', 'S', '2304', 'CÁCERES', 'N', '510250', 'S', 'N', 'S', NULL, NULL, 'N', 'N', 'S', '20', 'ESTAGNADA', '01', 'N', '202', NULL, NULL, NULL, NULL),
('510360', '5107', 'MT', '5101', '5105', '51021', '51', 'DOM AQUINO', NULL, '66', '78830000', '1', '9071', '9071', '10036', NULL, 'ATIVO', 'S', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '2205,079', '-15,81100', '-54,91800', '283', 'S', '0,69', NULL, NULL, '51900', 'S', 'N', '1569', NULL, '5190', '5190', NULL, '1958', 'S', '2323', 'DOM AQUINO', 'N', '510360', 'S', 'N', 'S', NULL, NULL, 'S', 'N', 'N', '42', 'ESTAGNADA', '03', 'N', '371', NULL, NULL, NULL, NULL),
('510550', '5112', 'MT', '5102', '5103', '51012', '51', 'VILA BELA DA SANTISSIMA TRINDADE', NULL, '65', '78245000', '7', '9109', '9109', '10055', NULL, 'ATIVO', 'S', 'S', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '13630,948', '-15,00800', '-59,95100', '198', 'S', '0,645', NULL, NULL, '51900', 'S', 'N', '5442', NULL, '5190', '5190', NULL, '1746', 'S', '2410', 'VILA BELA DA SANTÍSSIMA TRINDADE', 'N', '510550', 'S', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '140', 'DINÂMICA', '03', 'N', '444', NULL, NULL, NULL, NULL),
('510619', '5115', 'MT', '5103', '5101', '51007', '51', 'NOVA SANTA HELENA', NULL, '66', '78548000', '0', '1088', '1088', '10197', NULL, 'ATIVO', 'S', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'S', 'N', NULL, 'N', '2627,835', '-10,85200', '-55,17700', '0', 'S', '0,714', NULL, NULL, '51900', 'S', 'N', '5702', NULL, '5190', '5190', NULL, '2001', 'S', '5570', 'NOVA SANTA HELENA', 'N', '510619', 'S', 'N', 'S', NULL, '74', 'N', 'N', 'N', '82', 'ALTA RENDA', '03', 'N', '424', NULL, NULL, NULL, NULL),
('510629', '5104', 'MT', '5103', '5101', '51002', '51', 'PARANAITA', NULL, '66', '78590000', '9', '9885', '9885', '10138', NULL, 'ATIVO', 'S', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '4830,143', '-9,66500', '-56,47700', '249', 'S', '0,672', NULL, NULL, '51900', 'S', 'N', '3547', NULL, '5190', '5190', NULL, '1987', 'S', '2365', 'PARANAÍTA', 'N', '510629', 'S', 'N', 'S', NULL, '74', 'N', 'N', 'N', '89', 'DINÂMICA', '03', 'N', '370', NULL, NULL, NULL, NULL),
('510685', '5105', 'MT', '5105', '5103', '51013', '51', 'PORTO ESTRELA', NULL, '65', '78398000', '1', '0101', '0101', '10171', NULL, 'ATIVO', 'S', 'S', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '2065,241', '-15,32400', '-57,22800', '134', 'S', '0,599', NULL, NULL, '51900', 'S', 'N', '3911', NULL, '5190', '5190', NULL, '1993', 'S', '2377', 'PORTO ESTRELA', 'N', '510685', 'S', 'N', 'S', NULL, NULL, 'S', 'N', 'N', '101', 'ESTAGNADA', '03', 'N', '77', NULL, NULL, NULL, NULL),
('510715', '5102', 'MT', '5102', '5103', '51014', '51', 'RESERVA DO CABACAL', NULL, '65', '78265000', '6', '9879', '9879', '10143', NULL, 'ATIVO', 'S', 'S', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '370,82', '-15,08000', '-58,46600', '335', 'S', '0,676', NULL, NULL, '51900', 'S', 'N', '4080', NULL, '5190', '5190', NULL, '1986', 'S', '2381', 'RESERVA DO CABAÇAL', 'N', '510715', 'S', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '105', 'DINÂMICA', '03', 'N', '202', NULL, NULL, NULL, NULL),
('510724', '5114', 'MT', '5103', '5101', '51007', '51', 'SANTA CARMEM', NULL, '66', '78545000', '8', '0123', '0123', '10174', NULL, 'ATIVO', 'S', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '3920,277', '-11,91300', '-55,22600', '386', 'S', '0,715', NULL, NULL, '51900', 'S', 'N', '4304', NULL, '5190', '5190', NULL, '1993', 'S', '2388', 'SANTA CARMEM', 'N', '510724', 'S', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '113', 'ALTA RENDA', '03', 'N', '248', NULL, NULL, NULL, NULL),
('510730', '5113', 'MT', '5105', '5101', '51005', '51', 'SAO JOSE DO RIO CLARO', NULL, '66', '78435000', '5', '9199', '9199', '10107', NULL, 'ATIVO', 'S', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'S', 'N', NULL, 'N', '5057,854', '-13,44700', '-56,72100', '350', 'S', '0,682', NULL, NULL, '51900', 'S', 'N', '4728', NULL, '5190', '5190', NULL, '1979', 'S', '2394', 'SÃO JOSÉ DO RIO CLARO', 'N', '510730', 'S', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '122', 'DINÂMICA', '03', 'N', '201', NULL, NULL, NULL, NULL),
('510840', '5101', 'MT', '5105', '5104', '51017', '51', 'VARZEA GRANDE', NULL, '65', '78110970', '2', '9167', '9167', '10084', NULL, 'ATIVO', 'S', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '938,057', '-15,64700', '-56,13300', '190', 'S', '0,734', NULL, NULL, '51900', 'N', 'N', '5390', NULL, '5101', '5101', NULL, '1948', 'S', '2408', 'VÁRZEA GRANDE', 'N', '510840', 'S', 'N', 'S', NULL, '16', 'S', 'S', 'S', '138', 'ALTA RENDA', '01', 'N', '76', NULL, NULL, NULL, NULL),
('520017', '5204', 'GO', '5207', '5204', '52012', '52', 'AGUA FRIA DE GOIAS', NULL, '62', '73780000', '5', '9771', '9771', '08247', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'S', 'N', 'N', 'S', 'N', 'N', NULL, 'N', '2029,406', '-14,98600', '-47,78400', '980', 'S', '0,671', NULL, NULL, '52900', 'S', 'N', '57', NULL, '5301', '5301', NULL, '1989', 'S', '901', 'ÁGUA FRIA DE GOIÁS', 'S', '520017', 'N', 'N', 'S', NULL, '38', 'N', 'N', 'N', '5', 'ESTAGNADA', '01', 'N', '350', NULL, NULL, NULL, NULL),
('316820', '3115', 'MG', '3105', '3109', '31042', '31', 'TAPIRAI', NULL, '37', '38980000', '0', '5363', '5363', '11682', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '412,442', '-19,88800', '-46,02000', '673', 'S', '0,667', NULL, NULL, '31030', 'N', 'N', '5099', NULL, '3190', '3190', NULL, '1953', 'S', '2157', 'TAPIRAÍ', 'N', '316820', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '802', 'ALTA RENDA', '03', 'N', '622', NULL, NULL, NULL, NULL),
('355220', '3516', 'SP', '3519', '3512', '35046', '35', 'SOROCABA', NULL, '15', '18001970', '5', '7145', '7145', '21523', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'S', 'N', NULL, 'N', '449,122', '-23,50200', '-47,45800', '601', 'S', '0,798', NULL, NULL, '35163', 'N', 'N', '5028', NULL, '3590', '3513', NULL, '1661', 'S', '5325', 'SOROCABA', 'N', '355220', 'N', 'N', 'S', NULL, NULL, 'N', 'S', 'N', '584', 'ALTA RENDA', '01', 'N', '165', NULL, NULL, NULL, NULL),
('231280', '2311', 'CE', '2309', '2301', '23005', '23', 'SENADOR SA', NULL, '88', '62470000', '9', '1557', '1557', '05129', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'S', 'N', 'N', NULL, 'N', '430,58', '-3,35100', '-40,46300', '87', 'S', '0,603', NULL, NULL, '23900', 'S', 'N', '4917', NULL, '2390', '2390', NULL, '1957', 'S', '782', 'SENADOR SÁ', 'N', '231280', 'N', 'S', 'S', NULL, '86', 'N', 'N', 'N', '166', 'ESTAGNADA', '03', 'N', '284', NULL, NULL, NULL, NULL),
('220995', '2207', 'PI', '2207', '2204', '22013', '22', 'SAO JOAO DA VARJOTA', NULL, '89', '64510000', '5', '0386', '0386', '16211', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'S', 'N', 'S', 'N', 'S', 'N', NULL, 'N', '395,368', '-6,94200', '-41,89000', '340', 'S', '0,559', NULL, NULL, '22900', 'S', 'N', '4641', NULL, '2290', '2290', NULL, '1997', 'S', '3152', 'SÃO JOÃO DA VARJOTA', 'N', '220995', 'N', 'S', 'S', NULL, '133', 'S', 'N', 'N', '193', 'ESTAGNADA', '03', 'N', '75', NULL, NULL, NULL, NULL),
('421545', '4216', 'SC', '4210', '4206', '42018', '42', 'SANGAO', NULL, '48', '88717000', '5', '5547', '5547', '20257', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '83,058', '-28,63800', '-49,12900', '50', 'S', '0,7', NULL, NULL, '42900', 'N', 'N', '4288', NULL, '4212', '4290', NULL, '1993', 'S', '4600', 'SANGÃO', 'N', '421545', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '229', 'ALTA RENDA', '03', 'N', '495', NULL, NULL, NULL, NULL),
('421420', '4202', 'SC', '4213', '4201', '42002', '42', 'QUILOMBO', NULL, '49', '89850000', '1', '8279', '8279', '20140', NULL, 'ATIVO', 'N', 'S', NULL, NULL, 'S', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '279,279', '-26,72600', '-52,72100', '425', 'S', '0,73', NULL, NULL, '42900', 'N', 'N', '4029', NULL, '4216', '4290', NULL, '1961', 'S', '4584', 'QUILOMBO', 'N', '421420', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '213', 'ALTA RENDA', '03', 'N', '499', NULL, NULL, NULL, NULL),
('251220', '2505', 'PB', '2502', '2502', '25010', '25', 'PRATA', NULL, '83', '58550000', '0', '2145', '2145', '13123', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'S', 'N', 'N', 'N', NULL, 'N', '192,012', '-7,69100', '-37,08000', '577', 'S', '0,608', NULL, NULL, '25900', 'S', 'N', '3956', NULL, '2590', '2590', NULL, '1955', 'S', '2706', 'PRATA', 'N', '251220', 'N', 'S', 'S', NULL, '27', 'N', 'N', 'N', '152', 'DINÂMICA', '03', 'N', '253', NULL, NULL, NULL, NULL),
('120038', '1201', 'AC', '1201', '1202', '12004', '12', 'PLACIDO DE CASTRO', NULL, '68', '69928000', '5', '0151', '0151', '24018', NULL, 'ATIVO', 'S', 'S', NULL, NULL, 'S', 'N', 'N', 'S', 'N', 'N', NULL, 'N', '2047,455', '-10,33500', '-67,18400', '136', 'S', '0,622', NULL, NULL, '12900', 'S', 'N', '3823', NULL, '1290', '1290', NULL, '1976', 'S', '13', 'PLÁCIDO DE CASTRO', 'N', '120038', 'S', 'N', 'S', NULL, NULL, 'S', 'N', 'N', '13', 'DINÂMICA', '03', 'N', '105', NULL, NULL, NULL, NULL),
('231080', '2310', 'CE', '2306', '2305', '23025', '23', 'PEREIRO', NULL, '88', '63460000', '3', '1517', '1517', '05109', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'S', 'N', 'S', 'S', 'N', 'N', NULL, 'N', '432,881', '-6,04500', '-38,46100', '560', 'S', '0,601', NULL, NULL, '23900', 'S', 'N', '3699', NULL, '2390', '2390', NULL, '1933', 'S', '756', 'PEREIRO', 'N', '231080', 'N', 'S', 'S', NULL, NULL, 'N', 'N', 'N', '140', 'BAIXA RENDA', '03', 'N', '336', NULL, NULL, NULL, NULL),
('270642', '2710', 'AL', '2703', '2701', '27001', '27', 'PARICONHA', NULL, '82', '57475000', '2', '2645', '2645', '02098', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'S', 'S', 'N', 'S', NULL, 'N', '260,858', '-9,25400', '-38,00600', '0', 'S', '0,548', NULL, NULL, '27007', 'S', 'N', '3568', NULL, '2790', '2790', NULL, '1993', 'S', '90', 'PARICONHA', 'N', '270642', 'N', 'S', 'S', NULL, '40', 'S', 'N', 'N', '69', 'DINÂMICA', '03', 'N', '226', NULL, NULL, NULL, NULL),
('353480', '3511', 'SP', '3532', '3508', '35034', '35', 'OURO VERDE', NULL, '18', '17920000', '7', '6797', '6797', '21349', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'S', 'N', 'N', 'N', 'S', 'N', NULL, 'N', '266,452', '-21,48900', '-51,70000', '350', 'S', '0,692', NULL, NULL, '35111', 'N', 'N', '3442', NULL, '3590', '3590', NULL, '1953', 'S', '5135', 'OURO VERDE', 'N', '353480', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '394', 'ESTAGNADA', '03', 'N', '431', NULL, NULL, NULL, NULL),
('171510', '1701', 'TO', '1702', '1702', '17007', '17', 'NOVO ACORDO', NULL, '63', '77610000', '1', '9499', '9499', '28050', NULL, 'ATIVO', 'S', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '2671,882', '-9,96300', '-47,67700', '205', 'S', '0,639', NULL, NULL, '17900', 'S', 'N', '3349', NULL, '1790', '1790', NULL, '1989', 'S', '5472', 'NOVO ACORDO', 'N', '171510', 'S', 'N', 'S', NULL, '107', 'S', 'N', 'N', '85', 'BAIXA RENDA', '03', 'N', '163', NULL, NULL, NULL, NULL),
('411573', '4122', 'PR', '4105', '4108', '41028', '41', 'MATO RICO', NULL, '42', '85240000', '9', '5503', '5503', '14377', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'S', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '394,533', '-24,70500', '-52,14600', '700', 'S', '0,632', NULL, NULL, '41900', 'S', 'N', '2979', NULL, '4190', '4190', NULL, '1993', 'S', '3402', 'MATO RICO', 'N', '411573', 'N', 'N', 'S', NULL, '68', 'N', 'N', 'N', '219', 'ESTAGNADA', '03', 'N', '316', NULL, NULL, NULL, NULL),
('313160', '3112', 'MG', '3113', '3105', '31019', '31', 'IRAI DE MINAS', NULL, '34', '38510000', '4', '4631', '4631', '11316', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '357,575', '-18,98400', '-47,46100', '951', 'S', '0,695', NULL, NULL, '31074', 'N', 'N', '2235', NULL, '3190', '3190', NULL, '1962', 'S', '1715', 'IRAÍ DE MINAS', 'N', '313160', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '360', 'ESTAGNADA', '03', 'N', '649', NULL, NULL, NULL, NULL),
('520980', '5207', 'GO', '5209', '5203', '52006', '52', 'HIDROLINA', NULL, '62', '76375000', '4', '9391', '9391', '08096', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '580,386', '-14,72400', '-49,46500', '603', 'S', '0,677', NULL, NULL, '52900', 'N', 'N', '2038', NULL, '5290', '5290', NULL, '1958', 'S', '1000', 'HIDROLINA', 'N', '520980', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '106', 'ESTAGNADA', '03', 'N', '9', NULL, NULL, NULL, NULL),
('312670', '3106', 'MG', '3108', '3102', '31007', '31', 'FRANCISCO SA', NULL, '38', '39580000', '3', '4533', '4533', '11267', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'S', 'N', 'N', 'N', NULL, 'N', '2749,393', '-16,47600', '-43,48800', '656', 'S', '0,654', NULL, NULL, '31051', 'S', 'N', '1829', NULL, '3190', '3190', NULL, '1923', 'S', '1652', 'FRANCISCO SÁ', 'N', '312670', 'N', 'S', 'S', NULL, NULL, 'S', 'N', 'N', '297', 'ESTAGNADA', '03', 'N', '623', NULL, NULL, NULL, NULL),
('110094', '1104', 'RO', '1102', '1101', '11001', '11', 'CUJUBIM', NULL, '69', '76864000', '0', '0008', '0008', '26044', NULL, 'ATIVO', 'S', 'N', NULL, NULL, 'S', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '3864,071', '-9,36300', '-62,58500', '95', 'S', '0,612', NULL, NULL, '11900', 'S', 'N', '1475', NULL, '1190', '1190', NULL, '1997', 'S', '3857', 'CUJUBIM', 'N', '110094', 'S', 'N', 'S', NULL, '98', 'N', 'N', 'N', '18', 'ALTA RENDA', '03', 'N', '149', NULL, NULL, NULL, NULL),
('320180', '3202', 'ES', '3205', '3204', '32011', '32', 'DIVINO DE SAO LOURENCO', NULL, '28', '29590000', '3', '5635', '5635', '07018', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'S', 'N', 'N', 'S', 'N', 'N', NULL, 'N', '175,792', '-20,62000', '-41,68600', '680', 'S', '0,632', NULL, NULL, '32008', 'S', 'N', '1550', NULL, '3290', '3290', NULL, '1963', 'S', '841', 'DIVINO DE SÃO LOURENÇO', 'N', '320180', 'N', 'N', 'S', NULL, '26', 'N', 'N', 'N', '22', 'ESTAGNADA', '03', 'N', '52', NULL, NULL, NULL, NULL),
('290960', '2903', 'BA', '2914', '2904', '29017', '29', 'CRISOPOLIS', NULL, '75', '48480000', '4', '3491', '3491', '04096', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'S', 'S', 'N', 'N', NULL, 'N', '505,433', '-11,51100', '-38,15000', '149', 'S', '0,543', NULL, NULL, '29051', 'S', 'N', '1432', NULL, '2990', '2990', NULL, '1962', 'S', '314', 'CRISÓPOLIS', 'N', '290960', 'N', 'S', 'S', NULL, NULL, 'N', 'N', 'N', '114', 'ESTAGNADA', '03', 'N', '400', NULL, NULL, NULL, NULL),
('500280', '5005', 'MS', '5008', '5004', '50009', '50', 'CARACOL', NULL, '67', '79270000', '3', '9053', '9053', '06027', NULL, 'ATIVO', 'N', 'S', NULL, NULL, 'S', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '2938,675', '-22,01400', '-57,02400', '212', 'S', '0,647', NULL, NULL, '50014', 'N', 'N', '1073', NULL, '5090', '5090', NULL, '1963', 'S', '2229', 'CARACOL', 'N', '500280', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '21', 'ESTAGNADA', '03', 'N', '441', NULL, NULL, NULL, NULL),
('350950', '3507', 'SP', '3528', '3507', '35032', '35', 'CAMPINAS', NULL, '19', '13001970', '2', '6291', '6291', '21096', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'S', 'N', NULL, 'N', '795,697', '-22,90600', '-47,06100', '854', 'S', '0,805', NULL, NULL, '35072', 'N', 'N', '939', NULL, '3503', '3503', NULL, '1797', 'S', '4850', 'CAMPINAS', 'N', '350950', 'N', 'N', 'S', NULL, NULL, 'N', 'S', 'N', '109', 'ALTA RENDA', '01', 'N', '515', NULL, NULL, NULL, NULL),
('330070', '3302', 'RJ', '3310', '3304', '33010', '33', 'CABO FRIO', NULL, '22', '28901970', '4', '5813', '5813', '17007', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '400,693', '-22,87900', '-42,01900', '4', 'S', '0,735', NULL, NULL, '33900', 'N', 'N', '816', NULL, '3390', '3302', NULL, '1615', 'S', '3594', 'CABO FRIO', 'N', '330070', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '12', 'ALTA RENDA', '01', 'N', '35', NULL, NULL, NULL, NULL),
('311100', '3121', 'MG', '3101', '3110', '31051', '31', 'CAMPESTRE', NULL, '35', '37730000', '2', '4219', '4219', '11110', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '577,152', '-21,71100', '-46,24600', '1076', 'S', '0,698', NULL, NULL, '31001', 'N', 'N', '926', NULL, '3190', '3190', NULL, '1911', 'S', '1475', 'CAMPESTRE', 'N', '311100', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '120', 'ALTA RENDA', '03', 'N', '607', NULL, NULL, NULL, NULL),
('290475', '2922', 'BA', '2912', '2902', '29006', '29', 'BURITIRAMA', NULL, '77', '47120000', '3', '3079', '3079', '04344', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'S', 'S', 'N', 'N', NULL, 'N', '3797,871', '-10,70800', '-43,63100', '492', 'S', '0,565', NULL, NULL, '29072', 'S', 'N', '797', NULL, '2990', '2990', NULL, '1986', 'S', '258', 'BURITIRAMA', 'N', '290475', 'N', 'S', 'S', NULL, NULL, 'N', 'N', 'N', '58', 'DINÂMICA', '03', 'N', '289', NULL, NULL, NULL, NULL),
('130030', '1303', 'AM', '1304', '1303', '13007', '13', 'AUTAZES', NULL, '92', '69240000', '0', '0207', '0207', '03004', NULL, 'ATIVO', 'S', 'N', NULL, NULL, 'N', 'N', 'N', 'S', 'N', 'S', NULL, 'N', '7599,282', '-3,58000', '-59,13100', '36', 'S', '0,577', NULL, NULL, '13031', 'S', 'N', '431', NULL, '1390', '1390', NULL, '1985', 'S', '130', 'AUTAZES', 'N', '130030', 'S', 'N', 'S', NULL, '44', 'N', 'N', 'N', '7', 'DINÂMICA', '03', 'N', '334', NULL, NULL, NULL, NULL),
('290030', '2903', 'BA', '2914', '2904', '29017', '29', 'ACAJUTIBA', NULL, '75', '48360000', '6', '3305', '3305', '04003', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'S', 'N', 'N', NULL, 'N', '267,662', '-11,66200', '-38,01700', '162', 'S', '0,582', NULL, NULL, '29051', 'S', 'N', '18', NULL, '2990', '2990', NULL, '1952', 'S', '204', 'ACAJUTIBA', 'N', '290030', 'N', 'S', 'S', NULL, NULL, 'S', 'N', 'N', '3', 'ESTAGNADA', '03', 'N', '400', NULL, NULL, NULL, NULL),
('350100', '3513', 'SP', '3530', '3502', '35015', '35', 'ALTINOPOLIS', NULL, '16', '14350000', '4', '6119', '6119', '21010', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '929,426', '-21,02600', '-47,37400', '889', 'S', '0,73', NULL, NULL, '35133', 'N', 'N', '137', NULL, '3590', '3590', NULL, '1918', 'S', '4753', 'ALTINÓPOLIS', 'N', '350100', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '12', 'ALTA RENDA', '03', 'N', '166', NULL, NULL, NULL, NULL),
('520145', '5213', 'GO', '5206', '5205', '52013', '52', 'APARECIDA DO RIO DOCE', NULL, '64', '75827000', '4', '0071', '0071', '08303', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'S', 'N', 'N', NULL, 'N', '602,288', '-18,29900', '-51,14500', '0', 'S', '0,693', NULL, NULL, '52900', 'N', 'N', '269', NULL, '5290', '5290', NULL, '1993', 'S', '916', 'APARECIDA DO RIO DOCE', 'N', '520145', 'N', 'N', 'S', NULL, NULL, 'S', 'N', 'N', '20', 'ALTA RENDA', '03', 'N', '120', NULL, NULL, NULL, NULL),
('432345', '4304', 'RS', '4314', '4303', '43018', '43', 'VILA NOVA DO SUL', NULL, '55', '97385000', '7', '5795', '5795', '19427', NULL, 'ATIVO', 'N', 'S', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '523,935', '-30,34400', '-53,88300', '267', 'S', '0,662', NULL, NULL, '43900', 'N', 'N', '5450', NULL, '4390', '4390', NULL, '1993', 'S', '4368', 'VILA NOVA DO SUL', 'N', '432345', 'N', 'N', 'S', NULL, '75', 'N', 'N', 'N', '491', 'ALTA RENDA', '03', 'N', '457', NULL, NULL, NULL, NULL),
('293000', '2930', 'BA', '2911', '2906', '29026', '29', 'SEBASTIAO LARANJEIRAS', NULL, '77', '46450000', '6', '3899', '3899', '04300', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'S', 'S', 'N', 'N', NULL, 'N', '2004,185', '-14,57300', '-42,94000', '533', 'S', '0,615', NULL, NULL, '29082', 'S', 'N', '4894', NULL, '2990', '2990', NULL, '1962', 'S', '568', 'SEBASTIÃO LARANJEIRAS', 'N', '293000', 'N', 'S', 'S', NULL, NULL, 'S', 'N', 'N', '369', 'ESTAGNADA', '03', 'N', '7', NULL, NULL, NULL, NULL),
('150630', '1507', 'PA', '1512', '1502', '15006', '15', 'SALVATERRA', NULL, '91', '68860000', '2', '0525', '0525', '12063', NULL, 'ATIVO', 'S', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '1043,504', '-0,75300', '-48,51700', '5', 'S', '0,608', NULL, NULL, '15900', 'S', 'N', '4281', NULL, '1590', '1590', NULL, '1961', 'S', '2516', 'SALVATERRA', 'N', '150630', 'S', 'N', 'S', NULL, '129', 'S', 'N', 'N', '106', 'BAIXA RENDA', '03', 'N', '508', NULL, NULL, NULL, NULL),
('412040', '4115', 'PR', '4106', '4103', '41006', '41', 'PRESIDENTE CASTELO BRANCO', NULL, '44', '87180000', '8', '7787', '7787', '14194', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'S', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '155,734', '-23,27800', '-52,15200', '570', 'S', '0,713', NULL, NULL, '41900', 'N', 'N', '3964', NULL, '4103', '4190', NULL, '1964', 'S', '3469', 'PRESIDENTE CASTELO BRANCO', 'N', '412040', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '286', 'ESTAGNADA', '03', 'N', '315', NULL, NULL, NULL, NULL),
('431280', '4305', 'RS', '4310', '4302', '43014', '43', 'NOVA ARACA', NULL, '54', '95350000', '7', '8759', '8759', '19129', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '74,36', '-28,65900', '-51,74500', '597', 'S', '0,785', NULL, NULL, '43900', 'N', 'N', '3255', NULL, '4390', '4390', NULL, '1964', 'S', '4161', 'NOVA ARAÇÁ', 'N', '431280', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '272', 'ALTA RENDA', '03', 'N', '481', NULL, NULL, NULL, NULL),
('352910', '3515', 'SP', '3531', '3501', '35001', '35', 'MARINOPOLIS', NULL, '17', '15730000', '4', '6683', '6683', '21292', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'S', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '78,095', '-20,44100', '-50,82300', '408', 'S', '0,731', NULL, NULL, '35153', 'N', 'N', '2931', NULL, '3590', '3590', NULL, '1924', 'S', '5071', 'MARINÓPOLIS', 'N', '352910', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '330', 'ESTAGNADA', '03', 'N', '436', NULL, NULL, NULL, NULL),
('291500', '2918', 'BA', '2917', '2906', '29023', '29', 'ITAETE', NULL, '75', '46790000', '7', '3601', '3601', '04151', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'S', 'S', 'N', 'N', NULL, 'N', '1194,489', '-12,98600', '-40,97300', '321', 'S', '0,572', NULL, NULL, '29012', 'S', 'N', '2276', NULL, '2990', '2990', NULL, '1961', 'S', '379', 'ITAETÉ', 'N', '291500', 'N', 'S', 'S', NULL, '31', 'S', 'N', 'N', '179', 'DINÂMICA', '03', 'N', '55', NULL, NULL, NULL, NULL),
('312750', '3116', 'MG', '3106', '3108', '31035', '31', 'GONZAGA', NULL, '33', '39720000', '3', '4549', '4549', '11275', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'S', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '210,673', '-18,82200', '-42,47900', '795', 'S', '0,606', NULL, NULL, '31036', 'S', 'N', '1915', NULL, '3190', '3190', NULL, '1962', 'S', '1668', 'GONZAGA', 'N', '312750', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '313', 'ESTAGNADA', '03', 'N', '625', NULL, NULL, NULL, NULL),
('420455', '4213', 'SC', '4212', '4203', '42010', '42', 'CORREIA PINTO', NULL, '49', '88535000', '8', '8395', '8395', '20198', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '651,614', '-27,58500', '-50,36100', '847', 'S', '0,702', NULL, NULL, '42900', 'N', 'N', '1399', NULL, '4213', '4290', NULL, '1982', 'S', '4446', 'CORREIA PINTO', 'N', '420455', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '75', 'ALTA RENDA', '03', 'N', '501', NULL, NULL, NULL, NULL),
('520055', '5207', 'GO', '5209', '5202', '52004', '52', 'ALTO HORIZONTE', NULL, '62', '76560000', '5', '0085', '0085', '08295', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'S', 'N', 'N', NULL, 'N', '503,762', '-14,19600', '-49,33900', '375', 'S', '0,719', NULL, NULL, '52900', 'N', 'N', '151', NULL, '5290', '5290', NULL, '1993', 'S', '906', 'ALTO HORIZONTE', 'N', '520055', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '10', 'ESTAGNADA', '03', 'N', '9', NULL, NULL, NULL, NULL),
('520085', '5210', 'GO', '5208', '5203', '52009', '52', 'AMERICANO DO BRASIL', NULL, '64', '76165000', '2', '9661', '9661', '08225', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'S', 'N', 'N', NULL, 'N', '133,562', '-16,25500', '-49,98300', '890', 'S', '0,7', NULL, NULL, '52900', 'N', 'N', '196', NULL, '5290', '5290', NULL, '1980', 'S', '910', 'AMERICANO DO BRASIL', 'N', '520085', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '14', 'ESTAGNADA', '03', 'N', '236', NULL, NULL, NULL, NULL),
('520330', '5202', 'GO', '5210', '5203', '52010', '52', 'BELA VISTA DE GOIAS', NULL, '62', '75240000', '2', '9265', '9265', '08033', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'S', 'N', 'N', NULL, 'N', '1276,617', '-16,97300', '-48,95300', '803', 'S', '0,716', NULL, NULL, '52900', 'N', 'N', '563', NULL, '5201', '5290', NULL, '1896', 'S', '928', 'BELA VISTA DE GOIÁS', 'N', '520330', 'N', 'N', 'S', NULL, NULL, 'S', 'N', 'N', '32', 'ALTA RENDA', '03', 'N', '60', NULL, NULL, NULL, NULL),
('520425', '5215', 'GO', '5210', '5205', '52015', '52', 'CACHOEIRA DOURADA', NULL, '64', '75560000', '0', '9673', '9673', '08237', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '521,13', '-18,49200', '-49,47500', '459', 'S', '0,698', NULL, NULL, '52900', 'N', 'N', '838', NULL, '5290', '5290', NULL, '1982', 'S', '941', 'CACHOEIRA DOURADA', 'N', '520425', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '45', 'ALTA RENDA', '03', 'N', '354', NULL, NULL, NULL, NULL),
('520590', '5216', 'GO', '5210', '5205', '52017', '52', 'CORUMBAIBA', NULL, '64', '75680000', '1', '9319', '9319', '08060', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '1881,712', '-18,14200', '-48,56200', '633', 'S', '0,698', NULL, NULL, '52900', 'N', 'N', '1406', NULL, '5290', '5290', NULL, '1905', 'S', '965', 'CORUMBAÍBA', 'N', '520590', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '70', 'ALTA RENDA', '03', 'N', '351', NULL, NULL, NULL, NULL),
('520630', '5202', 'GO', '5210', '5205', '52016', '52', 'CRISTIANOPOLIS', NULL, '64', '75230000', '5', '9327', '9327', '08064', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '225,357', '-17,19900', '-48,70400', '802', 'S', '0,688', NULL, NULL, '52900', 'N', 'N', '1443', NULL, '5290', '5290', NULL, '1953', 'S', '967', 'CRISTIANÓPOLIS', 'N', '520630', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '72', 'ALTA RENDA', '03', 'N', '60', NULL, NULL, NULL, NULL),
('520650', '5202', 'GO', '5210', '5205', '52015', '52', 'CROMINIA', NULL, '64', '75635000', '3', '9331', '9331', '08066', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '369,917', '-17,28800', '-49,38100', '694', 'S', '0,706', NULL, NULL, '52900', 'N', 'N', '1451', NULL, '5290', '5290', NULL, '1953', 'S', '969', 'CROMÍNIA', 'N', '520650', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '74', 'ALTA RENDA', '03', 'N', '60', NULL, NULL, NULL, NULL),
('520830', '5205', 'GO', '5207', '5204', '52011', '52', 'DIVINOPOLIS DE GOIAS', NULL, '62', '73865000', '1', '9309', '9309', '08055', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'S', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '831,134', '-13,29500', '-46,39300', '620', 'S', '0,653', NULL, NULL, '52900', 'S', 'N', '1554', NULL, '5290', '5290', NULL, '1989', 'S', '975', 'DIVINÓPOLIS DE GOIÁS', 'N', '520830', 'N', 'N', 'S', NULL, '125', 'S', 'N', 'N', '80', 'DINÂMICA', '03', 'N', '183', NULL, NULL, NULL, NULL),
('520880', '5201', 'GO', '5208', '5203', '52010', '52', 'GOIANIRA', NULL, '62', '75370000', '6', '9375', '9375', '08088', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '200,402', '-16,49600', '-49,42600', '757', 'S', '0,694', NULL, NULL, '52900', 'N', 'N', '1905', NULL, '5201', '5201', NULL, '1958', 'S', '990', 'GOIANIRA', 'N', '520880', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '96', 'ALTA RENDA', '03', 'N', '405', NULL, NULL, NULL, NULL),
('521180', '5208', 'GO', '5209', '5203', '52007', '52', 'JARAGUA', NULL, '62', '76330000', '0', '9431', '9431', '08116', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '1888,938', '-15,75700', '-49,33400', '666', 'S', '0,699', NULL, NULL, '52900', 'N', 'N', '2503', NULL, '5290', '5290', NULL, '1833', 'S', '1020', 'JARAGUÁ', 'N', '521180', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '127', 'ALTA RENDA', '03', 'N', '519', NULL, NULL, NULL, NULL),
('521295', '5210', 'GO', '5208', '5201', '52002', '52', 'MATRINCHA', NULL, '62', '76730000', '6', '9927', '9927', '08266', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'S', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '1150,891', '-15,44400', '-50,74600', '315', 'S', '0,679', NULL, NULL, '52900', 'N', 'N', '2985', NULL, '5290', '5290', NULL, '1989', 'S', '1032', 'MATRINCHÃ', 'N', '521295', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '140', 'DINÂMICA', '03', 'N', '236', NULL, NULL, NULL, NULL),
('521305', '5209', 'GO', '5209', '5204', '52012', '52', 'MIMOSO DE GOIAS', NULL, '62', '73730000', '3', '9931', '9931', '08267', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'S', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '1386,91', '-15,05600', '-48,16100', '675', 'S', '0,665', NULL, NULL, '52900', 'S', 'N', '3027', NULL, '5301', '5301', NULL, '1989', 'S', '1034', 'MIMOSO DE GOIÁS', 'S', '521305', 'N', 'N', 'S', NULL, '38', 'N', 'N', 'N', '142', 'ESTAGNADA', '01', 'N', '519', NULL, NULL, NULL, NULL),
('521370', '5211', 'GO', '5208', '5201', '52003', '52', 'MONTES CLAROS DE GOIAS', NULL, '62', '76255000', '7', '9471', '9471', '08136', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '2899,177', '-16,00800', '-51,39700', '472', 'S', '0,707', NULL, NULL, '52900', 'N', 'N', '3128', NULL, '5290', '5290', NULL, '1963', 'S', '1039', 'MONTES CLAROS DE GOIÁS', 'N', '521370', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '147', 'DINÂMICA', '03', 'N', '352', NULL, NULL, NULL, NULL),
('521483', '5210', 'GO', '5208', '5201', '52001', '52', 'NOVA CRIXAS', NULL, '62', '76520000', '8', '9653', '9653', '08228', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '7298,795', '-14,09900', '-50,32700', '282', 'S', '0,643', NULL, NULL, '52900', 'S', 'N', '3273', NULL, '5290', '5290', NULL, '1980', 'S', '1053', 'NOVA CRIXÁS', 'N', '521483', 'N', 'N', 'S', NULL, NULL, 'S', 'N', 'N', '161', 'DINÂMICA', '03', 'N', '236', NULL, NULL, NULL, NULL),
('521920', '5216', 'GO', '5210', '5205', '52016', '52', 'SANTA CRUZ DE GOIAS', NULL, '64', '75220000', '9', '9579', '9579', '08190', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '1108,92', '-17,31600', '-48,48200', '754', 'S', '0,688', NULL, NULL, '52900', 'N', 'N', '4319', NULL, '5290', '5290', NULL, '1947', 'S', '1094', 'SANTA CRUZ DE GOIÁS', 'N', '521920', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '202', 'ALTA RENDA', '03', 'N', '351', NULL, NULL, NULL, NULL),
('521960', '5206', 'GO', '5209', '5202', '52004', '52', 'SANTA TEREZA DE GOIAS', NULL, '62', '76480000', '5', '9587', '9587', '08194', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'S', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '794,553', '-13,71400', '-49,01500', '409', 'S', '0,665', NULL, NULL, '52900', 'N', 'N', '4423', NULL, '5290', '5290', NULL, '1963', 'S', '1101', 'SANTA TEREZA DE GOIÁS', 'N', '521960', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '209', 'ESTAGNADA', '03', 'N', '406', NULL, NULL, NULL, NULL),
('521975', '5203', 'GO', '5207', '5204', '52012', '52', 'SANTO ANTONIO DO DESCOBERTO', NULL, '61', '72900000', '3', '9677', '9677', '08245', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'S', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '938,309', '-15,94000', '-48,25500', '912', 'S', '0,665', NULL, NULL, '52900', 'N', 'N', '4495', NULL, '5301', '5301', NULL, '1982', 'S', '1105', 'SANTO ANTÔNIO DO DESCOBERTO', 'S', '521975', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '213', 'ESTAGNADA', '01', 'N', '118', NULL, NULL, NULL, NULL),
('522028', '5208', 'GO', '5209', '5203', '52006', '52', 'SAO PATRICIO', NULL, '62', '76343000', '0', '1064', '1064', '08321', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'S', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '134,518', '-15,35000', '-49,81800', '560', 'S', '0,693', NULL, NULL, '52900', 'N', 'N', '4794', NULL, '5290', '5290', NULL, '1997', 'S', '1114', 'SÃO PATRÍCIO', 'N', '522028', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '222', 'ESTAGNADA', '03', 'N', '119', NULL, NULL, NULL, NULL);
INSERT INTO `tb_municipio` (`CO_MUNICIPIO_IBGE`, `CO_REGIONAL_SAUDE`, `SG_UF`, `CO_MACRORREGIONAL`, `CO_MESORREGIAO`, `CO_MICRORREGIAO`, `CO_UF_IBGE`, `NO_MUNICIPIO`, `SG_MUNICIPIO`, `NU_DDD`, `NU_CEP`, `DV_MUNICIPIO_IBGE`, `CO_MUNICIPIO_SIAFI`, `CO_MUNICIPIO_SIAPE`, `CO_SINPAS`, `CO_REGIAO_CORREIO`, `ST_MUNICIPIO`, `ST_AMAZONIA`, `ST_FRONTEIRA`, `CO_SUCESSOR`, `NO_ANTERIOR`, `ST_COMUNIDADE_SOLIDARIA`, `ST_SECA`, `ST_SEMI_ARIDO`, `ST_PRMI`, `ST_CALAMIDADE`, `ST_INDIGENA`, `NU_DISTANCIA_CAPITAL`, `ST_CAPITAL`, `NU_AREA`, `NU_LATITUDE`, `NU_LONGITUDE`, `NU_ALTITUDE`, `ST_REGISTRO_ATIVO`, `NU_IDH`, `CO_MUNICIPIO_CORREIO`, `CO_MUNICIPIO_INSS`, `CO_MICRORREGIONAL_SAUDE`, `ST_PITS`, `ST_QUILOMBOLA`, `CO_SEQ_ANTIGO`, `NO_POPULAR`, `CO_REGIAO_METROPOLITANA`, `CO_AGLOMERADO_URBANO`, `NU_ANO_EXTINCAO`, `NU_ANO_INSTALACAO`, `ST_IBGE`, `CO_MUNICIPIO_SVS`, `NO_MUNICIPIO_ACENTUADO`, `ST_RIDE`, `CO_MUNICIPIO_CNES`, `ST_SUDAM`, `ST_SUDENE`, `ST_CADSUS`, `CO_MUNICIPIO_ORIGEM`, `CO_TERRITORIO_CIDADANIA`, `ST_PSE`, `ST_PAN`, `ST_PACTO_RMINAL`, `CO_MUNICIPIO_TABNET_RJ`, `TP_TIPOLOGIA_PNDR`, `CO_GRUPO_PAC2`, `ST_CNES`, `CO_REGIAO_SAUDE`, `ST_PACTO`, `ST_CIB_SAS`, `DT_MANUTENCAO`, `FSDFSD`) VALUES
('522040', '5213', 'GO', '5206', '5205', '52018', '52', 'SAO SIMAO', NULL, '64', '75890000', '5', '9605', '9605', '08203', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '414,055', '-18,99100', '-50,54400', '367', 'S', '0,72', NULL, NULL, '52900', 'N', 'N', '4849', NULL, '5290', '5290', NULL, '1958', 'S', '1115', 'SÃO SIMÃO', 'N', '522040', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '223', 'ALTA RENDA', '03', 'N', '120', NULL, NULL, NULL, NULL),
('522200', '5202', 'GO', '5210', '5205', '52016', '52', 'VIANOPOLIS', NULL, '62', '75260000', '5', '9641', '9641', '08221', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '954,279', '-16,74200', '-48,51600', '1002', 'S', '0,712', NULL, NULL, '52900', 'N', 'N', '5426', NULL, '5290', '5290', NULL, '1948', 'S', '1135', 'VIANÓPOLIS', 'N', '522200', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '243', 'ALTA RENDA', '03', 'N', '60', NULL, NULL, NULL, NULL),
('522230', '5208', 'GO', '5209', '5204', '52012', '52', 'VILA PROPICIO', NULL, '62', '76393000', '2', '1068', '1068', '08323', NULL, 'ATIVO', 'N', 'N', NULL, NULL, 'S', 'N', 'N', 'N', 'N', 'N', NULL, 'N', '2181,575', '-15,45700', '-48,88900', '744', 'S', '0,634', NULL, NULL, '52900', 'S', 'N', '5453', NULL, '5290', '5290', NULL, '1997', 'S', '1138', 'VILA PROPÍCIO', 'N', '522230', 'N', 'N', 'S', NULL, NULL, 'N', 'N', 'N', '246', 'ESTAGNADA', '03', 'N', '519', NULL, NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_menu`
--
ALTER TABLE `tb_menu`
  ADD PRIMARY KEY (`CO_SEQ_MENU`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_menu`
--
ALTER TABLE `tb_menu`
  MODIFY `CO_SEQ_MENU` int(9) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=736;--
-- Database: `sys`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`mysql.sys`@`localhost` PROCEDURE `create_synonym_db`( IN in_db_name VARCHAR(64),  IN in_synonym VARCHAR(64) )
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
    COMMENT '\n Description\n \n Takes a source database name and synonym name, and then creates the \n synonym database with views that point to all of the tables within\n the source database.\n \n Useful for creating a "ps" synonym for "performance_schema",\n or "is" instead of "information_schema", for example.\n \n Parameters\n \n in_db_name (VARCHAR(64)):\n The database name that you would like to create a synonym for.\n in_synonym (VARCHAR(64)):\n The database synonym name.\n \n Example\n \n mysql> SHOW DATABASES;\n +--------------------+\n | Database           |\n +--------------------+\n | information_schema |\n | mysql              |\n | performance_schema |\n | sys                |\n | test               |\n +--------------------+\n 5 rows in set (0.00 sec)\n \n mysql> CALL sys.create_synonym_db(''performance_schema'', ''ps'');\n +---------------------------------------+\n | summary                               |\n +---------------------------------------+\n | Created 74 views in the `ps` database |\n +---------------------------------------+\n 1 row in set (8.57 sec)\n \n Query OK, 0 rows affected (8.57 sec)\n \n mysql> SHOW DATABASES;\n +--------------------+\n | Database           |\n +--------------------+\n | information_schema |\n | mysql              |\n | performance_schema |\n | ps                 |\n | sys                |\n | test               |\n +--------------------+\n 6 rows in set (0.00 sec)\n \n mysql> SHOW FULL TABLES FROM ps;\n +------------------------------------------------------+------------+\n | Tables_in_ps                                         | Table_type |\n +------------------------------------------------------+------------+\n | accounts                                             | VIEW       |\n | cond_instances                                       | VIEW       |\n | events_stages_current                                | VIEW       |\n | events_stages_history                                | VIEW       |\n ...\n '
BEGIN DECLARE v_done bool DEFAULT FALSE; DECLARE v_db_name_check VARCHAR(64); DECLARE v_db_err_msg TEXT; DECLARE v_table VARCHAR(64); DECLARE v_views_created INT DEFAULT 0;  DECLARE db_doesnt_exist CONDITION FOR SQLSTATE '42000'; DECLARE db_name_exists CONDITION FOR SQLSTATE 'HY000';  DECLARE c_table_names CURSOR FOR  SELECT TABLE_NAME  FROM INFORMATION_SCHEMA.TABLES  WHERE TABLE_SCHEMA = in_db_name;  DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_done = TRUE;  SELECT SCHEMA_NAME INTO v_db_name_check FROM INFORMATION_SCHEMA.SCHEMATA WHERE SCHEMA_NAME = in_db_name;  IF v_db_name_check IS NULL THEN SET v_db_err_msg = CONCAT('Unknown database ', in_db_name); SIGNAL SQLSTATE 'HY000' SET MESSAGE_TEXT = v_db_err_msg; END IF;  SELECT SCHEMA_NAME INTO v_db_name_check FROM INFORMATION_SCHEMA.SCHEMATA WHERE SCHEMA_NAME = in_synonym;  IF v_db_name_check = in_synonym THEN SET v_db_err_msg = CONCAT('Can\'t create database ', in_synonym, '; database exists'); SIGNAL SQLSTATE 'HY000' SET MESSAGE_TEXT = v_db_err_msg; END IF;  SET @create_db_stmt := CONCAT('CREATE DATABASE ', sys.quote_identifier(in_synonym)); PREPARE create_db_stmt FROM @create_db_stmt; EXECUTE create_db_stmt; DEALLOCATE PREPARE create_db_stmt;  SET v_done = FALSE; OPEN c_table_names; c_table_names: LOOP FETCH c_table_names INTO v_table; IF v_done THEN LEAVE c_table_names; END IF;  SET @create_view_stmt = CONCAT( 'CREATE SQL SECURITY INVOKER VIEW ', sys.quote_identifier(in_synonym), '.', sys.quote_identifier(v_table), ' AS SELECT * FROM ', sys.quote_identifier(in_db_name), '.', sys.quote_identifier(v_table) ); PREPARE create_view_stmt FROM @create_view_stmt; EXECUTE create_view_stmt; DEALLOCATE PREPARE create_view_stmt;  SET v_views_created = v_views_created + 1; END LOOP; CLOSE c_table_names;  SELECT CONCAT( 'Created ', v_views_created, ' view', IF(v_views_created != 1, 's', ''), ' in the ', sys.quote_identifier(in_synonym), ' database' ) AS summary;  END$$

CREATE DEFINER=`mysql.sys`@`localhost` PROCEDURE `diagnostics`( IN in_max_runtime int unsigned, IN in_interval int unsigned, IN in_auto_config enum ('current', 'medium', 'full') )
    READS SQL DATA
    SQL SECURITY INVOKER
    COMMENT '\n Description\n \n Create a report of the current status of the server for diagnostics purposes. Data collected includes (some items depends on versions and settings):\n \n * The GLOBAL VARIABLES\n * Several sys schema views including metrics or equivalent (depending on version and settings)\n * Queries in the 95th percentile\n * Several ndbinfo views for MySQL Cluster\n * Replication (both master and slave) information.\n \n Some of the sys schema views are calculated as initial (optional), overall, delta:\n \n * The initial view is the content of the view at the start of this procedure.\n This output will be the same as the the start values used for the delta view.\n The initial view is included if @sys.diagnostics.include_raw = ''ON''.\n * The overall view is the content of the view at the end of this procedure.\n This output is the same as the end values used for the delta view.\n The overall view is always included.\n * The delta view is the difference from the beginning to the end. Note that for min and max values\n they are simply the min or max value from the end view respectively, so does not necessarily reflect\n the minimum/maximum value in the monitored period.\n Note: except for the metrics views the delta is only calculation between the first and last outputs.\n \n Requires the SUPER privilege for "SET sql_log_bin = 0;".\n \n Versions supported:\n * MySQL 5.6: 5.6.10 and later\n * MySQL 5.7: 5.7.9 and later\n \n Parameters\n \n in_max_runtime (INT UNSIGNED):\n The maximum time to keep collecting data.\n Use NULL to get the default which is 60 seconds, otherwise enter a value greater than 0.\n in_interval (INT UNSIGNED):\n How long to sleep between data collections.\n Use NULL to get the default which is 30 seconds, otherwise enter a value greater than 0.\n in_auto_config (ENUM(''current'', ''medium'', ''full''))\n Automatically enable Performance Schema instruments and consumers.\n NOTE: The more that are enabled, the more impact on the performance.\n Supported values are:\n * current - use the current settings.\n * medium - enable some settings.\n * full - enables all settings. This will have a big impact on the\n performance - be careful using this option.\n If another setting the ''current'' is chosen, the current settings\n are restored at the end of the procedure.\n \n \n Configuration Options\n \n sys.diagnostics.allow_i_s_tables\n Specifies whether it is allowed to do table scan queries on information_schema.TABLES. This can be expensive if there\n are many tables. Set to ''ON'' to allow, ''OFF'' to not allow.\n Default is ''OFF''.\n \n sys.diagnostics.include_raw\n Set to ''ON'' to include the raw data (e.g. the original output of "SELECT * FROM sys.metrics").\n Use this to get the initial values of the various views.\n Default is ''OFF''.\n \n sys.statement_truncate_len\n How much of queries in the process list output to include.\n Default is 64.\n \n sys.debug\n Whether to provide debugging output.\n Default is ''OFF''. Set to ''ON'' to include.\n \n \n Example\n \n To create a report and append it to the file diag.out:\n \n mysql> TEE diag.out;\n mysql> CALL sys.diagnostics(120, 30, ''current'');\n ...\n mysql> NOTEE;\n '
BEGIN DECLARE v_start, v_runtime, v_iter_start, v_sleep DECIMAL(20,2) DEFAULT 0.0; DECLARE v_has_innodb, v_has_ndb, v_has_ps, v_has_replication, v_has_ps_replication VARCHAR(8) CHARSET utf8 DEFAULT 'NO'; DECLARE v_this_thread_enabled, v_has_ps_vars, v_has_metrics ENUM('YES', 'NO'); DECLARE v_table_name, v_banner VARCHAR(64) CHARSET utf8; DECLARE v_sql_status_summary_select, v_sql_status_summary_delta, v_sql_status_summary_from, v_no_delta_names TEXT; DECLARE v_output_time, v_output_time_prev DECIMAL(20,3) UNSIGNED; DECLARE v_output_count, v_count, v_old_group_concat_max_len INT UNSIGNED DEFAULT 0; DECLARE v_status_summary_width TINYINT UNSIGNED DEFAULT 50; DECLARE v_done BOOLEAN DEFAULT FALSE; DECLARE c_ndbinfo CURSOR FOR SELECT TABLE_NAME FROM information_schema.TABLES WHERE TABLE_SCHEMA = 'ndbinfo' AND TABLE_NAME NOT IN ( 'blocks', 'config_params', 'dict_obj_types', 'disk_write_speed_base', 'memory_per_fragment', 'memoryusage', 'operations_per_fragment', 'threadblocks' ); DECLARE c_sysviews_w_delta CURSOR FOR SELECT table_name FROM tmp_sys_views_delta ORDER BY table_name; DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_done = TRUE;  SELECT INSTRUMENTED INTO v_this_thread_enabled FROM performance_schema.threads WHERE PROCESSLIST_ID = CONNECTION_ID(); IF (v_this_thread_enabled = 'YES') THEN CALL sys.ps_setup_disable_thread(CONNECTION_ID()); END IF;  IF (in_max_runtime < in_interval) THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'in_max_runtime must be greater than or equal to in_interval'; END IF; IF (in_max_runtime = 0) THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'in_max_runtime must be greater than 0'; END IF; IF (in_interval = 0) THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'in_interval must be greater than 0'; END IF;  IF (@sys.diagnostics.allow_i_s_tables IS NULL) THEN SET @sys.diagnostics.allow_i_s_tables = sys.sys_get_config('diagnostics.allow_i_s_tables', 'OFF'); END IF; IF (@sys.diagnostics.include_raw IS NULL) THEN SET @sys.diagnostics.include_raw      = sys.sys_get_config('diagnostics.include_raw'     , 'OFF'); END IF; IF (@sys.debug IS NULL) THEN SET @sys.debug                        = sys.sys_get_config('debug'                       , 'OFF'); END IF; IF (@sys.statement_truncate_len IS NULL) THEN SET @sys.statement_truncate_len       = sys.sys_get_config('statement_truncate_len'      , '64' ); END IF;  SET @log_bin := @@sql_log_bin; IF (@log_bin = 1) THEN SET sql_log_bin = 0; END IF;  SET v_no_delta_names = CONCAT('s%{COUNT}.Variable_name NOT IN (', '''innodb_buffer_pool_pages_total'', ', '''innodb_page_size'', ', '''last_query_cost'', ', '''last_query_partial_plans'', ', '''qcache_total_blocks'', ', '''slave_last_heartbeat'', ', '''ssl_ctx_verify_depth'', ', '''ssl_ctx_verify_mode'', ', '''ssl_session_cache_size'', ', '''ssl_verify_depth'', ', '''ssl_verify_mode'', ', '''ssl_version'', ', '''buffer_flush_lsn_avg_rate'', ', '''buffer_flush_pct_for_dirty'', ', '''buffer_flush_pct_for_lsn'', ', '''buffer_pool_pages_total'', ', '''lock_row_lock_time_avg'', ', '''lock_row_lock_time_max'', ', '''innodb_page_size''', ')');  IF (in_auto_config <> 'current') THEN IF (@sys.debug = 'ON') THEN SELECT CONCAT('Updating Performance Schema configuration to ', in_auto_config) AS 'Debug'; END IF; CALL sys.ps_setup_save(0);  IF (in_auto_config = 'medium') THEN UPDATE performance_schema.setup_consumers SET ENABLED = 'YES' WHERE NAME NOT LIKE '%\_history%';  UPDATE performance_schema.setup_instruments SET ENABLED = 'YES', TIMED   = 'YES' WHERE NAME NOT LIKE 'wait/synch/%'; ELSEIF (in_auto_config = 'full') THEN UPDATE performance_schema.setup_consumers SET ENABLED = 'YES';  UPDATE performance_schema.setup_instruments SET ENABLED = 'YES', TIMED   = 'YES'; END IF;  UPDATE performance_schema.threads SET INSTRUMENTED = 'YES' WHERE PROCESSLIST_ID <> CONNECTION_ID(); END IF;  SET v_start        = UNIX_TIMESTAMP(NOW(2)), in_interval    = IFNULL(in_interval, 30), in_max_runtime = IFNULL(in_max_runtime, 60);  SET v_banner = REPEAT( '-', LEAST( GREATEST( 36, CHAR_LENGTH(VERSION()), CHAR_LENGTH(@@global.version_comment), CHAR_LENGTH(@@global.version_compile_os), CHAR_LENGTH(@@global.version_compile_machine), CHAR_LENGTH(@@global.socket), CHAR_LENGTH(@@global.datadir) ), 64 ) ); SELECT 'Hostname' AS 'Name', @@global.hostname AS 'Value' UNION ALL SELECT 'Port' AS 'Name', @@global.port AS 'Value' UNION ALL SELECT 'Socket' AS 'Name', @@global.socket AS 'Value' UNION ALL SELECT 'Datadir' AS 'Name', @@global.datadir AS 'Value' UNION ALL SELECT 'Server UUID' AS 'Name', @@global.server_uuid AS 'Value' UNION ALL SELECT REPEAT('-', 23) AS 'Name', v_banner AS 'Value' UNION ALL SELECT 'MySQL Version' AS 'Name', VERSION() AS 'Value' UNION ALL SELECT 'Sys Schema Version' AS 'Name', (SELECT sys_version FROM sys.version) AS 'Value' UNION ALL SELECT 'Version Comment' AS 'Name', @@global.version_comment AS 'Value' UNION ALL SELECT 'Version Compile OS' AS 'Name', @@global.version_compile_os AS 'Value' UNION ALL SELECT 'Version Compile Machine' AS 'Name', @@global.version_compile_machine AS 'Value' UNION ALL SELECT REPEAT('-', 23) AS 'Name', v_banner AS 'Value' UNION ALL SELECT 'UTC Time' AS 'Name', UTC_TIMESTAMP() AS 'Value' UNION ALL SELECT 'Local Time' AS 'Name', NOW() AS 'Value' UNION ALL SELECT 'Time Zone' AS 'Name', @@global.time_zone AS 'Value' UNION ALL SELECT 'System Time Zone' AS 'Name', @@global.system_time_zone AS 'Value' UNION ALL SELECT 'Time Zone Offset' AS 'Name', TIMEDIFF(NOW(), UTC_TIMESTAMP()) AS 'Value';  SET v_has_innodb         = IFNULL((SELECT SUPPORT FROM information_schema.ENGINES WHERE ENGINE = 'InnoDB'), 'NO'), v_has_ndb            = IFNULL((SELECT SUPPORT FROM information_schema.ENGINES WHERE ENGINE = 'NDBCluster'), 'NO'), v_has_ps             = IFNULL((SELECT SUPPORT FROM information_schema.ENGINES WHERE ENGINE = 'PERFORMANCE_SCHEMA'), 'NO'), v_has_ps_replication = IF(v_has_ps = 'YES' AND EXISTS(SELECT 1 FROM information_schema.TABLES WHERE TABLE_SCHEMA = 'performance_schema' AND TABLE_NAME = 'replication_applier_status'), 'YES', 'NO' ), v_has_replication    =  IF(v_has_ps_replication = 'YES', IF((SELECT COUNT(*) FROM performance_schema.replication_connection_status) > 0, 'YES', 'NO'), IF(@@master_info_repository = 'TABLE', IF((SELECT COUNT(*) FROM mysql.slave_master_info) > 0, 'YES', 'NO'), IF(@@relay_log_info_repository = 'TABLE', IF((SELECT COUNT(*) FROM mysql.slave_relay_log_info) > 0, 'YES', 'NO'), 'MAYBE')) ) , v_has_metrics        = IF(v_has_ps = 'YES' OR (sys.version_major() = 5 AND sys.version_minor() = 6), 'YES', 'NO'), v_has_ps_vars        = 'NO';   SET v_has_ps_vars = IF(@@global.show_compatibility_56, 'NO', 'YES');  SET v_has_ps_vars = 'YES';  IF (@sys.debug = 'ON') THEN SELECT v_has_innodb AS 'Has_InnoDB', v_has_ndb AS 'Has_NDBCluster', v_has_ps AS 'Has_Performance_Schema', v_has_ps_vars AS 'Has_P_S_SHOW_Variables', v_has_metrics AS 'Has_metrics', v_has_ps_replication 'AS Has_P_S_Replication', v_has_replication AS 'Has_Replication'; END IF;  IF (v_has_innodb IN ('DEFAULT', 'YES')) THEN SET @sys.diagnostics.sql = 'SHOW ENGINE InnoDB STATUS'; PREPARE stmt_innodb_status FROM @sys.diagnostics.sql; END IF;  IF (v_has_ps = 'YES') THEN SET @sys.diagnostics.sql = 'SHOW ENGINE PERFORMANCE_SCHEMA STATUS'; PREPARE stmt_ps_status FROM @sys.diagnostics.sql; END IF;  IF (v_has_ndb IN ('DEFAULT', 'YES')) THEN SET @sys.diagnostics.sql = 'SHOW ENGINE NDBCLUSTER STATUS'; PREPARE stmt_ndbcluster_status FROM @sys.diagnostics.sql; END IF;  SET @sys.diagnostics.sql_gen_query_template = 'SELECT CONCAT( ''SELECT '', GROUP_CONCAT( CASE WHEN (SUBSTRING(TABLE_NAME, 3), COLUMN_NAME) IN ( (''io_global_by_file_by_bytes'', ''total''), (''io_global_by_wait_by_bytes'', ''total_requested'') ) THEN CONCAT(''sys.format_bytes('', COLUMN_NAME, '') AS '', COLUMN_NAME) WHEN COLUMN_NAME LIKE ''%latency'' THEN CONCAT(''sys.format_time('', COLUMN_NAME, '') AS '', COLUMN_NAME) WHEN SUBSTRING(COLUMN_NAME, -7) = ''_memory'' OR SUBSTRING(COLUMN_NAME, -17) = ''_memory_allocated'' OR ((SUBSTRING(COLUMN_NAME, -5) = ''_read'' OR SUBSTRING(COLUMN_NAME, -8) = ''_written'' OR SUBSTRING(COLUMN_NAME, -6) = ''_write'') AND SUBSTRING(COLUMN_NAME, 1, 6) <> ''COUNT_'') THEN CONCAT(''sys.format_bytes('', COLUMN_NAME, '') AS '', COLUMN_NAME) ELSE COLUMN_NAME END ORDER BY ORDINAL_POSITION SEPARATOR '',\n       '' ), ''\n  FROM tmp_'', SUBSTRING(TABLE_NAME FROM 3), ''_%{OUTPUT}'' ) AS Query INTO @sys.diagnostics.sql_select FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = ''sys'' AND TABLE_NAME = ? GROUP BY TABLE_NAME';  SET @sys.diagnostics.sql_gen_query_delta = 'SELECT CONCAT( ''SELECT '', GROUP_CONCAT( CASE WHEN FIND_IN_SET(COLUMN_NAME, diag.pk) THEN COLUMN_NAME WHEN diag.TABLE_NAME = ''io_global_by_file_by_bytes'' AND COLUMN_NAME = ''write_pct'' THEN CONCAT(''IFNULL(ROUND(100-(((e.total_read-IFNULL(s.total_read, 0))'', ''/NULLIF(((e.total_read-IFNULL(s.total_read, 0))+(e.total_written-IFNULL(s.total_written, 0))), 0))*100), 2), 0.00) AS '', COLUMN_NAME) WHEN (diag.TABLE_NAME, COLUMN_NAME) IN ( (''io_global_by_file_by_bytes'', ''total''), (''io_global_by_wait_by_bytes'', ''total_requested'') ) THEN CONCAT(''sys.format_bytes(e.'', COLUMN_NAME, ''-IFNULL(s.'', COLUMN_NAME, '', 0)) AS '', COLUMN_NAME) WHEN SUBSTRING(COLUMN_NAME, 1, 4) IN (''max_'', ''min_'') AND SUBSTRING(COLUMN_NAME, -8) = ''_latency'' THEN CONCAT(''sys.format_time(e.'', COLUMN_NAME, '') AS '', COLUMN_NAME) WHEN COLUMN_NAME = ''avg_latency'' THEN CONCAT(''sys.format_time((e.total_latency - IFNULL(s.total_latency, 0))'', ''/NULLIF(e.total - IFNULL(s.total, 0), 0)) AS '', COLUMN_NAME) WHEN SUBSTRING(COLUMN_NAME, -12) = ''_avg_latency'' THEN CONCAT(''sys.format_time((e.'', SUBSTRING(COLUMN_NAME FROM 1 FOR CHAR_LENGTH(COLUMN_NAME)-12), ''_latency - IFNULL(s.'', SUBSTRING(COLUMN_NAME FROM 1 FOR CHAR_LENGTH(COLUMN_NAME)-12), ''_latency, 0))'', ''/NULLIF(e.'', SUBSTRING(COLUMN_NAME FROM 1 FOR CHAR_LENGTH(COLUMN_NAME)-12), ''s - IFNULL(s.'', SUBSTRING(COLUMN_NAME FROM 1 FOR CHAR_LENGTH(COLUMN_NAME)-12), ''s, 0), 0)) AS '', COLUMN_NAME) WHEN COLUMN_NAME LIKE ''%latency'' THEN CONCAT(''sys.format_time(e.'', COLUMN_NAME, '' - IFNULL(s.'', COLUMN_NAME, '', 0)) AS '', COLUMN_NAME) WHEN COLUMN_NAME IN (''avg_read'', ''avg_write'', ''avg_written'') THEN CONCAT(''sys.format_bytes(IFNULL((e.total_'', IF(COLUMN_NAME = ''avg_read'', ''read'', ''written''), ''-IFNULL(s.total_'', IF(COLUMN_NAME = ''avg_read'', ''read'', ''written''), '', 0))'', ''/NULLIF(e.count_'', IF(COLUMN_NAME = ''avg_read'', ''read'', ''write''), ''-IFNULL(s.count_'', IF(COLUMN_NAME = ''avg_read'', ''read'', ''write''), '', 0), 0), 0)) AS '', COLUMN_NAME) WHEN SUBSTRING(COLUMN_NAME, -7) = ''_memory'' OR SUBSTRING(COLUMN_NAME, -17) = ''_memory_allocated'' OR ((SUBSTRING(COLUMN_NAME, -5) = ''_read'' OR SUBSTRING(COLUMN_NAME, -8) = ''_written'' OR SUBSTRING(COLUMN_NAME, -6) = ''_write'') AND SUBSTRING(COLUMN_NAME, 1, 6) <> ''COUNT_'') THEN CONCAT(''sys.format_bytes(e.'', COLUMN_NAME, '' - IFNULL(s.'', COLUMN_NAME, '', 0)) AS '', COLUMN_NAME) ELSE CONCAT(''(e.'', COLUMN_NAME, '' - IFNULL(s.'', COLUMN_NAME, '', 0)) AS '', COLUMN_NAME) END ORDER BY ORDINAL_POSITION SEPARATOR '',\n       '' ), ''\n  FROM tmp_'', diag.TABLE_NAME, ''_end e LEFT OUTER JOIN tmp_'', diag.TABLE_NAME, ''_start s USING ('', diag.pk, '')'' ) AS Query INTO @sys.diagnostics.sql_select FROM tmp_sys_views_delta diag INNER JOIN information_schema.COLUMNS c ON c.TABLE_NAME = CONCAT(''x$'', diag.TABLE_NAME) WHERE c.TABLE_SCHEMA = ''sys'' AND diag.TABLE_NAME = ? GROUP BY diag.TABLE_NAME';  IF (v_has_ps = 'YES') THEN DROP TEMPORARY TABLE IF EXISTS tmp_sys_views_delta; CREATE TEMPORARY TABLE tmp_sys_views_delta ( TABLE_NAME varchar(64) NOT NULL, order_by text COMMENT 'ORDER BY clause for the initial and overall views', order_by_delta text COMMENT 'ORDER BY clause for the delta views', where_delta text COMMENT 'WHERE clause to use for delta views to only include rows with a "count" > 0', limit_rows int unsigned COMMENT 'The maximum number of rows to include for the view', pk varchar(128) COMMENT 'Used with the FIND_IN_SET() function so use comma separated list without whitespace', PRIMARY KEY (TABLE_NAME) );  IF (@sys.debug = 'ON') THEN SELECT 'Populating tmp_sys_views_delta' AS 'Debug'; END IF; INSERT INTO tmp_sys_views_delta VALUES ('host_summary'                       , '%{TABLE}.statement_latency DESC', '(e.statement_latency-IFNULL(s.statement_latency, 0)) DESC', '(e.statements - IFNULL(s.statements, 0)) > 0', NULL, 'host'), ('host_summary_by_file_io'            , '%{TABLE}.io_latency DESC', '(e.io_latency-IFNULL(s.io_latency, 0)) DESC', '(e.ios - IFNULL(s.ios, 0)) > 0', NULL, 'host'), ('host_summary_by_file_io_type'       , '%{TABLE}.host, %{TABLE}.total_latency DESC', 'e.host, (e.total_latency-IFNULL(s.total_latency, 0)) DESC', '(e.total - IFNULL(s.total, 0)) > 0', NULL, 'host,event_name'), ('host_summary_by_stages'             , '%{TABLE}.host, %{TABLE}.total_latency DESC', 'e.host, (e.total_latency-IFNULL(s.total_latency, 0)) DESC', '(e.total - IFNULL(s.total, 0)) > 0', NULL, 'host,event_name'), ('host_summary_by_statement_latency'  , '%{TABLE}.total_latency DESC', '(e.total_latency-IFNULL(s.total_latency, 0)) DESC', '(e.total - IFNULL(s.total, 0)) > 0', NULL, 'host'), ('host_summary_by_statement_type'     , '%{TABLE}.host, %{TABLE}.total_latency DESC', 'e.host, (e.total_latency-IFNULL(s.total_latency, 0)) DESC', '(e.total - IFNULL(s.total, 0)) > 0', NULL, 'host,statement'), ('io_by_thread_by_latency'            , '%{TABLE}.total_latency DESC', '(e.total_latency-IFNULL(s.total_latency, 0)) DESC', '(e.total - IFNULL(s.total, 0)) > 0', NULL, 'user,thread_id,processlist_id'), ('io_global_by_file_by_bytes'         , '%{TABLE}.total DESC', '(e.total-IFNULL(s.total, 0)) DESC', '(e.total - IFNULL(s.total, 0)) > 0', 100, 'file'), ('io_global_by_file_by_latency'       , '%{TABLE}.total_latency DESC', '(e.total_latency-IFNULL(s.total_latency, 0)) DESC', '(e.total - IFNULL(s.total, 0)) > 0', 100, 'file'), ('io_global_by_wait_by_bytes'         , '%{TABLE}.total_requested DESC', '(e.total_requested-IFNULL(s.total_requested, 0)) DESC', '(e.total - IFNULL(s.total, 0)) > 0', NULL, 'event_name'), ('io_global_by_wait_by_latency'       , '%{TABLE}.total_latency DESC', '(e.total_latency-IFNULL(s.total_latency, 0)) DESC', '(e.total - IFNULL(s.total, 0)) > 0', NULL, 'event_name'), ('schema_index_statistics'            , '(%{TABLE}.select_latency+%{TABLE}.insert_latency+%{TABLE}.update_latency+%{TABLE}.delete_latency) DESC', '((e.select_latency+e.insert_latency+e.update_latency+e.delete_latency)-IFNULL(s.select_latency+s.insert_latency+s.update_latency+s.delete_latency, 0)) DESC', '((e.rows_selected+e.insert_latency+e.rows_updated+e.rows_deleted)-IFNULL(s.rows_selected+s.rows_inserted+s.rows_updated+s.rows_deleted, 0)) > 0', 100, 'table_schema,table_name,index_name'), ('schema_table_statistics'            , '%{TABLE}.total_latency DESC', '(e.total_latency-IFNULL(s.total_latency, 0)) DESC', '(e.total_latency-IFNULL(s.total_latency, 0)) > 0', 100, 'table_schema,table_name'), ('schema_tables_with_full_table_scans', '%{TABLE}.rows_full_scanned DESC', '(e.rows_full_scanned-IFNULL(s.rows_full_scanned, 0)) DESC', '(e.rows_full_scanned-IFNULL(s.rows_full_scanned, 0)) > 0', 100, 'object_schema,object_name'), ('user_summary'                       , '%{TABLE}.statement_latency DESC', '(e.statement_latency-IFNULL(s.statement_latency, 0)) DESC', '(e.statements - IFNULL(s.statements, 0)) > 0', NULL, 'user'), ('user_summary_by_file_io'            , '%{TABLE}.io_latency DESC', '(e.io_latency-IFNULL(s.io_latency, 0)) DESC', '(e.ios - IFNULL(s.ios, 0)) > 0', NULL, 'user'), ('user_summary_by_file_io_type'       , '%{TABLE}.user, %{TABLE}.latency DESC', 'e.user, (e.latency-IFNULL(s.latency, 0)) DESC', '(e.total - IFNULL(s.total, 0)) > 0', NULL, 'user,event_name'), ('user_summary_by_stages'             , '%{TABLE}.user, %{TABLE}.total_latency DESC', 'e.user, (e.total_latency-IFNULL(s.total_latency, 0)) DESC', '(e.total - IFNULL(s.total, 0)) > 0', NULL, 'user,event_name'), ('user_summary_by_statement_latency'  , '%{TABLE}.total_latency DESC', '(e.total_latency-IFNULL(s.total_latency, 0)) DESC', '(e.total - IFNULL(s.total, 0)) > 0', NULL, 'user'), ('user_summary_by_statement_type'     , '%{TABLE}.user, %{TABLE}.total_latency DESC', 'e.user, (e.total_latency-IFNULL(s.total_latency, 0)) DESC', '(e.total - IFNULL(s.total, 0)) > 0', NULL, 'user,statement'), ('wait_classes_global_by_avg_latency' , 'IFNULL(%{TABLE}.total_latency / NULLIF(%{TABLE}.total, 0), 0) DESC', 'IFNULL((e.total_latency-IFNULL(s.total_latency, 0)) / NULLIF((e.total - IFNULL(s.total, 0)), 0), 0) DESC', '(e.total - IFNULL(s.total, 0)) > 0', NULL, 'event_class'), ('wait_classes_global_by_latency'     , '%{TABLE}.total_latency DESC', '(e.total_latency-IFNULL(s.total_latency, 0)) DESC', '(e.total - IFNULL(s.total, 0)) > 0', NULL, 'event_class'), ('waits_by_host_by_latency'           , '%{TABLE}.host, %{TABLE}.total_latency DESC', 'e.host, (e.total_latency-IFNULL(s.total_latency, 0)) DESC', '(e.total - IFNULL(s.total, 0)) > 0', NULL, 'host,event'), ('waits_by_user_by_latency'           , '%{TABLE}.user, %{TABLE}.total_latency DESC', 'e.user, (e.total_latency-IFNULL(s.total_latency, 0)) DESC', '(e.total - IFNULL(s.total, 0)) > 0', NULL, 'user,event'), ('waits_global_by_latency'            , '%{TABLE}.total_latency DESC', '(e.total_latency-IFNULL(s.total_latency, 0)) DESC', '(e.total - IFNULL(s.total, 0)) > 0', NULL, 'events') ; END IF;   SELECT '  =======================  Configuration  =======================  ' AS ''; SELECT 'GLOBAL VARIABLES' AS 'The following output is:'; IF (v_has_ps_vars = 'YES') THEN SELECT LOWER(VARIABLE_NAME) AS Variable_name, VARIABLE_VALUE AS Variable_value FROM performance_schema.global_variables ORDER BY VARIABLE_NAME; ELSE SELECT LOWER(VARIABLE_NAME) AS Variable_name, VARIABLE_VALUE AS Variable_value FROM information_schema.GLOBAL_VARIABLES ORDER BY VARIABLE_NAME; END IF;  IF (v_has_ps = 'YES') THEN SELECT 'Performance Schema Setup - Actors' AS 'The following output is:'; SELECT * FROM performance_schema.setup_actors;  SELECT 'Performance Schema Setup - Consumers' AS 'The following output is:'; SELECT NAME AS Consumer, ENABLED, sys.ps_is_consumer_enabled(NAME) AS COLLECTS FROM performance_schema.setup_consumers;  SELECT 'Performance Schema Setup - Instruments' AS 'The following output is:'; SELECT SUBSTRING_INDEX(NAME, '/', 2) AS 'InstrumentClass', ROUND(100*SUM(IF(ENABLED = 'YES', 1, 0))/COUNT(*), 2) AS 'EnabledPct', ROUND(100*SUM(IF(TIMED = 'YES', 1, 0))/COUNT(*), 2) AS 'TimedPct' FROM performance_schema.setup_instruments GROUP BY SUBSTRING_INDEX(NAME, '/', 2) ORDER BY SUBSTRING_INDEX(NAME, '/', 2);  SELECT 'Performance Schema Setup - Objects' AS 'The following output is:'; SELECT * FROM performance_schema.setup_objects;  SELECT 'Performance Schema Setup - Threads' AS 'The following output is:'; SELECT `TYPE` AS ThreadType, COUNT(*) AS 'Total', ROUND(100*SUM(IF(INSTRUMENTED = 'YES', 1, 0))/COUNT(*), 2) AS 'InstrumentedPct' FROM performance_schema.threads GROUP BY TYPE; END IF;   IF (v_has_replication = 'NO') THEN SELECT 'No Replication Configured' AS 'Replication Status'; ELSE SELECT CONCAT('Replication Configured: ', v_has_replication, ' - Performance Schema Replication Tables: ', v_has_ps_replication) AS 'Replication Status';  IF (v_has_ps_replication = 'YES') THEN SELECT 'Replication - Connection Configuration' AS 'The following output is:'; SELECT * FROM performance_schema.replication_connection_configuration ORDER BY CHANNEL_NAME ; END IF;  IF (v_has_ps_replication = 'YES') THEN SELECT 'Replication - Applier Configuration' AS 'The following output is:'; SELECT * FROM performance_schema.replication_applier_configuration ORDER BY CHANNEL_NAME; END IF;  IF (@@master_info_repository = 'TABLE') THEN SELECT 'Replication - Master Info Repository Configuration' AS 'The following output is:'; SELECT  Channel_name, Host, User_name, Port, Connect_retry, Enabled_ssl, Ssl_ca, Ssl_capath, Ssl_cert, Ssl_cipher, Ssl_key, Ssl_verify_server_cert, Heartbeat, Bind, Ignored_server_ids, Uuid, Retry_count, Ssl_crl, Ssl_crlpath, Tls_version, Enabled_auto_position FROM mysql.slave_master_info ORDER BY Channel_name ; END IF;  IF (@@relay_log_info_repository = 'TABLE') THEN SELECT 'Replication - Relay Log Repository Configuration' AS 'The following output is:'; SELECT  Channel_name, Sql_delay, Number_of_workers, Id FROM mysql.slave_relay_log_info ORDER BY Channel_name ; END IF; END IF;   IF (v_has_ndb IN ('DEFAULT', 'YES')) THEN SELECT 'Cluster Thread Blocks' AS 'The following output is:'; SELECT * FROM ndbinfo.threadblocks; END IF;  IF (v_has_ps = 'YES') THEN IF (@sys.diagnostics.include_raw = 'ON') THEN SELECT '  ========================  Initial Status  ========================  ' AS ''; END IF;  DROP TEMPORARY TABLE IF EXISTS tmp_digests_start; CALL sys.statement_performance_analyzer('create_tmp', 'tmp_digests_start', NULL); CALL sys.statement_performance_analyzer('snapshot', NULL, NULL); CALL sys.statement_performance_analyzer('save', 'tmp_digests_start', NULL);  IF (@sys.diagnostics.include_raw = 'ON') THEN SET @sys.diagnostics.sql = REPLACE(@sys.diagnostics.sql_gen_query_template, '%{OUTPUT}', 'start'); IF (@sys.debug = 'ON') THEN SELECT 'The following query will be used to generate the query for each sys view' AS 'Debug'; SELECT @sys.diagnostics.sql AS 'Debug'; END IF; PREPARE stmt_gen_query FROM @sys.diagnostics.sql; END IF; SET v_done = FALSE; OPEN c_sysviews_w_delta; c_sysviews_w_delta_loop: LOOP FETCH c_sysviews_w_delta INTO v_table_name; IF v_done THEN LEAVE c_sysviews_w_delta_loop; END IF;  IF (@sys.debug = 'ON') THEN SELECT CONCAT('The following queries are for storing the initial content of ', v_table_name) AS 'Debug'; END IF;  CALL sys.execute_prepared_stmt(CONCAT('DROP TEMPORARY TABLE IF EXISTS `tmp_', v_table_name, '_start`')); CALL sys.execute_prepared_stmt(CONCAT('CREATE TEMPORARY TABLE `tmp_', v_table_name, '_start` SELECT * FROM `sys`.`x$', v_table_name, '`'));  IF (@sys.diagnostics.include_raw = 'ON') THEN SET @sys.diagnostics.table_name = CONCAT('x$', v_table_name); EXECUTE stmt_gen_query USING @sys.diagnostics.table_name; SELECT CONCAT(@sys.diagnostics.sql_select, IF(order_by IS NOT NULL, CONCAT('\n ORDER BY ', REPLACE(order_by, '%{TABLE}', CONCAT('tmp_', v_table_name, '_start'))), ''), IF(limit_rows IS NOT NULL, CONCAT('\n LIMIT ', limit_rows), '') ) INTO @sys.diagnostics.sql_select FROM tmp_sys_views_delta WHERE TABLE_NAME = v_table_name; SELECT CONCAT('Initial ', v_table_name) AS 'The following output is:'; CALL sys.execute_prepared_stmt(@sys.diagnostics.sql_select); END IF; END LOOP; CLOSE c_sysviews_w_delta;  IF (@sys.diagnostics.include_raw = 'ON') THEN DEALLOCATE PREPARE stmt_gen_query; END IF; END IF;  SET v_sql_status_summary_select = 'SELECT Variable_name', v_sql_status_summary_delta  = '', v_sql_status_summary_from   = '';  REPEAT SET v_output_count = v_output_count + 1; IF (v_output_count > 1) THEN SET v_sleep = in_interval-(UNIX_TIMESTAMP(NOW(2))-v_iter_start); SELECT NOW() AS 'Time', CONCAT('Going to sleep for ', v_sleep, ' seconds. Please do not interrupt') AS 'The following output is:'; DO SLEEP(in_interval); END IF; SET v_iter_start = UNIX_TIMESTAMP(NOW(2));  SELECT NOW(), CONCAT('Iteration Number ', IFNULL(v_output_count, 'NULL')) AS 'The following output is:';  IF (@@log_bin = 1) THEN SELECT 'SHOW MASTER STATUS' AS 'The following output is:'; SHOW MASTER STATUS; END IF;  IF (v_has_replication <> 'NO') THEN SELECT 'SHOW SLAVE STATUS' AS 'The following output is:'; SHOW SLAVE STATUS;  IF (v_has_ps_replication = 'YES') THEN SELECT 'Replication Connection Status' AS 'The following output is:'; SELECT * FROM performance_schema.replication_connection_status;  SELECT 'Replication Applier Status' AS 'The following output is:'; SELECT * FROM performance_schema.replication_applier_status ORDER BY CHANNEL_NAME;  SELECT 'Replication Applier Status - Coordinator' AS 'The following output is:'; SELECT * FROM performance_schema.replication_applier_status_by_coordinator ORDER BY CHANNEL_NAME;  SELECT 'Replication Applier Status - Worker' AS 'The following output is:'; SELECT * FROM performance_schema.replication_applier_status_by_worker ORDER BY CHANNEL_NAME, WORKER_ID; END IF;  IF (@@master_info_repository = 'TABLE') THEN SELECT 'Replication - Master Log Status' AS 'The following output is:'; SELECT Master_log_name, Master_log_pos FROM mysql.slave_master_info; END IF;  IF (@@relay_log_info_repository = 'TABLE') THEN SELECT 'Replication - Relay Log Status' AS 'The following output is:'; SELECT sys.format_path(Relay_log_name) AS Relay_log_name, Relay_log_pos, Master_log_name, Master_log_pos FROM mysql.slave_relay_log_info;  SELECT 'Replication - Worker Status' AS 'The following output is:'; SELECT Id, sys.format_path(Relay_log_name) AS Relay_log_name, Relay_log_pos, Master_log_name, Master_log_pos, sys.format_path(Checkpoint_relay_log_name) AS Checkpoint_relay_log_name, Checkpoint_relay_log_pos, Checkpoint_master_log_name, Checkpoint_master_log_pos, Checkpoint_seqno, Checkpoint_group_size, HEX(Checkpoint_group_bitmap) AS Checkpoint_group_bitmap , Channel_name FROM mysql.slave_worker_info ORDER BY  Channel_name, Id; END IF; END IF;  SET v_table_name = CONCAT('tmp_metrics_', v_output_count); CALL sys.execute_prepared_stmt(CONCAT('DROP TEMPORARY TABLE IF EXISTS ', v_table_name));  CALL sys.execute_prepared_stmt(CONCAT('CREATE TEMPORARY TABLE ', v_table_name, ' ( Variable_name VARCHAR(193) NOT NULL, Variable_value VARCHAR(1024), Type VARCHAR(225) NOT NULL, Enabled ENUM(''YES'', ''NO'', ''PARTIAL'') NOT NULL, PRIMARY KEY (Type, Variable_name) ) ENGINE = InnoDB DEFAULT CHARSET=utf8'));  IF (v_has_metrics) THEN SET @sys.diagnostics.sql = CONCAT( 'INSERT INTO ', v_table_name, ' SELECT Variable_name, REPLACE(Variable_value, ''\n'', ''\\\\n'') AS Variable_value, Type, Enabled FROM sys.metrics' ); ELSE SET @sys.diagnostics.sql = CONCAT( 'INSERT INTO ', v_table_name, '(SELECT LOWER(VARIABLE_NAME) AS Variable_name, REPLACE(VARIABLE_VALUE, ''\n'', ''\\\\n'') AS Variable_value, ''Global Status'' AS Type, ''YES'' AS Enabled FROM performance_schema.global_status ) UNION ALL ( SELECT NAME AS Variable_name, COUNT AS Variable_value, CONCAT(''InnoDB Metrics - '', SUBSYSTEM) AS Type, IF(STATUS = ''enabled'', ''YES'', ''NO'') AS Enabled FROM information_schema.INNODB_METRICS WHERE NAME NOT IN ( ''lock_row_lock_time'', ''lock_row_lock_time_avg'', ''lock_row_lock_time_max'', ''lock_row_lock_waits'', ''buffer_pool_reads'', ''buffer_pool_read_requests'', ''buffer_pool_write_requests'', ''buffer_pool_wait_free'', ''buffer_pool_read_ahead'', ''buffer_pool_read_ahead_evicted'', ''buffer_pool_pages_total'', ''buffer_pool_pages_misc'', ''buffer_pool_pages_data'', ''buffer_pool_bytes_data'', ''buffer_pool_pages_dirty'', ''buffer_pool_bytes_dirty'', ''buffer_pool_pages_free'', ''buffer_pages_created'', ''buffer_pages_written'', ''buffer_pages_read'', ''buffer_data_reads'', ''buffer_data_written'', ''file_num_open_files'', ''os_log_bytes_written'', ''os_log_fsyncs'', ''os_log_pending_fsyncs'', ''os_log_pending_writes'', ''log_waits'', ''log_write_requests'', ''log_writes'', ''innodb_dblwr_writes'', ''innodb_dblwr_pages_written'', ''innodb_page_size'') ) UNION ALL ( SELECT ''NOW()'' AS Variable_name, NOW(3) AS Variable_value, ''System Time'' AS Type, ''YES'' AS Enabled ) UNION ALL ( SELECT ''UNIX_TIMESTAMP()'' AS Variable_name, ROUND(UNIX_TIMESTAMP(NOW(3)), 3) AS Variable_value, ''System Time'' AS Type, ''YES'' AS Enabled ) ORDER BY Type, Variable_name;' ); END IF; CALL sys.execute_prepared_stmt(@sys.diagnostics.sql);  CALL sys.execute_prepared_stmt( CONCAT('(SELECT Variable_value INTO @sys.diagnostics.output_time FROM ', v_table_name, ' WHERE Type = ''System Time'' AND Variable_name = ''UNIX_TIMESTAMP()'')') ); SET v_output_time = @sys.diagnostics.output_time;  SET v_sql_status_summary_select = CONCAT(v_sql_status_summary_select, ', CONCAT( LEFT(s', v_output_count, '.Variable_value, ', v_status_summary_width, '), IF(', REPLACE(v_no_delta_names, '%{COUNT}', v_output_count), ' AND s', v_output_count, '.Variable_value REGEXP ''^[0-9]+(\\\\.[0-9]+)?$'', CONCAT('' ('', ROUND(s', v_output_count, '.Variable_value/', v_output_time, ', 2), ''/sec)''), '''') ) AS ''Output ', v_output_count, ''''), v_sql_status_summary_from   = CONCAT(v_sql_status_summary_from, ' ', IF(v_output_count = 1, '  FROM ', '       INNER JOIN '), v_table_name, ' s', v_output_count, IF (v_output_count = 1, '', ' USING (Type, Variable_name)')); IF (v_output_count > 1) THEN SET v_sql_status_summary_delta  = CONCAT(v_sql_status_summary_delta, ', IF(', REPLACE(v_no_delta_names, '%{COUNT}', v_output_count), ' AND s', (v_output_count-1), '.Variable_value REGEXP ''^[0-9]+(\\\\.[0-9]+)?$'' AND s', v_output_count, '.Variable_value REGEXP ''^[0-9]+(\\\\.[0-9]+)?$'', CONCAT(IF(s', (v_output_count-1), '.Variable_value REGEXP ''^[0-9]+\\\\.[0-9]+$'' OR s', v_output_count, '.Variable_value REGEXP ''^[0-9]+\\\\.[0-9]+$'', ROUND((s', v_output_count, '.Variable_value-s', (v_output_count-1), '.Variable_value), 2), (s', v_output_count, '.Variable_value-s', (v_output_count-1), '.Variable_value) ), '' ('', ROUND((s', v_output_count, '.Variable_value-s', (v_output_count-1), '.Variable_value)/(', v_output_time, '-', v_output_time_prev, '), 2), ''/sec)'' ), '''' ) AS ''Delta (', (v_output_count-1), ' -> ', v_output_count, ')'''); END IF;  SET v_output_time_prev = v_output_time;  IF (@sys.diagnostics.include_raw = 'ON') THEN IF (v_has_metrics) THEN SELECT 'SELECT * FROM sys.metrics' AS 'The following output is:'; ELSE SELECT 'sys.metrics equivalent' AS 'The following output is:'; END IF; CALL sys.execute_prepared_stmt(CONCAT('SELECT Type, Variable_name, Enabled, Variable_value FROM ', v_table_name, ' ORDER BY Type, Variable_name')); END IF;  IF (v_has_innodb IN ('DEFAULT', 'YES')) THEN SELECT 'SHOW ENGINE INNODB STATUS' AS 'The following output is:'; EXECUTE stmt_innodb_status; SELECT 'InnoDB - Transactions' AS 'The following output is:'; SELECT * FROM information_schema.INNODB_TRX; END IF;  IF (v_has_ndb IN ('DEFAULT', 'YES')) THEN SELECT 'SHOW ENGINE NDBCLUSTER STATUS' AS 'The following output is:'; EXECUTE stmt_ndbcluster_status;  SELECT 'ndbinfo.memoryusage' AS 'The following output is:'; SELECT node_id, memory_type, sys.format_bytes(used) AS used, used_pages, sys.format_bytes(total) AS total, total_pages, ROUND(100*(used/total), 2) AS 'Used %' FROM ndbinfo.memoryusage;  SET v_done = FALSE; OPEN c_ndbinfo; c_ndbinfo_loop: LOOP FETCH c_ndbinfo INTO v_table_name; IF v_done THEN LEAVE c_ndbinfo_loop; END IF;  SELECT CONCAT('SELECT * FROM ndbinfo.', v_table_name) AS 'The following output is:'; CALL sys.execute_prepared_stmt(CONCAT('SELECT * FROM `ndbinfo`.`', v_table_name, '`')); END LOOP; CLOSE c_ndbinfo;  SELECT * FROM information_schema.FILES; END IF;  SELECT 'SELECT * FROM sys.processlist' AS 'The following output is:'; SELECT processlist.* FROM sys.processlist;  IF (v_has_ps = 'YES') THEN IF (sys.ps_is_consumer_enabled('events_waits_history_long') = 'YES') THEN SELECT 'SELECT * FROM sys.latest_file_io' AS 'The following output is:'; SELECT * FROM sys.latest_file_io; END IF;  IF (EXISTS(SELECT 1 FROM performance_schema.setup_instruments WHERE NAME LIKE 'memory/%' AND ENABLED = 'YES')) THEN SELECT 'SELECT * FROM sys.memory_by_host_by_current_bytes' AS 'The following output is:'; SELECT * FROM sys.memory_by_host_by_current_bytes;  SELECT 'SELECT * FROM sys.memory_by_thread_by_current_bytes' AS 'The following output is:'; SELECT * FROM sys.memory_by_thread_by_current_bytes;  SELECT 'SELECT * FROM sys.memory_by_user_by_current_bytes' AS 'The following output is:'; SELECT * FROM sys.memory_by_user_by_current_bytes;  SELECT 'SELECT * FROM sys.memory_global_by_current_bytes' AS 'The following output is:'; SELECT * FROM sys.memory_global_by_current_bytes; END IF; END IF;  SET v_runtime = (UNIX_TIMESTAMP(NOW(2)) - v_start); UNTIL (v_runtime + in_interval >= in_max_runtime) END REPEAT;  IF (v_has_ps = 'YES') THEN SELECT 'SHOW ENGINE PERFORMANCE_SCHEMA STATUS' AS 'The following output is:'; EXECUTE stmt_ps_status; END IF;  IF (v_has_innodb IN ('DEFAULT', 'YES')) THEN DEALLOCATE PREPARE stmt_innodb_status; END IF; IF (v_has_ps = 'YES') THEN DEALLOCATE PREPARE stmt_ps_status; END IF; IF (v_has_ndb IN ('DEFAULT', 'YES')) THEN DEALLOCATE PREPARE stmt_ndbcluster_status; END IF;   SELECT '  ============================  Schema Information  ============================  ' AS '';  SELECT COUNT(*) AS 'Total Number of Tables' FROM information_schema.TABLES;  IF (@sys.diagnostics.allow_i_s_tables = 'ON') THEN SELECT 'Storage Engine Usage' AS 'The following output is:'; SELECT ENGINE, COUNT(*) AS NUM_TABLES, sys.format_bytes(SUM(DATA_LENGTH)) AS DATA_LENGTH, sys.format_bytes(SUM(INDEX_LENGTH)) AS INDEX_LENGTH, sys.format_bytes(SUM(DATA_LENGTH+INDEX_LENGTH)) AS TOTAL FROM information_schema.TABLES GROUP BY ENGINE;  SELECT 'Schema Object Overview' AS 'The following output is:'; SELECT * FROM sys.schema_object_overview;  SELECT 'Tables without a PRIMARY KEY' AS 'The following output is:'; SELECT TABLES.TABLE_SCHEMA, ENGINE, COUNT(*) AS NumTables FROM information_schema.TABLES LEFT OUTER JOIN information_schema.STATISTICS ON STATISTICS.TABLE_SCHEMA = TABLES.TABLE_SCHEMA AND STATISTICS.TABLE_NAME = TABLES.TABLE_NAME AND STATISTICS.INDEX_NAME = 'PRIMARY' WHERE STATISTICS.TABLE_NAME IS NULL AND TABLES.TABLE_SCHEMA NOT IN ('mysql', 'information_schema', 'performance_schema', 'sys') AND TABLES.TABLE_TYPE = 'BASE TABLE' GROUP BY TABLES.TABLE_SCHEMA, ENGINE; END IF;  IF (v_has_ps = 'YES') THEN SELECT 'Unused Indexes' AS 'The following output is:'; SELECT object_schema, COUNT(*) AS NumUnusedIndexes FROM performance_schema.table_io_waits_summary_by_index_usage WHERE index_name IS NOT NULL AND count_star = 0 AND object_schema NOT IN ('mysql', 'sys') AND index_name != 'PRIMARY' GROUP BY object_schema; END IF;  IF (v_has_ps = 'YES') THEN SELECT '  =========================  Overall Status  =========================  ' AS '';  SELECT 'CALL sys.ps_statement_avg_latency_histogram()' AS 'The following output is:'; CALL sys.ps_statement_avg_latency_histogram();  CALL sys.statement_performance_analyzer('snapshot', NULL, NULL); CALL sys.statement_performance_analyzer('overall', NULL, 'with_runtimes_in_95th_percentile');  SET @sys.diagnostics.sql = REPLACE(@sys.diagnostics.sql_gen_query_template, '%{OUTPUT}', 'end'); IF (@sys.debug = 'ON') THEN SELECT 'The following query will be used to generate the query for each sys view' AS 'Debug'; SELECT @sys.diagnostics.sql AS 'Debug'; END IF; PREPARE stmt_gen_query FROM @sys.diagnostics.sql;  SET v_done = FALSE; OPEN c_sysviews_w_delta; c_sysviews_w_delta_loop: LOOP FETCH c_sysviews_w_delta INTO v_table_name; IF v_done THEN LEAVE c_sysviews_w_delta_loop; END IF;  IF (@sys.debug = 'ON') THEN SELECT CONCAT('The following queries are for storing the final content of ', v_table_name) AS 'Debug'; END IF;  CALL sys.execute_prepared_stmt(CONCAT('DROP TEMPORARY TABLE IF EXISTS `tmp_', v_table_name, '_end`')); CALL sys.execute_prepared_stmt(CONCAT('CREATE TEMPORARY TABLE `tmp_', v_table_name, '_end` SELECT * FROM `sys`.`x$', v_table_name, '`'));  SET @sys.diagnostics.table_name = CONCAT('x$', v_table_name); EXECUTE stmt_gen_query USING @sys.diagnostics.table_name; SELECT CONCAT(@sys.diagnostics.sql_select, IF(order_by IS NOT NULL, CONCAT('\n ORDER BY ', REPLACE(order_by, '%{TABLE}', CONCAT('tmp_', v_table_name, '_end'))), ''), IF(limit_rows IS NOT NULL, CONCAT('\n LIMIT ', limit_rows), '') ) INTO @sys.diagnostics.sql_select FROM tmp_sys_views_delta WHERE TABLE_NAME = v_table_name; SELECT CONCAT('Overall ', v_table_name) AS 'The following output is:'; CALL sys.execute_prepared_stmt(@sys.diagnostics.sql_select); END LOOP; CLOSE c_sysviews_w_delta;  DEALLOCATE PREPARE stmt_gen_query;   SELECT '  ======================  Delta Status  ======================  ' AS '';  CALL sys.statement_performance_analyzer('delta', 'tmp_digests_start', 'with_runtimes_in_95th_percentile'); CALL sys.statement_performance_analyzer('cleanup', NULL, NULL);  DROP TEMPORARY TABLE tmp_digests_start;  IF (@sys.debug = 'ON') THEN SELECT 'The following query will be used to generate the query for each sys view delta' AS 'Debug'; SELECT @sys.diagnostics.sql_gen_query_delta AS 'Debug'; END IF; PREPARE stmt_gen_query_delta FROM @sys.diagnostics.sql_gen_query_delta;  SET v_old_group_concat_max_len = @@session.group_concat_max_len; SET @@session.group_concat_max_len = 2048; SET v_done = FALSE; OPEN c_sysviews_w_delta; c_sysviews_w_delta_loop: LOOP FETCH c_sysviews_w_delta INTO v_table_name; IF v_done THEN LEAVE c_sysviews_w_delta_loop; END IF;  SET @sys.diagnostics.table_name = v_table_name; EXECUTE stmt_gen_query_delta USING @sys.diagnostics.table_name; SELECT CONCAT(@sys.diagnostics.sql_select, IF(where_delta IS NOT NULL, CONCAT('\n WHERE ', where_delta), ''), IF(order_by_delta IS NOT NULL, CONCAT('\n ORDER BY ', order_by_delta), ''), IF(limit_rows IS NOT NULL, CONCAT('\n LIMIT ', limit_rows), '') ) INTO @sys.diagnostics.sql_select FROM tmp_sys_views_delta WHERE TABLE_NAME = v_table_name;  SELECT CONCAT('Delta ', v_table_name) AS 'The following output is:'; CALL sys.execute_prepared_stmt(@sys.diagnostics.sql_select);  CALL sys.execute_prepared_stmt(CONCAT('DROP TEMPORARY TABLE `tmp_', v_table_name, '_end`')); CALL sys.execute_prepared_stmt(CONCAT('DROP TEMPORARY TABLE `tmp_', v_table_name, '_start`')); END LOOP; CLOSE c_sysviews_w_delta; SET @@session.group_concat_max_len = v_old_group_concat_max_len;  DEALLOCATE PREPARE stmt_gen_query_delta; DROP TEMPORARY TABLE tmp_sys_views_delta; END IF;  IF (v_has_metrics) THEN SELECT 'SELECT * FROM sys.metrics' AS 'The following output is:'; ELSE SELECT 'sys.metrics equivalent' AS 'The following output is:'; END IF; CALL sys.execute_prepared_stmt( CONCAT(v_sql_status_summary_select, v_sql_status_summary_delta, ', Type, s1.Enabled', v_sql_status_summary_from, ' ORDER BY Type, Variable_name' ) );  SET v_count = 0; WHILE (v_count < v_output_count) DO SET v_count = v_count + 1; SET v_table_name = CONCAT('tmp_metrics_', v_count); CALL sys.execute_prepared_stmt(CONCAT('DROP TEMPORARY TABLE IF EXISTS ', v_table_name)); END WHILE;  IF (in_auto_config <> 'current') THEN CALL sys.ps_setup_reload_saved(); SET sql_log_bin = @log_bin; END IF;  SET @sys.diagnostics.output_time            = NULL, @sys.diagnostics.sql                    = NULL, @sys.diagnostics.sql_gen_query_delta    = NULL, @sys.diagnostics.sql_gen_query_template = NULL, @sys.diagnostics.sql_select             = NULL, @sys.diagnostics.table_name             = NULL;  IF (v_this_thread_enabled = 'YES') THEN CALL sys.ps_setup_enable_thread(CONNECTION_ID()); END IF;  IF (@log_bin = 1) THEN SET sql_log_bin = @log_bin; END IF; END$$

CREATE DEFINER=`mysql.sys`@`localhost` PROCEDURE `execute_prepared_stmt`( IN in_query longtext CHARACTER SET UTF8 )
    READS SQL DATA
    SQL SECURITY INVOKER
    COMMENT '\n Description\n \n Takes the query in the argument and executes it using a prepared statement. The prepared statement is deallocated,\n so the procedure is mainly useful for executing one off dynamically created queries.\n \n The sys_execute_prepared_stmt prepared statement name is used for the query and is required not to exist.\n \n \n Parameters\n \n in_query (longtext CHARACTER SET UTF8):\n The query to execute.\n \n \n Configuration Options\n \n sys.debug\n Whether to provide debugging output.\n Default is ''OFF''. Set to ''ON'' to include.\n \n \n Example\n \n mysql> CALL sys.execute_prepared_stmt(''SELECT * FROM sys.sys_config'');\n +------------------------+-------+---------------------+--------+\n | variable               | value | set_time            | set_by |\n +------------------------+-------+---------------------+--------+\n | statement_truncate_len | 64    | 2015-06-30 13:06:00 | NULL   |\n +------------------------+-------+---------------------+--------+\n 1 row in set (0.00 sec)\n \n Query OK, 0 rows affected (0.00 sec)\n '
BEGIN IF (@sys.debug IS NULL) THEN SET @sys.debug = sys.sys_get_config('debug', 'OFF'); END IF;  IF (in_query IS NULL OR LENGTH(in_query) < 4) THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "The @sys.execute_prepared_stmt.sql must contain a query"; END IF;  SET @sys.execute_prepared_stmt.sql = in_query;  IF (@sys.debug = 'ON') THEN SELECT @sys.execute_prepared_stmt.sql AS 'Debug'; END IF; PREPARE sys_execute_prepared_stmt FROM @sys.execute_prepared_stmt.sql; EXECUTE sys_execute_prepared_stmt; DEALLOCATE PREPARE sys_execute_prepared_stmt;  SET @sys.execute_prepared_stmt.sql = NULL; END$$

CREATE DEFINER=`mysql.sys`@`localhost` PROCEDURE `ps_setup_disable_background_threads`()
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
    COMMENT '\n Description\n \n Disable all background thread instrumentation within Performance Schema.\n \n Parameters\n \n None.\n \n Example\n \n mysql> CALL sys.ps_setup_disable_background_threads();\n +--------------------------------+\n | summary                        |\n +--------------------------------+\n | Disabled 18 background threads |\n +--------------------------------+\n 1 row in set (0.00 sec)\n '
BEGIN UPDATE performance_schema.threads SET instrumented = 'NO' WHERE type = 'BACKGROUND';  SELECT CONCAT('Disabled ', @rows := ROW_COUNT(), ' background thread', IF(@rows != 1, 's', '')) AS summary; END$$

CREATE DEFINER=`mysql.sys`@`localhost` PROCEDURE `ps_setup_disable_consumer`( IN consumer VARCHAR(128) )
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
    COMMENT '\n Description\n \n Disables consumers within Performance Schema \n matching the input pattern.\n \n Parameters\n \n consumer (VARCHAR(128)):\n A LIKE pattern match (using "%consumer%") of consumers to disable\n \n Example\n \n To disable all consumers:\n \n mysql> CALL sys.ps_setup_disable_consumer('''');\n +--------------------------+\n | summary                  |\n +--------------------------+\n | Disabled 15 consumers    |\n +--------------------------+\n 1 row in set (0.02 sec)\n \n To disable just the event_stage consumers:\n \n mysql> CALL sys.ps_setup_disable_comsumers(''stage'');\n +------------------------+\n | summary                |\n +------------------------+\n | Disabled 3 consumers   |\n +------------------------+\n 1 row in set (0.00 sec)\n '
BEGIN UPDATE performance_schema.setup_consumers SET enabled = 'NO' WHERE name LIKE CONCAT('%', consumer, '%');  SELECT CONCAT('Disabled ', @rows := ROW_COUNT(), ' consumer', IF(@rows != 1, 's', '')) AS summary; END$$

CREATE DEFINER=`mysql.sys`@`localhost` PROCEDURE `ps_setup_disable_instrument`( IN in_pattern VARCHAR(128) )
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
    COMMENT '\n Description\n \n Disables instruments within Performance Schema \n matching the input pattern.\n \n Parameters\n \n in_pattern (VARCHAR(128)):\n A LIKE pattern match (using "%in_pattern%") of events to disable\n \n Example\n \n To disable all mutex instruments:\n \n mysql> CALL sys.ps_setup_disable_instrument(''wait/synch/mutex'');\n +--------------------------+\n | summary                  |\n +--------------------------+\n | Disabled 155 instruments |\n +--------------------------+\n 1 row in set (0.02 sec)\n \n To disable just a specific TCP/IP based network IO instrument:\n \n mysql> CALL sys.ps_setup_disable_instrument(''wait/io/socket/sql/server_tcpip_socket'');\n +------------------------+\n | summary                |\n +------------------------+\n | Disabled 1 instruments |\n +------------------------+\n 1 row in set (0.00 sec)\n \n To disable all instruments:\n \n mysql> CALL sys.ps_setup_disable_instrument('''');\n +--------------------------+\n | summary                  |\n +--------------------------+\n | Disabled 547 instruments |\n +--------------------------+\n 1 row in set (0.01 sec)\n '
BEGIN UPDATE performance_schema.setup_instruments SET enabled = 'NO', timed = 'NO' WHERE name LIKE CONCAT('%', in_pattern, '%');  SELECT CONCAT('Disabled ', @rows := ROW_COUNT(), ' instrument', IF(@rows != 1, 's', '')) AS summary; END$$

CREATE DEFINER=`mysql.sys`@`localhost` PROCEDURE `ps_setup_disable_thread`( IN in_connection_id BIGINT )
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
    COMMENT '\n Description\n \n Disable the given connection/thread in Performance Schema.\n \n Parameters\n \n in_connection_id (BIGINT):\n The connection ID (PROCESSLIST_ID from performance_schema.threads\n or the ID shown within SHOW PROCESSLIST)\n \n Example\n \n mysql> CALL sys.ps_setup_disable_thread(3);\n +-------------------+\n | summary           |\n +-------------------+\n | Disabled 1 thread |\n +-------------------+\n 1 row in set (0.01 sec)\n \n To disable the current connection:\n \n mysql> CALL sys.ps_setup_disable_thread(CONNECTION_ID());\n +-------------------+\n | summary           |\n +-------------------+\n | Disabled 1 thread |\n +-------------------+\n 1 row in set (0.00 sec)\n '
BEGIN UPDATE performance_schema.threads SET instrumented = 'NO' WHERE processlist_id = in_connection_id;  SELECT CONCAT('Disabled ', @rows := ROW_COUNT(), ' thread', IF(@rows != 1, 's', '')) AS summary; END$$

CREATE DEFINER=`mysql.sys`@`localhost` PROCEDURE `ps_setup_enable_background_threads`()
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
    COMMENT '\n Description\n \n Enable all background thread instrumentation within Performance Schema.\n \n Parameters\n \n None.\n \n Example\n \n mysql> CALL sys.ps_setup_enable_background_threads();\n +-------------------------------+\n | summary                       |\n +-------------------------------+\n | Enabled 18 background threads |\n +-------------------------------+\n 1 row in set (0.00 sec)\n '
BEGIN UPDATE performance_schema.threads SET instrumented = 'YES' WHERE type = 'BACKGROUND';  SELECT CONCAT('Enabled ', @rows := ROW_COUNT(), ' background thread', IF(@rows != 1, 's', '')) AS summary; END$$

CREATE DEFINER=`mysql.sys`@`localhost` PROCEDURE `ps_setup_enable_consumer`( IN consumer VARCHAR(128) )
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
    COMMENT '\n Description\n \n Enables consumers within Performance Schema \n matching the input pattern.\n \n Parameters\n \n consumer (VARCHAR(128)):\n A LIKE pattern match (using "%consumer%") of consumers to enable\n \n Example\n \n To enable all consumers:\n \n mysql> CALL sys.ps_setup_enable_consumer('''');\n +-------------------------+\n | summary                 |\n +-------------------------+\n | Enabled 10 consumers    |\n +-------------------------+\n 1 row in set (0.02 sec)\n \n Query OK, 0 rows affected (0.02 sec)\n \n To enable just "waits" consumers:\n \n mysql> CALL sys.ps_setup_enable_consumer(''waits'');\n +-----------------------+\n | summary               |\n +-----------------------+\n | Enabled 3 consumers   |\n +-----------------------+\n 1 row in set (0.00 sec)\n \n Query OK, 0 rows affected (0.00 sec)\n '
BEGIN UPDATE performance_schema.setup_consumers SET enabled = 'YES' WHERE name LIKE CONCAT('%', consumer, '%');  SELECT CONCAT('Enabled ', @rows := ROW_COUNT(), ' consumer', IF(@rows != 1, 's', '')) AS summary; END$$

CREATE DEFINER=`mysql.sys`@`localhost` PROCEDURE `ps_setup_enable_instrument`( IN in_pattern VARCHAR(128) )
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
    COMMENT '\n Description\n \n Enables instruments within Performance Schema \n matching the input pattern.\n \n Parameters\n \n in_pattern (VARCHAR(128)):\n A LIKE pattern match (using "%in_pattern%") of events to enable\n \n Example\n \n To enable all mutex instruments:\n \n mysql> CALL sys.ps_setup_enable_instrument(''wait/synch/mutex'');\n +-------------------------+\n | summary                 |\n +-------------------------+\n | Enabled 155 instruments |\n +-------------------------+\n 1 row in set (0.02 sec)\n \n Query OK, 0 rows affected (0.02 sec)\n \n To enable just a specific TCP/IP based network IO instrument:\n \n mysql> CALL sys.ps_setup_enable_instrument(''wait/io/socket/sql/server_tcpip_socket'');\n +-----------------------+\n | summary               |\n +-----------------------+\n | Enabled 1 instruments |\n +-----------------------+\n 1 row in set (0.00 sec)\n \n Query OK, 0 rows affected (0.00 sec)\n \n To enable all instruments:\n \n mysql> CALL sys.ps_setup_enable_instrument('''');\n +-------------------------+\n | summary                 |\n +-------------------------+\n | Enabled 547 instruments |\n +-------------------------+\n 1 row in set (0.01 sec)\n \n Query OK, 0 rows affected (0.01 sec)\n '
BEGIN UPDATE performance_schema.setup_instruments SET enabled = 'YES', timed = 'YES' WHERE name LIKE CONCAT('%', in_pattern, '%');  SELECT CONCAT('Enabled ', @rows := ROW_COUNT(), ' instrument', IF(@rows != 1, 's', '')) AS summary; END$$

CREATE DEFINER=`mysql.sys`@`localhost` PROCEDURE `ps_setup_enable_thread`( IN in_connection_id BIGINT )
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
    COMMENT '\n Description\n \n Enable the given connection/thread in Performance Schema.\n \n Parameters\n \n in_connection_id (BIGINT):\n The connection ID (PROCESSLIST_ID from performance_schema.threads\n or the ID shown within SHOW PROCESSLIST)\n \n Example\n \n mysql> CALL sys.ps_setup_enable_thread(3);\n +------------------+\n | summary          |\n +------------------+\n | Enabled 1 thread |\n +------------------+\n 1 row in set (0.01 sec)\n \n To enable the current connection:\n \n mysql> CALL sys.ps_setup_enable_thread(CONNECTION_ID());\n +------------------+\n | summary          |\n +------------------+\n | Enabled 1 thread |\n +------------------+\n 1 row in set (0.00 sec)\n '
BEGIN UPDATE performance_schema.threads SET instrumented = 'YES' WHERE processlist_id = in_connection_id;  SELECT CONCAT('Enabled ', @rows := ROW_COUNT(), ' thread', IF(@rows != 1, 's', '')) AS summary; END$$

CREATE DEFINER=`mysql.sys`@`localhost` PROCEDURE `ps_setup_reload_saved`()
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
    COMMENT '\n Description\n \n Reloads a saved Performance Schema configuration,\n so that you can alter the setup for debugging purposes, \n but restore it to a previous state.\n \n Use the companion procedure - ps_setup_save(), to \n save a configuration.\n \n Requires the SUPER privilege for "SET sql_log_bin = 0;".\n \n Parameters\n \n None.\n \n Example\n \n mysql> CALL sys.ps_setup_save();\n Query OK, 0 rows affected (0.08 sec)\n \n mysql> UPDATE performance_schema.setup_instruments SET enabled = ''YES'', timed = ''YES'';\n Query OK, 547 rows affected (0.40 sec)\n Rows matched: 784  Changed: 547  Warnings: 0\n \n /* Run some tests that need more detailed instrumentation here */\n \n mysql> CALL sys.ps_setup_reload_saved();\n Query OK, 0 rows affected (0.32 sec)\n '
BEGIN DECLARE v_done bool DEFAULT FALSE; DECLARE v_lock_result INT; DECLARE v_lock_used_by BIGINT; DECLARE v_signal_message TEXT; DECLARE EXIT HANDLER FOR SQLEXCEPTION BEGIN SIGNAL SQLSTATE VALUE '90001' SET MESSAGE_TEXT = 'An error occurred, was sys.ps_setup_save() run before this procedure?'; END;  SET @log_bin := @@sql_log_bin; SET sql_log_bin = 0;  SELECT IS_USED_LOCK('sys.ps_setup_save') INTO v_lock_used_by;  IF (v_lock_used_by != CONNECTION_ID()) THEN SET v_signal_message = CONCAT('The sys.ps_setup_save lock is currently owned by ', v_lock_used_by); SIGNAL SQLSTATE VALUE '90002' SET MESSAGE_TEXT = v_signal_message; END IF;  DELETE FROM performance_schema.setup_actors; INSERT INTO performance_schema.setup_actors SELECT * FROM tmp_setup_actors;  BEGIN DECLARE v_name varchar(64); DECLARE v_enabled enum('YES', 'NO'); DECLARE c_consumers CURSOR FOR SELECT NAME, ENABLED FROM tmp_setup_consumers; DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_done = TRUE;  SET v_done = FALSE; OPEN c_consumers; c_consumers_loop: LOOP FETCH c_consumers INTO v_name, v_enabled; IF v_done THEN LEAVE c_consumers_loop; END IF;  UPDATE performance_schema.setup_consumers SET ENABLED = v_enabled WHERE NAME = v_name; END LOOP; CLOSE c_consumers; END;  UPDATE performance_schema.setup_instruments INNER JOIN tmp_setup_instruments USING (NAME) SET performance_schema.setup_instruments.ENABLED = tmp_setup_instruments.ENABLED, performance_schema.setup_instruments.TIMED   = tmp_setup_instruments.TIMED; BEGIN DECLARE v_thread_id bigint unsigned; DECLARE v_instrumented enum('YES', 'NO'); DECLARE c_threads CURSOR FOR SELECT THREAD_ID, INSTRUMENTED FROM tmp_threads; DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_done = TRUE;  SET v_done = FALSE; OPEN c_threads; c_threads_loop: LOOP FETCH c_threads INTO v_thread_id, v_instrumented; IF v_done THEN LEAVE c_threads_loop; END IF;  UPDATE performance_schema.threads SET INSTRUMENTED = v_instrumented WHERE THREAD_ID = v_thread_id; END LOOP; CLOSE c_threads; END;  UPDATE performance_schema.threads SET INSTRUMENTED = IF(PROCESSLIST_USER IS NOT NULL, sys.ps_is_account_enabled(PROCESSLIST_HOST, PROCESSLIST_USER), 'YES') WHERE THREAD_ID NOT IN (SELECT THREAD_ID FROM tmp_threads);  DROP TEMPORARY TABLE tmp_setup_actors; DROP TEMPORARY TABLE tmp_setup_consumers; DROP TEMPORARY TABLE tmp_setup_instruments; DROP TEMPORARY TABLE tmp_threads;  SELECT RELEASE_LOCK('sys.ps_setup_save') INTO v_lock_result;  SET sql_log_bin = @log_bin;  END$$

CREATE DEFINER=`mysql.sys`@`localhost` PROCEDURE `ps_setup_reset_to_default`( IN in_verbose BOOLEAN )
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
    COMMENT '\n Description\n \n Resets the Performance Schema setup to the default settings.\n \n Parameters\n \n in_verbose (BOOLEAN):\n Whether to print each setup stage (including the SQL) whilst running.\n \n Example\n \n mysql> CALL sys.ps_setup_reset_to_default(true)\\G\n *************************** 1. row ***************************\n status: Resetting: setup_actors\n DELETE\n FROM performance_schema.setup_actors\n WHERE NOT (HOST = ''%'' AND USER = ''%'' AND `ROLE` = ''%'')\n 1 row in set (0.00 sec)\n \n *************************** 1. row ***************************\n status: Resetting: setup_actors\n INSERT IGNORE INTO performance_schema.setup_actors\n VALUES (''%'', ''%'', ''%'')\n 1 row in set (0.00 sec)\n ...\n \n mysql> CALL sys.ps_setup_reset_to_default(false)\\G\n Query OK, 0 rows affected (0.00 sec)\n '
BEGIN SET @query = 'DELETE FROM performance_schema.setup_actors WHERE NOT (HOST = ''%'' AND USER = ''%'' AND `ROLE` = ''%'')';  IF (in_verbose) THEN SELECT CONCAT('Resetting: setup_actors\n', REPLACE(@query, '  ', '')) AS status; END IF;  PREPARE reset_stmt FROM @query; EXECUTE reset_stmt; DEALLOCATE PREPARE reset_stmt;  SET @query = 'INSERT IGNORE INTO performance_schema.setup_actors VALUES (''%'', ''%'', ''%'', ''YES'', ''YES'')';  IF (in_verbose) THEN SELECT CONCAT('Resetting: setup_actors\n', REPLACE(@query, '  ', '')) AS status; END IF;  PREPARE reset_stmt FROM @query; EXECUTE reset_stmt; DEALLOCATE PREPARE reset_stmt;  SET @query = 'UPDATE performance_schema.setup_instruments SET ENABLED = sys.ps_is_instrument_default_enabled(NAME), TIMED   = sys.ps_is_instrument_default_timed(NAME)';  IF (in_verbose) THEN SELECT CONCAT('Resetting: setup_instruments\n', REPLACE(@query, '  ', '')) AS status; END IF;  PREPARE reset_stmt FROM @query; EXECUTE reset_stmt; DEALLOCATE PREPARE reset_stmt;  SET @query = 'UPDATE performance_schema.setup_consumers SET ENABLED = IF(NAME IN (''events_statements_current'', ''events_transactions_current'', ''global_instrumentation'', ''thread_instrumentation'', ''statements_digest''), ''YES'', ''NO'')';  IF (in_verbose) THEN SELECT CONCAT('Resetting: setup_consumers\n', REPLACE(@query, '  ', '')) AS status; END IF;  PREPARE reset_stmt FROM @query; EXECUTE reset_stmt; DEALLOCATE PREPARE reset_stmt;  SET @query = 'DELETE FROM performance_schema.setup_objects WHERE NOT (OBJECT_TYPE IN (''EVENT'', ''FUNCTION'', ''PROCEDURE'', ''TABLE'', ''TRIGGER'') AND OBJECT_NAME = ''%''  AND (OBJECT_SCHEMA = ''mysql''              AND ENABLED = ''NO''  AND TIMED = ''NO'' ) OR (OBJECT_SCHEMA = ''performance_schema'' AND ENABLED = ''NO''  AND TIMED = ''NO'' ) OR (OBJECT_SCHEMA = ''information_schema'' AND ENABLED = ''NO''  AND TIMED = ''NO'' ) OR (OBJECT_SCHEMA = ''%''                  AND ENABLED = ''YES'' AND TIMED = ''YES''))';  IF (in_verbose) THEN SELECT CONCAT('Resetting: setup_objects\n', REPLACE(@query, '  ', '')) AS status; END IF;  PREPARE reset_stmt FROM @query; EXECUTE reset_stmt; DEALLOCATE PREPARE reset_stmt;  SET @query = 'INSERT IGNORE INTO performance_schema.setup_objects VALUES (''EVENT''    , ''mysql''             , ''%'', ''NO'' , ''NO'' ), (''EVENT''    , ''performance_schema'', ''%'', ''NO'' , ''NO'' ), (''EVENT''    , ''information_schema'', ''%'', ''NO'' , ''NO'' ), (''EVENT''    , ''%''                 , ''%'', ''YES'', ''YES''), (''FUNCTION'' , ''mysql''             , ''%'', ''NO'' , ''NO'' ), (''FUNCTION'' , ''performance_schema'', ''%'', ''NO'' , ''NO'' ), (''FUNCTION'' , ''information_schema'', ''%'', ''NO'' , ''NO'' ), (''FUNCTION'' , ''%''                 , ''%'', ''YES'', ''YES''), (''PROCEDURE'', ''mysql''             , ''%'', ''NO'' , ''NO'' ), (''PROCEDURE'', ''performance_schema'', ''%'', ''NO'' , ''NO'' ), (''PROCEDURE'', ''information_schema'', ''%'', ''NO'' , ''NO'' ), (''PROCEDURE'', ''%''                 , ''%'', ''YES'', ''YES''), (''TABLE''    , ''mysql''             , ''%'', ''NO'' , ''NO'' ), (''TABLE''    , ''performance_schema'', ''%'', ''NO'' , ''NO'' ), (''TABLE''    , ''information_schema'', ''%'', ''NO'' , ''NO'' ), (''TABLE''    , ''%''                 , ''%'', ''YES'', ''YES''), (''TRIGGER''  , ''mysql''             , ''%'', ''NO'' , ''NO'' ), (''TRIGGER''  , ''performance_schema'', ''%'', ''NO'' , ''NO'' ), (''TRIGGER''  , ''information_schema'', ''%'', ''NO'' , ''NO'' ), (''TRIGGER''  , ''%''                 , ''%'', ''YES'', ''YES'')';  IF (in_verbose) THEN SELECT CONCAT('Resetting: setup_objects\n', REPLACE(@query, '  ', '')) AS status; END IF;  PREPARE reset_stmt FROM @query; EXECUTE reset_stmt; DEALLOCATE PREPARE reset_stmt;  SET @query = 'UPDATE performance_schema.threads SET INSTRUMENTED = ''YES''';  IF (in_verbose) THEN SELECT CONCAT('Resetting: threads\n', REPLACE(@query, '  ', '')) AS status; END IF;  PREPARE reset_stmt FROM @query; EXECUTE reset_stmt; DEALLOCATE PREPARE reset_stmt; END$$

CREATE DEFINER=`mysql.sys`@`localhost` PROCEDURE `ps_setup_save`( IN in_timeout INT )
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
    COMMENT '\n Description\n \n Saves the current configuration of Performance Schema, \n so that you can alter the setup for debugging purposes, \n but restore it to a previous state.\n \n Use the companion procedure - ps_setup_reload_saved(), to \n restore the saved config.\n \n The named lock "sys.ps_setup_save" is taken before the\n current configuration is saved. If the attempt to get the named\n lock times out, an error occurs.\n \n The lock is released after the settings have been restored by\n calling ps_setup_reload_saved().\n \n Requires the SUPER privilege for "SET sql_log_bin = 0;".\n \n Parameters\n \n in_timeout INT\n The timeout in seconds used when trying to obtain the lock.\n A negative timeout means infinite timeout.\n \n Example\n \n mysql> CALL sys.ps_setup_save(-1);\n Query OK, 0 rows affected (0.08 sec)\n \n mysql> UPDATE performance_schema.setup_instruments \n ->    SET enabled = ''YES'', timed = ''YES'';\n Query OK, 547 rows affected (0.40 sec)\n Rows matched: 784  Changed: 547  Warnings: 0\n \n /* Run some tests that need more detailed instrumentation here */\n \n mysql> CALL sys.ps_setup_reload_saved();\n Query OK, 0 rows affected (0.32 sec)\n '
BEGIN DECLARE v_lock_result INT;  SET @log_bin := @@sql_log_bin; SET sql_log_bin = 0;  SELECT GET_LOCK('sys.ps_setup_save', in_timeout) INTO v_lock_result;  IF v_lock_result THEN DROP TEMPORARY TABLE IF EXISTS tmp_setup_actors; DROP TEMPORARY TABLE IF EXISTS tmp_setup_consumers; DROP TEMPORARY TABLE IF EXISTS tmp_setup_instruments; DROP TEMPORARY TABLE IF EXISTS tmp_threads;  CREATE TEMPORARY TABLE tmp_setup_actors SELECT * FROM performance_schema.setup_actors LIMIT 0; CREATE TEMPORARY TABLE tmp_setup_consumers LIKE performance_schema.setup_consumers; CREATE TEMPORARY TABLE tmp_setup_instruments LIKE performance_schema.setup_instruments; CREATE TEMPORARY TABLE tmp_threads (THREAD_ID bigint unsigned NOT NULL PRIMARY KEY, INSTRUMENTED enum('YES','NO') NOT NULL);  INSERT INTO tmp_setup_actors SELECT * FROM performance_schema.setup_actors; INSERT INTO tmp_setup_consumers SELECT * FROM performance_schema.setup_consumers; INSERT INTO tmp_setup_instruments SELECT * FROM performance_schema.setup_instruments; INSERT INTO tmp_threads SELECT THREAD_ID, INSTRUMENTED FROM performance_schema.threads; ELSE SIGNAL SQLSTATE VALUE '90000' SET MESSAGE_TEXT = 'Could not lock the sys.ps_setup_save user lock, another thread has a saved configuration'; END IF;  SET sql_log_bin = @log_bin; END$$

CREATE DEFINER=`mysql.sys`@`localhost` PROCEDURE `ps_setup_show_disabled`( IN in_show_instruments BOOLEAN, IN in_show_threads BOOLEAN )
    READS SQL DATA
    SQL SECURITY INVOKER
    COMMENT '\n Description\n \n Shows all currently disable Performance Schema configuration.\n \n Disabled users is only available for MySQL 5.7.6 and later.\n In earlier versions it was only possible to enable users.\n \n Parameters\n \n in_show_instruments (BOOLEAN):\n Whether to print disabled instruments (can print many items)\n \n in_show_threads (BOOLEAN):\n Whether to print disabled threads\n \n Example\n \n mysql> CALL sys.ps_setup_show_disabled(TRUE, TRUE);\n +----------------------------+\n | performance_schema_enabled |\n +----------------------------+\n |                          1 |\n +----------------------------+\n 1 row in set (0.00 sec)\n \n +--------------------+\n | disabled_users     |\n +--------------------+\n | ''mark''@''localhost'' |\n +--------------------+\n 1 row in set (0.00 sec)\n \n +-------------+----------------------+---------+-------+\n | object_type | objects              | enabled | timed |\n +-------------+----------------------+---------+-------+\n | EVENT       | mysql.%              | NO      | NO    |\n | EVENT       | performance_schema.% | NO      | NO    |\n | EVENT       | information_schema.% | NO      | NO    |\n | FUNCTION    | mysql.%              | NO      | NO    |\n | FUNCTION    | performance_schema.% | NO      | NO    |\n | FUNCTION    | information_schema.% | NO      | NO    |\n | PROCEDURE   | mysql.%              | NO      | NO    |\n | PROCEDURE   | performance_schema.% | NO      | NO    |\n | PROCEDURE   | information_schema.% | NO      | NO    |\n | TABLE       | mysql.%              | NO      | NO    |\n | TABLE       | performance_schema.% | NO      | NO    |\n | TABLE       | information_schema.% | NO      | NO    |\n | TRIGGER     | mysql.%              | NO      | NO    |\n | TRIGGER     | performance_schema.% | NO      | NO    |\n | TRIGGER     | information_schema.% | NO      | NO    |\n +-------------+----------------------+---------+-------+\n 15 rows in set (0.00 sec)\n \n +----------------------------------+\n | disabled_consumers               |\n +----------------------------------+\n | events_stages_current            |\n | events_stages_history            |\n | events_stages_history_long       |\n | events_statements_history        |\n | events_statements_history_long   |\n | events_transactions_history      |\n | events_transactions_history_long |\n | events_waits_current             |\n | events_waits_history             |\n | events_waits_history_long        |\n +----------------------------------+\n 10 rows in set (0.00 sec)\n \n Empty set (0.00 sec)\n \n +---------------------------------------------------------------------------------------+-------+\n | disabled_instruments                                                                  | timed |\n +---------------------------------------------------------------------------------------+-------+\n | wait/synch/mutex/sql/TC_LOG_MMAP::LOCK_tc                                             | NO    |\n | wait/synch/mutex/sql/LOCK_des_key_file                                                | NO    |\n | wait/synch/mutex/sql/MYSQL_BIN_LOG::LOCK_commit                                       | NO    |\n ...\n | memory/sql/servers_cache                                                              | NO    |\n | memory/sql/udf_mem                                                                    | NO    |\n | wait/lock/metadata/sql/mdl                                                            | NO    |\n +---------------------------------------------------------------------------------------+-------+\n 547 rows in set (0.00 sec)\n \n Query OK, 0 rows affected (0.01 sec)\n '
BEGIN SELECT @@performance_schema AS performance_schema_enabled;   SELECT CONCAT('\'', user, '\'@\'', host, '\'') AS disabled_users FROM performance_schema.setup_actors WHERE enabled = 'NO' ORDER BY disabled_users;   SELECT object_type, CONCAT(object_schema, '.', object_name) AS objects, enabled, timed FROM performance_schema.setup_objects WHERE enabled = 'NO' ORDER BY object_type, objects;  SELECT name AS disabled_consumers FROM performance_schema.setup_consumers WHERE enabled = 'NO' ORDER BY disabled_consumers;  IF (in_show_threads) THEN SELECT IF(name = 'thread/sql/one_connection',  CONCAT(processlist_user, '@', processlist_host),  REPLACE(name, 'thread/', '')) AS disabled_threads, TYPE AS thread_type FROM performance_schema.threads WHERE INSTRUMENTED = 'NO' ORDER BY disabled_threads; END IF;  IF (in_show_instruments) THEN SELECT name AS disabled_instruments, timed FROM performance_schema.setup_instruments WHERE enabled = 'NO' ORDER BY disabled_instruments; END IF; END$$

CREATE DEFINER=`mysql.sys`@`localhost` PROCEDURE `ps_setup_show_disabled_consumers`()
    READS SQL DATA
    DETERMINISTIC
    SQL SECURITY INVOKER
    COMMENT '\n Description\n \n Shows all currently disabled consumers.\n \n Parameters\n \n None\n \n Example\n \n mysql> CALL sys.ps_setup_show_disabled_consumers();\n \n +---------------------------+\n | disabled_consumers        |\n +---------------------------+\n | events_statements_current |\n | global_instrumentation    |\n | thread_instrumentation    |\n | statements_digest         |\n +---------------------------+\n 4 rows in set (0.05 sec)\n '
BEGIN SELECT name AS disabled_consumers FROM performance_schema.setup_consumers WHERE enabled = 'NO' ORDER BY disabled_consumers; END$$

CREATE DEFINER=`mysql.sys`@`localhost` PROCEDURE `ps_setup_show_disabled_instruments`()
    READS SQL DATA
    DETERMINISTIC
    SQL SECURITY INVOKER
    COMMENT '\n Description\n \n Shows all currently disabled instruments.\n \n Parameters\n \n None\n \n Example\n \n mysql> CALL sys.ps_setup_show_disabled_instruments();\n '
BEGIN SELECT name AS disabled_instruments, timed FROM performance_schema.setup_instruments WHERE enabled = 'NO' ORDER BY disabled_instruments; END$$

CREATE DEFINER=`mysql.sys`@`localhost` PROCEDURE `ps_setup_show_enabled`( IN in_show_instruments BOOLEAN, IN in_show_threads BOOLEAN )
    READS SQL DATA
    DETERMINISTIC
    SQL SECURITY INVOKER
    COMMENT '\n Description\n \n Shows all currently enabled Performance Schema configuration.\n \n Parameters\n \n in_show_instruments (BOOLEAN):\n Whether to print enabled instruments (can print many items)\n \n in_show_threads (BOOLEAN):\n Whether to print enabled threads\n \n Example\n \n mysql> CALL sys.ps_setup_show_enabled(TRUE, TRUE);\n +----------------------------+\n | performance_schema_enabled |\n +----------------------------+\n |                          1 |\n +----------------------------+\n 1 row in set (0.00 sec)\n \n +---------------+\n | enabled_users |\n +---------------+\n | ''%''@''%''       |\n +---------------+\n 1 row in set (0.01 sec)\n \n +-------------+---------+---------+-------+\n | object_type | objects | enabled | timed |\n +-------------+---------+---------+-------+\n | EVENT       | %.%     | YES     | YES   |\n | FUNCTION    | %.%     | YES     | YES   |\n | PROCEDURE   | %.%     | YES     | YES   |\n | TABLE       | %.%     | YES     | YES   |\n | TRIGGER     | %.%     | YES     | YES   |\n +-------------+---------+---------+-------+\n 5 rows in set (0.01 sec)\n \n +---------------------------+\n | enabled_consumers         |\n +---------------------------+\n | events_statements_current |\n | global_instrumentation    |\n | thread_instrumentation    |\n | statements_digest         |\n +---------------------------+\n 4 rows in set (0.05 sec)\n \n +---------------------------------+-------------+\n | enabled_threads                 | thread_type |\n +---------------------------------+-------------+\n | sql/main                        | BACKGROUND  |\n | sql/thread_timer_notifier       | BACKGROUND  |\n | innodb/io_ibuf_thread           | BACKGROUND  |\n | innodb/io_log_thread            | BACKGROUND  |\n | innodb/io_read_thread           | BACKGROUND  |\n | innodb/io_read_thread           | BACKGROUND  |\n | innodb/io_write_thread          | BACKGROUND  |\n | innodb/io_write_thread          | BACKGROUND  |\n | innodb/page_cleaner_thread      | BACKGROUND  |\n | innodb/srv_lock_timeout_thread  | BACKGROUND  |\n | innodb/srv_error_monitor_thread | BACKGROUND  |\n | innodb/srv_monitor_thread       | BACKGROUND  |\n | innodb/srv_master_thread        | BACKGROUND  |\n | innodb/srv_purge_thread         | BACKGROUND  |\n | innodb/srv_worker_thread        | BACKGROUND  |\n | innodb/srv_worker_thread        | BACKGROUND  |\n | innodb/srv_worker_thread        | BACKGROUND  |\n | innodb/buf_dump_thread          | BACKGROUND  |\n | innodb/dict_stats_thread        | BACKGROUND  |\n | sql/signal_handler              | BACKGROUND  |\n | sql/compress_gtid_table         | FOREGROUND  |\n | root@localhost                  | FOREGROUND  |\n +---------------------------------+-------------+\n 22 rows in set (0.01 sec)\n \n +-------------------------------------+-------+\n | enabled_instruments                 | timed |\n +-------------------------------------+-------+\n | wait/io/file/sql/map                | YES   |\n | wait/io/file/sql/binlog             | YES   |\n ...\n | statement/com/Error                 | YES   |\n | statement/com/                      | YES   |\n | idle                                | YES   |\n +-------------------------------------+-------+\n 210 rows in set (0.08 sec)\n \n Query OK, 0 rows affected (0.89 sec)\n '
BEGIN SELECT @@performance_schema AS performance_schema_enabled;  SELECT CONCAT('\'', user, '\'@\'', host, '\'') AS enabled_users FROM performance_schema.setup_actors  WHERE enabled = 'YES'  ORDER BY enabled_users;  SELECT object_type, CONCAT(object_schema, '.', object_name) AS objects, enabled, timed FROM performance_schema.setup_objects WHERE enabled = 'YES' ORDER BY object_type, objects;  SELECT name AS enabled_consumers FROM performance_schema.setup_consumers WHERE enabled = 'YES' ORDER BY enabled_consumers;  IF (in_show_threads) THEN SELECT IF(name = 'thread/sql/one_connection',  CONCAT(processlist_user, '@', processlist_host),  REPLACE(name, 'thread/', '')) AS enabled_threads, TYPE AS thread_type FROM performance_schema.threads WHERE INSTRUMENTED = 'YES' ORDER BY enabled_threads; END IF;  IF (in_show_instruments) THEN SELECT name AS enabled_instruments, timed FROM performance_schema.setup_instruments WHERE enabled = 'YES' ORDER BY enabled_instruments; END IF; END$$

CREATE DEFINER=`mysql.sys`@`localhost` PROCEDURE `ps_setup_show_enabled_consumers`()
    READS SQL DATA
    DETERMINISTIC
    SQL SECURITY INVOKER
    COMMENT '\n Description\n \n Shows all currently enabled consumers.\n \n Parameters\n \n None\n \n Example\n \n mysql> CALL sys.ps_setup_show_enabled_consumers();\n \n +---------------------------+\n | enabled_consumers         |\n +---------------------------+\n | events_statements_current |\n | global_instrumentation    |\n | thread_instrumentation    |\n | statements_digest         |\n +---------------------------+\n 4 rows in set (0.05 sec)\n '
BEGIN SELECT name AS enabled_consumers FROM performance_schema.setup_consumers WHERE enabled = 'YES' ORDER BY enabled_consumers; END$$

CREATE DEFINER=`mysql.sys`@`localhost` PROCEDURE `ps_setup_show_enabled_instruments`()
    READS SQL DATA
    DETERMINISTIC
    SQL SECURITY INVOKER
    COMMENT '\n Description\n \n Shows all currently enabled instruments.\n \n Parameters\n \n None\n \n Example\n \n mysql> CALL sys.ps_setup_show_enabled_instruments();\n '
BEGIN SELECT name AS enabled_instruments, timed FROM performance_schema.setup_instruments WHERE enabled = 'YES' ORDER BY enabled_instruments; END$$

CREATE DEFINER=`mysql.sys`@`localhost` PROCEDURE `ps_statement_avg_latency_histogram`()
    READS SQL DATA
    SQL SECURITY INVOKER
    COMMENT '\n Description\n \n Outputs a textual histogram graph of the average latency values\n across all normalized queries tracked within the Performance Schema\n events_statements_summary_by_digest table.\n \n Can be used to show a very high level picture of what kind of \n latency distribution statements running within this instance have.\n \n Parameters\n \n None.\n \n Example\n \n mysql> CALL sys.ps_statement_avg_latency_histogram()\\G\n *************************** 1. row ***************************\n Performance Schema Statement Digest Average Latency Histogram:\n \n . = 1 unit\n * = 2 units\n # = 3 units\n \n (0 - 38ms)     240 | ################################################################################\n (38 - 77ms)    38  | ......................................\n (77 - 115ms)   3   | ...\n (115 - 154ms)  62  | *******************************\n (154 - 192ms)  3   | ...\n (192 - 231ms)  0   |\n (231 - 269ms)  0   |\n (269 - 307ms)  0   |\n (307 - 346ms)  0   |\n (346 - 384ms)  1   | .\n (384 - 423ms)  1   | .\n (423 - 461ms)  0   |\n (461 - 499ms)  0   |\n (499 - 538ms)  0   |\n (538 - 576ms)  0   |\n (576 - 615ms)  1   | .\n \n Total Statements: 350; Buckets: 16; Bucket Size: 38 ms;\n '
BEGIN SELECT CONCAT('\n', '\n  . = 1 unit', '\n  * = 2 units', '\n  # = 3 units\n', @label := CONCAT(@label_inner := CONCAT('\n(0 - ', ROUND((@bucket_size := (SELECT ROUND((MAX(avg_us) - MIN(avg_us)) / (@buckets := 16)) AS size FROM sys.x$ps_digest_avg_latency_distribution)) / (@unit_div := 1000)), (@unit := 'ms'), ')'), REPEAT(' ', (@max_label_size := ((1 + LENGTH(ROUND((@bucket_size * 15) / @unit_div)) + 3 + LENGTH(ROUND(@bucket_size * 16) / @unit_div)) + 1)) - LENGTH(@label_inner)), @count_in_bucket := IFNULL((SELECT SUM(cnt) FROM sys.x$ps_digest_avg_latency_distribution AS b1  WHERE b1.avg_us <= @bucket_size), 0)), REPEAT(' ', (@max_label_len := (@max_label_size + LENGTH((@total_queries := (SELECT SUM(cnt) FROM sys.x$ps_digest_avg_latency_distribution)))) + 1) - LENGTH(@label)), '| ', IFNULL(REPEAT(IF(@count_in_bucket < (@one_unit := 40), '.', IF(@count_in_bucket < (@two_unit := 80), '*', '#')),  	             IF(@count_in_bucket < @one_unit, @count_in_bucket, 	             	IF(@count_in_bucket < @two_unit, @count_in_bucket / 2, @count_in_bucket / 3))), ''),  @label := CONCAT(@label_inner := CONCAT('\n(', ROUND(@bucket_size / @unit_div), ' - ', ROUND((@bucket_size * 2) / @unit_div), @unit, ')'), REPEAT(' ', @max_label_size - LENGTH(@label_inner)), @count_in_bucket := IFNULL((SELECT SUM(cnt) FROM sys.x$ps_digest_avg_latency_distribution AS b1  WHERE b1.avg_us > @bucket_size AND b1.avg_us <= @bucket_size * 2), 0)), REPEAT(' ', @max_label_len - LENGTH(@label)), '| ', IFNULL(REPEAT(IF(@count_in_bucket < @one_unit, '.', IF(@count_in_bucket < @two_unit, '*', '#')),  	             IF(@count_in_bucket < @one_unit, @count_in_bucket, 	             	IF(@count_in_bucket < @two_unit, @count_in_bucket / 2, @count_in_bucket / 3))), ''), @label := CONCAT(@label_inner := CONCAT('\n(', ROUND((@bucket_size * 2) / @unit_div), ' - ', ROUND((@bucket_size * 3) / @unit_div), @unit, ')'), REPEAT(' ', @max_label_size - LENGTH(@label_inner)), @count_in_bucket := IFNULL((SELECT SUM(cnt) FROM sys.x$ps_digest_avg_latency_distribution AS b1  WHERE b1.avg_us > @bucket_size * 2 AND b1.avg_us <= @bucket_size * 3), 0)), REPEAT(' ', @max_label_len - LENGTH(@label)), '| ', IFNULL(REPEAT(IF(@count_in_bucket < @one_unit, '.', IF(@count_in_bucket < @two_unit, '*', '#')),  	             IF(@count_in_bucket < @one_unit, @count_in_bucket, 	             	IF(@count_in_bucket < @two_unit, @count_in_bucket / 2, @count_in_bucket / 3))), ''), @label := CONCAT(@label_inner := CONCAT('\n(', ROUND((@bucket_size * 3) / @unit_div), ' - ', ROUND((@bucket_size * 4) / @unit_div), @unit, ')'), REPEAT(' ', @max_label_size - LENGTH(@label_inner)), @count_in_bucket := IFNULL((SELECT SUM(cnt) FROM sys.x$ps_digest_avg_latency_distribution AS b1  WHERE b1.avg_us > @bucket_size * 3 AND b1.avg_us <= @bucket_size * 4), 0)), REPEAT(' ', @max_label_len - LENGTH(@label)), '| ', IFNULL(REPEAT(IF(@count_in_bucket < @one_unit, '.', IF(@count_in_bucket < @two_unit, '*', '#')),  	             IF(@count_in_bucket < @one_unit, @count_in_bucket, 	             	IF(@count_in_bucket < @two_unit, @count_in_bucket / 2, @count_in_bucket / 3))), ''), @label := CONCAT(@label_inner := CONCAT('\n(', ROUND((@bucket_size * 4) / @unit_div), ' - ', ROUND((@bucket_size * 5) / @unit_div), @unit, ')'), REPEAT(' ', @max_label_size - LENGTH(@label_inner)), @count_in_bucket := IFNULL((SELECT SUM(cnt) FROM sys.x$ps_digest_avg_latency_distribution AS b1  WHERE b1.avg_us > @bucket_size * 4 AND b1.avg_us <= @bucket_size * 5), 0)), REPEAT(' ', @max_label_len - LENGTH(@label)), '| ', IFNULL(REPEAT(IF(@count_in_bucket < @one_unit, '.', IF(@count_in_bucket < @two_unit, '*', '#')),  	             IF(@count_in_bucket < @one_unit, @count_in_bucket, 	             	IF(@count_in_bucket < @two_unit, @count_in_bucket / 2, @count_in_bucket / 3))), ''), @label := CONCAT(@label_inner := CONCAT('\n(', ROUND((@bucket_size * 5) / @unit_div), ' - ', ROUND((@bucket_size * 6) / @unit_div), @unit, ')'), REPEAT(' ', @max_label_size - LENGTH(@label_inner)), @count_in_bucket := IFNULL((SELECT SUM(cnt) FROM sys.x$ps_digest_avg_latency_distribution AS b1  WHERE b1.avg_us > @bucket_size * 5 AND b1.avg_us <= @bucket_size * 6), 0)), REPEAT(' ', @max_label_len - LENGTH(@label)), '| ', IFNULL(REPEAT(IF(@count_in_bucket < @one_unit, '.', IF(@count_in_bucket < @two_unit, '*', '#')),  	             IF(@count_in_bucket < @one_unit, @count_in_bucket, 	             	IF(@count_in_bucket < @two_unit, @count_in_bucket / 2, @count_in_bucket / 3))), ''), @label := CONCAT(@label_inner := CONCAT('\n(', ROUND((@bucket_size * 6) / @unit_div), ' - ', ROUND((@bucket_size * 7) / @unit_div), @unit, ')'), REPEAT(' ', @max_label_size - LENGTH(@label_inner)), @count_in_bucket := IFNULL((SELECT SUM(cnt) FROM sys.x$ps_digest_avg_latency_distribution AS b1  WHERE b1.avg_us > @bucket_size * 6 AND b1.avg_us <= @bucket_size * 7), 0)), REPEAT(' ', @max_label_len - LENGTH(@label)), '| ', IFNULL(REPEAT(IF(@count_in_bucket < @one_unit, '.', IF(@count_in_bucket < @two_unit, '*', '#')),  	             IF(@count_in_bucket < @one_unit, @count_in_bucket, 	             	IF(@count_in_bucket < @two_unit, @count_in_bucket / 2, @count_in_bucket / 3))), ''), @label := CONCAT(@label_inner := CONCAT('\n(', ROUND((@bucket_size * 7) / @unit_div), ' - ', ROUND((@bucket_size * 8) / @unit_div), @unit, ')'), REPEAT(' ', @max_label_size - LENGTH(@label_inner)), @count_in_bucket := IFNULL((SELECT SUM(cnt) FROM sys.x$ps_digest_avg_latency_distribution AS b1  WHERE b1.avg_us > @bucket_size * 7 AND b1.avg_us <= @bucket_size * 8), 0)), REPEAT(' ', @max_label_len - LENGTH(@label)), '| ', IFNULL(REPEAT(IF(@count_in_bucket < @one_unit, '.', IF(@count_in_bucket < @two_unit, '*', '#')),  	             IF(@count_in_bucket < @one_unit, @count_in_bucket, 	             	IF(@count_in_bucket < @two_unit, @count_in_bucket / 2, @count_in_bucket / 3))), ''), @label := CONCAT(@label_inner := CONCAT('\n(', ROUND((@bucket_size * 8) / @unit_div), ' - ', ROUND((@bucket_size * 9) / @unit_div), @unit, ')'), REPEAT(' ', @max_label_size - LENGTH(@label_inner)), @count_in_bucket := IFNULL((SELECT SUM(cnt) FROM sys.x$ps_digest_avg_latency_distribution AS b1  WHERE b1.avg_us > @bucket_size * 8 AND b1.avg_us <= @bucket_size * 9), 0)), REPEAT(' ', @max_label_len - LENGTH(@label)), '| ', IFNULL(REPEAT(IF(@count_in_bucket < @one_unit, '.', IF(@count_in_bucket < @two_unit, '*', '#')),  	             IF(@count_in_bucket < @one_unit, @count_in_bucket, 	             	IF(@count_in_bucket < @two_unit, @count_in_bucket / 2, @count_in_bucket / 3))), ''), @label := CONCAT(@label_inner := CONCAT('\n(', ROUND((@bucket_size * 9) / @unit_div), ' - ', ROUND((@bucket_size * 10) / @unit_div), @unit, ')'), REPEAT(' ', @max_label_size - LENGTH(@label_inner)), @count_in_bucket := IFNULL((SELECT SUM(cnt) FROM sys.x$ps_digest_avg_latency_distribution AS b1  WHERE b1.avg_us > @bucket_size * 9 AND b1.avg_us <= @bucket_size * 10), 0)), REPEAT(' ', @max_label_len - LENGTH(@label)), '| ', IFNULL(REPEAT(IF(@count_in_bucket < @one_unit, '.', IF(@count_in_bucket < @two_unit, '*', '#')),  	             IF(@count_in_bucket < @one_unit, @count_in_bucket, 	             	IF(@count_in_bucket < @two_unit, @count_in_bucket / 2, @count_in_bucket / 3))), ''), @label := CONCAT(@label_inner := CONCAT('\n(', ROUND((@bucket_size * 10) / @unit_div), ' - ', ROUND((@bucket_size * 11) / @unit_div), @unit, ')'), REPEAT(' ', @max_label_size - LENGTH(@label_inner)), @count_in_bucket := IFNULL((SELECT SUM(cnt) FROM sys.x$ps_digest_avg_latency_distribution AS b1  WHERE b1.avg_us > @bucket_size * 10 AND b1.avg_us <= @bucket_size * 11), 0)), REPEAT(' ', @max_label_len - LENGTH(@label)), '| ', IFNULL(REPEAT(IF(@count_in_bucket < @one_unit, '.', IF(@count_in_bucket < @two_unit, '*', '#')),  	             IF(@count_in_bucket < @one_unit, @count_in_bucket, 	             	IF(@count_in_bucket < @two_unit, @count_in_bucket / 2, @count_in_bucket / 3))), ''), @label := CONCAT(@label_inner := CONCAT('\n(', ROUND((@bucket_size * 11) / @unit_div), ' - ', ROUND((@bucket_size * 12) / @unit_div), @unit, ')'), REPEAT(' ', @max_label_size - LENGTH(@label_inner)), @count_in_bucket := IFNULL((SELECT SUM(cnt) FROM sys.x$ps_digest_avg_latency_distribution AS b1  WHERE b1.avg_us > @bucket_size * 11 AND b1.avg_us <= @bucket_size * 12), 0)), REPEAT(' ', @max_label_len - LENGTH(@label)), '| ', IFNULL(REPEAT(IF(@count_in_bucket < @one_unit, '.', IF(@count_in_bucket < @two_unit, '*', '#')),  	             IF(@count_in_bucket < @one_unit, @count_in_bucket, 	             	IF(@count_in_bucket < @two_unit, @count_in_bucket / 2, @count_in_bucket / 3))), ''), @label := CONCAT(@label_inner := CONCAT('\n(', ROUND((@bucket_size * 12) / @unit_div), ' - ', ROUND((@bucket_size * 13) / @unit_div), @unit, ')'), REPEAT(' ', @max_label_size - LENGTH(@label_inner)), @count_in_bucket := IFNULL((SELECT SUM(cnt) FROM sys.x$ps_digest_avg_latency_distribution AS b1  WHERE b1.avg_us > @bucket_size * 12 AND b1.avg_us <= @bucket_size * 13), 0)), REPEAT(' ', @max_label_len - LENGTH(@label)), '| ', IFNULL(REPEAT(IF(@count_in_bucket < @one_unit, '.', IF(@count_in_bucket < @two_unit, '*', '#')),  	             IF(@count_in_bucket < @one_unit, @count_in_bucket, 	             	IF(@count_in_bucket < @two_unit, @count_in_bucket / 2, @count_in_bucket / 3))), ''), @label := CONCAT(@label_inner := CONCAT('\n(', ROUND((@bucket_size * 13) / @unit_div), ' - ', ROUND((@bucket_size * 14) / @unit_div), @unit, ')'), REPEAT(' ', @max_label_size - LENGTH(@label_inner)), @count_in_bucket := IFNULL((SELECT SUM(cnt) FROM sys.x$ps_digest_avg_latency_distribution AS b1  WHERE b1.avg_us > @bucket_size * 13 AND b1.avg_us <= @bucket_size * 14), 0)), REPEAT(' ', @max_label_len - LENGTH(@label)), '| ', IFNULL(REPEAT(IF(@count_in_bucket < @one_unit, '.', IF(@count_in_bucket < @two_unit, '*', '#')),  	             IF(@count_in_bucket < @one_unit, @count_in_bucket, 	             	IF(@count_in_bucket < @two_unit, @count_in_bucket / 2, @count_in_bucket / 3))), ''), @label := CONCAT(@label_inner := CONCAT('\n(', ROUND((@bucket_size * 14) / @unit_div), ' - ', ROUND((@bucket_size * 15) / @unit_div), @unit, ')'), REPEAT(' ', @max_label_size - LENGTH(@label_inner)), @count_in_bucket := IFNULL((SELECT SUM(cnt) FROM sys.x$ps_digest_avg_latency_distribution AS b1  WHERE b1.avg_us > @bucket_size * 14 AND b1.avg_us <= @bucket_size * 15), 0)), REPEAT(' ', @max_label_len - LENGTH(@label)), '| ', IFNULL(REPEAT(IF(@count_in_bucket < @one_unit, '.', IF(@count_in_bucket < @two_unit, '*', '#')),  	             IF(@count_in_bucket < @one_unit, @count_in_bucket, 	             	IF(@count_in_bucket < @two_unit, @count_in_bucket / 2, @count_in_bucket / 3))), ''), @label := CONCAT(@label_inner := CONCAT('\n(', ROUND((@bucket_size * 15) / @unit_div), ' - ', ROUND((@bucket_size * 16) / @unit_div), @unit, ')'), REPEAT(' ', @max_label_size - LENGTH(@label_inner)), @count_in_bucket := IFNULL((SELECT SUM(cnt) FROM sys.x$ps_digest_avg_latency_distribution AS b1  WHERE b1.avg_us > @bucket_size * 15 AND b1.avg_us <= @bucket_size * 16), 0)), REPEAT(' ', @max_label_len - LENGTH(@label)), '| ', IFNULL(REPEAT(IF(@count_in_bucket < @one_unit, '.', IF(@count_in_bucket < @two_unit, '*', '#')),  	             IF(@count_in_bucket < @one_unit, @count_in_bucket, 	             	IF(@count_in_bucket < @two_unit, @count_in_bucket / 2, @count_in_bucket / 3))), ''),  '\n\n  Total Statements: ', @total_queries, '; Buckets: ', @buckets , '; Bucket Size: ', ROUND(@bucket_size / @unit_div) , ' ', @unit, ';\n'  ) AS `Performance Schema Statement Digest Average Latency Histogram`;  END$$

CREATE DEFINER=`mysql.sys`@`localhost` PROCEDURE `ps_trace_statement_digest`( IN in_digest VARCHAR(32), IN in_runtime INT, IN in_interval DECIMAL(2,2), IN in_start_fresh BOOLEAN, IN in_auto_enable BOOLEAN )
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
    COMMENT '\n Description\n \n Traces all instrumentation within Performance Schema for a specific\n Statement Digest.\n \n When finding a statement of interest within the\n performance_schema.events_statements_summary_by_digest table, feed\n the DIGEST MD5 value in to this procedure, set how long to poll for,\n and at what interval to poll, and it will generate a report of all\n statistics tracked within Performance Schema for that digest for the\n interval.\n \n It will also attempt to generate an EXPLAIN for the longest running\n example of the digest during the interval. Note this may fail, as:\n \n * Performance Schema truncates long SQL_TEXT values (and hence the\n EXPLAIN will fail due to parse errors)\n * the default schema is sys (so tables that are not fully qualified\n in the query may not be found)\n * some queries such as SHOW are not supported in EXPLAIN.\n \n When the EXPLAIN fails, the error will be ignored and no EXPLAIN\n output generated.\n \n Requires the SUPER privilege for "SET sql_log_bin = 0;".\n \n Parameters\n \n in_digest (VARCHAR(32)):\n The statement digest identifier you would like to analyze\n in_runtime (INT):\n The number of seconds to run analysis for\n in_interval (DECIMAL(2,2)):\n The interval (in seconds, may be fractional) at which to try\n and take snapshots\n in_start_fresh (BOOLEAN):\n Whether to TRUNCATE the events_statements_history_long and\n events_stages_history_long tables before starting\n in_auto_enable (BOOLEAN):\n Whether to automatically turn on required consumers\n \n Example\n \n mysql> call ps_trace_statement_digest(''891ec6860f98ba46d89dd20b0c03652c'', 10, 0.1, true, true);\n +--------------------+\n | SUMMARY STATISTICS |\n +--------------------+\n | SUMMARY STATISTICS |\n +--------------------+\n 1 row in set (9.11 sec)\n \n +------------+-----------+-----------+-----------+---------------+------------+------------+\n | executions | exec_time | lock_time | rows_sent | rows_examined | tmp_tables | full_scans |\n +------------+-----------+-----------+-----------+---------------+------------+------------+\n |         21 | 4.11 ms   | 2.00 ms   |         0 |            21 |          0 |          0 |\n +------------+-----------+-----------+-----------+---------------+------------+------------+\n 1 row in set (9.11 sec)\n \n +------------------------------------------+-------+-----------+\n | event_name                               | count | latency   |\n +------------------------------------------+-------+-----------+\n | stage/sql/checking query cache for query |    16 | 724.37 us |\n | stage/sql/statistics                     |    16 | 546.92 us |\n | stage/sql/freeing items                  |    18 | 520.11 us |\n | stage/sql/init                           |    51 | 466.80 us |\n ...\n | stage/sql/cleaning up                    |    18 | 11.92 us  |\n | stage/sql/executing                      |    16 | 6.95 us   |\n +------------------------------------------+-------+-----------+\n 17 rows in set (9.12 sec)\n \n +---------------------------+\n | LONGEST RUNNING STATEMENT |\n +---------------------------+\n | LONGEST RUNNING STATEMENT |\n +---------------------------+\n 1 row in set (9.16 sec)\n \n +-----------+-----------+-----------+-----------+---------------+------------+-----------+\n | thread_id | exec_time | lock_time | rows_sent | rows_examined | tmp_tables | full_scan |\n +-----------+-----------+-----------+-----------+---------------+------------+-----------+\n |    166646 | 618.43 us | 1.00 ms   |         0 |             1 |          0 |         0 |\n +-----------+-----------+-----------+-----------+---------------+------------+-----------+\n 1 row in set (9.16 sec)\n \n // Truncated for clarity...\n +-----------------------------------------------------------------+\n | sql_text                                                        |\n +-----------------------------------------------------------------+\n | select hibeventhe0_.id as id1382_, hibeventhe0_.createdTime ... |\n +-----------------------------------------------------------------+\n 1 row in set (9.17 sec)\n \n +------------------------------------------+-----------+\n | event_name                               | latency   |\n +------------------------------------------+-----------+\n | stage/sql/init                           | 8.61 us   |\n | stage/sql/Waiting for query cache lock   | 453.23 us |\n | stage/sql/init                           | 331.07 ns |\n | stage/sql/checking query cache for query | 43.04 us  |\n ...\n | stage/sql/freeing items                  | 30.46 us  |\n | stage/sql/cleaning up                    | 662.13 ns |\n +------------------------------------------+-----------+\n 18 rows in set (9.23 sec)\n \n +----+-------------+--------------+-------+---------------+-----------+---------+-------------+------+-------+\n | id | select_type | table        | type  | possible_keys | key       | key_len | ref         | rows | Extra |\n +----+-------------+--------------+-------+---------------+-----------+---------+-------------+------+-------+\n |  1 | SIMPLE      | hibeventhe0_ | const | fixedTime     | fixedTime | 775     | const,const |    1 | NULL  |\n +----+-------------+--------------+-------+---------------+-----------+---------+-------------+------+-------+\n 1 row in set (9.27 sec)\n \n Query OK, 0 rows affected (9.28 sec)\n '
BEGIN  DECLARE v_start_fresh BOOLEAN DEFAULT false; DECLARE v_auto_enable BOOLEAN DEFAULT false; DECLARE v_explain     BOOLEAN DEFAULT true; DECLARE v_this_thread_enabed ENUM('YES', 'NO'); DECLARE v_runtime INT DEFAULT 0; DECLARE v_start INT DEFAULT 0; DECLARE v_found_stmts INT;  SET @log_bin := @@sql_log_bin; SET sql_log_bin = 0;  SELECT INSTRUMENTED INTO v_this_thread_enabed FROM performance_schema.threads WHERE PROCESSLIST_ID = CONNECTION_ID(); CALL sys.ps_setup_disable_thread(CONNECTION_ID());  DROP TEMPORARY TABLE IF EXISTS stmt_trace; CREATE TEMPORARY TABLE stmt_trace ( thread_id BIGINT UNSIGNED, timer_start BIGINT UNSIGNED, event_id BIGINT UNSIGNED, sql_text longtext, timer_wait BIGINT UNSIGNED, lock_time BIGINT UNSIGNED, errors BIGINT UNSIGNED, mysql_errno INT, rows_sent BIGINT UNSIGNED, rows_affected BIGINT UNSIGNED, rows_examined BIGINT UNSIGNED, created_tmp_tables BIGINT UNSIGNED, created_tmp_disk_tables BIGINT UNSIGNED, no_index_used BIGINT UNSIGNED, PRIMARY KEY (thread_id, timer_start) );  DROP TEMPORARY TABLE IF EXISTS stmt_stages; CREATE TEMPORARY TABLE stmt_stages ( event_id BIGINT UNSIGNED, stmt_id BIGINT UNSIGNED, event_name VARCHAR(128), timer_wait BIGINT UNSIGNED, PRIMARY KEY (event_id) );  SET v_start_fresh = in_start_fresh; IF v_start_fresh THEN TRUNCATE TABLE performance_schema.events_statements_history_long; TRUNCATE TABLE performance_schema.events_stages_history_long; END IF;  SET v_auto_enable = in_auto_enable; IF v_auto_enable THEN CALL sys.ps_setup_save(0);  UPDATE performance_schema.threads SET INSTRUMENTED = IF(PROCESSLIST_ID IS NOT NULL, 'YES', 'NO');  UPDATE performance_schema.setup_consumers SET ENABLED = 'YES' WHERE NAME NOT LIKE '%\_history' AND NAME NOT LIKE 'events_wait%' AND NAME NOT LIKE 'events_transactions%' AND NAME <> 'statements_digest';  UPDATE performance_schema.setup_instruments SET ENABLED = 'YES', TIMED   = 'YES' WHERE NAME LIKE 'statement/%' OR NAME LIKE 'stage/%'; END IF;  WHILE v_runtime < in_runtime DO SELECT UNIX_TIMESTAMP() INTO v_start;  INSERT IGNORE INTO stmt_trace SELECT thread_id, timer_start, event_id, sql_text, timer_wait, lock_time, errors, mysql_errno,  rows_sent, rows_affected, rows_examined, created_tmp_tables, created_tmp_disk_tables, no_index_used FROM performance_schema.events_statements_history_long WHERE digest = in_digest;  INSERT IGNORE INTO stmt_stages SELECT stages.event_id, stmt_trace.event_id, stages.event_name, stages.timer_wait FROM performance_schema.events_stages_history_long AS stages JOIN stmt_trace ON stages.nesting_event_id = stmt_trace.event_id;  SELECT SLEEP(in_interval) INTO @sleep; SET v_runtime = v_runtime + (UNIX_TIMESTAMP() - v_start); END WHILE;  SELECT "SUMMARY STATISTICS";  SELECT COUNT(*) executions, sys.format_time(SUM(timer_wait)) AS exec_time, sys.format_time(SUM(lock_time)) AS lock_time, SUM(rows_sent) AS rows_sent, SUM(rows_affected) AS rows_affected, SUM(rows_examined) AS rows_examined, SUM(created_tmp_tables) AS tmp_tables, SUM(no_index_used) AS full_scans FROM stmt_trace;  SELECT event_name, COUNT(*) as count, sys.format_time(SUM(timer_wait)) as latency FROM stmt_stages GROUP BY event_name ORDER BY SUM(timer_wait) DESC;  SELECT "LONGEST RUNNING STATEMENT";  SELECT thread_id, sys.format_time(timer_wait) AS exec_time, sys.format_time(lock_time) AS lock_time, rows_sent, rows_affected, rows_examined, created_tmp_tables AS tmp_tables, no_index_used AS full_scan FROM stmt_trace ORDER BY timer_wait DESC LIMIT 1;  SELECT sql_text FROM stmt_trace ORDER BY timer_wait DESC LIMIT 1;  SELECT sql_text, event_id INTO @sql, @sql_id FROM stmt_trace ORDER BY timer_wait DESC LIMIT 1;  IF (@sql_id IS NOT NULL) THEN SELECT event_name, sys.format_time(timer_wait) as latency FROM stmt_stages WHERE stmt_id = @sql_id ORDER BY event_id; END IF;  DROP TEMPORARY TABLE stmt_trace; DROP TEMPORARY TABLE stmt_stages;  IF (@sql IS NOT NULL) THEN SET @stmt := CONCAT("EXPLAIN FORMAT=JSON ", @sql); BEGIN DECLARE CONTINUE HANDLER FOR 1064, 1146 SET v_explain = false;  PREPARE explain_stmt FROM @stmt; END;  IF (v_explain) THEN EXECUTE explain_stmt; DEALLOCATE PREPARE explain_stmt; END IF; END IF;  IF v_auto_enable THEN CALL sys.ps_setup_reload_saved(); END IF; IF (v_this_thread_enabed = 'YES') THEN CALL sys.ps_setup_enable_thread(CONNECTION_ID()); END IF;  SET sql_log_bin = @log_bin; END$$

CREATE DEFINER=`mysql.sys`@`localhost` PROCEDURE `ps_trace_thread`( IN in_thread_id BIGINT UNSIGNED, IN in_outfile VARCHAR(255), IN in_max_runtime DECIMAL(20,2), IN in_interval DECIMAL(20,2), IN in_start_fresh BOOLEAN, IN in_auto_setup BOOLEAN, IN in_debug BOOLEAN )
    MODIFIES SQL DATA
    SQL SECURITY INVOKER
    COMMENT '\n Description\n \n Dumps all data within Performance Schema for an instrumented thread,\n to create a DOT formatted graph file. \n \n Each resultset returned from the procedure should be used for a complete graph\n \n Requires the SUPER privilege for "SET sql_log_bin = 0;".\n \n Parameters\n \n in_thread_id (BIGINT UNSIGNED):\n The thread that you would like a stack trace for\n in_outfile  (VARCHAR(255)):\n The filename the dot file will be written to\n in_max_runtime (DECIMAL(20,2)):\n The maximum time to keep collecting data.\n Use NULL to get the default which is 60 seconds.\n in_interval (DECIMAL(20,2)): \n How long to sleep between data collections. \n Use NULL to get the default which is 1 second.\n in_start_fresh (BOOLEAN):\n Whether to reset all Performance Schema data before tracing.\n in_auto_setup (BOOLEAN):\n Whether to disable all other threads and enable all consumers/instruments. \n This will also reset the settings at the end of the run.\n in_debug (BOOLEAN):\n Whether you would like to include file:lineno in the graph\n \n Example\n \n mysql> CALL sys.ps_trace_thread(25, CONCAT(''/tmp/stack-'', REPLACE(NOW(), '' '', ''-''), ''.dot''), NULL, NULL, TRUE, TRUE, TRUE);\n +-------------------+\n | summary           |\n +-------------------+\n | Disabled 1 thread |\n +-------------------+\n 1 row in set (0.00 sec)\n \n +---------------------------------------------+\n | Info                                        |\n +---------------------------------------------+\n | Data collection starting for THREAD_ID = 25 |\n +---------------------------------------------+\n 1 row in set (0.03 sec)\n \n +-----------------------------------------------------------+\n | Info                                                      |\n +-----------------------------------------------------------+\n | Stack trace written to /tmp/stack-2014-02-16-21:18:41.dot |\n +-----------------------------------------------------------+\n 1 row in set (60.07 sec)\n \n +-------------------------------------------------------------------+\n | Convert to PDF                                                    |\n +-------------------------------------------------------------------+\n | dot -Tpdf -o /tmp/stack_25.pdf /tmp/stack-2014-02-16-21:18:41.dot |\n +-------------------------------------------------------------------+\n 1 row in set (60.07 sec)\n \n +-------------------------------------------------------------------+\n | Convert to PNG                                                    |\n +-------------------------------------------------------------------+\n | dot -Tpng -o /tmp/stack_25.png /tmp/stack-2014-02-16-21:18:41.dot |\n +-------------------------------------------------------------------+\n 1 row in set (60.07 sec)\n \n +------------------+\n | summary          |\n +------------------+\n | Enabled 1 thread |\n +------------------+\n 1 row in set (60.32 sec)\n '
BEGIN DECLARE v_done bool DEFAULT FALSE; DECLARE v_start, v_runtime DECIMAL(20,2) DEFAULT 0.0; DECLARE v_min_event_id bigint unsigned DEFAULT 0; DECLARE v_this_thread_enabed ENUM('YES', 'NO'); DECLARE v_event longtext; DECLARE c_stack CURSOR FOR SELECT CONCAT(IF(nesting_event_id IS NOT NULL, CONCAT(nesting_event_id, ' -> '), ''),  event_id, '; ', event_id, ' [label="', '(', sys.format_time(timer_wait), ') ', IF (event_name NOT LIKE 'wait/io%',  SUBSTRING_INDEX(event_name, '/', -2),  IF (event_name NOT LIKE 'wait/io/file%' OR event_name NOT LIKE 'wait/io/socket%', SUBSTRING_INDEX(event_name, '/', -4), event_name) ), IF (event_name LIKE 'transaction', IFNULL(CONCAT('\\n', wait_info), ''), ''), IF (event_name LIKE 'statement/%', IFNULL(CONCAT('\\n', wait_info), ''), ''), IF (in_debug AND event_name LIKE 'wait%', wait_info, ''), '", ',  CASE WHEN event_name LIKE 'wait/io/file%' THEN  'shape=box, style=filled, color=red' WHEN event_name LIKE 'wait/io/table%' THEN  'shape=box, style=filled, color=green' WHEN event_name LIKE 'wait/io/socket%' THEN 'shape=box, style=filled, color=yellow' WHEN event_name LIKE 'wait/synch/mutex%' THEN 'style=filled, color=lightskyblue' WHEN event_name LIKE 'wait/synch/cond%' THEN 'style=filled, color=darkseagreen3' WHEN event_name LIKE 'wait/synch/rwlock%' THEN 'style=filled, color=orchid' WHEN event_name LIKE 'wait/synch/sxlock%' THEN 'style=filled, color=palevioletred'  WHEN event_name LIKE 'wait/lock%' THEN 'shape=box, style=filled, color=tan' WHEN event_name LIKE 'statement/%' THEN CONCAT('shape=box, style=bold', CASE WHEN event_name LIKE 'statement/com/%' THEN ' style=filled, color=darkseagreen' ELSE IF((timer_wait/1000000000000) > @@long_query_time,  ' style=filled, color=red',  ' style=filled, color=lightblue') END ) WHEN event_name LIKE 'transaction' THEN 'shape=box, style=filled, color=lightblue3' WHEN event_name LIKE 'stage/%' THEN 'style=filled, color=slategray3' WHEN event_name LIKE '%idle%' THEN 'shape=box, style=filled, color=firebrick3' ELSE '' END, '];\n' ) event, event_id FROM ( (SELECT thread_id, event_id, event_name, timer_wait, timer_start, nesting_event_id, CONCAT('trx_id: ',  IFNULL(trx_id, ''), '\\n', 'gtid: ', IFNULL(gtid, ''), '\\n', 'state: ', state, '\\n', 'mode: ', access_mode, '\\n', 'isolation: ', isolation_level, '\\n', 'autocommit: ', autocommit, '\\n', 'savepoints: ', number_of_savepoints, '\\n' ) AS wait_info FROM performance_schema.events_transactions_history_long WHERE thread_id = in_thread_id AND event_id > v_min_event_id) UNION (SELECT thread_id, event_id, event_name, timer_wait, timer_start, nesting_event_id,  CONCAT('statement: ', sql_text, '\\n', 'errors: ', errors, '\\n', 'warnings: ', warnings, '\\n', 'lock time: ', sys.format_time(lock_time),'\\n', 'rows affected: ', rows_affected, '\\n', 'rows sent: ', rows_sent, '\\n', 'rows examined: ', rows_examined, '\\n', 'tmp tables: ', created_tmp_tables, '\\n', 'tmp disk tables: ', created_tmp_disk_tables, '\\n' 'select scan: ', select_scan, '\\n', 'select full join: ', select_full_join, '\\n', 'select full range join: ', select_full_range_join, '\\n', 'select range: ', select_range, '\\n', 'select range check: ', select_range_check, '\\n',  'sort merge passes: ', sort_merge_passes, '\\n', 'sort rows: ', sort_rows, '\\n', 'sort range: ', sort_range, '\\n', 'sort scan: ', sort_scan, '\\n', 'no index used: ', IF(no_index_used, 'TRUE', 'FALSE'), '\\n', 'no good index used: ', IF(no_good_index_used, 'TRUE', 'FALSE'), '\\n' ) AS wait_info FROM performance_schema.events_statements_history_long WHERE thread_id = in_thread_id AND event_id > v_min_event_id) UNION (SELECT thread_id, event_id, event_name, timer_wait, timer_start, nesting_event_id, null AS wait_info FROM performance_schema.events_stages_history_long  WHERE thread_id = in_thread_id AND event_id > v_min_event_id) UNION  (SELECT thread_id, event_id,  CONCAT(event_name,  IF(event_name NOT LIKE 'wait/synch/mutex%', IFNULL(CONCAT(' - ', operation), ''), ''),  IF(number_of_bytes IS NOT NULL, CONCAT(' ', number_of_bytes, ' bytes'), ''), IF(event_name LIKE 'wait/io/file%', '\\n', ''), IF(object_schema IS NOT NULL, CONCAT('\\nObject: ', object_schema, '.'), ''),  IF(object_name IS NOT NULL,  IF (event_name LIKE 'wait/io/socket%', CONCAT('\\n', IF (object_name LIKE ':0%', @@socket, object_name)), object_name), '' ), IF(index_name IS NOT NULL, CONCAT(' Index: ', index_name), ''), '\\n' ) AS event_name, timer_wait, timer_start, nesting_event_id, source AS wait_info FROM performance_schema.events_waits_history_long WHERE thread_id = in_thread_id AND event_id > v_min_event_id) ) events  ORDER BY event_id; DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_done = TRUE;  SET @log_bin := @@sql_log_bin; SET sql_log_bin = 0;  SELECT INSTRUMENTED INTO v_this_thread_enabed FROM performance_schema.threads WHERE PROCESSLIST_ID = CONNECTION_ID(); CALL sys.ps_setup_disable_thread(CONNECTION_ID());  IF (in_auto_setup) THEN CALL sys.ps_setup_save(0);  DELETE FROM performance_schema.setup_actors;  UPDATE performance_schema.threads SET INSTRUMENTED = IF(THREAD_ID = in_thread_id, 'YES', 'NO');  UPDATE performance_schema.setup_consumers SET ENABLED = 'YES' WHERE NAME NOT LIKE '%\_history';  UPDATE performance_schema.setup_instruments SET ENABLED = 'YES', TIMED   = 'YES'; END IF;  IF (in_start_fresh) THEN TRUNCATE performance_schema.events_transactions_history_long; TRUNCATE performance_schema.events_statements_history_long; TRUNCATE performance_schema.events_stages_history_long; TRUNCATE performance_schema.events_waits_history_long; END IF;  DROP TEMPORARY TABLE IF EXISTS tmp_events; CREATE TEMPORARY TABLE tmp_events ( event_id bigint unsigned NOT NULL, event longblob, PRIMARY KEY (event_id) );  INSERT INTO tmp_events VALUES (0, CONCAT('digraph events { rankdir=LR; nodesep=0.10;\n', '// Stack created .....: ', NOW(), '\n', '// MySQL version .....: ', VERSION(), '\n', '// MySQL hostname ....: ', @@hostname, '\n', '// MySQL port ........: ', @@port, '\n', '// MySQL socket ......: ', @@socket, '\n', '// MySQL user ........: ', CURRENT_USER(), '\n'));  SELECT CONCAT('Data collection starting for THREAD_ID = ', in_thread_id) AS 'Info';  SET v_min_event_id = 0, v_start        = UNIX_TIMESTAMP(), in_interval    = IFNULL(in_interval, 1.00), in_max_runtime = IFNULL(in_max_runtime, 60.00);  WHILE (v_runtime < in_max_runtime AND (SELECT INSTRUMENTED FROM performance_schema.threads WHERE THREAD_ID = in_thread_id) = 'YES') DO SET v_done = FALSE; OPEN c_stack; c_stack_loop: LOOP FETCH c_stack INTO v_event, v_min_event_id; IF v_done THEN LEAVE c_stack_loop; END IF;  IF (LENGTH(v_event) > 0) THEN INSERT INTO tmp_events VALUES (v_min_event_id, v_event); END IF; END LOOP; CLOSE c_stack;  SELECT SLEEP(in_interval) INTO @sleep; SET v_runtime = (UNIX_TIMESTAMP() - v_start); END WHILE;  INSERT INTO tmp_events VALUES (v_min_event_id+1, '}');  SET @query = CONCAT('SELECT event FROM tmp_events ORDER BY event_id INTO OUTFILE ''', in_outfile, ''' FIELDS ESCAPED BY '''' LINES TERMINATED BY '''''); PREPARE stmt_output FROM @query; EXECUTE stmt_output; DEALLOCATE PREPARE stmt_output;  SELECT CONCAT('Stack trace written to ', in_outfile) AS 'Info'; SELECT CONCAT('dot -Tpdf -o /tmp/stack_', in_thread_id, '.pdf ', in_outfile) AS 'Convert to PDF'; SELECT CONCAT('dot -Tpng -o /tmp/stack_', in_thread_id, '.png ', in_outfile) AS 'Convert to PNG'; DROP TEMPORARY TABLE tmp_events;  IF (in_auto_setup) THEN CALL sys.ps_setup_reload_saved(); END IF; IF (v_this_thread_enabed = 'YES') THEN CALL sys.ps_setup_enable_thread(CONNECTION_ID()); END IF;  SET sql_log_bin = @log_bin; END$$

CREATE DEFINER=`mysql.sys`@`localhost` PROCEDURE `ps_truncate_all_tables`( IN in_verbose BOOLEAN )
    MODIFIES SQL DATA
    DETERMINISTIC
    SQL SECURITY INVOKER
    COMMENT '\n Description\n \n Truncates all summary tables within Performance Schema, \n resetting all aggregated instrumentation as a snapshot.\n \n Parameters\n \n in_verbose (BOOLEAN):\n Whether to print each TRUNCATE statement before running\n \n Example\n \n mysql> CALL sys.ps_truncate_all_tables(false);\n +---------------------+\n | summary             |\n +---------------------+\n | Truncated 44 tables |\n +---------------------+\n 1 row in set (0.10 sec)\n \n Query OK, 0 rows affected (0.10 sec)\n '
BEGIN DECLARE v_done INT DEFAULT FALSE; DECLARE v_total_tables INT DEFAULT 0; DECLARE v_ps_table VARCHAR(64); DECLARE ps_tables CURSOR FOR SELECT table_name  FROM INFORMATION_SCHEMA.TABLES  WHERE table_schema = 'performance_schema'  AND (table_name LIKE '%summary%'  OR table_name LIKE '%history%'); DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_done = TRUE;  OPEN ps_tables;  ps_tables_loop: LOOP FETCH ps_tables INTO v_ps_table; IF v_done THEN LEAVE ps_tables_loop; END IF;  SET @truncate_stmt := CONCAT('TRUNCATE TABLE performance_schema.', v_ps_table); IF in_verbose THEN SELECT CONCAT('Running: ', @truncate_stmt) AS status; END IF;  PREPARE truncate_stmt FROM @truncate_stmt; EXECUTE truncate_stmt; DEALLOCATE PREPARE truncate_stmt;  SET v_total_tables = v_total_tables + 1; END LOOP;  CLOSE ps_tables;  SELECT CONCAT('Truncated ', v_total_tables, ' tables') AS summary;  END$$

CREATE DEFINER=`mysql.sys`@`localhost` PROCEDURE `statement_performance_analyzer`( IN in_action ENUM('snapshot', 'overall', 'delta', 'create_table', 'create_tmp', 'save', 'cleanup'), IN in_table VARCHAR(129), IN in_views SET ('with_runtimes_in_95th_percentile', 'analysis', 'with_errors_or_warnings', 'with_full_table_scans', 'with_sorting', 'with_temp_tables', 'custom') )
    SQL SECURITY INVOKER
    COMMENT '\n Description\n \n Create a report of the statements running on the server.\n \n The views are calculated based on the overall and/or delta activity.\n \n Requires the SUPER privilege for "SET sql_log_bin = 0;".\n \n Parameters\n \n in_action (ENUM(''snapshot'', ''overall'', ''delta'', ''create_tmp'', ''create_table'', ''save'', ''cleanup'')):\n The action to take. Supported actions are:\n * snapshot      Store a snapshot. The default is to make a snapshot of the current content of\n performance_schema.events_statements_summary_by_digest, but by setting in_table\n this can be overwritten to copy the content of the specified table.\n The snapshot is stored in the sys.tmp_digests temporary table.\n * overall       Generate analyzis based on the content specified by in_table. For the overall analyzis,\n in_table can be NOW() to use a fresh snapshot. This will overwrite an existing snapshot.\n Use NULL for in_table to use the existing snapshot. If in_table IS NULL and no snapshot\n exists, a new will be created.\n See also in_views and @sys.statement_performance_analyzer.limit.\n * delta         Generate a delta analysis. The delta will be calculated between the reference table in\n in_table and the snapshot. An existing snapshot must exist.\n The action uses the sys.tmp_digests_delta temporary table.\n See also in_views and @sys.statement_performance_analyzer.limit.\n * create_table  Create a regular table suitable for storing the snapshot for later use, e.g. for\n calculating deltas.\n * create_tmp    Create a temporary table suitable for storing the snapshot for later use, e.g. for\n calculating deltas.\n * save          Save the snapshot in the table specified by in_table. The table must exists and have\n the correct structure.\n If no snapshot exists, a new is created.\n * cleanup       Remove the temporary tables used for the snapshot and delta.\n \n in_table (VARCHAR(129)):\n The table argument used for some actions. Use the format ''db1.t1'' or ''t1'' without using any backticks (`)\n for quoting. Periods (.) are not supported in the database and table names.\n \n The meaning of the table for each action supporting the argument is:\n \n * snapshot      The snapshot is created based on the specified table. Set to NULL or NOW() to use\n the current content of performance_schema.events_statements_summary_by_digest.\n * overall       The table with the content to create the overall analyzis for. The following values\n can be used:\n - A table name - use the content of that table.\n - NOW()        - create a fresh snapshot and overwrite the existing snapshot.\n - NULL         - use the last stored snapshot.\n * delta         The table name is mandatory and specified the reference view to compare the currently\n stored snapshot against. If no snapshot exists, a new will be created.\n * create_table  The name of the regular table to create.\n * create_tmp    The name of the temporary table to create.\n * save          The name of the table to save the currently stored snapshot into.\n \n in_views (SET (''with_runtimes_in_95th_percentile'', ''analysis'', ''with_errors_or_warnings'',\n ''with_full_table_scans'', ''with_sorting'', ''with_temp_tables'', ''custom''))\n Which views to include:  * with_runtimes_in_95th_percentile  Based on the sys.statements_with_runtimes_in_95th_percentile view * analysis                          Based on the sys.statement_analysis view * with_errors_or_warnings           Based on the sys.statements_with_errors_or_warnings view * with_full_table_scans             Based on the sys.statements_with_full_table_scans view * with_sorting                      Based on the sys.statements_with_sorting view * with_temp_tables                  Based on the sys.statements_with_temp_tables view * custom                            Use a custom view. This view must be specified in @sys.statement_performance_analyzer.view to an existing view or a query  Default is to include all except ''custom''.   Configuration Options  sys.statement_performance_analyzer.limit The maximum number of rows to include for the views that does not have a built-in limit (e.g. the 95th percentile view). If not set the limit is 100.  sys.statement_performance_analyzer.view Used together with the ''custom'' view. If the value contains a space, it is considered a query, otherwise it must be an existing view querying the performance_schema.events_statements_summary_by_digest table. There cannot be any limit clause including in the query or view definition if @sys.statement_performance_analyzer.limit > 0. If specifying a view, use the same format as for in_table.  sys.debug Whether to provide debugging output. Default is ''OFF''. Set to ''ON'' to include.   Example  To create a report with the queries in the 95th percentile since last truncate of performance_schema.events_statements_summary_by_digest and the delta for a 1 minute period:  1. Create a temporary table to store the initial snapshot. 2. Create the initial snapshot. 3. Save the initial snapshot in the temporary table. 4. Wait one minute. 5. Create a new snapshot. 6. Perform analyzis based on the new snapshot. 7. Perform analyzis based on the delta between the initial and new snapshots.  mysql> CALL sys.statement_performance_analyzer(''create_tmp'', ''mydb.tmp_digests_ini'', NULL); Query OK, 0 rows affected (0.08 sec)  mysql> CALL sys.statement_performance_analyzer(''snapshot'', NULL, NULL); Query OK, 0 rows affected (0.02 sec)  mysql> CALL sys.statement_performance_analyzer(''save'', ''mydb.tmp_digests_ini'', NULL); Query OK, 0 rows affected (0.00 sec)  mysql> DO SLEEP(60); Query OK, 0 rows affected (1 min 0.00 sec)  mysql> CALL sys.statement_performance_analyzer(''snapshot'', NULL, NULL); Query OK, 0 rows affected (0.02 sec)  mysql> CALL sys.statement_performance_analyzer(''overall'', NULL, ''with_runtimes_in_95th_percentile''); +-----------------------------------------+ | Next Output                             | +-----------------------------------------+ | Queries with Runtime in 95th Percentile | +-----------------------------------------+ 1 row in set (0.05 sec)  ...  mysql> CALL sys.statement_performance_analyzer(''delta'', ''mydb.tmp_digests_ini'', ''with_runtimes_in_95th_percentile''); +-----------------------------------------+ | Next Output                             | +-----------------------------------------+ | Queries with Runtime in 95th Percentile | +-----------------------------------------+ 1 row in set (0.03 sec)  ...   To create an overall report of the 95th percentile queries and the top 10 queries with full table scans:  mysql> CALL sys.statement_performance_analyzer(''snapshot'', NULL, NULL); Query OK, 0 rows affected (0.01 sec)  mysql> SET @sys.statement_performance_analyzer.limit = 10; Query OK, 0 rows affected (0.00 sec)  mysql> CALL sys.statement_performance_analyzer(''overall'', NULL, ''with_runtimes_in_95th_percentile,with_full_table_scans''); +-----------------------------------------+ | Next Output                             | +-----------------------------------------+ | Queries with Runtime in 95th Percentile | +-----------------------------------------+ 1 row in set (0.01 sec)  ...  +-------------------------------------+ | Next Output                         | +-------------------------------------+ | Top 10 Queries with Full Table Scan | +-------------------------------------+ 1 row in set (0.09 sec)  ...   Use a custom view showing the top 10 query sorted by total execution time refreshing the view every minute using the watch command in Linux.  mysql> CREATE OR REPLACE VIEW mydb.my_statements AS -> SELECT sys.format_statement(DIGEST_TEXT) AS query, ->        SCHEMA_NAME AS db, ->        COUNT_STAR AS exec_count, ->        sys.format_time(SUM_TIMER_WAIT) AS total_latency, ->        sys.format_time(AVG_TIMER_WAIT) AS avg_latency, ->        ROUND(IFNULL(SUM_ROWS_SENT / NULLIF(COUNT_STAR, 0), 0)) AS rows_sent_avg, ->        ROUND(IFNULL(SUM_ROWS_EXAMINED / NULLIF(COUNT_STAR, 0), 0)) AS rows_examined_avg, ->        ROUND(IFNULL(SUM_ROWS_AFFECTED / NULLIF(COUNT_STAR, 0), 0)) AS rows_affected_avg, ->        DIGEST AS digest ->   FROM performance_schema.events_statements_summary_by_digest -> ORDER BY SUM_TIMER_WAIT DESC; Query OK, 0 rows affected (0.01 sec)  mysql> CALL sys.statement_performance_analyzer(''create_table'', ''mydb.digests_prev'', NULL); Query OK, 0 rows affected (0.10 sec)  shell$ watch -n 60 "mysql sys --table -e " > SET @sys.statement_performance_analyzer.view = ''mydb.my_statements''; > SET @sys.statement_performance_analyzer.limit = 10; > CALL statement_performance_analyzer(''snapshot'', NULL, NULL); > CALL statement_performance_analyzer(''delta'', ''mydb.digests_prev'', ''custom''); > CALL statement_performance_analyzer(''save'', ''mydb.digests_prev'', NULL); > ""  Every 60.0s: mysql sys --table -e "                                                                                                   ...  Mon Dec 22 10:58:51 2014  +----------------------------------+ | Next Output                      | +----------------------------------+ | Top 10 Queries Using Custom View | +----------------------------------+ +-------------------+-------+------------+---------------+-------------+---------------+-------------------+-------------------+----------------------------------+ | query             | db    | exec_count | total_latency | avg_latency | rows_sent_avg | rows_examined_avg | rows_affected_avg | digest                           | +-------------------+-------+------------+---------------+-------------+---------------+-------------------+-------------------+----------------------------------+ ... '
BEGIN DECLARE v_table_exists, v_tmp_digests_table_exists, v_custom_view_exists ENUM('', 'BASE TABLE', 'VIEW', 'TEMPORARY') DEFAULT ''; DECLARE v_this_thread_enabled ENUM('YES', 'NO'); DECLARE v_force_new_snapshot BOOLEAN DEFAULT FALSE; DECLARE v_digests_table VARCHAR(133); DECLARE v_quoted_table, v_quoted_custom_view VARCHAR(133) DEFAULT ''; DECLARE v_table_db, v_table_name, v_custom_db, v_custom_name VARCHAR(64); DECLARE v_digest_table_template, v_checksum_ref, v_checksum_table text; DECLARE v_sql longtext; DECLARE v_error_msg VARCHAR(128);   SELECT INSTRUMENTED INTO v_this_thread_enabled FROM performance_schema.threads WHERE PROCESSLIST_ID = CONNECTION_ID(); IF (v_this_thread_enabled = 'YES') THEN CALL sys.ps_setup_disable_thread(CONNECTION_ID()); END IF;  SET @log_bin := @@sql_log_bin; IF (@log_bin = 1) THEN SET sql_log_bin = 0; END IF;   IF (@sys.statement_performance_analyzer.limit IS NULL) THEN SET @sys.statement_performance_analyzer.limit = sys.sys_get_config('statement_performance_analyzer.limit', '100'); END IF; IF (@sys.debug IS NULL) THEN SET @sys.debug                                = sys.sys_get_config('debug'                               , 'OFF'); END IF;   IF (in_table = 'NOW()') THEN SET v_force_new_snapshot = TRUE, in_table             = NULL; ELSEIF (in_table IS NOT NULL) THEN IF (NOT INSTR(in_table, '.')) THEN SET v_table_db   = DATABASE(), v_table_name = in_table; ELSE SET v_table_db   = SUBSTRING_INDEX(in_table, '.', 1); SET v_table_name = SUBSTRING(in_table, CHAR_LENGTH(v_table_db)+2); END IF;  SET v_quoted_table = CONCAT('`', v_table_db, '`.`', v_table_name, '`');  IF (@sys.debug = 'ON') THEN SELECT CONCAT('in_table is: db = ''', v_table_db, ''', table = ''', v_table_name, '''') AS 'Debug'; END IF;  IF (v_table_db = DATABASE() AND (v_table_name = 'tmp_digests' OR v_table_name = 'tmp_digests_delta')) THEN SET v_error_msg = CONCAT('Invalid value for in_table: ', v_quoted_table, ' is reserved table name.'); SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = v_error_msg; END IF;  CALL sys.table_exists(v_table_db, v_table_name, v_table_exists); IF (@sys.debug = 'ON') THEN SELECT CONCAT('v_table_exists = ', v_table_exists) AS 'Debug'; END IF;  IF (v_table_exists = 'BASE TABLE') THEN SET v_checksum_ref = ( SELECT GROUP_CONCAT(CONCAT(COLUMN_NAME, COLUMN_TYPE) ORDER BY ORDINAL_POSITION) AS Checksum FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'performance_schema' AND TABLE_NAME = 'events_statements_summary_by_digest' ), v_checksum_table = ( SELECT GROUP_CONCAT(CONCAT(COLUMN_NAME, COLUMN_TYPE) ORDER BY ORDINAL_POSITION) AS Checksum FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = v_table_db AND TABLE_NAME = v_table_name );  IF (v_checksum_ref <> v_checksum_table) THEN SET v_error_msg = CONCAT('The table ', IF(CHAR_LENGTH(v_quoted_table) > 93, CONCAT('...', SUBSTRING(v_quoted_table, -90)), v_quoted_table), ' has the wrong definition.'); SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = v_error_msg; END IF; END IF; END IF;   IF (in_views IS NULL OR in_views = '') THEN SET in_views = 'with_runtimes_in_95th_percentile,analysis,with_errors_or_warnings,with_full_table_scans,with_sorting,with_temp_tables'; END IF;   CALL sys.table_exists(DATABASE(), 'tmp_digests', v_tmp_digests_table_exists); IF (@sys.debug = 'ON') THEN SELECT CONCAT('v_tmp_digests_table_exists = ', v_tmp_digests_table_exists) AS 'Debug'; END IF;  CASE WHEN in_action IN ('snapshot', 'overall') THEN IF (in_table IS NOT NULL) THEN IF (NOT v_table_exists IN ('TEMPORARY', 'BASE TABLE')) THEN SET v_error_msg = CONCAT('The ', in_action, ' action requires in_table to be NULL, NOW() or specify an existing table.', ' The table ', IF(CHAR_LENGTH(v_quoted_table) > 16, CONCAT('...', SUBSTRING(v_quoted_table, -13)), v_quoted_table), ' does not exist.'); SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = v_error_msg; END IF; END IF;  WHEN in_action IN ('delta', 'save') THEN IF (v_table_exists NOT IN ('TEMPORARY', 'BASE TABLE')) THEN SET v_error_msg = CONCAT('The ', in_action, ' action requires in_table to be an existing table.', IF(in_table IS NOT NULL, CONCAT(' The table ', IF(CHAR_LENGTH(v_quoted_table) > 39, CONCAT('...', SUBSTRING(v_quoted_table, -36)), v_quoted_table), ' does not exist.'), '')); SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = v_error_msg; END IF;  IF (in_action = 'delta' AND v_tmp_digests_table_exists <> 'TEMPORARY') THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'An existing snapshot generated with the statement_performance_analyzer() must exist.'; END IF; WHEN in_action = 'create_tmp' THEN IF (v_table_exists = 'TEMPORARY') THEN SET v_error_msg = CONCAT('Cannot create the table ', IF(CHAR_LENGTH(v_quoted_table) > 72, CONCAT('...', SUBSTRING(v_quoted_table, -69)), v_quoted_table), ' as it already exists.'); SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = v_error_msg; END IF;  WHEN in_action = 'create_table' THEN IF (v_table_exists <> '') THEN SET v_error_msg = CONCAT('Cannot create the table ', IF(CHAR_LENGTH(v_quoted_table) > 52, CONCAT('...', SUBSTRING(v_quoted_table, -49)), v_quoted_table), ' as it already exists', IF(v_table_exists = 'TEMPORARY', ' as a temporary table.', '.')); SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = v_error_msg; END IF;  WHEN in_action = 'cleanup' THEN DO (SELECT 1); ELSE SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Unknown action. Supported actions are: cleanup, create_table, create_tmp, delta, overall, save, snapshot'; END CASE;  SET v_digest_table_template = 'CREATE %{TEMPORARY}TABLE %{TABLE_NAME} ( `SCHEMA_NAME` varchar(64) DEFAULT NULL, `DIGEST` varchar(32) DEFAULT NULL, `DIGEST_TEXT` longtext, `COUNT_STAR` bigint(20) unsigned NOT NULL, `SUM_TIMER_WAIT` bigint(20) unsigned NOT NULL, `MIN_TIMER_WAIT` bigint(20) unsigned NOT NULL, `AVG_TIMER_WAIT` bigint(20) unsigned NOT NULL, `MAX_TIMER_WAIT` bigint(20) unsigned NOT NULL, `SUM_LOCK_TIME` bigint(20) unsigned NOT NULL, `SUM_ERRORS` bigint(20) unsigned NOT NULL, `SUM_WARNINGS` bigint(20) unsigned NOT NULL, `SUM_ROWS_AFFECTED` bigint(20) unsigned NOT NULL, `SUM_ROWS_SENT` bigint(20) unsigned NOT NULL, `SUM_ROWS_EXAMINED` bigint(20) unsigned NOT NULL, `SUM_CREATED_TMP_DISK_TABLES` bigint(20) unsigned NOT NULL, `SUM_CREATED_TMP_TABLES` bigint(20) unsigned NOT NULL, `SUM_SELECT_FULL_JOIN` bigint(20) unsigned NOT NULL, `SUM_SELECT_FULL_RANGE_JOIN` bigint(20) unsigned NOT NULL, `SUM_SELECT_RANGE` bigint(20) unsigned NOT NULL, `SUM_SELECT_RANGE_CHECK` bigint(20) unsigned NOT NULL, `SUM_SELECT_SCAN` bigint(20) unsigned NOT NULL, `SUM_SORT_MERGE_PASSES` bigint(20) unsigned NOT NULL, `SUM_SORT_RANGE` bigint(20) unsigned NOT NULL, `SUM_SORT_ROWS` bigint(20) unsigned NOT NULL, `SUM_SORT_SCAN` bigint(20) unsigned NOT NULL, `SUM_NO_INDEX_USED` bigint(20) unsigned NOT NULL, `SUM_NO_GOOD_INDEX_USED` bigint(20) unsigned NOT NULL, `FIRST_SEEN` timestamp NULL DEFAULT NULL, `LAST_SEEN` timestamp NULL DEFAULT NULL, INDEX (SCHEMA_NAME, DIGEST) ) DEFAULT CHARSET=utf8';  IF (v_force_new_snapshot OR in_action = 'snapshot' OR (in_action = 'overall' AND in_table IS NULL) OR (in_action = 'save' AND v_tmp_digests_table_exists <> 'TEMPORARY') ) THEN IF (v_tmp_digests_table_exists = 'TEMPORARY') THEN IF (@sys.debug = 'ON') THEN SELECT 'DROP TEMPORARY TABLE IF EXISTS tmp_digests' AS 'Debug'; END IF; DROP TEMPORARY TABLE IF EXISTS tmp_digests; END IF; CALL sys.execute_prepared_stmt(REPLACE(REPLACE(v_digest_table_template, '%{TEMPORARY}', 'TEMPORARY '), '%{TABLE_NAME}', 'tmp_digests'));  SET v_sql = CONCAT('INSERT INTO tmp_digests SELECT * FROM ', IF(in_table IS NULL OR in_action = 'save', 'performance_schema.events_statements_summary_by_digest', v_quoted_table)); CALL sys.execute_prepared_stmt(v_sql); END IF;  IF (in_action IN ('create_table', 'create_tmp')) THEN IF (in_action = 'create_table') THEN CALL sys.execute_prepared_stmt(REPLACE(REPLACE(v_digest_table_template, '%{TEMPORARY}', ''), '%{TABLE_NAME}', v_quoted_table)); ELSE CALL sys.execute_prepared_stmt(REPLACE(REPLACE(v_digest_table_template, '%{TEMPORARY}', 'TEMPORARY '), '%{TABLE_NAME}', v_quoted_table)); END IF; ELSEIF (in_action = 'save') THEN CALL sys.execute_prepared_stmt(CONCAT('DELETE FROM ', v_quoted_table)); CALL sys.execute_prepared_stmt(CONCAT('INSERT INTO ', v_quoted_table, ' SELECT * FROM tmp_digests')); ELSEIF (in_action = 'cleanup') THEN DROP TEMPORARY TABLE IF EXISTS sys.tmp_digests; DROP TEMPORARY TABLE IF EXISTS sys.tmp_digests_delta; ELSEIF (in_action IN ('overall', 'delta')) THEN IF (in_action = 'overall') THEN IF (in_table IS NULL) THEN SET v_digests_table = 'tmp_digests'; ELSE SET v_digests_table = v_quoted_table; END IF; ELSE SET v_digests_table = 'tmp_digests_delta'; DROP TEMPORARY TABLE IF EXISTS tmp_digests_delta; CREATE TEMPORARY TABLE tmp_digests_delta LIKE tmp_digests; SET v_sql = CONCAT('INSERT INTO tmp_digests_delta SELECT `d_end`.`SCHEMA_NAME`, `d_end`.`DIGEST`, `d_end`.`DIGEST_TEXT`, `d_end`.`COUNT_STAR`-IFNULL(`d_start`.`COUNT_STAR`, 0) AS ''COUNT_STAR'', `d_end`.`SUM_TIMER_WAIT`-IFNULL(`d_start`.`SUM_TIMER_WAIT`, 0) AS ''SUM_TIMER_WAIT'', `d_end`.`MIN_TIMER_WAIT` AS ''MIN_TIMER_WAIT'', IFNULL((`d_end`.`SUM_TIMER_WAIT`-IFNULL(`d_start`.`SUM_TIMER_WAIT`, 0))/NULLIF(`d_end`.`COUNT_STAR`-IFNULL(`d_start`.`COUNT_STAR`, 0), 0), 0) AS ''AVG_TIMER_WAIT'', `d_end`.`MAX_TIMER_WAIT` AS ''MAX_TIMER_WAIT'', `d_end`.`SUM_LOCK_TIME`-IFNULL(`d_start`.`SUM_LOCK_TIME`, 0) AS ''SUM_LOCK_TIME'', `d_end`.`SUM_ERRORS`-IFNULL(`d_start`.`SUM_ERRORS`, 0) AS ''SUM_ERRORS'', `d_end`.`SUM_WARNINGS`-IFNULL(`d_start`.`SUM_WARNINGS`, 0) AS ''SUM_WARNINGS'', `d_end`.`SUM_ROWS_AFFECTED`-IFNULL(`d_start`.`SUM_ROWS_AFFECTED`, 0) AS ''SUM_ROWS_AFFECTED'', `d_end`.`SUM_ROWS_SENT`-IFNULL(`d_start`.`SUM_ROWS_SENT`, 0) AS ''SUM_ROWS_SENT'', `d_end`.`SUM_ROWS_EXAMINED`-IFNULL(`d_start`.`SUM_ROWS_EXAMINED`, 0) AS ''SUM_ROWS_EXAMINED'', `d_end`.`SUM_CREATED_TMP_DISK_TABLES`-IFNULL(`d_start`.`SUM_CREATED_TMP_DISK_TABLES`, 0) AS ''SUM_CREATED_TMP_DISK_TABLES'', `d_end`.`SUM_CREATED_TMP_TABLES`-IFNULL(`d_start`.`SUM_CREATED_TMP_TABLES`, 0) AS ''SUM_CREATED_TMP_TABLES'', `d_end`.`SUM_SELECT_FULL_JOIN`-IFNULL(`d_start`.`SUM_SELECT_FULL_JOIN`, 0) AS ''SUM_SELECT_FULL_JOIN'', `d_end`.`SUM_SELECT_FULL_RANGE_JOIN`-IFNULL(`d_start`.`SUM_SELECT_FULL_RANGE_JOIN`, 0) AS ''SUM_SELECT_FULL_RANGE_JOIN'', `d_end`.`SUM_SELECT_RANGE`-IFNULL(`d_start`.`SUM_SELECT_RANGE`, 0) AS ''SUM_SELECT_RANGE'', `d_end`.`SUM_SELECT_RANGE_CHECK`-IFNULL(`d_start`.`SUM_SELECT_RANGE_CHECK`, 0) AS ''SUM_SELECT_RANGE_CHECK'', `d_end`.`SUM_SELECT_SCAN`-IFNULL(`d_start`.`SUM_SELECT_SCAN`, 0) AS ''SUM_SELECT_SCAN'', `d_end`.`SUM_SORT_MERGE_PASSES`-IFNULL(`d_start`.`SUM_SORT_MERGE_PASSES`, 0) AS ''SUM_SORT_MERGE_PASSES'', `d_end`.`SUM_SORT_RANGE`-IFNULL(`d_start`.`SUM_SORT_RANGE`, 0) AS ''SUM_SORT_RANGE'', `d_end`.`SUM_SORT_ROWS`-IFNULL(`d_start`.`SUM_SORT_ROWS`, 0) AS ''SUM_SORT_ROWS'', `d_end`.`SUM_SORT_SCAN`-IFNULL(`d_start`.`SUM_SORT_SCAN`, 0) AS ''SUM_SORT_SCAN'', `d_end`.`SUM_NO_INDEX_USED`-IFNULL(`d_start`.`SUM_NO_INDEX_USED`, 0) AS ''SUM_NO_INDEX_USED'', `d_end`.`SUM_NO_GOOD_INDEX_USED`-IFNULL(`d_start`.`SUM_NO_GOOD_INDEX_USED`, 0) AS ''SUM_NO_GOOD_INDEX_USED'', `d_end`.`FIRST_SEEN`, `d_end`.`LAST_SEEN` FROM tmp_digests d_end LEFT OUTER JOIN ', v_quoted_table, ' d_start ON `d_start`.`DIGEST` = `d_end`.`DIGEST` AND (`d_start`.`SCHEMA_NAME` = `d_end`.`SCHEMA_NAME` OR (`d_start`.`SCHEMA_NAME` IS NULL AND `d_end`.`SCHEMA_NAME` IS NULL) ) WHERE `d_end`.`COUNT_STAR`-IFNULL(`d_start`.`COUNT_STAR`, 0) > 0'); CALL sys.execute_prepared_stmt(v_sql); END IF;  IF (FIND_IN_SET('with_runtimes_in_95th_percentile', in_views)) THEN SELECT 'Queries with Runtime in 95th Percentile' AS 'Next Output';  DROP TEMPORARY TABLE IF EXISTS tmp_digest_avg_latency_distribution1; DROP TEMPORARY TABLE IF EXISTS tmp_digest_avg_latency_distribution2; DROP TEMPORARY TABLE IF EXISTS tmp_digest_95th_percentile_by_avg_us;  CREATE TEMPORARY TABLE tmp_digest_avg_latency_distribution1 ( cnt bigint unsigned NOT NULL, avg_us decimal(21,0) NOT NULL, PRIMARY KEY (avg_us) ) ENGINE=InnoDB;  SET v_sql = CONCAT('INSERT INTO tmp_digest_avg_latency_distribution1 SELECT COUNT(*) cnt, ROUND(avg_timer_wait/1000000) AS avg_us FROM ', v_digests_table, ' GROUP BY avg_us'); CALL sys.execute_prepared_stmt(v_sql);  CREATE TEMPORARY TABLE tmp_digest_avg_latency_distribution2 LIKE tmp_digest_avg_latency_distribution1; INSERT INTO tmp_digest_avg_latency_distribution2 SELECT * FROM tmp_digest_avg_latency_distribution1;  CREATE TEMPORARY TABLE tmp_digest_95th_percentile_by_avg_us ( avg_us decimal(21,0) NOT NULL, percentile decimal(46,4) NOT NULL, PRIMARY KEY (avg_us) ) ENGINE=InnoDB;  SET v_sql = CONCAT('INSERT INTO tmp_digest_95th_percentile_by_avg_us SELECT s2.avg_us avg_us, IFNULL(SUM(s1.cnt)/NULLIF((SELECT COUNT(*) FROM ', v_digests_table, '), 0), 0) percentile FROM tmp_digest_avg_latency_distribution1 AS s1 JOIN tmp_digest_avg_latency_distribution2 AS s2 ON s1.avg_us <= s2.avg_us GROUP BY s2.avg_us HAVING percentile > 0.95 ORDER BY percentile LIMIT 1'); CALL sys.execute_prepared_stmt(v_sql);  SET v_sql = REPLACE( REPLACE( (SELECT VIEW_DEFINITION FROM information_schema.VIEWS WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'statements_with_runtimes_in_95th_percentile' ), '`performance_schema`.`events_statements_summary_by_digest`', v_digests_table ), 'sys.x$ps_digest_95th_percentile_by_avg_us', '`sys`.`x$ps_digest_95th_percentile_by_avg_us`' ); CALL sys.execute_prepared_stmt(v_sql);  DROP TEMPORARY TABLE tmp_digest_avg_latency_distribution1; DROP TEMPORARY TABLE tmp_digest_avg_latency_distribution2; DROP TEMPORARY TABLE tmp_digest_95th_percentile_by_avg_us; END IF;  IF (FIND_IN_SET('analysis', in_views)) THEN SELECT CONCAT('Top ', @sys.statement_performance_analyzer.limit, ' Queries Ordered by Total Latency') AS 'Next Output'; SET v_sql = REPLACE( (SELECT VIEW_DEFINITION FROM information_schema.VIEWS WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'statement_analysis' ), '`performance_schema`.`events_statements_summary_by_digest`', v_digests_table ); IF (@sys.statement_performance_analyzer.limit > 0) THEN SET v_sql = CONCAT(v_sql, ' LIMIT ', @sys.statement_performance_analyzer.limit); END IF; CALL sys.execute_prepared_stmt(v_sql); END IF;  IF (FIND_IN_SET('with_errors_or_warnings', in_views)) THEN SELECT CONCAT('Top ', @sys.statement_performance_analyzer.limit, ' Queries with Errors') AS 'Next Output'; SET v_sql = REPLACE( (SELECT VIEW_DEFINITION FROM information_schema.VIEWS WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'statements_with_errors_or_warnings' ), '`performance_schema`.`events_statements_summary_by_digest`', v_digests_table ); IF (@sys.statement_performance_analyzer.limit > 0) THEN SET v_sql = CONCAT(v_sql, ' LIMIT ', @sys.statement_performance_analyzer.limit); END IF; CALL sys.execute_prepared_stmt(v_sql); END IF;  IF (FIND_IN_SET('with_full_table_scans', in_views)) THEN SELECT CONCAT('Top ', @sys.statement_performance_analyzer.limit, ' Queries with Full Table Scan') AS 'Next Output'; SET v_sql = REPLACE( (SELECT VIEW_DEFINITION FROM information_schema.VIEWS WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'statements_with_full_table_scans' ), '`performance_schema`.`events_statements_summary_by_digest`', v_digests_table ); IF (@sys.statement_performance_analyzer.limit > 0) THEN SET v_sql = CONCAT(v_sql, ' LIMIT ', @sys.statement_performance_analyzer.limit); END IF; CALL sys.execute_prepared_stmt(v_sql); END IF;  IF (FIND_IN_SET('with_sorting', in_views)) THEN SELECT CONCAT('Top ', @sys.statement_performance_analyzer.limit, ' Queries with Sorting') AS 'Next Output'; SET v_sql = REPLACE( (SELECT VIEW_DEFINITION FROM information_schema.VIEWS WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'statements_with_sorting' ), '`performance_schema`.`events_statements_summary_by_digest`', v_digests_table ); IF (@sys.statement_performance_analyzer.limit > 0) THEN SET v_sql = CONCAT(v_sql, ' LIMIT ', @sys.statement_performance_analyzer.limit); END IF; CALL sys.execute_prepared_stmt(v_sql); END IF;  IF (FIND_IN_SET('with_temp_tables', in_views)) THEN SELECT CONCAT('Top ', @sys.statement_performance_analyzer.limit, ' Queries with Internal Temporary Tables') AS 'Next Output'; SET v_sql = REPLACE( (SELECT VIEW_DEFINITION FROM information_schema.VIEWS WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'statements_with_temp_tables' ), '`performance_schema`.`events_statements_summary_by_digest`', v_digests_table ); IF (@sys.statement_performance_analyzer.limit > 0) THEN SET v_sql = CONCAT(v_sql, ' LIMIT ', @sys.statement_performance_analyzer.limit); END IF; CALL sys.execute_prepared_stmt(v_sql); END IF;  IF (FIND_IN_SET('custom', in_views)) THEN SELECT CONCAT('Top ', @sys.statement_performance_analyzer.limit, ' Queries Using Custom View') AS 'Next Output';  IF (@sys.statement_performance_analyzer.view IS NULL) THEN SET @sys.statement_performance_analyzer.view = sys.sys_get_config('statement_performance_analyzer.view', NULL); END IF; IF (@sys.statement_performance_analyzer.view IS NULL) THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'The @sys.statement_performance_analyzer.view user variable must be set with the view or query to use.'; END IF;  IF (NOT INSTR(@sys.statement_performance_analyzer.view, ' ')) THEN IF (NOT INSTR(@sys.statement_performance_analyzer.view, '.')) THEN SET v_custom_db   = DATABASE(), v_custom_name = @sys.statement_performance_analyzer.view; ELSE SET v_custom_db   = SUBSTRING_INDEX(@sys.statement_performance_analyzer.view, '.', 1); SET v_custom_name = SUBSTRING(@sys.statement_performance_analyzer.view, CHAR_LENGTH(v_custom_db)+2); END IF;  CALL sys.table_exists(v_custom_db, v_custom_name, v_custom_view_exists); IF (v_custom_view_exists <> 'VIEW') THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'The @sys.statement_performance_analyzer.view user variable is set but specified neither an existing view nor a query.'; END IF;  SET v_sql = REPLACE( (SELECT VIEW_DEFINITION FROM information_schema.VIEWS WHERE TABLE_SCHEMA = v_custom_db AND TABLE_NAME = v_custom_name ), '`performance_schema`.`events_statements_summary_by_digest`', v_digests_table ); ELSE SET v_sql = REPLACE(@sys.statement_performance_analyzer.view, '`performance_schema`.`events_statements_summary_by_digest`', v_digests_table); END IF;  IF (@sys.statement_performance_analyzer.limit > 0) THEN SET v_sql = CONCAT(v_sql, ' LIMIT ', @sys.statement_performance_analyzer.limit); END IF;  CALL sys.execute_prepared_stmt(v_sql); END IF; END IF;  IF (v_this_thread_enabled = 'YES') THEN CALL sys.ps_setup_enable_thread(CONNECTION_ID()); END IF;  IF (@log_bin = 1) THEN SET sql_log_bin = @log_bin; END IF; END$$

CREATE DEFINER=`mysql.sys`@`localhost` PROCEDURE `table_exists`( IN in_db VARCHAR(64), IN in_table VARCHAR(64), OUT out_exists ENUM('', 'BASE TABLE', 'VIEW', 'TEMPORARY') )
    SQL SECURITY INVOKER
    COMMENT '\n Description\n \n Tests whether the table specified in in_db and in_table exists either as a regular\n table, or as a temporary table. The returned value corresponds to the table that\n will be used, so if there''s both a temporary and a permanent table with the given\n name, then ''TEMPORARY'' will be returned.\n \n Parameters\n \n in_db (VARCHAR(64)):\n The database name to check for the existance of the table in.\n \n in_table (VARCHAR(64)):\n The name of the table to check the existance of.\n \n out_exists ENUM('''', ''BASE TABLE'', ''VIEW'', ''TEMPORARY''):\n The return value: whether the table exists. The value is one of:\n * ''''           - the table does not exist neither as a base table, view, nor temporary table.\n * ''BASE TABLE'' - the table name exists as a permanent base table table.\n * ''VIEW''       - the table name exists as a view.\n * ''TEMPORARY''  - the table name exists as a temporary table.\n \n Example\n \n mysql> CREATE DATABASE db1;\n Query OK, 1 row affected (0.07 sec)\n \n mysql> use db1;\n Database changed\n mysql> CREATE TABLE t1 (id INT PRIMARY KEY);\n Query OK, 0 rows affected (0.08 sec)\n \n mysql> CREATE TABLE t2 (id INT PRIMARY KEY);\n Query OK, 0 rows affected (0.08 sec)\n \n mysql> CREATE view v_t1 AS SELECT * FROM t1;\n Query OK, 0 rows affected (0.00 sec)\n \n mysql> CREATE TEMPORARY TABLE t1 (id INT PRIMARY KEY);\n Query OK, 0 rows affected (0.00 sec)\n \n mysql> CALL sys.table_exists(''db1'', ''t1'', @exists); SELECT @exists;\n Query OK, 0 rows affected (0.00 sec)\n \n +------------+\n | @exists    |\n +------------+\n | TEMPORARY  |\n +------------+\n 1 row in set (0.00 sec)\n \n mysql> CALL sys.table_exists(''db1'', ''t2'', @exists); SELECT @exists;\n Query OK, 0 rows affected (0.00 sec)\n \n +------------+\n | @exists    |\n +------------+\n | BASE TABLE |\n +------------+\n 1 row in set (0.01 sec)\n \n mysql> CALL sys.table_exists(''db1'', ''v_t1'', @exists); SELECT @exists;\n Query OK, 0 rows affected (0.00 sec)\n \n +---------+\n | @exists |\n +---------+\n | VIEW    |\n +---------+\n 1 row in set (0.00 sec)\n \n mysql> CALL sys.table_exists(''db1'', ''t3'', @exists); SELECT @exists;\n Query OK, 0 rows affected (0.01 sec)\n \n +---------+\n | @exists |\n +---------+\n |         |\n +---------+\n 1 row in set (0.00 sec)\n '
BEGIN DECLARE v_error BOOLEAN DEFAULT FALSE; DECLARE CONTINUE HANDLER FOR 1050 SET v_error = TRUE; DECLARE CONTINUE HANDLER FOR 1146 SET v_error = TRUE;  SET out_exists = '';  IF (EXISTS(SELECT 1 FROM information_schema.TABLES WHERE TABLE_SCHEMA = in_db AND TABLE_NAME = in_table)) THEN SET @sys.tmp.table_exists.SQL = CONCAT('CREATE TEMPORARY TABLE `', in_db, '`.`', in_table, '` (id INT PRIMARY KEY)'); PREPARE stmt_create_table FROM @sys.tmp.table_exists.SQL; EXECUTE stmt_create_table; DEALLOCATE PREPARE stmt_create_table; IF (v_error) THEN SET out_exists = 'TEMPORARY'; ELSE SET @sys.tmp.table_exists.SQL = CONCAT('DROP TEMPORARY TABLE `', in_db, '`.`', in_table, '`'); PREPARE stmt_drop_table FROM @sys.tmp.table_exists.SQL; EXECUTE stmt_drop_table; DEALLOCATE PREPARE stmt_drop_table; SET out_exists = (SELECT TABLE_TYPE FROM information_schema.TABLES WHERE TABLE_SCHEMA = in_db AND TABLE_NAME = in_table); END IF; ELSE SET @sys.tmp.table_exists.SQL = CONCAT('SELECT COUNT(*) FROM `', in_db, '`.`', in_table, '`'); PREPARE stmt_select FROM @sys.tmp.table_exists.SQL; IF (NOT v_error) THEN DEALLOCATE PREPARE stmt_select; SET out_exists = 'TEMPORARY'; END IF; END IF; END$$

--
-- Functions
--
CREATE DEFINER=`mysql.sys`@`localhost` FUNCTION `extract_schema_from_file_name`( path VARCHAR(512) ) RETURNS varchar(64) CHARSET utf8
    NO SQL
    DETERMINISTIC
    SQL SECURITY INVOKER
    COMMENT '\n Description\n \n Takes a raw file path, and attempts to extract the schema name from it.\n \n Useful for when interacting with Performance Schema data \n concerning IO statistics, for example.\n \n Currently relies on the fact that a table data file will be within a \n specified database directory (will not work with partitions or tables\n that specify an individual DATA_DIRECTORY).\n \n Parameters\n \n path (VARCHAR(512)):\n The full file path to a data file to extract the schema name from.\n \n Returns\n \n VARCHAR(64)\n \n Example\n \n mysql> SELECT sys.extract_schema_from_file_name(''/var/lib/mysql/employees/employee.ibd'');\n +----------------------------------------------------------------------------+\n | sys.extract_schema_from_file_name(''/var/lib/mysql/employees/employee.ibd'') |\n +----------------------------------------------------------------------------+\n | employees                                                                  |\n +----------------------------------------------------------------------------+\n 1 row in set (0.00 sec)\n '
BEGIN RETURN LEFT(SUBSTRING_INDEX(SUBSTRING_INDEX(REPLACE(path, '\\', '/'), '/', -2), '/', 1), 64); END$$

CREATE DEFINER=`mysql.sys`@`localhost` FUNCTION `extract_table_from_file_name`( path VARCHAR(512) ) RETURNS varchar(64) CHARSET utf8
    NO SQL
    DETERMINISTIC
    SQL SECURITY INVOKER
    COMMENT '\n Description\n \n Takes a raw file path, and extracts the table name from it.\n \n Useful for when interacting with Performance Schema data \n concerning IO statistics, for example.\n \n Parameters\n \n path (VARCHAR(512)):\n The full file path to a data file to extract the table name from.\n \n Returns\n \n VARCHAR(64)\n \n Example\n \n mysql> SELECT sys.extract_table_from_file_name(''/var/lib/mysql/employees/employee.ibd'');\n +---------------------------------------------------------------------------+\n | sys.extract_table_from_file_name(''/var/lib/mysql/employees/employee.ibd'') |\n +---------------------------------------------------------------------------+\n | employee                                                                  |\n +---------------------------------------------------------------------------+\n 1 row in set (0.02 sec)\n '
BEGIN RETURN LEFT(SUBSTRING_INDEX(REPLACE(SUBSTRING_INDEX(REPLACE(path, '\\', '/'), '/', -1), '@0024', '$'), '.', 1), 64); END$$

CREATE DEFINER=`mysql.sys`@`localhost` FUNCTION `format_bytes`( bytes TEXT ) RETURNS text CHARSET utf8
    NO SQL
    DETERMINISTIC
    SQL SECURITY INVOKER
    COMMENT '\n Description\n \n Takes a raw bytes value, and converts it to a human readable format.\n \n Parameters\n \n bytes (TEXT):\n A raw bytes value.\n \n Returns\n \n TEXT\n \n Example\n \n mysql> SELECT sys.format_bytes(2348723492723746) AS size;\n +----------+\n | size     |\n +----------+\n | 2.09 PiB |\n +----------+\n 1 row in set (0.00 sec)\n \n mysql> SELECT sys.format_bytes(2348723492723) AS size;\n +----------+\n | size     |\n +----------+\n | 2.14 TiB |\n +----------+\n 1 row in set (0.00 sec)\n \n mysql> SELECT sys.format_bytes(23487234) AS size;\n +-----------+\n | size      |\n +-----------+\n | 22.40 MiB |\n +-----------+\n 1 row in set (0.00 sec)\n '
BEGIN IF bytes IS NULL THEN RETURN NULL; ELSEIF bytes >= 1125899906842624 THEN RETURN CONCAT(ROUND(bytes / 1125899906842624, 2), ' PiB'); ELSEIF bytes >= 1099511627776 THEN RETURN CONCAT(ROUND(bytes / 1099511627776, 2), ' TiB'); ELSEIF bytes >= 1073741824 THEN RETURN CONCAT(ROUND(bytes / 1073741824, 2), ' GiB'); ELSEIF bytes >= 1048576 THEN RETURN CONCAT(ROUND(bytes / 1048576, 2), ' MiB'); ELSEIF bytes >= 1024 THEN RETURN CONCAT(ROUND(bytes / 1024, 2), ' KiB'); ELSE RETURN CONCAT(ROUND(bytes, 0), ' bytes'); END IF; END$$

CREATE DEFINER=`mysql.sys`@`localhost` FUNCTION `format_path`( in_path VARCHAR(512) ) RETURNS varchar(512) CHARSET utf8
    NO SQL
    DETERMINISTIC
    SQL SECURITY INVOKER
    COMMENT '\n Description\n \n Takes a raw path value, and strips out the datadir or tmpdir\n replacing with @@datadir and @@tmpdir respectively.\n \n Also normalizes the paths across operating systems, so backslashes\n on Windows are converted to forward slashes\n \n Parameters\n \n path (VARCHAR(512)):\n The raw file path value to format.\n \n Returns\n \n VARCHAR(512) CHARSET UTF8\n \n Example\n \n mysql> select @@datadir;\n +-----------------------------------------------+\n | @@datadir                                     |\n +-----------------------------------------------+\n | /Users/mark/sandboxes/SmallTree/AMaster/data/ |\n +-----------------------------------------------+\n 1 row in set (0.06 sec)\n \n mysql> select format_path(''/Users/mark/sandboxes/SmallTree/AMaster/data/mysql/proc.MYD'') AS path;\n +--------------------------+\n | path                     |\n +--------------------------+\n | @@datadir/mysql/proc.MYD |\n +--------------------------+\n 1 row in set (0.03 sec)\n '
BEGIN DECLARE v_path VARCHAR(512); DECLARE v_undo_dir VARCHAR(1024);  DECLARE path_separator CHAR(1) DEFAULT '/';  IF @@global.version_compile_os LIKE 'win%' THEN SET path_separator = '\\'; END IF;  IF in_path LIKE '/private/%' THEN SET v_path = REPLACE(in_path, '/private', ''); ELSE SET v_path = in_path; END IF;  SET v_undo_dir = IFNULL((SELECT VARIABLE_VALUE FROM performance_schema.global_variables WHERE VARIABLE_NAME = 'innodb_undo_directory'), '');  IF v_path IS NULL THEN RETURN NULL; ELSEIF v_path LIKE CONCAT(@@global.datadir, IF(SUBSTRING(@@global.datadir, -1) = path_separator, '%', CONCAT(path_separator, '%'))) ESCAPE '|' THEN SET v_path = REPLACE(v_path, @@global.datadir, CONCAT('@@datadir', IF(SUBSTRING(@@global.datadir, -1) = path_separator, path_separator, ''))); ELSEIF v_path LIKE CONCAT(@@global.tmpdir, IF(SUBSTRING(@@global.tmpdir, -1) = path_separator, '%', CONCAT(path_separator, '%'))) ESCAPE '|' THEN SET v_path = REPLACE(v_path, @@global.tmpdir, CONCAT('@@tmpdir', IF(SUBSTRING(@@global.tmpdir, -1) = path_separator, path_separator, ''))); ELSEIF v_path LIKE CONCAT(@@global.slave_load_tmpdir, IF(SUBSTRING(@@global.slave_load_tmpdir, -1) = path_separator, '%', CONCAT(path_separator, '%'))) ESCAPE '|' THEN SET v_path = REPLACE(v_path, @@global.slave_load_tmpdir, CONCAT('@@slave_load_tmpdir', IF(SUBSTRING(@@global.slave_load_tmpdir, -1) = path_separator, path_separator, ''))); ELSEIF v_path LIKE CONCAT(@@global.innodb_data_home_dir, IF(SUBSTRING(@@global.innodb_data_home_dir, -1) = path_separator, '%', CONCAT(path_separator, '%'))) ESCAPE '|' THEN SET v_path = REPLACE(v_path, @@global.innodb_data_home_dir, CONCAT('@@innodb_data_home_dir', IF(SUBSTRING(@@global.innodb_data_home_dir, -1) = path_separator, path_separator, ''))); ELSEIF v_path LIKE CONCAT(@@global.innodb_log_group_home_dir, IF(SUBSTRING(@@global.innodb_log_group_home_dir, -1) = path_separator, '%', CONCAT(path_separator, '%'))) ESCAPE '|' THEN SET v_path = REPLACE(v_path, @@global.innodb_log_group_home_dir, CONCAT('@@innodb_log_group_home_dir', IF(SUBSTRING(@@global.innodb_log_group_home_dir, -1) = path_separator, path_separator, ''))); ELSEIF v_path LIKE CONCAT(v_undo_dir, IF(SUBSTRING(v_undo_dir, -1) = path_separator, '%', CONCAT(path_separator, '%'))) ESCAPE '|' THEN SET v_path = REPLACE(v_path, v_undo_dir, CONCAT('@@innodb_undo_directory', IF(SUBSTRING(v_undo_dir, -1) = path_separator, path_separator, ''))); ELSEIF v_path LIKE CONCAT(@@global.basedir, IF(SUBSTRING(@@global.basedir, -1) = path_separator, '%', CONCAT(path_separator, '%'))) ESCAPE '|' THEN SET v_path = REPLACE(v_path, @@global.basedir, CONCAT('@@basedir', IF(SUBSTRING(@@global.basedir, -1) = path_separator, path_separator, ''))); END IF;  RETURN v_path; END$$

CREATE DEFINER=`mysql.sys`@`localhost` FUNCTION `format_statement`( statement LONGTEXT ) RETURNS longtext CHARSET utf8
    NO SQL
    DETERMINISTIC
    SQL SECURITY INVOKER
    COMMENT '\n Description\n \n Formats a normalized statement, truncating it if it is > 64 characters long by default.\n \n To configure the length to truncate the statement to by default, update the `statement_truncate_len`\n variable with `sys_config` table to a different value. Alternatively, to change it just for just \n your particular session, use `SET @sys.statement_truncate_len := <some new value>`.\n \n Useful for printing statement related data from Performance Schema from \n the command line.\n \n Parameters\n \n statement (LONGTEXT): \n The statement to format.\n \n Returns\n \n LONGTEXT\n \n Example\n \n mysql> SELECT sys.format_statement(digest_text)\n ->   FROM performance_schema.events_statements_summary_by_digest\n ->  ORDER by sum_timer_wait DESC limit 5;\n +-------------------------------------------------------------------+\n | sys.format_statement(digest_text)                                 |\n +-------------------------------------------------------------------+\n | CREATE SQL SECURITY INVOKER VI ... KE ? AND `variable_value` > ?  |\n | CREATE SQL SECURITY INVOKER VI ... ait` IS NOT NULL , `esc` . ... |\n | CREATE SQL SECURITY INVOKER VI ... ait` IS NOT NULL , `sys` . ... |\n | CREATE SQL SECURITY INVOKER VI ...  , `compressed_size` ) ) DESC  |\n | CREATE SQL SECURITY INVOKER VI ... LIKE ? ORDER BY `timer_start`  |\n +-------------------------------------------------------------------+\n 5 rows in set (0.00 sec)\n '
BEGIN IF @sys.statement_truncate_len IS NULL THEN SET @sys.statement_truncate_len = sys_get_config('statement_truncate_len', 64); END IF;  IF CHAR_LENGTH(statement) > @sys.statement_truncate_len THEN RETURN REPLACE(CONCAT(LEFT(statement, (@sys.statement_truncate_len/2)-2), ' ... ', RIGHT(statement, (@sys.statement_truncate_len/2)-2)), '\n', ' '); ELSE  RETURN REPLACE(statement, '\n', ' '); END IF; END$$

CREATE DEFINER=`mysql.sys`@`localhost` FUNCTION `format_time`( picoseconds TEXT ) RETURNS text CHARSET utf8
    NO SQL
    DETERMINISTIC
    SQL SECURITY INVOKER
    COMMENT '\n Description\n \n Takes a raw picoseconds value, and converts it to a human readable form.\n \n Picoseconds are the precision that all latency values are printed in\n within Performance Schema, however are not user friendly when wanting\n to scan output from the command line.\n \n Parameters\n \n picoseconds (TEXT):\n The raw picoseconds value to convert.\n \n Returns\n \n TEXT\n \n Example\n \n mysql> select format_time(342342342342345);\n +------------------------------+\n | format_time(342342342342345) |\n +------------------------------+\n | 00:05:42                     |\n +------------------------------+\n 1 row in set (0.00 sec)\n \n mysql> select format_time(342342342);\n +------------------------+\n | format_time(342342342) |\n +------------------------+\n | 342.34 us              |\n +------------------------+\n 1 row in set (0.00 sec)\n \n mysql> select format_time(34234);\n +--------------------+\n | format_time(34234) |\n +--------------------+\n | 34.23 ns           |\n +--------------------+\n 1 row in set (0.00 sec)\n '
BEGIN IF picoseconds IS NULL THEN RETURN NULL; ELSEIF picoseconds >= 604800000000000000 THEN RETURN CONCAT(ROUND(picoseconds / 604800000000000000, 2), ' w'); ELSEIF picoseconds >= 86400000000000000 THEN RETURN CONCAT(ROUND(picoseconds / 86400000000000000, 2), ' d'); ELSEIF picoseconds >= 3600000000000000 THEN RETURN CONCAT(ROUND(picoseconds / 3600000000000000, 2), ' h'); ELSEIF picoseconds >= 60000000000000 THEN RETURN CONCAT(ROUND(picoseconds / 60000000000000, 2), ' m'); ELSEIF picoseconds >= 1000000000000 THEN RETURN CONCAT(ROUND(picoseconds / 1000000000000, 2), ' s'); ELSEIF picoseconds >= 1000000000 THEN RETURN CONCAT(ROUND(picoseconds / 1000000000, 2), ' ms'); ELSEIF picoseconds >= 1000000 THEN RETURN CONCAT(ROUND(picoseconds / 1000000, 2), ' us'); ELSEIF picoseconds >= 1000 THEN RETURN CONCAT(ROUND(picoseconds / 1000, 2), ' ns'); ELSE RETURN CONCAT(picoseconds, ' ps'); END IF; END$$

CREATE DEFINER=`mysql.sys`@`localhost` FUNCTION `list_add`( in_list TEXT, in_add_value TEXT ) RETURNS text CHARSET utf8
    DETERMINISTIC
    SQL SECURITY INVOKER
    COMMENT '\n Description\n \n Takes a list, and a value to add to the list, and returns the resulting list.\n \n Useful for altering certain session variables, like sql_mode or optimizer_switch for instance.\n \n Parameters\n \n in_list (TEXT):\n The comma separated list to add a value to\n \n in_add_value (TEXT):\n The value to add to the input list\n \n Returns\n \n TEXT\n \n Example\n \n mysql> select @@sql_mode;\n +-----------------------------------------------------------------------------------+\n | @@sql_mode                                                                        |\n +-----------------------------------------------------------------------------------+\n | ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION |\n +-----------------------------------------------------------------------------------+\n 1 row in set (0.00 sec)\n \n mysql> set sql_mode = sys.list_add(@@sql_mode, ''ANSI_QUOTES'');\n Query OK, 0 rows affected (0.06 sec)\n \n mysql> select @@sql_mode;\n +-----------------------------------------------------------------------------------------------+\n | @@sql_mode                                                                                    |\n +-----------------------------------------------------------------------------------------------+\n | ANSI_QUOTES,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION |\n +-----------------------------------------------------------------------------------------------+\n 1 row in set (0.00 sec)\n \n '
BEGIN  IF (in_add_value IS NULL) THEN SIGNAL SQLSTATE '02200' SET MESSAGE_TEXT = 'Function sys.list_add: in_add_value input variable should not be NULL', MYSQL_ERRNO = 1138; END IF;  IF (in_list IS NULL OR LENGTH(in_list) = 0) THEN RETURN in_add_value; END IF;  RETURN (SELECT CONCAT(TRIM(BOTH ',' FROM TRIM(in_list)), ',', in_add_value));  END$$

CREATE DEFINER=`mysql.sys`@`localhost` FUNCTION `list_drop`( in_list TEXT, in_drop_value TEXT ) RETURNS text CHARSET utf8
    DETERMINISTIC
    SQL SECURITY INVOKER
    COMMENT '\n Description\n \n Takes a list, and a value to attempt to remove from the list, and returns the resulting list.\n \n Useful for altering certain session variables, like sql_mode or optimizer_switch for instance.\n \n Parameters\n \n in_list (TEXT):\n The comma separated list to drop a value from\n \n in_drop_value (TEXT):\n The value to drop from the input list\n \n Returns\n \n TEXT\n \n Example\n \n mysql> select @@sql_mode;\n +-----------------------------------------------------------------------------------------------+\n | @@sql_mode                                                                                    |\n +-----------------------------------------------------------------------------------------------+\n | ANSI_QUOTES,ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION |\n +-----------------------------------------------------------------------------------------------+\n 1 row in set (0.00 sec)\n \n mysql> set sql_mode = sys.list_drop(@@sql_mode, ''ONLY_FULL_GROUP_BY'');\n Query OK, 0 rows affected (0.03 sec)\n \n mysql> select @@sql_mode;\n +----------------------------------------------------------------------------+\n | @@sql_mode                                                                 |\n +----------------------------------------------------------------------------+\n | ANSI_QUOTES,STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION |\n +----------------------------------------------------------------------------+\n 1 row in set (0.00 sec)\n \n '
BEGIN  IF (in_drop_value IS NULL) THEN SIGNAL SQLSTATE '02200' SET MESSAGE_TEXT = 'Function sys.list_drop: in_drop_value input variable should not be NULL', MYSQL_ERRNO = 1138; END IF;  IF (in_list IS NULL OR LENGTH(in_list) = 0) THEN RETURN in_list; END IF;  RETURN (SELECT TRIM(BOTH ',' FROM REPLACE(REPLACE(CONCAT(',', in_list), CONCAT(',', in_drop_value), ''), CONCAT(', ', in_drop_value), '')));  END$$

CREATE DEFINER=`mysql.sys`@`localhost` FUNCTION `ps_is_account_enabled`( in_host VARCHAR(60),  in_user VARCHAR(32) ) RETURNS enum('YES','NO') CHARSET utf8
    READS SQL DATA
    DETERMINISTIC
    SQL SECURITY INVOKER
    COMMENT '\n Description\n \n Determines whether instrumentation of an account is enabled \n within Performance Schema.\n \n Parameters\n \n in_host VARCHAR(60): \n The hostname of the account to check.\n in_user VARCHAR(32):\n The username of the account to check.\n \n Returns\n \n ENUM(''YES'', ''NO'', ''PARTIAL'')\n \n Example\n \n mysql> SELECT sys.ps_is_account_enabled(''localhost'', ''root'');\n +------------------------------------------------+\n | sys.ps_is_account_enabled(''localhost'', ''root'') |\n +------------------------------------------------+\n | YES                                            |\n +------------------------------------------------+\n 1 row in set (0.01 sec)\n '
BEGIN RETURN IF(EXISTS(SELECT 1 FROM performance_schema.setup_actors WHERE (`HOST` = '%' OR in_host LIKE `HOST`) AND (`USER` = '%' OR `USER` = in_user) AND (`ENABLED` = 'YES') ), 'YES', 'NO' ); END$$

CREATE DEFINER=`mysql.sys`@`localhost` FUNCTION `ps_is_consumer_enabled`( in_consumer varchar(64) ) RETURNS enum('YES','NO') CHARSET utf8
    READS SQL DATA
    DETERMINISTIC
    SQL SECURITY INVOKER
    COMMENT '\n Description\n \n Determines whether a consumer is enabled (taking the consumer hierarchy into consideration)\n within the Performance Schema.\n \n An exception with errno 3047 is thrown if an unknown consumer name is passed to the function.\n A consumer name of NULL returns NULL.\n \n Parameters\n \n in_consumer VARCHAR(64): \n The name of the consumer to check.\n \n Returns\n \n ENUM(''YES'', ''NO'')\n \n Example\n \n mysql> SELECT sys.ps_is_consumer_enabled(''events_stages_history'');\n +-----------------------------------------------------+\n | sys.ps_is_consumer_enabled(''events_stages_history'') |\n +-----------------------------------------------------+\n | NO                                                  |\n +-----------------------------------------------------+\n 1 row in set (0.00 sec)\n '
BEGIN DECLARE v_is_enabled ENUM('YES', 'NO') DEFAULT NULL; DECLARE v_error_msg VARCHAR(128);  IF (in_consumer IS NULL) THEN RETURN NULL; END IF;  SET v_is_enabled = ( SELECT (CASE WHEN c.NAME = 'global_instrumentation' THEN c.ENABLED WHEN c.NAME = 'thread_instrumentation' THEN IF(cg.ENABLED = 'YES' AND c.ENABLED = 'YES', 'YES', 'NO') WHEN c.NAME LIKE '%\_digest'           THEN IF(cg.ENABLED = 'YES' AND c.ENABLED = 'YES', 'YES', 'NO') WHEN c.NAME LIKE '%\_current'          THEN IF(cg.ENABLED = 'YES' AND ct.ENABLED = 'YES' AND c.ENABLED = 'YES', 'YES', 'NO') ELSE IF(cg.ENABLED = 'YES' AND ct.ENABLED = 'YES' AND c.ENABLED = 'YES' AND ( SELECT cc.ENABLED FROM performance_schema.setup_consumers cc WHERE NAME = CONCAT(SUBSTRING_INDEX(c.NAME, '_', 2), '_current') ) = 'YES', 'YES', 'NO') END) AS IsEnabled FROM performance_schema.setup_consumers c INNER JOIN performance_schema.setup_consumers cg INNER JOIN performance_schema.setup_consumers ct WHERE cg.NAME       = 'global_instrumentation' AND ct.NAME   = 'thread_instrumentation' AND c.NAME    = in_consumer );  IF (v_is_enabled IS NOT NULL) THEN RETURN v_is_enabled; ELSE SET v_error_msg = CONCAT('Invalid argument error: ', in_consumer, ' in function sys.ps_is_consumer_enabled.'); SIGNAL SQLSTATE 'HY000' SET MESSAGE_TEXT = v_error_msg, MYSQL_ERRNO  = 3047; END IF; END$$

CREATE DEFINER=`mysql.sys`@`localhost` FUNCTION `ps_is_instrument_default_enabled`( in_instrument VARCHAR(128) ) RETURNS enum('YES','NO') CHARSET utf8
    READS SQL DATA
    DETERMINISTIC
    SQL SECURITY INVOKER
    COMMENT '\n Description\n \n Returns whether an instrument is enabled by default in this version of MySQL.\n \n Parameters\n \n in_instrument VARCHAR(128): \n The instrument to check.\n \n Returns\n \n ENUM(''YES'', ''NO'')\n \n Example\n \n mysql> SELECT sys.ps_is_instrument_default_enabled(''statement/sql/select'');\n +--------------------------------------------------------------+\n | sys.ps_is_instrument_default_enabled(''statement/sql/select'') |\n +--------------------------------------------------------------+\n | YES                                                          |\n +--------------------------------------------------------------+\n 1 row in set (0.00 sec)\n '
BEGIN DECLARE v_enabled ENUM('YES', 'NO');  SET v_enabled = IF(in_instrument LIKE 'wait/io/file/%' OR in_instrument LIKE 'wait/io/table/%' OR in_instrument LIKE 'statement/%' OR in_instrument LIKE 'memory/performance_schema/%' OR in_instrument IN ('wait/lock/table/sql/handler', 'idle')  OR in_instrument LIKE 'stage/innodb/%' OR in_instrument = 'stage/sql/copy to tmp table'  , 'YES', 'NO' );  RETURN v_enabled; END$$

CREATE DEFINER=`mysql.sys`@`localhost` FUNCTION `ps_is_instrument_default_timed`( in_instrument VARCHAR(128) ) RETURNS enum('YES','NO') CHARSET utf8
    READS SQL DATA
    DETERMINISTIC
    SQL SECURITY INVOKER
    COMMENT '\n Description\n \n Returns whether an instrument is timed by default in this version of MySQL.\n \n Parameters\n \n in_instrument VARCHAR(128): \n The instrument to check.\n \n Returns\n \n ENUM(''YES'', ''NO'')\n \n Example\n \n mysql> SELECT sys.ps_is_instrument_default_timed(''statement/sql/select'');\n +------------------------------------------------------------+\n | sys.ps_is_instrument_default_timed(''statement/sql/select'') |\n +------------------------------------------------------------+\n | YES                                                        |\n +------------------------------------------------------------+\n 1 row in set (0.00 sec)\n '
BEGIN DECLARE v_timed ENUM('YES', 'NO');  SET v_timed = IF(in_instrument LIKE 'wait/io/file/%' OR in_instrument LIKE 'wait/io/table/%' OR in_instrument LIKE 'statement/%' OR in_instrument IN ('wait/lock/table/sql/handler', 'idle')  OR in_instrument LIKE 'stage/innodb/%' OR in_instrument = 'stage/sql/copy to tmp table'  , 'YES', 'NO' );  RETURN v_timed; END$$

CREATE DEFINER=`mysql.sys`@`localhost` FUNCTION `ps_is_thread_instrumented`( in_connection_id BIGINT UNSIGNED ) RETURNS enum('YES','NO','UNKNOWN') CHARSET utf8
    READS SQL DATA
    SQL SECURITY INVOKER
    COMMENT '\n Description\n \n Checks whether the provided connection id is instrumented within Performance Schema.\n \n Parameters\n \n in_connection_id (BIGINT UNSIGNED):\n The id of the connection to check.\n \n Returns\n \n ENUM(''YES'', ''NO'', ''UNKNOWN'')\n \n Example\n \n mysql> SELECT sys.ps_is_thread_instrumented(CONNECTION_ID());\n +------------------------------------------------+\n | sys.ps_is_thread_instrumented(CONNECTION_ID()) |\n +------------------------------------------------+\n | YES                                            |\n +------------------------------------------------+\n '
BEGIN DECLARE v_enabled ENUM('YES', 'NO', 'UNKNOWN');  IF (in_connection_id IS NULL) THEN RETURN NULL; END IF;  SELECT INSTRUMENTED INTO v_enabled FROM performance_schema.threads  WHERE PROCESSLIST_ID = in_connection_id;  IF (v_enabled IS NULL) THEN RETURN 'UNKNOWN'; ELSE RETURN v_enabled; END IF; END$$

CREATE DEFINER=`mysql.sys`@`localhost` FUNCTION `ps_thread_account`( in_thread_id BIGINT UNSIGNED ) RETURNS text CHARSET utf8
    READS SQL DATA
    SQL SECURITY INVOKER
    COMMENT '\n Description\n \n Return the user@host account for the given Performance Schema thread id.\n \n Parameters\n \n in_thread_id (BIGINT UNSIGNED):\n The id of the thread to return the account for.\n \n Example\n \n mysql> select thread_id, processlist_user, processlist_host from performance_schema.threads where type = ''foreground'';\n +-----------+------------------+------------------+\n | thread_id | processlist_user | processlist_host |\n +-----------+------------------+------------------+\n |        23 | NULL             | NULL             |\n |        30 | root             | localhost        |\n |        31 | msandbox         | localhost        |\n |        32 | msandbox         | localhost        |\n +-----------+------------------+------------------+\n 4 rows in set (0.00 sec)\n \n mysql> select sys.ps_thread_account(31);\n +---------------------------+\n | sys.ps_thread_account(31) |\n +---------------------------+\n | msandbox@localhost        |\n +---------------------------+\n 1 row in set (0.00 sec)\n '
BEGIN RETURN (SELECT IF( type = 'FOREGROUND', CONCAT(processlist_user, '@', processlist_host), type ) AS account FROM `performance_schema`.`threads` WHERE thread_id = in_thread_id); END$$

CREATE DEFINER=`mysql.sys`@`localhost` FUNCTION `ps_thread_id`( in_connection_id BIGINT UNSIGNED ) RETURNS bigint(20) unsigned
    READS SQL DATA
    SQL SECURITY INVOKER
    COMMENT '\n Description\n \n Return the Performance Schema THREAD_ID for the specified connection ID.\n \n Parameters\n \n in_connection_id (BIGINT UNSIGNED):\n The id of the connection to return the thread id for. If NULL, the current\n connection thread id is returned.\n \n Example\n \n mysql> SELECT sys.ps_thread_id(79);\n +----------------------+\n | sys.ps_thread_id(79) |\n +----------------------+\n |                   98 |\n +----------------------+\n 1 row in set (0.00 sec)\n \n mysql> SELECT sys.ps_thread_id(CONNECTION_ID());\n +-----------------------------------+\n | sys.ps_thread_id(CONNECTION_ID()) |\n +-----------------------------------+\n |                                98 |\n +-----------------------------------+\n 1 row in set (0.00 sec)\n '
BEGIN RETURN (SELECT THREAD_ID FROM `performance_schema`.`threads` WHERE PROCESSLIST_ID = IFNULL(in_connection_id, CONNECTION_ID()) ); END$$

CREATE DEFINER=`mysql.sys`@`localhost` FUNCTION `ps_thread_stack`( thd_id BIGINT UNSIGNED, debug BOOLEAN ) RETURNS longtext CHARSET latin1
    READS SQL DATA
    SQL SECURITY INVOKER
    COMMENT '\n Description\n \n Outputs a JSON formatted stack of all statements, stages and events\n within Performance Schema for the specified thread.\n \n Parameters\n \n thd_id (BIGINT UNSIGNED):\n The id of the thread to trace. This should match the thread_id\n column from the performance_schema.threads table.\n in_verbose (BOOLEAN):\n Include file:lineno information in the events.\n \n Example\n \n (line separation added for output)\n \n mysql> SELECT sys.ps_thread_stack(37, FALSE) AS thread_stack\\G\n *************************** 1. row ***************************\n thread_stack: {"rankdir": "LR","nodesep": "0.10","stack_created": "2014-02-19 13:39:03",\n "mysql_version": "5.7.3-m13","mysql_user": "root@localhost","events": \n [{"nesting_event_id": "0", "event_id": "10", "timer_wait": 256.35, "event_info": \n "sql/select", "wait_info": "select @@version_comment limit 1\\nerrors: 0\\nwarnings: 0\\nlock time:\n ...\n '
BEGIN  DECLARE json_objects LONGTEXT;   UPDATE performance_schema.threads SET instrumented = 'NO' WHERE processlist_id = CONNECTION_ID();   SET SESSION group_concat_max_len=@@global.max_allowed_packet;  SELECT GROUP_CONCAT(CONCAT( '{' , CONCAT_WS( ', ' , CONCAT('"nesting_event_id": "', IF(nesting_event_id IS NULL, '0', nesting_event_id), '"') , CONCAT('"event_id": "', event_id, '"') , CONCAT( '"timer_wait": ', ROUND(timer_wait/1000000, 2))   , CONCAT( '"event_info": "' , CASE WHEN event_name NOT LIKE 'wait/io%' THEN REPLACE(SUBSTRING_INDEX(event_name, '/', -2), '\\', '\\\\') WHEN event_name NOT LIKE 'wait/io/file%' OR event_name NOT LIKE 'wait/io/socket%' THEN REPLACE(SUBSTRING_INDEX(event_name, '/', -4), '\\', '\\\\') ELSE event_name END , '"' ) , CONCAT( '"wait_info": "', IFNULL(wait_info, ''), '"') , CONCAT( '"source": "', IF(true AND event_name LIKE 'wait%', IFNULL(wait_info, ''), ''), '"') , CASE  WHEN event_name LIKE 'wait/io/file%'      THEN '"event_type": "io/file"' WHEN event_name LIKE 'wait/io/table%'     THEN '"event_type": "io/table"' WHEN event_name LIKE 'wait/io/socket%'    THEN '"event_type": "io/socket"' WHEN event_name LIKE 'wait/synch/mutex%'  THEN '"event_type": "synch/mutex"' WHEN event_name LIKE 'wait/synch/cond%'   THEN '"event_type": "synch/cond"' WHEN event_name LIKE 'wait/synch/rwlock%' THEN '"event_type": "synch/rwlock"' WHEN event_name LIKE 'wait/lock%'         THEN '"event_type": "lock"' WHEN event_name LIKE 'statement/%'        THEN '"event_type": "stmt"' WHEN event_name LIKE 'stage/%'            THEN '"event_type": "stage"' WHEN event_name LIKE '%idle%'             THEN '"event_type": "idle"' ELSE ''  END                    ) , '}' ) ORDER BY event_id ASC SEPARATOR ',') event INTO json_objects FROM (  (SELECT thread_id, event_id, event_name, timer_wait, timer_start, nesting_event_id,  CONCAT(sql_text, '\\n', 'errors: ', errors, '\\n', 'warnings: ', warnings, '\\n', 'lock time: ', ROUND(lock_time/1000000, 2),'us\\n', 'rows affected: ', rows_affected, '\\n', 'rows sent: ', rows_sent, '\\n', 'rows examined: ', rows_examined, '\\n', 'tmp tables: ', created_tmp_tables, '\\n', 'tmp disk tables: ', created_tmp_disk_tables, '\\n', 'select scan: ', select_scan, '\\n', 'select full join: ', select_full_join, '\\n', 'select full range join: ', select_full_range_join, '\\n', 'select range: ', select_range, '\\n', 'select range check: ', select_range_check, '\\n',  'sort merge passes: ', sort_merge_passes, '\\n', 'sort rows: ', sort_rows, '\\n', 'sort range: ', sort_range, '\\n', 'sort scan: ', sort_scan, '\\n', 'no index used: ', IF(no_index_used, 'TRUE', 'FALSE'), '\\n', 'no good index used: ', IF(no_good_index_used, 'TRUE', 'FALSE'), '\\n' ) AS wait_info FROM performance_schema.events_statements_history_long WHERE thread_id = thd_id) UNION  (SELECT thread_id, event_id, event_name, timer_wait, timer_start, nesting_event_id, null AS wait_info FROM performance_schema.events_stages_history_long WHERE thread_id = thd_id)  UNION  (SELECT thread_id, event_id,  CONCAT(event_name ,  IF(event_name NOT LIKE 'wait/synch/mutex%', IFNULL(CONCAT(' - ', operation), ''), ''),  IF(number_of_bytes IS NOT NULL, CONCAT(' ', number_of_bytes, ' bytes'), ''), IF(event_name LIKE 'wait/io/file%', '\\n', ''), IF(object_schema IS NOT NULL, CONCAT('\\nObject: ', object_schema, '.'), ''),  IF(object_name IS NOT NULL,  IF (event_name LIKE 'wait/io/socket%', CONCAT(IF (object_name LIKE ':0%', @@socket, object_name)), object_name), ''),  IF(index_name IS NOT NULL, CONCAT(' Index: ', index_name), ''), '\\n' ) AS event_name, timer_wait, timer_start, nesting_event_id, source AS wait_info FROM performance_schema.events_waits_history_long WHERE thread_id = thd_id)) events  ORDER BY event_id;  RETURN CONCAT('{',  CONCAT_WS(',',  '"rankdir": "LR"', '"nodesep": "0.10"', CONCAT('"stack_created": "', NOW(), '"'), CONCAT('"mysql_version": "', VERSION(), '"'), CONCAT('"mysql_user": "', CURRENT_USER(), '"'), CONCAT('"events": [', IFNULL(json_objects,''), ']') ), '}');  END$$

CREATE DEFINER=`mysql.sys`@`localhost` FUNCTION `ps_thread_trx_info`( in_thread_id BIGINT UNSIGNED ) RETURNS longtext CHARSET utf8
    READS SQL DATA
    SQL SECURITY INVOKER
    COMMENT '\n Description\n \n Returns a JSON object with info on the given threads current transaction, \n and the statements it has already executed, derived from the\n performance_schema.events_transactions_current and\n performance_schema.events_statements_history tables (so the consumers \n for these also have to be enabled within Performance Schema to get full\n data in the object).\n \n When the output exceeds the default truncation length (65535), a JSON error\n object is returned, such as:\n \n { "error": "Trx info truncated: Row 6 was cut by GROUP_CONCAT()" }\n \n Similar error objects are returned for other warnings/and exceptions raised\n when calling the function.\n \n The max length of the output of this function can be controlled with the\n ps_thread_trx_info.max_length variable set via sys_config, or the\n @sys.ps_thread_trx_info.max_length user variable, as appropriate.\n \n Parameters\n \n in_thread_id (BIGINT UNSIGNED):\n The id of the thread to return the transaction info for.\n \n Example\n \n SELECT sys.ps_thread_trx_info(48)\\G\n *************************** 1. row ***************************\n sys.ps_thread_trx_info(48): [\n {\n "time": "790.70 us",\n "state": "COMMITTED",\n "mode": "READ WRITE",\n "autocommitted": "NO",\n "gtid": "AUTOMATIC",\n "isolation": "REPEATABLE READ",\n "statements_executed": [\n {\n "sql_text": "INSERT INTO info VALUES (1, ''foo'')",\n "time": "471.02 us",\n "schema": "trx",\n "rows_examined": 0,\n "rows_affected": 1,\n "rows_sent": 0,\n "tmp_tables": 0,\n "tmp_disk_tables": 0,\n "sort_rows": 0,\n "sort_merge_passes": 0\n },\n {\n "sql_text": "COMMIT",\n "time": "254.42 us",\n "schema": "trx",\n "rows_examined": 0,\n "rows_affected": 0,\n "rows_sent": 0,\n "tmp_tables": 0,\n "tmp_disk_tables": 0,\n "sort_rows": 0,\n "sort_merge_passes": 0\n }\n ]\n },\n {\n "time": "426.20 us",\n "state": "COMMITTED",\n "mode": "READ WRITE",\n "autocommitted": "NO",\n "gtid": "AUTOMATIC",\n "isolation": "REPEATABLE READ",\n "statements_executed": [\n {\n "sql_text": "INSERT INTO info VALUES (2, ''bar'')",\n "time": "107.33 us",\n "schema": "trx",\n "rows_examined": 0,\n "rows_affected": 1,\n "rows_sent": 0,\n "tmp_tables": 0,\n "tmp_disk_tables": 0,\n "sort_rows": 0,\n "sort_merge_passes": 0\n },\n {\n "sql_text": "COMMIT",\n "time": "213.23 us",\n "schema": "trx",\n "rows_examined": 0,\n "rows_affected": 0,\n "rows_sent": 0,\n "tmp_tables": 0,\n "tmp_disk_tables": 0,\n "sort_rows": 0,\n "sort_merge_passes": 0\n }\n ]\n }\n ]\n 1 row in set (0.03 sec)\n '
BEGIN DECLARE v_output LONGTEXT DEFAULT '{}'; DECLARE v_msg_text TEXT DEFAULT ''; DECLARE v_signal_msg TEXT DEFAULT ''; DECLARE v_mysql_errno INT; DECLARE v_max_output_len BIGINT; DECLARE EXIT HANDLER FOR SQLWARNING, SQLEXCEPTION BEGIN GET DIAGNOSTICS CONDITION 1 v_msg_text = MESSAGE_TEXT, v_mysql_errno = MYSQL_ERRNO;  IF v_mysql_errno = 1260 THEN SET v_signal_msg = CONCAT('{ "error": "Trx info truncated: ', v_msg_text, '" }'); ELSE SET v_signal_msg = CONCAT('{ "error": "', v_msg_text, '" }'); END IF;  RETURN v_signal_msg; END;  IF (@sys.ps_thread_trx_info.max_length IS NULL) THEN SET @sys.ps_thread_trx_info.max_length = sys.sys_get_config('ps_thread_trx_info.max_length', 65535); END IF;  IF (@sys.ps_thread_trx_info.max_length != @@session.group_concat_max_len) THEN SET @old_group_concat_max_len = @@session.group_concat_max_len; SET v_max_output_len = (@sys.ps_thread_trx_info.max_length - 5); SET SESSION group_concat_max_len = v_max_output_len; END IF;  SET v_output = ( SELECT CONCAT('[', IFNULL(GROUP_CONCAT(trx_info ORDER BY event_id), ''), '\n]') AS trx_info FROM (SELECT trxi.thread_id,  trxi.event_id, GROUP_CONCAT( IFNULL( CONCAT('\n  {\n', '    "time": "', IFNULL(sys.format_time(trxi.timer_wait), ''), '",\n', '    "state": "', IFNULL(trxi.state, ''), '",\n', '    "mode": "', IFNULL(trxi.access_mode, ''), '",\n', '    "autocommitted": "', IFNULL(trxi.autocommit, ''), '",\n', '    "gtid": "', IFNULL(trxi.gtid, ''), '",\n', '    "isolation": "', IFNULL(trxi.isolation_level, ''), '",\n', '    "statements_executed": [', IFNULL(s.stmts, ''), IF(s.stmts IS NULL, ' ]\n', '\n    ]\n'), '  }' ),  '')  ORDER BY event_id) AS trx_info  FROM ( (SELECT thread_id, event_id, timer_wait, state,access_mode, autocommit, gtid, isolation_level FROM performance_schema.events_transactions_current WHERE thread_id = in_thread_id AND end_event_id IS NULL) UNION (SELECT thread_id, event_id, timer_wait, state,access_mode, autocommit, gtid, isolation_level FROM performance_schema.events_transactions_history WHERE thread_id = in_thread_id) ) AS trxi LEFT JOIN (SELECT thread_id, nesting_event_id, GROUP_CONCAT( IFNULL( CONCAT('\n      {\n', '        "sql_text": "', IFNULL(sys.format_statement(REPLACE(sql_text, '\\', '\\\\')), ''), '",\n', '        "time": "', IFNULL(sys.format_time(timer_wait), ''), '",\n', '        "schema": "', IFNULL(current_schema, ''), '",\n', '        "rows_examined": ', IFNULL(rows_examined, ''), ',\n', '        "rows_affected": ', IFNULL(rows_affected, ''), ',\n', '        "rows_sent": ', IFNULL(rows_sent, ''), ',\n', '        "tmp_tables": ', IFNULL(created_tmp_tables, ''), ',\n', '        "tmp_disk_tables": ', IFNULL(created_tmp_disk_tables, ''), ',\n', '        "sort_rows": ', IFNULL(sort_rows, ''), ',\n', '        "sort_merge_passes": ', IFNULL(sort_merge_passes, ''), '\n', '      }'), '') ORDER BY event_id) AS stmts FROM performance_schema.events_statements_history WHERE sql_text IS NOT NULL AND thread_id = in_thread_id GROUP BY thread_id, nesting_event_id ) AS s  ON trxi.thread_id = s.thread_id  AND trxi.event_id = s.nesting_event_id WHERE trxi.thread_id = in_thread_id GROUP BY trxi.thread_id, trxi.event_id ) trxs GROUP BY thread_id );  IF (@old_group_concat_max_len IS NOT NULL) THEN SET SESSION group_concat_max_len = @old_group_concat_max_len; END IF;  RETURN v_output; END$$

CREATE DEFINER=`mysql.sys`@`localhost` FUNCTION `quote_identifier`(in_identifier TEXT) RETURNS text CHARSET utf8
    NO SQL
    DETERMINISTIC
    SQL SECURITY INVOKER
    COMMENT '\n Description\n \n Takes an unquoted identifier (schema name, table name, etc.) and\n returns the identifier quoted with backticks.\n \n Parameters\n \n in_identifier (TEXT):\n The identifier to quote.\n \n Returns\n \n TEXT\n \n Example\n \n mysql> SELECT sys.quote_identifier(''my_identifier'') AS Identifier;\n +-----------------+\n | Identifier      |\n +-----------------+\n | `my_identifier` |\n +-----------------+\n 1 row in set (0.00 sec)\n \n mysql> SELECT sys.quote_identifier(''my`idenfier'') AS Identifier;\n +----------------+\n | Identifier     |\n +----------------+\n | `my``idenfier` |\n +----------------+\n 1 row in set (0.00 sec)\n '
BEGIN RETURN CONCAT('`', REPLACE(in_identifier, '`', '``'), '`'); END$$

CREATE DEFINER=`mysql.sys`@`localhost` FUNCTION `sys_get_config`( in_variable_name VARCHAR(128), in_default_value VARCHAR(128) ) RETURNS varchar(128) CHARSET utf8
    READS SQL DATA
    DETERMINISTIC
    SQL SECURITY INVOKER
    COMMENT '\n Description\n \n Returns the value for the requested variable using the following logic:\n \n 1. If the option exists in sys.sys_config return the value from there.\n 2. Else fall back on the provided default value.\n \n Notes for using sys_get_config():\n \n * If the default value argument to sys_get_config() is NULL and case 2. is reached, NULL is returned.\n It is then expected that the caller is able to handle NULL for the given configuration option.\n * The convention is to name the user variables @sys.<name of variable>. It is <name of variable> that\n is stored in the sys_config table and is what is expected as the argument to sys_get_config().\n * If you want to check whether the configuration option has already been set and if not assign with\n the return value of sys_get_config() you can use IFNULL(...) (see example below). However this should\n not be done inside a loop (e.g. for each row in a result set) as for repeated calls where assignment\n is only needed in the first iteration using IFNULL(...) is expected to be significantly slower than\n using an IF (...) THEN ... END IF; block (see example below).\n \n Parameters\n \n in_variable_name (VARCHAR(128)):\n The name of the config option to return the value for.\n \n in_default_value (VARCHAR(128)):\n The default value to return if the variable does not exist in sys.sys_config.\n \n Returns\n \n VARCHAR(128)\n \n Example\n \n mysql> SELECT sys.sys_get_config(''statement_truncate_len'', 128) AS Value;\n +-------+\n | Value |\n +-------+\n | 64    |\n +-------+\n 1 row in set (0.00 sec)\n \n mysql> SET @sys.statement_truncate_len = IFNULL(@sys.statement_truncate_len, sys.sys_get_config(''statement_truncate_len'', 64));\n Query OK, 0 rows affected (0.00 sec)\n \n IF (@sys.statement_truncate_len IS NULL) THEN\n SET @sys.statement_truncate_len = sys.sys_get_config(''statement_truncate_len'', 64);\n END IF;\n '
BEGIN DECLARE v_value VARCHAR(128) DEFAULT NULL;  SET v_value = (SELECT value FROM sys.sys_config WHERE variable = in_variable_name);  IF (v_value IS NULL) THEN SET v_value = in_default_value; END IF;  RETURN v_value; END$$

CREATE DEFINER=`mysql.sys`@`localhost` FUNCTION `version_major`() RETURNS tinyint(3) unsigned
    NO SQL
    SQL SECURITY INVOKER
    COMMENT '\n Description\n \n Returns the major version of MySQL Server.\n \n Returns\n \n TINYINT UNSIGNED\n \n Example\n \n mysql> SELECT VERSION(), sys.version_major();\n +--------------------------------------+---------------------+\n | VERSION()                            | sys.version_major() |\n +--------------------------------------+---------------------+\n | 5.7.9-enterprise-commercial-advanced | 5                   |\n +--------------------------------------+---------------------+\n 1 row in set (0.00 sec)\n '
BEGIN RETURN SUBSTRING_INDEX(SUBSTRING_INDEX(VERSION(), '-', 1), '.', 1); END$$

CREATE DEFINER=`mysql.sys`@`localhost` FUNCTION `version_minor`() RETURNS tinyint(3) unsigned
    NO SQL
    SQL SECURITY INVOKER
    COMMENT '\n Description\n \n Returns the minor (release series) version of MySQL Server.\n \n Returns\n \n TINYINT UNSIGNED\n \n Example\n \n mysql> SELECT VERSION(), sys.server_minor();\n +--------------------------------------+---------------------+\n | VERSION()                            | sys.version_minor() |\n +--------------------------------------+---------------------+\n | 5.7.9-enterprise-commercial-advanced | 7                   |\n +--------------------------------------+---------------------+\n 1 row in set (0.00 sec)\n '
BEGIN RETURN SUBSTRING_INDEX(SUBSTRING_INDEX(SUBSTRING_INDEX(VERSION(), '-', 1), '.', 2), '.', -1); END$$

CREATE DEFINER=`mysql.sys`@`localhost` FUNCTION `version_patch`() RETURNS tinyint(3) unsigned
    NO SQL
    SQL SECURITY INVOKER
    COMMENT '\n Description\n \n Returns the patch release version of MySQL Server.\n \n Returns\n \n TINYINT UNSIGNED\n \n Example\n \n mysql> SELECT VERSION(), sys.version_patch();\n +--------------------------------------+---------------------+\n | VERSION()                            | sys.version_patch() |\n +--------------------------------------+---------------------+\n | 5.7.9-enterprise-commercial-advanced | 9                   |\n +--------------------------------------+---------------------+\n 1 row in set (0.00 sec)\n '
BEGIN RETURN SUBSTRING_INDEX(SUBSTRING_INDEX(VERSION(), '-', 1), '.', -1); END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `host_summary`
--
CREATE TABLE IF NOT EXISTS `host_summary` (
`host` varchar(60)
,`statements` decimal(64,0)
,`statement_latency` text
,`statement_avg_latency` text
,`table_scans` decimal(65,0)
,`file_ios` decimal(64,0)
,`file_io_latency` text
,`current_connections` decimal(41,0)
,`total_connections` decimal(41,0)
,`unique_users` bigint(21)
,`current_memory` text
,`total_memory_allocated` text
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `host_summary_by_file_io`
--
CREATE TABLE IF NOT EXISTS `host_summary_by_file_io` (
`host` varchar(60)
,`ios` decimal(42,0)
,`io_latency` text
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `host_summary_by_file_io_type`
--
CREATE TABLE IF NOT EXISTS `host_summary_by_file_io_type` (
`host` varchar(60)
,`event_name` varchar(128)
,`total` bigint(20) unsigned
,`total_latency` text
,`max_latency` text
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `host_summary_by_stages`
--
CREATE TABLE IF NOT EXISTS `host_summary_by_stages` (
`host` varchar(60)
,`event_name` varchar(128)
,`total` bigint(20) unsigned
,`total_latency` text
,`avg_latency` text
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `host_summary_by_statement_latency`
--
CREATE TABLE IF NOT EXISTS `host_summary_by_statement_latency` (
`host` varchar(60)
,`total` decimal(42,0)
,`total_latency` text
,`max_latency` text
,`lock_latency` text
,`rows_sent` decimal(42,0)
,`rows_examined` decimal(42,0)
,`rows_affected` decimal(42,0)
,`full_scans` decimal(43,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `host_summary_by_statement_type`
--
CREATE TABLE IF NOT EXISTS `host_summary_by_statement_type` (
`host` varchar(60)
,`statement` varchar(128)
,`total` bigint(20) unsigned
,`total_latency` text
,`max_latency` text
,`lock_latency` text
,`rows_sent` bigint(20) unsigned
,`rows_examined` bigint(20) unsigned
,`rows_affected` bigint(20) unsigned
,`full_scans` bigint(21) unsigned
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `innodb_buffer_stats_by_schema`
--
CREATE TABLE IF NOT EXISTS `innodb_buffer_stats_by_schema` (
`object_schema` text
,`allocated` text
,`data` text
,`pages` bigint(21)
,`pages_hashed` bigint(21)
,`pages_old` bigint(21)
,`rows_cached` decimal(44,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `innodb_buffer_stats_by_table`
--
CREATE TABLE IF NOT EXISTS `innodb_buffer_stats_by_table` (
`object_schema` text
,`object_name` text
,`allocated` text
,`data` text
,`pages` bigint(21)
,`pages_hashed` bigint(21)
,`pages_old` bigint(21)
,`rows_cached` decimal(44,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `innodb_lock_waits`
--
CREATE TABLE IF NOT EXISTS `innodb_lock_waits` (
`wait_started` datetime
,`wait_age` time
,`wait_age_secs` bigint(21)
,`locked_table` varchar(1024)
,`locked_index` varchar(1024)
,`locked_type` varchar(32)
,`waiting_trx_id` varchar(18)
,`waiting_trx_started` datetime
,`waiting_trx_age` time
,`waiting_trx_rows_locked` bigint(21) unsigned
,`waiting_trx_rows_modified` bigint(21) unsigned
,`waiting_pid` bigint(21) unsigned
,`waiting_query` longtext
,`waiting_lock_id` varchar(81)
,`waiting_lock_mode` varchar(32)
,`blocking_trx_id` varchar(18)
,`blocking_pid` bigint(21) unsigned
,`blocking_query` longtext
,`blocking_lock_id` varchar(81)
,`blocking_lock_mode` varchar(32)
,`blocking_trx_started` datetime
,`blocking_trx_age` time
,`blocking_trx_rows_locked` bigint(21) unsigned
,`blocking_trx_rows_modified` bigint(21) unsigned
,`sql_kill_blocking_query` varchar(32)
,`sql_kill_blocking_connection` varchar(26)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `io_by_thread_by_latency`
--
CREATE TABLE IF NOT EXISTS `io_by_thread_by_latency` (
`user` varchar(128)
,`total` decimal(42,0)
,`total_latency` text
,`min_latency` text
,`avg_latency` text
,`max_latency` text
,`thread_id` bigint(20) unsigned
,`processlist_id` bigint(20) unsigned
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `io_global_by_file_by_bytes`
--
CREATE TABLE IF NOT EXISTS `io_global_by_file_by_bytes` (
`file` varchar(512)
,`count_read` bigint(20) unsigned
,`total_read` text
,`avg_read` text
,`count_write` bigint(20) unsigned
,`total_written` text
,`avg_write` text
,`total` text
,`write_pct` decimal(26,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `io_global_by_file_by_latency`
--
CREATE TABLE IF NOT EXISTS `io_global_by_file_by_latency` (
`file` varchar(512)
,`total` bigint(20) unsigned
,`total_latency` text
,`count_read` bigint(20) unsigned
,`read_latency` text
,`count_write` bigint(20) unsigned
,`write_latency` text
,`count_misc` bigint(20) unsigned
,`misc_latency` text
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `io_global_by_wait_by_bytes`
--
CREATE TABLE IF NOT EXISTS `io_global_by_wait_by_bytes` (
`event_name` varchar(128)
,`total` bigint(20) unsigned
,`total_latency` text
,`min_latency` text
,`avg_latency` text
,`max_latency` text
,`count_read` bigint(20) unsigned
,`total_read` text
,`avg_read` text
,`count_write` bigint(20) unsigned
,`total_written` text
,`avg_written` text
,`total_requested` text
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `io_global_by_wait_by_latency`
--
CREATE TABLE IF NOT EXISTS `io_global_by_wait_by_latency` (
`event_name` varchar(128)
,`total` bigint(20) unsigned
,`total_latency` text
,`avg_latency` text
,`max_latency` text
,`read_latency` text
,`write_latency` text
,`misc_latency` text
,`count_read` bigint(20) unsigned
,`total_read` text
,`avg_read` text
,`count_write` bigint(20) unsigned
,`total_written` text
,`avg_written` text
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `latest_file_io`
--
CREATE TABLE IF NOT EXISTS `latest_file_io` (
`thread` varchar(149)
,`file` varchar(512)
,`latency` text
,`operation` varchar(32)
,`requested` text
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `memory_by_host_by_current_bytes`
--
CREATE TABLE IF NOT EXISTS `memory_by_host_by_current_bytes` (
`host` varchar(60)
,`current_count_used` decimal(41,0)
,`current_allocated` text
,`current_avg_alloc` text
,`current_max_alloc` text
,`total_allocated` text
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `memory_by_thread_by_current_bytes`
--
CREATE TABLE IF NOT EXISTS `memory_by_thread_by_current_bytes` (
`thread_id` bigint(20) unsigned
,`user` varchar(128)
,`current_count_used` decimal(41,0)
,`current_allocated` text
,`current_avg_alloc` text
,`current_max_alloc` text
,`total_allocated` text
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `memory_by_user_by_current_bytes`
--
CREATE TABLE IF NOT EXISTS `memory_by_user_by_current_bytes` (
`user` varchar(32)
,`current_count_used` decimal(41,0)
,`current_allocated` text
,`current_avg_alloc` text
,`current_max_alloc` text
,`total_allocated` text
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `memory_global_by_current_bytes`
--
CREATE TABLE IF NOT EXISTS `memory_global_by_current_bytes` (
`event_name` varchar(128)
,`current_count` bigint(20)
,`current_alloc` text
,`current_avg_alloc` text
,`high_count` bigint(20)
,`high_alloc` text
,`high_avg_alloc` text
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `memory_global_total`
--
CREATE TABLE IF NOT EXISTS `memory_global_total` (
`total_allocated` text
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `metrics`
--
CREATE TABLE IF NOT EXISTS `metrics` (
`Variable_name` varchar(193)
,`Variable_value` text
,`Type` varchar(210)
,`Enabled` varchar(7)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `processlist`
--
CREATE TABLE IF NOT EXISTS `processlist` (
`thd_id` bigint(20) unsigned
,`conn_id` bigint(20) unsigned
,`user` varchar(128)
,`db` varchar(64)
,`command` varchar(16)
,`state` varchar(64)
,`time` bigint(20)
,`current_statement` longtext
,`statement_latency` text
,`progress` decimal(26,2)
,`lock_latency` text
,`rows_examined` bigint(20) unsigned
,`rows_sent` bigint(20) unsigned
,`rows_affected` bigint(20) unsigned
,`tmp_tables` bigint(20) unsigned
,`tmp_disk_tables` bigint(20) unsigned
,`full_scan` varchar(3)
,`last_statement` longtext
,`last_statement_latency` text
,`current_memory` text
,`last_wait` varchar(128)
,`last_wait_latency` text
,`source` varchar(64)
,`trx_latency` text
,`trx_state` enum('ACTIVE','COMMITTED','ROLLED BACK')
,`trx_autocommit` enum('YES','NO')
,`pid` varchar(1024)
,`program_name` varchar(1024)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `ps_check_lost_instrumentation`
--
CREATE TABLE IF NOT EXISTS `ps_check_lost_instrumentation` (
`variable_name` varchar(64)
,`variable_value` varchar(1024)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `schema_auto_increment_columns`
--
CREATE TABLE IF NOT EXISTS `schema_auto_increment_columns` (
`table_schema` varchar(64)
,`table_name` varchar(64)
,`column_name` varchar(64)
,`data_type` varchar(64)
,`column_type` longtext
,`is_signed` int(1)
,`is_unsigned` int(1)
,`max_value` bigint(21) unsigned
,`auto_increment` bigint(21) unsigned
,`auto_increment_ratio` decimal(25,4) unsigned
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `schema_index_statistics`
--
CREATE TABLE IF NOT EXISTS `schema_index_statistics` (
`table_schema` varchar(64)
,`table_name` varchar(64)
,`index_name` varchar(64)
,`rows_selected` bigint(20) unsigned
,`select_latency` text
,`rows_inserted` bigint(20) unsigned
,`insert_latency` text
,`rows_updated` bigint(20) unsigned
,`update_latency` text
,`rows_deleted` bigint(20) unsigned
,`delete_latency` text
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `schema_object_overview`
--
CREATE TABLE IF NOT EXISTS `schema_object_overview` (
`db` varchar(64)
,`object_type` varchar(64)
,`count` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `schema_redundant_indexes`
--
CREATE TABLE IF NOT EXISTS `schema_redundant_indexes` (
`table_schema` varchar(64)
,`table_name` varchar(64)
,`redundant_index_name` varchar(64)
,`redundant_index_columns` text
,`redundant_index_non_unique` bigint(1)
,`dominant_index_name` varchar(64)
,`dominant_index_columns` text
,`dominant_index_non_unique` bigint(1)
,`subpart_exists` int(1)
,`sql_drop_index` varchar(223)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `schema_table_lock_waits`
--
CREATE TABLE IF NOT EXISTS `schema_table_lock_waits` (
`object_schema` varchar(64)
,`object_name` varchar(64)
,`waiting_thread_id` bigint(20) unsigned
,`waiting_pid` bigint(20) unsigned
,`waiting_account` text
,`waiting_lock_type` varchar(32)
,`waiting_lock_duration` varchar(32)
,`waiting_query` longtext
,`waiting_query_secs` bigint(20)
,`waiting_query_rows_affected` bigint(20) unsigned
,`waiting_query_rows_examined` bigint(20) unsigned
,`blocking_thread_id` bigint(20) unsigned
,`blocking_pid` bigint(20) unsigned
,`blocking_account` text
,`blocking_lock_type` varchar(32)
,`blocking_lock_duration` varchar(32)
,`sql_kill_blocking_query` varchar(31)
,`sql_kill_blocking_connection` varchar(25)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `schema_table_statistics`
--
CREATE TABLE IF NOT EXISTS `schema_table_statistics` (
`table_schema` varchar(64)
,`table_name` varchar(64)
,`total_latency` text
,`rows_fetched` bigint(20) unsigned
,`fetch_latency` text
,`rows_inserted` bigint(20) unsigned
,`insert_latency` text
,`rows_updated` bigint(20) unsigned
,`update_latency` text
,`rows_deleted` bigint(20) unsigned
,`delete_latency` text
,`io_read_requests` decimal(42,0)
,`io_read` text
,`io_read_latency` text
,`io_write_requests` decimal(42,0)
,`io_write` text
,`io_write_latency` text
,`io_misc_requests` decimal(42,0)
,`io_misc_latency` text
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `schema_table_statistics_with_buffer`
--
CREATE TABLE IF NOT EXISTS `schema_table_statistics_with_buffer` (
`table_schema` varchar(64)
,`table_name` varchar(64)
,`rows_fetched` bigint(20) unsigned
,`fetch_latency` text
,`rows_inserted` bigint(20) unsigned
,`insert_latency` text
,`rows_updated` bigint(20) unsigned
,`update_latency` text
,`rows_deleted` bigint(20) unsigned
,`delete_latency` text
,`io_read_requests` decimal(42,0)
,`io_read` text
,`io_read_latency` text
,`io_write_requests` decimal(42,0)
,`io_write` text
,`io_write_latency` text
,`io_misc_requests` decimal(42,0)
,`io_misc_latency` text
,`innodb_buffer_allocated` text
,`innodb_buffer_data` text
,`innodb_buffer_free` text
,`innodb_buffer_pages` bigint(21)
,`innodb_buffer_pages_hashed` bigint(21)
,`innodb_buffer_pages_old` bigint(21)
,`innodb_buffer_rows_cached` decimal(44,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `schema_tables_with_full_table_scans`
--
CREATE TABLE IF NOT EXISTS `schema_tables_with_full_table_scans` (
`object_schema` varchar(64)
,`object_name` varchar(64)
,`rows_full_scanned` bigint(20) unsigned
,`latency` text
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `schema_unused_indexes`
--
CREATE TABLE IF NOT EXISTS `schema_unused_indexes` (
`object_schema` varchar(64)
,`object_name` varchar(64)
,`index_name` varchar(64)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `session`
--
CREATE TABLE IF NOT EXISTS `session` (
`thd_id` bigint(20) unsigned
,`conn_id` bigint(20) unsigned
,`user` varchar(128)
,`db` varchar(64)
,`command` varchar(16)
,`state` varchar(64)
,`time` bigint(20)
,`current_statement` longtext
,`statement_latency` text
,`progress` decimal(26,2)
,`lock_latency` text
,`rows_examined` bigint(20) unsigned
,`rows_sent` bigint(20) unsigned
,`rows_affected` bigint(20) unsigned
,`tmp_tables` bigint(20) unsigned
,`tmp_disk_tables` bigint(20) unsigned
,`full_scan` varchar(3)
,`last_statement` longtext
,`last_statement_latency` text
,`current_memory` text
,`last_wait` varchar(128)
,`last_wait_latency` text
,`source` varchar(64)
,`trx_latency` text
,`trx_state` enum('ACTIVE','COMMITTED','ROLLED BACK')
,`trx_autocommit` enum('YES','NO')
,`pid` varchar(1024)
,`program_name` varchar(1024)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `session_ssl_status`
--
CREATE TABLE IF NOT EXISTS `session_ssl_status` (
`thread_id` bigint(20) unsigned
,`ssl_version` varchar(1024)
,`ssl_cipher` varchar(1024)
,`ssl_sessions_reused` varchar(1024)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `statement_analysis`
--
CREATE TABLE IF NOT EXISTS `statement_analysis` (
`query` longtext
,`db` varchar(64)
,`full_scan` varchar(1)
,`exec_count` bigint(20) unsigned
,`err_count` bigint(20) unsigned
,`warn_count` bigint(20) unsigned
,`total_latency` text
,`max_latency` text
,`avg_latency` text
,`lock_latency` text
,`rows_sent` bigint(20) unsigned
,`rows_sent_avg` decimal(21,0)
,`rows_examined` bigint(20) unsigned
,`rows_examined_avg` decimal(21,0)
,`rows_affected` bigint(20) unsigned
,`rows_affected_avg` decimal(21,0)
,`tmp_tables` bigint(20) unsigned
,`tmp_disk_tables` bigint(20) unsigned
,`rows_sorted` bigint(20) unsigned
,`sort_merge_passes` bigint(20) unsigned
,`digest` varchar(32)
,`first_seen` timestamp
,`last_seen` timestamp
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `statements_with_errors_or_warnings`
--
CREATE TABLE IF NOT EXISTS `statements_with_errors_or_warnings` (
`query` longtext
,`db` varchar(64)
,`exec_count` bigint(20) unsigned
,`errors` bigint(20) unsigned
,`error_pct` decimal(27,4)
,`warnings` bigint(20) unsigned
,`warning_pct` decimal(27,4)
,`first_seen` timestamp
,`last_seen` timestamp
,`digest` varchar(32)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `statements_with_full_table_scans`
--
CREATE TABLE IF NOT EXISTS `statements_with_full_table_scans` (
`query` longtext
,`db` varchar(64)
,`exec_count` bigint(20) unsigned
,`total_latency` text
,`no_index_used_count` bigint(20) unsigned
,`no_good_index_used_count` bigint(20) unsigned
,`no_index_used_pct` decimal(24,0)
,`rows_sent` bigint(20) unsigned
,`rows_examined` bigint(20) unsigned
,`rows_sent_avg` decimal(21,0) unsigned
,`rows_examined_avg` decimal(21,0) unsigned
,`first_seen` timestamp
,`last_seen` timestamp
,`digest` varchar(32)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `statements_with_runtimes_in_95th_percentile`
--
CREATE TABLE IF NOT EXISTS `statements_with_runtimes_in_95th_percentile` (
`query` longtext
,`db` varchar(64)
,`full_scan` varchar(1)
,`exec_count` bigint(20) unsigned
,`err_count` bigint(20) unsigned
,`warn_count` bigint(20) unsigned
,`total_latency` text
,`max_latency` text
,`avg_latency` text
,`rows_sent` bigint(20) unsigned
,`rows_sent_avg` decimal(21,0)
,`rows_examined` bigint(20) unsigned
,`rows_examined_avg` decimal(21,0)
,`first_seen` timestamp
,`last_seen` timestamp
,`digest` varchar(32)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `statements_with_sorting`
--
CREATE TABLE IF NOT EXISTS `statements_with_sorting` (
`query` longtext
,`db` varchar(64)
,`exec_count` bigint(20) unsigned
,`total_latency` text
,`sort_merge_passes` bigint(20) unsigned
,`avg_sort_merges` decimal(21,0)
,`sorts_using_scans` bigint(20) unsigned
,`sort_using_range` bigint(20) unsigned
,`rows_sorted` bigint(20) unsigned
,`avg_rows_sorted` decimal(21,0)
,`first_seen` timestamp
,`last_seen` timestamp
,`digest` varchar(32)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `statements_with_temp_tables`
--
CREATE TABLE IF NOT EXISTS `statements_with_temp_tables` (
`query` longtext
,`db` varchar(64)
,`exec_count` bigint(20) unsigned
,`total_latency` text
,`memory_tmp_tables` bigint(20) unsigned
,`disk_tmp_tables` bigint(20) unsigned
,`avg_tmp_tables_per_query` decimal(21,0)
,`tmp_tables_to_disk_pct` decimal(24,0)
,`first_seen` timestamp
,`last_seen` timestamp
,`digest` varchar(32)
);

-- --------------------------------------------------------

--
-- Estrutura da tabela `sys_config`
--

CREATE TABLE IF NOT EXISTS `sys_config` (
  `variable` varchar(128) NOT NULL,
  `value` varchar(128) DEFAULT NULL,
  `set_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `set_by` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `sys_config`
--

INSERT INTO `sys_config` (`variable`, `value`, `set_time`, `set_by`) VALUES
('diagnostics.allow_i_s_tables', 'OFF', '2020-04-01 11:22:27', NULL),
('diagnostics.include_raw', 'OFF', '2020-04-01 11:22:27', NULL),
('ps_thread_trx_info.max_length', '65535', '2020-04-01 11:22:27', NULL),
('statement_performance_analyzer.limit', '100', '2020-04-01 11:22:27', NULL),
('statement_performance_analyzer.view', NULL, '2020-04-01 11:22:27', NULL),
('statement_truncate_len', '64', '2020-04-01 11:22:27', NULL);

--
-- Acionadores `sys_config`
--
DELIMITER $$
CREATE TRIGGER `sys_config_insert_set_user` BEFORE INSERT ON `sys_config`
 FOR EACH ROW BEGIN IF @sys.ignore_sys_config_triggers != true AND NEW.set_by IS NULL THEN SET NEW.set_by = USER(); END IF; END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `sys_config_update_set_user` BEFORE UPDATE ON `sys_config`
 FOR EACH ROW BEGIN IF @sys.ignore_sys_config_triggers != true AND NEW.set_by IS NULL THEN SET NEW.set_by = USER(); END IF; END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `user_summary`
--
CREATE TABLE IF NOT EXISTS `user_summary` (
`user` varchar(32)
,`statements` decimal(64,0)
,`statement_latency` text
,`statement_avg_latency` text
,`table_scans` decimal(65,0)
,`file_ios` decimal(64,0)
,`file_io_latency` text
,`current_connections` decimal(41,0)
,`total_connections` decimal(41,0)
,`unique_hosts` bigint(21)
,`current_memory` text
,`total_memory_allocated` text
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `user_summary_by_file_io`
--
CREATE TABLE IF NOT EXISTS `user_summary_by_file_io` (
`user` varchar(32)
,`ios` decimal(42,0)
,`io_latency` text
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `user_summary_by_file_io_type`
--
CREATE TABLE IF NOT EXISTS `user_summary_by_file_io_type` (
`user` varchar(32)
,`event_name` varchar(128)
,`total` bigint(20) unsigned
,`latency` text
,`max_latency` text
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `user_summary_by_stages`
--
CREATE TABLE IF NOT EXISTS `user_summary_by_stages` (
`user` varchar(32)
,`event_name` varchar(128)
,`total` bigint(20) unsigned
,`total_latency` text
,`avg_latency` text
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `user_summary_by_statement_latency`
--
CREATE TABLE IF NOT EXISTS `user_summary_by_statement_latency` (
`user` varchar(32)
,`total` decimal(42,0)
,`total_latency` text
,`max_latency` text
,`lock_latency` text
,`rows_sent` decimal(42,0)
,`rows_examined` decimal(42,0)
,`rows_affected` decimal(42,0)
,`full_scans` decimal(43,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `user_summary_by_statement_type`
--
CREATE TABLE IF NOT EXISTS `user_summary_by_statement_type` (
`user` varchar(32)
,`statement` varchar(128)
,`total` bigint(20) unsigned
,`total_latency` text
,`max_latency` text
,`lock_latency` text
,`rows_sent` bigint(20) unsigned
,`rows_examined` bigint(20) unsigned
,`rows_affected` bigint(20) unsigned
,`full_scans` bigint(21) unsigned
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `version`
--
CREATE TABLE IF NOT EXISTS `version` (
`sys_version` varchar(5)
,`mysql_version` varchar(6)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `wait_classes_global_by_avg_latency`
--
CREATE TABLE IF NOT EXISTS `wait_classes_global_by_avg_latency` (
`event_class` varchar(128)
,`total` decimal(42,0)
,`total_latency` text
,`min_latency` text
,`avg_latency` text
,`max_latency` text
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `wait_classes_global_by_latency`
--
CREATE TABLE IF NOT EXISTS `wait_classes_global_by_latency` (
`event_class` varchar(128)
,`total` decimal(42,0)
,`total_latency` text
,`min_latency` text
,`avg_latency` text
,`max_latency` text
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `waits_by_host_by_latency`
--
CREATE TABLE IF NOT EXISTS `waits_by_host_by_latency` (
`host` varchar(60)
,`event` varchar(128)
,`total` bigint(20) unsigned
,`total_latency` text
,`avg_latency` text
,`max_latency` text
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `waits_by_user_by_latency`
--
CREATE TABLE IF NOT EXISTS `waits_by_user_by_latency` (
`user` varchar(32)
,`event` varchar(128)
,`total` bigint(20) unsigned
,`total_latency` text
,`avg_latency` text
,`max_latency` text
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `waits_global_by_latency`
--
CREATE TABLE IF NOT EXISTS `waits_global_by_latency` (
`events` varchar(128)
,`total` bigint(20) unsigned
,`total_latency` text
,`avg_latency` text
,`max_latency` text
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `x$host_summary`
--
CREATE TABLE IF NOT EXISTS `x$host_summary` (
`host` varchar(60)
,`statements` decimal(64,0)
,`statement_latency` decimal(64,0)
,`statement_avg_latency` decimal(65,4)
,`table_scans` decimal(65,0)
,`file_ios` decimal(64,0)
,`file_io_latency` decimal(64,0)
,`current_connections` decimal(41,0)
,`total_connections` decimal(41,0)
,`unique_users` bigint(21)
,`current_memory` decimal(63,0)
,`total_memory_allocated` decimal(64,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `x$host_summary_by_file_io`
--
CREATE TABLE IF NOT EXISTS `x$host_summary_by_file_io` (
`host` varchar(60)
,`ios` decimal(42,0)
,`io_latency` decimal(42,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `x$host_summary_by_file_io_type`
--
CREATE TABLE IF NOT EXISTS `x$host_summary_by_file_io_type` (
`host` varchar(60)
,`event_name` varchar(128)
,`total` bigint(20) unsigned
,`total_latency` bigint(20) unsigned
,`max_latency` bigint(20) unsigned
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `x$host_summary_by_stages`
--
CREATE TABLE IF NOT EXISTS `x$host_summary_by_stages` (
`host` varchar(60)
,`event_name` varchar(128)
,`total` bigint(20) unsigned
,`total_latency` bigint(20) unsigned
,`avg_latency` bigint(20) unsigned
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `x$host_summary_by_statement_latency`
--
CREATE TABLE IF NOT EXISTS `x$host_summary_by_statement_latency` (
`host` varchar(60)
,`total` decimal(42,0)
,`total_latency` decimal(42,0)
,`max_latency` bigint(20) unsigned
,`lock_latency` decimal(42,0)
,`rows_sent` decimal(42,0)
,`rows_examined` decimal(42,0)
,`rows_affected` decimal(42,0)
,`full_scans` decimal(43,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `x$host_summary_by_statement_type`
--
CREATE TABLE IF NOT EXISTS `x$host_summary_by_statement_type` (
`host` varchar(60)
,`statement` varchar(128)
,`total` bigint(20) unsigned
,`total_latency` bigint(20) unsigned
,`max_latency` bigint(20) unsigned
,`lock_latency` bigint(20) unsigned
,`rows_sent` bigint(20) unsigned
,`rows_examined` bigint(20) unsigned
,`rows_affected` bigint(20) unsigned
,`full_scans` bigint(21) unsigned
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `x$innodb_buffer_stats_by_schema`
--
CREATE TABLE IF NOT EXISTS `x$innodb_buffer_stats_by_schema` (
`object_schema` text
,`allocated` decimal(43,0)
,`data` decimal(43,0)
,`pages` bigint(21)
,`pages_hashed` bigint(21)
,`pages_old` bigint(21)
,`rows_cached` decimal(44,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `x$innodb_buffer_stats_by_table`
--
CREATE TABLE IF NOT EXISTS `x$innodb_buffer_stats_by_table` (
`object_schema` text
,`object_name` text
,`allocated` decimal(43,0)
,`data` decimal(43,0)
,`pages` bigint(21)
,`pages_hashed` bigint(21)
,`pages_old` bigint(21)
,`rows_cached` decimal(44,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `x$innodb_lock_waits`
--
CREATE TABLE IF NOT EXISTS `x$innodb_lock_waits` (
`wait_started` datetime
,`wait_age` time
,`wait_age_secs` bigint(21)
,`locked_table` varchar(1024)
,`locked_index` varchar(1024)
,`locked_type` varchar(32)
,`waiting_trx_id` varchar(18)
,`waiting_trx_started` datetime
,`waiting_trx_age` time
,`waiting_trx_rows_locked` bigint(21) unsigned
,`waiting_trx_rows_modified` bigint(21) unsigned
,`waiting_pid` bigint(21) unsigned
,`waiting_query` varchar(1024)
,`waiting_lock_id` varchar(81)
,`waiting_lock_mode` varchar(32)
,`blocking_trx_id` varchar(18)
,`blocking_pid` bigint(21) unsigned
,`blocking_query` varchar(1024)
,`blocking_lock_id` varchar(81)
,`blocking_lock_mode` varchar(32)
,`blocking_trx_started` datetime
,`blocking_trx_age` time
,`blocking_trx_rows_locked` bigint(21) unsigned
,`blocking_trx_rows_modified` bigint(21) unsigned
,`sql_kill_blocking_query` varchar(32)
,`sql_kill_blocking_connection` varchar(26)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `x$io_by_thread_by_latency`
--
CREATE TABLE IF NOT EXISTS `x$io_by_thread_by_latency` (
`user` varchar(128)
,`total` decimal(42,0)
,`total_latency` decimal(42,0)
,`min_latency` bigint(20) unsigned
,`avg_latency` decimal(24,4)
,`max_latency` bigint(20) unsigned
,`thread_id` bigint(20) unsigned
,`processlist_id` bigint(20) unsigned
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `x$io_global_by_file_by_bytes`
--
CREATE TABLE IF NOT EXISTS `x$io_global_by_file_by_bytes` (
`file` varchar(512)
,`count_read` bigint(20) unsigned
,`total_read` bigint(20)
,`avg_read` decimal(23,4)
,`count_write` bigint(20) unsigned
,`total_written` bigint(20)
,`avg_write` decimal(23,4)
,`total` bigint(21)
,`write_pct` decimal(26,2)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `x$io_global_by_file_by_latency`
--
CREATE TABLE IF NOT EXISTS `x$io_global_by_file_by_latency` (
`file` varchar(512)
,`total` bigint(20) unsigned
,`total_latency` bigint(20) unsigned
,`count_read` bigint(20) unsigned
,`read_latency` bigint(20) unsigned
,`count_write` bigint(20) unsigned
,`write_latency` bigint(20) unsigned
,`count_misc` bigint(20) unsigned
,`misc_latency` bigint(20) unsigned
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `x$io_global_by_wait_by_bytes`
--
CREATE TABLE IF NOT EXISTS `x$io_global_by_wait_by_bytes` (
`event_name` varchar(128)
,`total` bigint(20) unsigned
,`total_latency` bigint(20) unsigned
,`min_latency` bigint(20) unsigned
,`avg_latency` bigint(20) unsigned
,`max_latency` bigint(20) unsigned
,`count_read` bigint(20) unsigned
,`total_read` bigint(20)
,`avg_read` decimal(23,4)
,`count_write` bigint(20) unsigned
,`total_written` bigint(20)
,`avg_written` decimal(23,4)
,`total_requested` bigint(21)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `x$io_global_by_wait_by_latency`
--
CREATE TABLE IF NOT EXISTS `x$io_global_by_wait_by_latency` (
`event_name` varchar(128)
,`total` bigint(20) unsigned
,`total_latency` bigint(20) unsigned
,`avg_latency` bigint(20) unsigned
,`max_latency` bigint(20) unsigned
,`read_latency` bigint(20) unsigned
,`write_latency` bigint(20) unsigned
,`misc_latency` bigint(20) unsigned
,`count_read` bigint(20) unsigned
,`total_read` bigint(20)
,`avg_read` decimal(23,4)
,`count_write` bigint(20) unsigned
,`total_written` bigint(20)
,`avg_written` decimal(23,4)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `x$latest_file_io`
--
CREATE TABLE IF NOT EXISTS `x$latest_file_io` (
`thread` varchar(149)
,`file` varchar(512)
,`latency` bigint(20) unsigned
,`operation` varchar(32)
,`requested` bigint(20)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `x$memory_by_host_by_current_bytes`
--
CREATE TABLE IF NOT EXISTS `x$memory_by_host_by_current_bytes` (
`host` varchar(60)
,`current_count_used` decimal(41,0)
,`current_allocated` decimal(41,0)
,`current_avg_alloc` decimal(45,4)
,`current_max_alloc` bigint(20)
,`total_allocated` decimal(42,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `x$memory_by_thread_by_current_bytes`
--
CREATE TABLE IF NOT EXISTS `x$memory_by_thread_by_current_bytes` (
`thread_id` bigint(20) unsigned
,`user` varchar(128)
,`current_count_used` decimal(41,0)
,`current_allocated` decimal(41,0)
,`current_avg_alloc` decimal(45,4)
,`current_max_alloc` bigint(20)
,`total_allocated` decimal(42,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `x$memory_by_user_by_current_bytes`
--
CREATE TABLE IF NOT EXISTS `x$memory_by_user_by_current_bytes` (
`user` varchar(32)
,`current_count_used` decimal(41,0)
,`current_allocated` decimal(41,0)
,`current_avg_alloc` decimal(45,4)
,`current_max_alloc` bigint(20)
,`total_allocated` decimal(42,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `x$memory_global_by_current_bytes`
--
CREATE TABLE IF NOT EXISTS `x$memory_global_by_current_bytes` (
`event_name` varchar(128)
,`current_count` bigint(20)
,`current_alloc` bigint(20)
,`current_avg_alloc` decimal(23,4)
,`high_count` bigint(20)
,`high_alloc` bigint(20)
,`high_avg_alloc` decimal(23,4)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `x$memory_global_total`
--
CREATE TABLE IF NOT EXISTS `x$memory_global_total` (
`total_allocated` decimal(41,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `x$processlist`
--
CREATE TABLE IF NOT EXISTS `x$processlist` (
`thd_id` bigint(20) unsigned
,`conn_id` bigint(20) unsigned
,`user` varchar(128)
,`db` varchar(64)
,`command` varchar(16)
,`state` varchar(64)
,`time` bigint(20)
,`current_statement` longtext
,`statement_latency` bigint(20) unsigned
,`progress` decimal(26,2)
,`lock_latency` bigint(20) unsigned
,`rows_examined` bigint(20) unsigned
,`rows_sent` bigint(20) unsigned
,`rows_affected` bigint(20) unsigned
,`tmp_tables` bigint(20) unsigned
,`tmp_disk_tables` bigint(20) unsigned
,`full_scan` varchar(3)
,`last_statement` longtext
,`last_statement_latency` bigint(20) unsigned
,`current_memory` decimal(41,0)
,`last_wait` varchar(128)
,`last_wait_latency` varchar(20)
,`source` varchar(64)
,`trx_latency` bigint(20) unsigned
,`trx_state` enum('ACTIVE','COMMITTED','ROLLED BACK')
,`trx_autocommit` enum('YES','NO')
,`pid` varchar(1024)
,`program_name` varchar(1024)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `x$ps_digest_95th_percentile_by_avg_us`
--
CREATE TABLE IF NOT EXISTS `x$ps_digest_95th_percentile_by_avg_us` (
`avg_us` decimal(21,0)
,`percentile` decimal(46,4)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `x$ps_digest_avg_latency_distribution`
--
CREATE TABLE IF NOT EXISTS `x$ps_digest_avg_latency_distribution` (
`cnt` bigint(21)
,`avg_us` decimal(21,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `x$ps_schema_table_statistics_io`
--
CREATE TABLE IF NOT EXISTS `x$ps_schema_table_statistics_io` (
`table_schema` varchar(64)
,`table_name` varchar(64)
,`count_read` decimal(42,0)
,`sum_number_of_bytes_read` decimal(41,0)
,`sum_timer_read` decimal(42,0)
,`count_write` decimal(42,0)
,`sum_number_of_bytes_write` decimal(41,0)
,`sum_timer_write` decimal(42,0)
,`count_misc` decimal(42,0)
,`sum_timer_misc` decimal(42,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `x$schema_flattened_keys`
--
CREATE TABLE IF NOT EXISTS `x$schema_flattened_keys` (
`table_schema` varchar(64)
,`table_name` varchar(64)
,`index_name` varchar(64)
,`non_unique` bigint(1)
,`subpart_exists` bigint(1)
,`index_columns` text
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `x$schema_index_statistics`
--
CREATE TABLE IF NOT EXISTS `x$schema_index_statistics` (
`table_schema` varchar(64)
,`table_name` varchar(64)
,`index_name` varchar(64)
,`rows_selected` bigint(20) unsigned
,`select_latency` bigint(20) unsigned
,`rows_inserted` bigint(20) unsigned
,`insert_latency` bigint(20) unsigned
,`rows_updated` bigint(20) unsigned
,`update_latency` bigint(20) unsigned
,`rows_deleted` bigint(20) unsigned
,`delete_latency` bigint(20) unsigned
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `x$schema_table_lock_waits`
--
CREATE TABLE IF NOT EXISTS `x$schema_table_lock_waits` (
`object_schema` varchar(64)
,`object_name` varchar(64)
,`waiting_thread_id` bigint(20) unsigned
,`waiting_pid` bigint(20) unsigned
,`waiting_account` text
,`waiting_lock_type` varchar(32)
,`waiting_lock_duration` varchar(32)
,`waiting_query` longtext
,`waiting_query_secs` bigint(20)
,`waiting_query_rows_affected` bigint(20) unsigned
,`waiting_query_rows_examined` bigint(20) unsigned
,`blocking_thread_id` bigint(20) unsigned
,`blocking_pid` bigint(20) unsigned
,`blocking_account` text
,`blocking_lock_type` varchar(32)
,`blocking_lock_duration` varchar(32)
,`sql_kill_blocking_query` varchar(31)
,`sql_kill_blocking_connection` varchar(25)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `x$schema_table_statistics`
--
CREATE TABLE IF NOT EXISTS `x$schema_table_statistics` (
`table_schema` varchar(64)
,`table_name` varchar(64)
,`total_latency` bigint(20) unsigned
,`rows_fetched` bigint(20) unsigned
,`fetch_latency` bigint(20) unsigned
,`rows_inserted` bigint(20) unsigned
,`insert_latency` bigint(20) unsigned
,`rows_updated` bigint(20) unsigned
,`update_latency` bigint(20) unsigned
,`rows_deleted` bigint(20) unsigned
,`delete_latency` bigint(20) unsigned
,`io_read_requests` decimal(42,0)
,`io_read` decimal(41,0)
,`io_read_latency` decimal(42,0)
,`io_write_requests` decimal(42,0)
,`io_write` decimal(41,0)
,`io_write_latency` decimal(42,0)
,`io_misc_requests` decimal(42,0)
,`io_misc_latency` decimal(42,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `x$schema_table_statistics_with_buffer`
--
CREATE TABLE IF NOT EXISTS `x$schema_table_statistics_with_buffer` (
`table_schema` varchar(64)
,`table_name` varchar(64)
,`rows_fetched` bigint(20) unsigned
,`fetch_latency` bigint(20) unsigned
,`rows_inserted` bigint(20) unsigned
,`insert_latency` bigint(20) unsigned
,`rows_updated` bigint(20) unsigned
,`update_latency` bigint(20) unsigned
,`rows_deleted` bigint(20) unsigned
,`delete_latency` bigint(20) unsigned
,`io_read_requests` decimal(42,0)
,`io_read` decimal(41,0)
,`io_read_latency` decimal(42,0)
,`io_write_requests` decimal(42,0)
,`io_write` decimal(41,0)
,`io_write_latency` decimal(42,0)
,`io_misc_requests` decimal(42,0)
,`io_misc_latency` decimal(42,0)
,`innodb_buffer_allocated` decimal(43,0)
,`innodb_buffer_data` decimal(43,0)
,`innodb_buffer_free` decimal(44,0)
,`innodb_buffer_pages` bigint(21)
,`innodb_buffer_pages_hashed` bigint(21)
,`innodb_buffer_pages_old` bigint(21)
,`innodb_buffer_rows_cached` decimal(44,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `x$schema_tables_with_full_table_scans`
--
CREATE TABLE IF NOT EXISTS `x$schema_tables_with_full_table_scans` (
`object_schema` varchar(64)
,`object_name` varchar(64)
,`rows_full_scanned` bigint(20) unsigned
,`latency` bigint(20) unsigned
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `x$session`
--
CREATE TABLE IF NOT EXISTS `x$session` (
`thd_id` bigint(20) unsigned
,`conn_id` bigint(20) unsigned
,`user` varchar(128)
,`db` varchar(64)
,`command` varchar(16)
,`state` varchar(64)
,`time` bigint(20)
,`current_statement` longtext
,`statement_latency` bigint(20) unsigned
,`progress` decimal(26,2)
,`lock_latency` bigint(20) unsigned
,`rows_examined` bigint(20) unsigned
,`rows_sent` bigint(20) unsigned
,`rows_affected` bigint(20) unsigned
,`tmp_tables` bigint(20) unsigned
,`tmp_disk_tables` bigint(20) unsigned
,`full_scan` varchar(3)
,`last_statement` longtext
,`last_statement_latency` bigint(20) unsigned
,`current_memory` decimal(41,0)
,`last_wait` varchar(128)
,`last_wait_latency` varchar(20)
,`source` varchar(64)
,`trx_latency` bigint(20) unsigned
,`trx_state` enum('ACTIVE','COMMITTED','ROLLED BACK')
,`trx_autocommit` enum('YES','NO')
,`pid` varchar(1024)
,`program_name` varchar(1024)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `x$statement_analysis`
--
CREATE TABLE IF NOT EXISTS `x$statement_analysis` (
`query` longtext
,`db` varchar(64)
,`full_scan` varchar(1)
,`exec_count` bigint(20) unsigned
,`err_count` bigint(20) unsigned
,`warn_count` bigint(20) unsigned
,`total_latency` bigint(20) unsigned
,`max_latency` bigint(20) unsigned
,`avg_latency` bigint(20) unsigned
,`lock_latency` bigint(20) unsigned
,`rows_sent` bigint(20) unsigned
,`rows_sent_avg` decimal(21,0)
,`rows_examined` bigint(20) unsigned
,`rows_examined_avg` decimal(21,0)
,`rows_affected` bigint(20) unsigned
,`rows_affected_avg` decimal(21,0)
,`tmp_tables` bigint(20) unsigned
,`tmp_disk_tables` bigint(20) unsigned
,`rows_sorted` bigint(20) unsigned
,`sort_merge_passes` bigint(20) unsigned
,`digest` varchar(32)
,`first_seen` timestamp
,`last_seen` timestamp
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `x$statements_with_errors_or_warnings`
--
CREATE TABLE IF NOT EXISTS `x$statements_with_errors_or_warnings` (
`query` longtext
,`db` varchar(64)
,`exec_count` bigint(20) unsigned
,`errors` bigint(20) unsigned
,`error_pct` decimal(27,4)
,`warnings` bigint(20) unsigned
,`warning_pct` decimal(27,4)
,`first_seen` timestamp
,`last_seen` timestamp
,`digest` varchar(32)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `x$statements_with_full_table_scans`
--
CREATE TABLE IF NOT EXISTS `x$statements_with_full_table_scans` (
`query` longtext
,`db` varchar(64)
,`exec_count` bigint(20) unsigned
,`total_latency` bigint(20) unsigned
,`no_index_used_count` bigint(20) unsigned
,`no_good_index_used_count` bigint(20) unsigned
,`no_index_used_pct` decimal(24,0)
,`rows_sent` bigint(20) unsigned
,`rows_examined` bigint(20) unsigned
,`rows_sent_avg` decimal(21,0) unsigned
,`rows_examined_avg` decimal(21,0) unsigned
,`first_seen` timestamp
,`last_seen` timestamp
,`digest` varchar(32)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `x$statements_with_runtimes_in_95th_percentile`
--
CREATE TABLE IF NOT EXISTS `x$statements_with_runtimes_in_95th_percentile` (
`query` longtext
,`db` varchar(64)
,`full_scan` varchar(1)
,`exec_count` bigint(20) unsigned
,`err_count` bigint(20) unsigned
,`warn_count` bigint(20) unsigned
,`total_latency` bigint(20) unsigned
,`max_latency` bigint(20) unsigned
,`avg_latency` bigint(20) unsigned
,`rows_sent` bigint(20) unsigned
,`rows_sent_avg` decimal(21,0)
,`rows_examined` bigint(20) unsigned
,`rows_examined_avg` decimal(21,0)
,`first_seen` timestamp
,`last_seen` timestamp
,`digest` varchar(32)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `x$statements_with_sorting`
--
CREATE TABLE IF NOT EXISTS `x$statements_with_sorting` (
`query` longtext
,`db` varchar(64)
,`exec_count` bigint(20) unsigned
,`total_latency` bigint(20) unsigned
,`sort_merge_passes` bigint(20) unsigned
,`avg_sort_merges` decimal(21,0)
,`sorts_using_scans` bigint(20) unsigned
,`sort_using_range` bigint(20) unsigned
,`rows_sorted` bigint(20) unsigned
,`avg_rows_sorted` decimal(21,0)
,`first_seen` timestamp
,`last_seen` timestamp
,`digest` varchar(32)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `x$statements_with_temp_tables`
--
CREATE TABLE IF NOT EXISTS `x$statements_with_temp_tables` (
`query` longtext
,`db` varchar(64)
,`exec_count` bigint(20) unsigned
,`total_latency` bigint(20) unsigned
,`memory_tmp_tables` bigint(20) unsigned
,`disk_tmp_tables` bigint(20) unsigned
,`avg_tmp_tables_per_query` decimal(21,0)
,`tmp_tables_to_disk_pct` decimal(24,0)
,`first_seen` timestamp
,`last_seen` timestamp
,`digest` varchar(32)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `x$user_summary`
--
CREATE TABLE IF NOT EXISTS `x$user_summary` (
`user` varchar(32)
,`statements` decimal(64,0)
,`statement_latency` decimal(64,0)
,`statement_avg_latency` decimal(65,4)
,`table_scans` decimal(65,0)
,`file_ios` decimal(64,0)
,`file_io_latency` decimal(64,0)
,`current_connections` decimal(41,0)
,`total_connections` decimal(41,0)
,`unique_hosts` bigint(21)
,`current_memory` decimal(63,0)
,`total_memory_allocated` decimal(64,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `x$user_summary_by_file_io`
--
CREATE TABLE IF NOT EXISTS `x$user_summary_by_file_io` (
`user` varchar(32)
,`ios` decimal(42,0)
,`io_latency` decimal(42,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `x$user_summary_by_file_io_type`
--
CREATE TABLE IF NOT EXISTS `x$user_summary_by_file_io_type` (
`user` varchar(32)
,`event_name` varchar(128)
,`total` bigint(20) unsigned
,`latency` bigint(20) unsigned
,`max_latency` bigint(20) unsigned
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `x$user_summary_by_stages`
--
CREATE TABLE IF NOT EXISTS `x$user_summary_by_stages` (
`user` varchar(32)
,`event_name` varchar(128)
,`total` bigint(20) unsigned
,`total_latency` bigint(20) unsigned
,`avg_latency` bigint(20) unsigned
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `x$user_summary_by_statement_latency`
--
CREATE TABLE IF NOT EXISTS `x$user_summary_by_statement_latency` (
`user` varchar(32)
,`total` decimal(42,0)
,`total_latency` decimal(42,0)
,`max_latency` decimal(42,0)
,`lock_latency` decimal(42,0)
,`rows_sent` decimal(42,0)
,`rows_examined` decimal(42,0)
,`rows_affected` decimal(42,0)
,`full_scans` decimal(43,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `x$user_summary_by_statement_type`
--
CREATE TABLE IF NOT EXISTS `x$user_summary_by_statement_type` (
`user` varchar(32)
,`statement` varchar(128)
,`total` bigint(20) unsigned
,`total_latency` bigint(20) unsigned
,`max_latency` bigint(20) unsigned
,`lock_latency` bigint(20) unsigned
,`rows_sent` bigint(20) unsigned
,`rows_examined` bigint(20) unsigned
,`rows_affected` bigint(20) unsigned
,`full_scans` bigint(21) unsigned
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `x$wait_classes_global_by_avg_latency`
--
CREATE TABLE IF NOT EXISTS `x$wait_classes_global_by_avg_latency` (
`event_class` varchar(128)
,`total` decimal(42,0)
,`total_latency` decimal(42,0)
,`min_latency` bigint(20) unsigned
,`avg_latency` decimal(46,4)
,`max_latency` bigint(20) unsigned
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `x$wait_classes_global_by_latency`
--
CREATE TABLE IF NOT EXISTS `x$wait_classes_global_by_latency` (
`event_class` varchar(128)
,`total` decimal(42,0)
,`total_latency` decimal(42,0)
,`min_latency` bigint(20) unsigned
,`avg_latency` decimal(46,4)
,`max_latency` bigint(20) unsigned
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `x$waits_by_host_by_latency`
--
CREATE TABLE IF NOT EXISTS `x$waits_by_host_by_latency` (
`host` varchar(60)
,`event` varchar(128)
,`total` bigint(20) unsigned
,`total_latency` bigint(20) unsigned
,`avg_latency` bigint(20) unsigned
,`max_latency` bigint(20) unsigned
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `x$waits_by_user_by_latency`
--
CREATE TABLE IF NOT EXISTS `x$waits_by_user_by_latency` (
`user` varchar(32)
,`event` varchar(128)
,`total` bigint(20) unsigned
,`total_latency` bigint(20) unsigned
,`avg_latency` bigint(20) unsigned
,`max_latency` bigint(20) unsigned
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `x$waits_global_by_latency`
--
CREATE TABLE IF NOT EXISTS `x$waits_global_by_latency` (
`events` varchar(128)
,`total` bigint(20) unsigned
,`total_latency` bigint(20) unsigned
,`avg_latency` bigint(20) unsigned
,`max_latency` bigint(20) unsigned
);

-- --------------------------------------------------------

--
-- Structure for view `host_summary`
--
DROP TABLE IF EXISTS `host_summary`;

CREATE ALGORITHM=TEMPTABLE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `host_summary` AS select if(isnull(`performance_schema`.`accounts`.`HOST`),'background',`performance_schema`.`accounts`.`HOST`) AS `host`,sum(`stmt`.`total`) AS `statements`,`format_time`(sum(`stmt`.`total_latency`)) AS `statement_latency`,`format_time`(ifnull((sum(`stmt`.`total_latency`) / nullif(sum(`stmt`.`total`),0)),0)) AS `statement_avg_latency`,sum(`stmt`.`full_scans`) AS `table_scans`,sum(`io`.`ios`) AS `file_ios`,`format_time`(sum(`io`.`io_latency`)) AS `file_io_latency`,sum(`performance_schema`.`accounts`.`CURRENT_CONNECTIONS`) AS `current_connections`,sum(`performance_schema`.`accounts`.`TOTAL_CONNECTIONS`) AS `total_connections`,count(distinct `performance_schema`.`accounts`.`USER`) AS `unique_users`,`format_bytes`(sum(`mem`.`current_allocated`)) AS `current_memory`,`format_bytes`(sum(`mem`.`total_allocated`)) AS `total_memory_allocated` from (((`performance_schema`.`accounts` join `x$host_summary_by_statement_latency` `stmt` on((`performance_schema`.`accounts`.`HOST` = `stmt`.`host`))) join `x$host_summary_by_file_io` `io` on((`performance_schema`.`accounts`.`HOST` = `io`.`host`))) join `x$memory_by_host_by_current_bytes` `mem` on((`performance_schema`.`accounts`.`HOST` = `mem`.`host`))) group by if(isnull(`performance_schema`.`accounts`.`HOST`),'background',`performance_schema`.`accounts`.`HOST`);

-- --------------------------------------------------------

--
-- Structure for view `host_summary_by_file_io`
--
DROP TABLE IF EXISTS `host_summary_by_file_io`;

CREATE ALGORITHM=TEMPTABLE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `host_summary_by_file_io` AS select if(isnull(`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST`),'background',`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST`) AS `host`,sum(`performance_schema`.`events_waits_summary_by_host_by_event_name`.`COUNT_STAR`) AS `ios`,`format_time`(sum(`performance_schema`.`events_waits_summary_by_host_by_event_name`.`SUM_TIMER_WAIT`)) AS `io_latency` from `performance_schema`.`events_waits_summary_by_host_by_event_name` where (`performance_schema`.`events_waits_summary_by_host_by_event_name`.`EVENT_NAME` like 'wait/io/file/%') group by if(isnull(`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST`),'background',`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST`) order by sum(`performance_schema`.`events_waits_summary_by_host_by_event_name`.`SUM_TIMER_WAIT`) desc;

-- --------------------------------------------------------

--
-- Structure for view `host_summary_by_file_io_type`
--
DROP TABLE IF EXISTS `host_summary_by_file_io_type`;

CREATE ALGORITHM=MERGE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `host_summary_by_file_io_type` AS select if(isnull(`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST`),'background',`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST`) AS `host`,`performance_schema`.`events_waits_summary_by_host_by_event_name`.`EVENT_NAME` AS `event_name`,`performance_schema`.`events_waits_summary_by_host_by_event_name`.`COUNT_STAR` AS `total`,`format_time`(`performance_schema`.`events_waits_summary_by_host_by_event_name`.`SUM_TIMER_WAIT`) AS `total_latency`,`format_time`(`performance_schema`.`events_waits_summary_by_host_by_event_name`.`MAX_TIMER_WAIT`) AS `max_latency` from `performance_schema`.`events_waits_summary_by_host_by_event_name` where ((`performance_schema`.`events_waits_summary_by_host_by_event_name`.`EVENT_NAME` like 'wait/io/file%') and (`performance_schema`.`events_waits_summary_by_host_by_event_name`.`COUNT_STAR` > 0)) order by if(isnull(`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST`),'background',`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST`),`performance_schema`.`events_waits_summary_by_host_by_event_name`.`SUM_TIMER_WAIT` desc;

-- --------------------------------------------------------

--
-- Structure for view `host_summary_by_stages`
--
DROP TABLE IF EXISTS `host_summary_by_stages`;

CREATE ALGORITHM=MERGE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `host_summary_by_stages` AS select if(isnull(`performance_schema`.`events_stages_summary_by_host_by_event_name`.`HOST`),'background',`performance_schema`.`events_stages_summary_by_host_by_event_name`.`HOST`) AS `host`,`performance_schema`.`events_stages_summary_by_host_by_event_name`.`EVENT_NAME` AS `event_name`,`performance_schema`.`events_stages_summary_by_host_by_event_name`.`COUNT_STAR` AS `total`,`format_time`(`performance_schema`.`events_stages_summary_by_host_by_event_name`.`SUM_TIMER_WAIT`) AS `total_latency`,`format_time`(`performance_schema`.`events_stages_summary_by_host_by_event_name`.`AVG_TIMER_WAIT`) AS `avg_latency` from `performance_schema`.`events_stages_summary_by_host_by_event_name` where (`performance_schema`.`events_stages_summary_by_host_by_event_name`.`SUM_TIMER_WAIT` <> 0) order by if(isnull(`performance_schema`.`events_stages_summary_by_host_by_event_name`.`HOST`),'background',`performance_schema`.`events_stages_summary_by_host_by_event_name`.`HOST`),`performance_schema`.`events_stages_summary_by_host_by_event_name`.`SUM_TIMER_WAIT` desc;

-- --------------------------------------------------------

--
-- Structure for view `host_summary_by_statement_latency`
--
DROP TABLE IF EXISTS `host_summary_by_statement_latency`;

CREATE ALGORITHM=TEMPTABLE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `host_summary_by_statement_latency` AS select if(isnull(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`HOST`),'background',`performance_schema`.`events_statements_summary_by_host_by_event_name`.`HOST`) AS `host`,sum(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`COUNT_STAR`) AS `total`,`format_time`(sum(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_TIMER_WAIT`)) AS `total_latency`,`format_time`(max(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`MAX_TIMER_WAIT`)) AS `max_latency`,`format_time`(sum(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_LOCK_TIME`)) AS `lock_latency`,sum(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_ROWS_SENT`) AS `rows_sent`,sum(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_ROWS_EXAMINED`) AS `rows_examined`,sum(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_ROWS_AFFECTED`) AS `rows_affected`,(sum(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_NO_INDEX_USED`) + sum(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_NO_GOOD_INDEX_USED`)) AS `full_scans` from `performance_schema`.`events_statements_summary_by_host_by_event_name` group by if(isnull(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`HOST`),'background',`performance_schema`.`events_statements_summary_by_host_by_event_name`.`HOST`) order by sum(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_TIMER_WAIT`) desc;

-- --------------------------------------------------------

--
-- Structure for view `host_summary_by_statement_type`
--
DROP TABLE IF EXISTS `host_summary_by_statement_type`;

CREATE ALGORITHM=MERGE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `host_summary_by_statement_type` AS select if(isnull(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`HOST`),'background',`performance_schema`.`events_statements_summary_by_host_by_event_name`.`HOST`) AS `host`,substring_index(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`EVENT_NAME`,'/',-(1)) AS `statement`,`performance_schema`.`events_statements_summary_by_host_by_event_name`.`COUNT_STAR` AS `total`,`format_time`(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_TIMER_WAIT`) AS `total_latency`,`format_time`(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`MAX_TIMER_WAIT`) AS `max_latency`,`format_time`(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_LOCK_TIME`) AS `lock_latency`,`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_ROWS_SENT` AS `rows_sent`,`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_ROWS_EXAMINED` AS `rows_examined`,`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_ROWS_AFFECTED` AS `rows_affected`,(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_NO_INDEX_USED` + `performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_NO_GOOD_INDEX_USED`) AS `full_scans` from `performance_schema`.`events_statements_summary_by_host_by_event_name` where (`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_TIMER_WAIT` <> 0) order by if(isnull(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`HOST`),'background',`performance_schema`.`events_statements_summary_by_host_by_event_name`.`HOST`),`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_TIMER_WAIT` desc;

-- --------------------------------------------------------

--
-- Structure for view `innodb_buffer_stats_by_schema`
--
DROP TABLE IF EXISTS `innodb_buffer_stats_by_schema`;

CREATE ALGORITHM=TEMPTABLE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `innodb_buffer_stats_by_schema` AS select if((locate('.',`ibp`.`TABLE_NAME`) = 0),'InnoDB System',replace(substring_index(`ibp`.`TABLE_NAME`,'.',1),'`','')) AS `object_schema`,`format_bytes`(sum(if((`ibp`.`COMPRESSED_SIZE` = 0),16384,`ibp`.`COMPRESSED_SIZE`))) AS `allocated`,`format_bytes`(sum(`ibp`.`DATA_SIZE`)) AS `data`,count(`ibp`.`PAGE_NUMBER`) AS `pages`,count(if((`ibp`.`IS_HASHED` = 'YES'),1,NULL)) AS `pages_hashed`,count(if((`ibp`.`IS_OLD` = 'YES'),1,NULL)) AS `pages_old`,round((sum(`ibp`.`NUMBER_RECORDS`) / count(distinct `ibp`.`INDEX_NAME`)),0) AS `rows_cached` from `information_schema`.`innodb_buffer_page` `ibp` where (`ibp`.`TABLE_NAME` is not null) group by `object_schema` order by sum(if((`ibp`.`COMPRESSED_SIZE` = 0),16384,`ibp`.`COMPRESSED_SIZE`)) desc;

-- --------------------------------------------------------

--
-- Structure for view `innodb_buffer_stats_by_table`
--
DROP TABLE IF EXISTS `innodb_buffer_stats_by_table`;

CREATE ALGORITHM=TEMPTABLE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `innodb_buffer_stats_by_table` AS select if((locate('.',`ibp`.`TABLE_NAME`) = 0),'InnoDB System',replace(substring_index(`ibp`.`TABLE_NAME`,'.',1),'`','')) AS `object_schema`,replace(substring_index(`ibp`.`TABLE_NAME`,'.',-(1)),'`','') AS `object_name`,`format_bytes`(sum(if((`ibp`.`COMPRESSED_SIZE` = 0),16384,`ibp`.`COMPRESSED_SIZE`))) AS `allocated`,`format_bytes`(sum(`ibp`.`DATA_SIZE`)) AS `data`,count(`ibp`.`PAGE_NUMBER`) AS `pages`,count(if((`ibp`.`IS_HASHED` = 'YES'),1,NULL)) AS `pages_hashed`,count(if((`ibp`.`IS_OLD` = 'YES'),1,NULL)) AS `pages_old`,round((sum(`ibp`.`NUMBER_RECORDS`) / count(distinct `ibp`.`INDEX_NAME`)),0) AS `rows_cached` from `information_schema`.`innodb_buffer_page` `ibp` where (`ibp`.`TABLE_NAME` is not null) group by `object_schema`,`object_name` order by sum(if((`ibp`.`COMPRESSED_SIZE` = 0),16384,`ibp`.`COMPRESSED_SIZE`)) desc;

-- --------------------------------------------------------

--
-- Structure for view `innodb_lock_waits`
--
DROP TABLE IF EXISTS `innodb_lock_waits`;

CREATE ALGORITHM=TEMPTABLE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `innodb_lock_waits` AS select `r`.`trx_wait_started` AS `wait_started`,timediff(now(),`r`.`trx_wait_started`) AS `wait_age`,timestampdiff(SECOND,`r`.`trx_wait_started`,now()) AS `wait_age_secs`,`rl`.`lock_table` AS `locked_table`,`rl`.`lock_index` AS `locked_index`,`rl`.`lock_type` AS `locked_type`,`r`.`trx_id` AS `waiting_trx_id`,`r`.`trx_started` AS `waiting_trx_started`,timediff(now(),`r`.`trx_started`) AS `waiting_trx_age`,`r`.`trx_rows_locked` AS `waiting_trx_rows_locked`,`r`.`trx_rows_modified` AS `waiting_trx_rows_modified`,`r`.`trx_mysql_thread_id` AS `waiting_pid`,`format_statement`(`r`.`trx_query`) AS `waiting_query`,`rl`.`lock_id` AS `waiting_lock_id`,`rl`.`lock_mode` AS `waiting_lock_mode`,`b`.`trx_id` AS `blocking_trx_id`,`b`.`trx_mysql_thread_id` AS `blocking_pid`,`format_statement`(`b`.`trx_query`) AS `blocking_query`,`bl`.`lock_id` AS `blocking_lock_id`,`bl`.`lock_mode` AS `blocking_lock_mode`,`b`.`trx_started` AS `blocking_trx_started`,timediff(now(),`b`.`trx_started`) AS `blocking_trx_age`,`b`.`trx_rows_locked` AS `blocking_trx_rows_locked`,`b`.`trx_rows_modified` AS `blocking_trx_rows_modified`,concat('KILL QUERY ',`b`.`trx_mysql_thread_id`) AS `sql_kill_blocking_query`,concat('KILL ',`b`.`trx_mysql_thread_id`) AS `sql_kill_blocking_connection` from ((((`information_schema`.`innodb_lock_waits` `w` join `information_schema`.`innodb_trx` `b` on((`b`.`trx_id` = `w`.`blocking_trx_id`))) join `information_schema`.`innodb_trx` `r` on((`r`.`trx_id` = `w`.`requesting_trx_id`))) join `information_schema`.`innodb_locks` `bl` on((`bl`.`lock_id` = `w`.`blocking_lock_id`))) join `information_schema`.`innodb_locks` `rl` on((`rl`.`lock_id` = `w`.`requested_lock_id`))) order by `r`.`trx_wait_started`;

-- --------------------------------------------------------

--
-- Structure for view `io_by_thread_by_latency`
--
DROP TABLE IF EXISTS `io_by_thread_by_latency`;

CREATE ALGORITHM=TEMPTABLE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `io_by_thread_by_latency` AS select if(isnull(`performance_schema`.`threads`.`PROCESSLIST_ID`),substring_index(`performance_schema`.`threads`.`NAME`,'/',-(1)),concat(`performance_schema`.`threads`.`PROCESSLIST_USER`,'@',`performance_schema`.`threads`.`PROCESSLIST_HOST`)) AS `user`,sum(`performance_schema`.`events_waits_summary_by_thread_by_event_name`.`COUNT_STAR`) AS `total`,`format_time`(sum(`performance_schema`.`events_waits_summary_by_thread_by_event_name`.`SUM_TIMER_WAIT`)) AS `total_latency`,`format_time`(min(`performance_schema`.`events_waits_summary_by_thread_by_event_name`.`MIN_TIMER_WAIT`)) AS `min_latency`,`format_time`(avg(`performance_schema`.`events_waits_summary_by_thread_by_event_name`.`AVG_TIMER_WAIT`)) AS `avg_latency`,`format_time`(max(`performance_schema`.`events_waits_summary_by_thread_by_event_name`.`MAX_TIMER_WAIT`)) AS `max_latency`,`performance_schema`.`events_waits_summary_by_thread_by_event_name`.`THREAD_ID` AS `thread_id`,`performance_schema`.`threads`.`PROCESSLIST_ID` AS `processlist_id` from (`performance_schema`.`events_waits_summary_by_thread_by_event_name` left join `performance_schema`.`threads` on((`performance_schema`.`events_waits_summary_by_thread_by_event_name`.`THREAD_ID` = `performance_schema`.`threads`.`THREAD_ID`))) where ((`performance_schema`.`events_waits_summary_by_thread_by_event_name`.`EVENT_NAME` like 'wait/io/file/%') and (`performance_schema`.`events_waits_summary_by_thread_by_event_name`.`SUM_TIMER_WAIT` > 0)) group by `performance_schema`.`events_waits_summary_by_thread_by_event_name`.`THREAD_ID`,`performance_schema`.`threads`.`PROCESSLIST_ID`,`user` order by sum(`performance_schema`.`events_waits_summary_by_thread_by_event_name`.`SUM_TIMER_WAIT`) desc;

-- --------------------------------------------------------

--
-- Structure for view `io_global_by_file_by_bytes`
--
DROP TABLE IF EXISTS `io_global_by_file_by_bytes`;

CREATE ALGORITHM=MERGE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `io_global_by_file_by_bytes` AS select `format_path`(`performance_schema`.`file_summary_by_instance`.`FILE_NAME`) AS `file`,`performance_schema`.`file_summary_by_instance`.`COUNT_READ` AS `count_read`,`format_bytes`(`performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_READ`) AS `total_read`,`format_bytes`(ifnull((`performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_READ` / nullif(`performance_schema`.`file_summary_by_instance`.`COUNT_READ`,0)),0)) AS `avg_read`,`performance_schema`.`file_summary_by_instance`.`COUNT_WRITE` AS `count_write`,`format_bytes`(`performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_WRITE`) AS `total_written`,`format_bytes`(ifnull((`performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_WRITE` / nullif(`performance_schema`.`file_summary_by_instance`.`COUNT_WRITE`,0)),0.00)) AS `avg_write`,`format_bytes`((`performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_READ` + `performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_WRITE`)) AS `total`,ifnull(round((100 - ((`performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_READ` / nullif((`performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_READ` + `performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_WRITE`),0)) * 100)),2),0.00) AS `write_pct` from `performance_schema`.`file_summary_by_instance` order by (`performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_READ` + `performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_WRITE`) desc;

-- --------------------------------------------------------

--
-- Structure for view `io_global_by_file_by_latency`
--
DROP TABLE IF EXISTS `io_global_by_file_by_latency`;

CREATE ALGORITHM=MERGE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `io_global_by_file_by_latency` AS select `format_path`(`performance_schema`.`file_summary_by_instance`.`FILE_NAME`) AS `file`,`performance_schema`.`file_summary_by_instance`.`COUNT_STAR` AS `total`,`format_time`(`performance_schema`.`file_summary_by_instance`.`SUM_TIMER_WAIT`) AS `total_latency`,`performance_schema`.`file_summary_by_instance`.`COUNT_READ` AS `count_read`,`format_time`(`performance_schema`.`file_summary_by_instance`.`SUM_TIMER_READ`) AS `read_latency`,`performance_schema`.`file_summary_by_instance`.`COUNT_WRITE` AS `count_write`,`format_time`(`performance_schema`.`file_summary_by_instance`.`SUM_TIMER_WRITE`) AS `write_latency`,`performance_schema`.`file_summary_by_instance`.`COUNT_MISC` AS `count_misc`,`format_time`(`performance_schema`.`file_summary_by_instance`.`SUM_TIMER_MISC`) AS `misc_latency` from `performance_schema`.`file_summary_by_instance` order by `performance_schema`.`file_summary_by_instance`.`SUM_TIMER_WAIT` desc;

-- --------------------------------------------------------

--
-- Structure for view `io_global_by_wait_by_bytes`
--
DROP TABLE IF EXISTS `io_global_by_wait_by_bytes`;

CREATE ALGORITHM=MERGE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `io_global_by_wait_by_bytes` AS select substring_index(`performance_schema`.`file_summary_by_event_name`.`EVENT_NAME`,'/',-(2)) AS `event_name`,`performance_schema`.`file_summary_by_event_name`.`COUNT_STAR` AS `total`,`format_time`(`performance_schema`.`file_summary_by_event_name`.`SUM_TIMER_WAIT`) AS `total_latency`,`format_time`(`performance_schema`.`file_summary_by_event_name`.`MIN_TIMER_WAIT`) AS `min_latency`,`format_time`(`performance_schema`.`file_summary_by_event_name`.`AVG_TIMER_WAIT`) AS `avg_latency`,`format_time`(`performance_schema`.`file_summary_by_event_name`.`MAX_TIMER_WAIT`) AS `max_latency`,`performance_schema`.`file_summary_by_event_name`.`COUNT_READ` AS `count_read`,`format_bytes`(`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_READ`) AS `total_read`,`format_bytes`(ifnull((`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_READ` / nullif(`performance_schema`.`file_summary_by_event_name`.`COUNT_READ`,0)),0)) AS `avg_read`,`performance_schema`.`file_summary_by_event_name`.`COUNT_WRITE` AS `count_write`,`format_bytes`(`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_WRITE`) AS `total_written`,`format_bytes`(ifnull((`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_WRITE` / nullif(`performance_schema`.`file_summary_by_event_name`.`COUNT_WRITE`,0)),0)) AS `avg_written`,`format_bytes`((`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_WRITE` + `performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_READ`)) AS `total_requested` from `performance_schema`.`file_summary_by_event_name` where ((`performance_schema`.`file_summary_by_event_name`.`EVENT_NAME` like 'wait/io/file/%') and (`performance_schema`.`file_summary_by_event_name`.`COUNT_STAR` > 0)) order by (`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_WRITE` + `performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_READ`) desc;

-- --------------------------------------------------------

--
-- Structure for view `io_global_by_wait_by_latency`
--
DROP TABLE IF EXISTS `io_global_by_wait_by_latency`;

CREATE ALGORITHM=MERGE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `io_global_by_wait_by_latency` AS select substring_index(`performance_schema`.`file_summary_by_event_name`.`EVENT_NAME`,'/',-(2)) AS `event_name`,`performance_schema`.`file_summary_by_event_name`.`COUNT_STAR` AS `total`,`format_time`(`performance_schema`.`file_summary_by_event_name`.`SUM_TIMER_WAIT`) AS `total_latency`,`format_time`(`performance_schema`.`file_summary_by_event_name`.`AVG_TIMER_WAIT`) AS `avg_latency`,`format_time`(`performance_schema`.`file_summary_by_event_name`.`MAX_TIMER_WAIT`) AS `max_latency`,`format_time`(`performance_schema`.`file_summary_by_event_name`.`SUM_TIMER_READ`) AS `read_latency`,`format_time`(`performance_schema`.`file_summary_by_event_name`.`SUM_TIMER_WRITE`) AS `write_latency`,`format_time`(`performance_schema`.`file_summary_by_event_name`.`SUM_TIMER_MISC`) AS `misc_latency`,`performance_schema`.`file_summary_by_event_name`.`COUNT_READ` AS `count_read`,`format_bytes`(`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_READ`) AS `total_read`,`format_bytes`(ifnull((`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_READ` / nullif(`performance_schema`.`file_summary_by_event_name`.`COUNT_READ`,0)),0)) AS `avg_read`,`performance_schema`.`file_summary_by_event_name`.`COUNT_WRITE` AS `count_write`,`format_bytes`(`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_WRITE`) AS `total_written`,`format_bytes`(ifnull((`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_WRITE` / nullif(`performance_schema`.`file_summary_by_event_name`.`COUNT_WRITE`,0)),0)) AS `avg_written` from `performance_schema`.`file_summary_by_event_name` where ((`performance_schema`.`file_summary_by_event_name`.`EVENT_NAME` like 'wait/io/file/%') and (`performance_schema`.`file_summary_by_event_name`.`COUNT_STAR` > 0)) order by `performance_schema`.`file_summary_by_event_name`.`SUM_TIMER_WAIT` desc;

-- --------------------------------------------------------

--
-- Structure for view `latest_file_io`
--
DROP TABLE IF EXISTS `latest_file_io`;

CREATE ALGORITHM=MERGE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `latest_file_io` AS select if(isnull(`information_schema`.`processlist`.`ID`),concat(substring_index(`performance_schema`.`threads`.`NAME`,'/',-(1)),':',`performance_schema`.`events_waits_history_long`.`THREAD_ID`),concat(`information_schema`.`processlist`.`USER`,'@',`information_schema`.`processlist`.`HOST`,':',`information_schema`.`processlist`.`ID`)) AS `thread`,`format_path`(`performance_schema`.`events_waits_history_long`.`OBJECT_NAME`) AS `file`,`format_time`(`performance_schema`.`events_waits_history_long`.`TIMER_WAIT`) AS `latency`,`performance_schema`.`events_waits_history_long`.`OPERATION` AS `operation`,`format_bytes`(`performance_schema`.`events_waits_history_long`.`NUMBER_OF_BYTES`) AS `requested` from ((`performance_schema`.`events_waits_history_long` join `performance_schema`.`threads` on((`performance_schema`.`events_waits_history_long`.`THREAD_ID` = `performance_schema`.`threads`.`THREAD_ID`))) left join `information_schema`.`processlist` on((`performance_schema`.`threads`.`PROCESSLIST_ID` = `information_schema`.`processlist`.`ID`))) where ((`performance_schema`.`events_waits_history_long`.`OBJECT_NAME` is not null) and (`performance_schema`.`events_waits_history_long`.`EVENT_NAME` like 'wait/io/file/%')) order by `performance_schema`.`events_waits_history_long`.`TIMER_START`;

-- --------------------------------------------------------

--
-- Structure for view `memory_by_host_by_current_bytes`
--
DROP TABLE IF EXISTS `memory_by_host_by_current_bytes`;

CREATE ALGORITHM=TEMPTABLE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `memory_by_host_by_current_bytes` AS select if(isnull(`performance_schema`.`memory_summary_by_host_by_event_name`.`HOST`),'background',`performance_schema`.`memory_summary_by_host_by_event_name`.`HOST`) AS `host`,sum(`performance_schema`.`memory_summary_by_host_by_event_name`.`CURRENT_COUNT_USED`) AS `current_count_used`,`format_bytes`(sum(`performance_schema`.`memory_summary_by_host_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`)) AS `current_allocated`,`format_bytes`(ifnull((sum(`performance_schema`.`memory_summary_by_host_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`) / nullif(sum(`performance_schema`.`memory_summary_by_host_by_event_name`.`CURRENT_COUNT_USED`),0)),0)) AS `current_avg_alloc`,`format_bytes`(max(`performance_schema`.`memory_summary_by_host_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`)) AS `current_max_alloc`,`format_bytes`(sum(`performance_schema`.`memory_summary_by_host_by_event_name`.`SUM_NUMBER_OF_BYTES_ALLOC`)) AS `total_allocated` from `performance_schema`.`memory_summary_by_host_by_event_name` group by if(isnull(`performance_schema`.`memory_summary_by_host_by_event_name`.`HOST`),'background',`performance_schema`.`memory_summary_by_host_by_event_name`.`HOST`) order by sum(`performance_schema`.`memory_summary_by_host_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`) desc;

-- --------------------------------------------------------

--
-- Structure for view `memory_by_thread_by_current_bytes`
--
DROP TABLE IF EXISTS `memory_by_thread_by_current_bytes`;

CREATE ALGORITHM=TEMPTABLE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `memory_by_thread_by_current_bytes` AS select `mt`.`THREAD_ID` AS `thread_id`,if((`t`.`NAME` = 'thread/sql/one_connection'),concat(`t`.`PROCESSLIST_USER`,'@',`t`.`PROCESSLIST_HOST`),replace(`t`.`NAME`,'thread/','')) AS `user`,sum(`mt`.`CURRENT_COUNT_USED`) AS `current_count_used`,`format_bytes`(sum(`mt`.`CURRENT_NUMBER_OF_BYTES_USED`)) AS `current_allocated`,`format_bytes`(ifnull((sum(`mt`.`CURRENT_NUMBER_OF_BYTES_USED`) / nullif(sum(`mt`.`CURRENT_COUNT_USED`),0)),0)) AS `current_avg_alloc`,`format_bytes`(max(`mt`.`CURRENT_NUMBER_OF_BYTES_USED`)) AS `current_max_alloc`,`format_bytes`(sum(`mt`.`SUM_NUMBER_OF_BYTES_ALLOC`)) AS `total_allocated` from (`performance_schema`.`memory_summary_by_thread_by_event_name` `mt` join `performance_schema`.`threads` `t` on((`mt`.`THREAD_ID` = `t`.`THREAD_ID`))) group by `mt`.`THREAD_ID`,if((`t`.`NAME` = 'thread/sql/one_connection'),concat(`t`.`PROCESSLIST_USER`,'@',`t`.`PROCESSLIST_HOST`),replace(`t`.`NAME`,'thread/','')) order by sum(`mt`.`CURRENT_NUMBER_OF_BYTES_USED`) desc;

-- --------------------------------------------------------

--
-- Structure for view `memory_by_user_by_current_bytes`
--
DROP TABLE IF EXISTS `memory_by_user_by_current_bytes`;

CREATE ALGORITHM=TEMPTABLE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `memory_by_user_by_current_bytes` AS select if(isnull(`performance_schema`.`memory_summary_by_user_by_event_name`.`USER`),'background',`performance_schema`.`memory_summary_by_user_by_event_name`.`USER`) AS `user`,sum(`performance_schema`.`memory_summary_by_user_by_event_name`.`CURRENT_COUNT_USED`) AS `current_count_used`,`format_bytes`(sum(`performance_schema`.`memory_summary_by_user_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`)) AS `current_allocated`,`format_bytes`(ifnull((sum(`performance_schema`.`memory_summary_by_user_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`) / nullif(sum(`performance_schema`.`memory_summary_by_user_by_event_name`.`CURRENT_COUNT_USED`),0)),0)) AS `current_avg_alloc`,`format_bytes`(max(`performance_schema`.`memory_summary_by_user_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`)) AS `current_max_alloc`,`format_bytes`(sum(`performance_schema`.`memory_summary_by_user_by_event_name`.`SUM_NUMBER_OF_BYTES_ALLOC`)) AS `total_allocated` from `performance_schema`.`memory_summary_by_user_by_event_name` group by if(isnull(`performance_schema`.`memory_summary_by_user_by_event_name`.`USER`),'background',`performance_schema`.`memory_summary_by_user_by_event_name`.`USER`) order by sum(`performance_schema`.`memory_summary_by_user_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`) desc;

-- --------------------------------------------------------

--
-- Structure for view `memory_global_by_current_bytes`
--
DROP TABLE IF EXISTS `memory_global_by_current_bytes`;

CREATE ALGORITHM=MERGE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `memory_global_by_current_bytes` AS select `performance_schema`.`memory_summary_global_by_event_name`.`EVENT_NAME` AS `event_name`,`performance_schema`.`memory_summary_global_by_event_name`.`CURRENT_COUNT_USED` AS `current_count`,`format_bytes`(`performance_schema`.`memory_summary_global_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`) AS `current_alloc`,`format_bytes`(ifnull((`performance_schema`.`memory_summary_global_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED` / nullif(`performance_schema`.`memory_summary_global_by_event_name`.`CURRENT_COUNT_USED`,0)),0)) AS `current_avg_alloc`,`performance_schema`.`memory_summary_global_by_event_name`.`HIGH_COUNT_USED` AS `high_count`,`format_bytes`(`performance_schema`.`memory_summary_global_by_event_name`.`HIGH_NUMBER_OF_BYTES_USED`) AS `high_alloc`,`format_bytes`(ifnull((`performance_schema`.`memory_summary_global_by_event_name`.`HIGH_NUMBER_OF_BYTES_USED` / nullif(`performance_schema`.`memory_summary_global_by_event_name`.`HIGH_COUNT_USED`,0)),0)) AS `high_avg_alloc` from `performance_schema`.`memory_summary_global_by_event_name` where (`performance_schema`.`memory_summary_global_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED` > 0) order by `performance_schema`.`memory_summary_global_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED` desc;

-- --------------------------------------------------------

--
-- Structure for view `memory_global_total`
--
DROP TABLE IF EXISTS `memory_global_total`;

CREATE ALGORITHM=TEMPTABLE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `memory_global_total` AS select `format_bytes`(sum(`performance_schema`.`memory_summary_global_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`)) AS `total_allocated` from `performance_schema`.`memory_summary_global_by_event_name`;

-- --------------------------------------------------------

--
-- Structure for view `metrics`
--
DROP TABLE IF EXISTS `metrics`;

CREATE ALGORITHM=TEMPTABLE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `metrics` AS (select lower(`performance_schema`.`global_status`.`VARIABLE_NAME`) AS `Variable_name`,`performance_schema`.`global_status`.`VARIABLE_VALUE` AS `Variable_value`,'Global Status' AS `Type`,'YES' AS `Enabled` from `performance_schema`.`global_status`) union all (select `information_schema`.`INNODB_METRICS`.`NAME` AS `Variable_name`,`information_schema`.`INNODB_METRICS`.`COUNT` AS `Variable_value`,concat('InnoDB Metrics - ',`information_schema`.`INNODB_METRICS`.`SUBSYSTEM`) AS `Type`,if((`information_schema`.`INNODB_METRICS`.`STATUS` = 'enabled'),'YES','NO') AS `Enabled` from `information_schema`.`INNODB_METRICS` where (`information_schema`.`INNODB_METRICS`.`NAME` not in ('lock_row_lock_time','lock_row_lock_time_avg','lock_row_lock_time_max','lock_row_lock_waits','buffer_pool_reads','buffer_pool_read_requests','buffer_pool_write_requests','buffer_pool_wait_free','buffer_pool_read_ahead','buffer_pool_read_ahead_evicted','buffer_pool_pages_total','buffer_pool_pages_misc','buffer_pool_pages_data','buffer_pool_bytes_data','buffer_pool_pages_dirty','buffer_pool_bytes_dirty','buffer_pool_pages_free','buffer_pages_created','buffer_pages_written','buffer_pages_read','buffer_data_reads','buffer_data_written','file_num_open_files','os_log_bytes_written','os_log_fsyncs','os_log_pending_fsyncs','os_log_pending_writes','log_waits','log_write_requests','log_writes','innodb_dblwr_writes','innodb_dblwr_pages_written','innodb_page_size'))) union all (select 'memory_current_allocated' AS `Variable_name`,sum(`performance_schema`.`memory_summary_global_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`) AS `Variable_value`,'Performance Schema' AS `Type`,if(((select count(0) from `performance_schema`.`setup_instruments` where ((`performance_schema`.`setup_instruments`.`NAME` like 'memory/%') and (`performance_schema`.`setup_instruments`.`ENABLED` = 'YES'))) = 0),'NO',if(((select count(0) from `performance_schema`.`setup_instruments` where ((`performance_schema`.`setup_instruments`.`NAME` like 'memory/%') and (`performance_schema`.`setup_instruments`.`ENABLED` = 'YES'))) = (select count(0) from `performance_schema`.`setup_instruments` where (`performance_schema`.`setup_instruments`.`NAME` like 'memory/%'))),'YES','PARTIAL')) AS `Enabled` from `performance_schema`.`memory_summary_global_by_event_name`) union all (select 'memory_total_allocated' AS `Variable_name`,sum(`performance_schema`.`memory_summary_global_by_event_name`.`SUM_NUMBER_OF_BYTES_ALLOC`) AS `Variable_value`,'Performance Schema' AS `Type`,if(((select count(0) from `performance_schema`.`setup_instruments` where ((`performance_schema`.`setup_instruments`.`NAME` like 'memory/%') and (`performance_schema`.`setup_instruments`.`ENABLED` = 'YES'))) = 0),'NO',if(((select count(0) from `performance_schema`.`setup_instruments` where ((`performance_schema`.`setup_instruments`.`NAME` like 'memory/%') and (`performance_schema`.`setup_instruments`.`ENABLED` = 'YES'))) = (select count(0) from `performance_schema`.`setup_instruments` where (`performance_schema`.`setup_instruments`.`NAME` like 'memory/%'))),'YES','PARTIAL')) AS `Enabled` from `performance_schema`.`memory_summary_global_by_event_name`) union all (select 'NOW()' AS `Variable_name`,now(3) AS `Variable_value`,'System Time' AS `Type`,'YES' AS `Enabled`) union all (select 'UNIX_TIMESTAMP()' AS `Variable_name`,round(unix_timestamp(now(3)),3) AS `Variable_value`,'System Time' AS `Type`,'YES' AS `Enabled`) order by `Type`,`Variable_name`;

-- --------------------------------------------------------

--
-- Structure for view `processlist`
--
DROP TABLE IF EXISTS `processlist`;

CREATE ALGORITHM=TEMPTABLE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `processlist` AS select `pps`.`THREAD_ID` AS `thd_id`,`pps`.`PROCESSLIST_ID` AS `conn_id`,if((`pps`.`NAME` in ('thread/sql/one_connection','thread/thread_pool/tp_one_connection')),concat(`pps`.`PROCESSLIST_USER`,'@',`pps`.`PROCESSLIST_HOST`),replace(`pps`.`NAME`,'thread/','')) AS `user`,`pps`.`PROCESSLIST_DB` AS `db`,`pps`.`PROCESSLIST_COMMAND` AS `command`,`pps`.`PROCESSLIST_STATE` AS `state`,`pps`.`PROCESSLIST_TIME` AS `time`,`format_statement`(`pps`.`PROCESSLIST_INFO`) AS `current_statement`,if(isnull(`esc`.`END_EVENT_ID`),`format_time`(`esc`.`TIMER_WAIT`),NULL) AS `statement_latency`,if(isnull(`esc`.`END_EVENT_ID`),round((100 * (`estc`.`WORK_COMPLETED` / `estc`.`WORK_ESTIMATED`)),2),NULL) AS `progress`,`format_time`(`esc`.`LOCK_TIME`) AS `lock_latency`,`esc`.`ROWS_EXAMINED` AS `rows_examined`,`esc`.`ROWS_SENT` AS `rows_sent`,`esc`.`ROWS_AFFECTED` AS `rows_affected`,`esc`.`CREATED_TMP_TABLES` AS `tmp_tables`,`esc`.`CREATED_TMP_DISK_TABLES` AS `tmp_disk_tables`,if(((`esc`.`NO_GOOD_INDEX_USED` > 0) or (`esc`.`NO_INDEX_USED` > 0)),'YES','NO') AS `full_scan`,if((`esc`.`END_EVENT_ID` is not null),`format_statement`(`esc`.`SQL_TEXT`),NULL) AS `last_statement`,if((`esc`.`END_EVENT_ID` is not null),`format_time`(`esc`.`TIMER_WAIT`),NULL) AS `last_statement_latency`,`format_bytes`(`mem`.`current_allocated`) AS `current_memory`,`ewc`.`EVENT_NAME` AS `last_wait`,if((isnull(`ewc`.`END_EVENT_ID`) and (`ewc`.`EVENT_NAME` is not null)),'Still Waiting',`format_time`(`ewc`.`TIMER_WAIT`)) AS `last_wait_latency`,`ewc`.`SOURCE` AS `source`,`format_time`(`etc`.`TIMER_WAIT`) AS `trx_latency`,`etc`.`STATE` AS `trx_state`,`etc`.`AUTOCOMMIT` AS `trx_autocommit`,`conattr_pid`.`ATTR_VALUE` AS `pid`,`conattr_progname`.`ATTR_VALUE` AS `program_name` from (((((((`performance_schema`.`threads` `pps` left join `performance_schema`.`events_waits_current` `ewc` on((`pps`.`THREAD_ID` = `ewc`.`THREAD_ID`))) left join `performance_schema`.`events_stages_current` `estc` on((`pps`.`THREAD_ID` = `estc`.`THREAD_ID`))) left join `performance_schema`.`events_statements_current` `esc` on((`pps`.`THREAD_ID` = `esc`.`THREAD_ID`))) left join `performance_schema`.`events_transactions_current` `etc` on((`pps`.`THREAD_ID` = `etc`.`THREAD_ID`))) left join `x$memory_by_thread_by_current_bytes` `mem` on((`pps`.`THREAD_ID` = `mem`.`thread_id`))) left join `performance_schema`.`session_connect_attrs` `conattr_pid` on(((`conattr_pid`.`PROCESSLIST_ID` = `pps`.`PROCESSLIST_ID`) and (`conattr_pid`.`ATTR_NAME` = '_pid')))) left join `performance_schema`.`session_connect_attrs` `conattr_progname` on(((`conattr_progname`.`PROCESSLIST_ID` = `pps`.`PROCESSLIST_ID`) and (`conattr_progname`.`ATTR_NAME` = 'program_name')))) order by `pps`.`PROCESSLIST_TIME` desc,`last_wait_latency` desc;

-- --------------------------------------------------------

--
-- Structure for view `ps_check_lost_instrumentation`
--
DROP TABLE IF EXISTS `ps_check_lost_instrumentation`;

CREATE ALGORITHM=MERGE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `ps_check_lost_instrumentation` AS select `performance_schema`.`global_status`.`VARIABLE_NAME` AS `variable_name`,`performance_schema`.`global_status`.`VARIABLE_VALUE` AS `variable_value` from `performance_schema`.`global_status` where ((`performance_schema`.`global_status`.`VARIABLE_NAME` like 'perf%lost') and (`performance_schema`.`global_status`.`VARIABLE_VALUE` > 0));

-- --------------------------------------------------------

--
-- Structure for view `schema_auto_increment_columns`
--
DROP TABLE IF EXISTS `schema_auto_increment_columns`;

CREATE ALGORITHM=MERGE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `schema_auto_increment_columns` AS select `information_schema`.`COLUMNS`.`TABLE_SCHEMA` AS `table_schema`,`information_schema`.`COLUMNS`.`TABLE_NAME` AS `table_name`,`information_schema`.`COLUMNS`.`COLUMN_NAME` AS `column_name`,`information_schema`.`COLUMNS`.`DATA_TYPE` AS `data_type`,`information_schema`.`COLUMNS`.`COLUMN_TYPE` AS `column_type`,(locate('unsigned',`information_schema`.`COLUMNS`.`COLUMN_TYPE`) = 0) AS `is_signed`,(locate('unsigned',`information_schema`.`COLUMNS`.`COLUMN_TYPE`) > 0) AS `is_unsigned`,((case `information_schema`.`COLUMNS`.`DATA_TYPE` when 'tinyint' then 255 when 'smallint' then 65535 when 'mediumint' then 16777215 when 'int' then 4294967295 when 'bigint' then 18446744073709551615 end) >> if((locate('unsigned',`information_schema`.`COLUMNS`.`COLUMN_TYPE`) > 0),0,1)) AS `max_value`,`information_schema`.`TABLES`.`AUTO_INCREMENT` AS `auto_increment`,(`information_schema`.`TABLES`.`AUTO_INCREMENT` / ((case `information_schema`.`COLUMNS`.`DATA_TYPE` when 'tinyint' then 255 when 'smallint' then 65535 when 'mediumint' then 16777215 when 'int' then 4294967295 when 'bigint' then 18446744073709551615 end) >> if((locate('unsigned',`information_schema`.`COLUMNS`.`COLUMN_TYPE`) > 0),0,1))) AS `auto_increment_ratio` from (`INFORMATION_SCHEMA`.`COLUMNS` join `INFORMATION_SCHEMA`.`TABLES` on(((`information_schema`.`COLUMNS`.`TABLE_SCHEMA` = `information_schema`.`TABLES`.`TABLE_SCHEMA`) and (`information_schema`.`COLUMNS`.`TABLE_NAME` = `information_schema`.`TABLES`.`TABLE_NAME`)))) where ((`information_schema`.`COLUMNS`.`TABLE_SCHEMA` not in ('mysql','sys','INFORMATION_SCHEMA','performance_schema')) and (`information_schema`.`TABLES`.`TABLE_TYPE` = 'BASE TABLE') and (`information_schema`.`COLUMNS`.`EXTRA` = 'auto_increment')) order by (`information_schema`.`TABLES`.`AUTO_INCREMENT` / ((case `information_schema`.`COLUMNS`.`DATA_TYPE` when 'tinyint' then 255 when 'smallint' then 65535 when 'mediumint' then 16777215 when 'int' then 4294967295 when 'bigint' then 18446744073709551615 end) >> if((locate('unsigned',`information_schema`.`COLUMNS`.`COLUMN_TYPE`) > 0),0,1))) desc,((case `information_schema`.`COLUMNS`.`DATA_TYPE` when 'tinyint' then 255 when 'smallint' then 65535 when 'mediumint' then 16777215 when 'int' then 4294967295 when 'bigint' then 18446744073709551615 end) >> if((locate('unsigned',`information_schema`.`COLUMNS`.`COLUMN_TYPE`) > 0),0,1));

-- --------------------------------------------------------

--
-- Structure for view `schema_index_statistics`
--
DROP TABLE IF EXISTS `schema_index_statistics`;

CREATE ALGORITHM=MERGE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `schema_index_statistics` AS select `performance_schema`.`table_io_waits_summary_by_index_usage`.`OBJECT_SCHEMA` AS `table_schema`,`performance_schema`.`table_io_waits_summary_by_index_usage`.`OBJECT_NAME` AS `table_name`,`performance_schema`.`table_io_waits_summary_by_index_usage`.`INDEX_NAME` AS `index_name`,`performance_schema`.`table_io_waits_summary_by_index_usage`.`COUNT_FETCH` AS `rows_selected`,`format_time`(`performance_schema`.`table_io_waits_summary_by_index_usage`.`SUM_TIMER_FETCH`) AS `select_latency`,`performance_schema`.`table_io_waits_summary_by_index_usage`.`COUNT_INSERT` AS `rows_inserted`,`format_time`(`performance_schema`.`table_io_waits_summary_by_index_usage`.`SUM_TIMER_INSERT`) AS `insert_latency`,`performance_schema`.`table_io_waits_summary_by_index_usage`.`COUNT_UPDATE` AS `rows_updated`,`format_time`(`performance_schema`.`table_io_waits_summary_by_index_usage`.`SUM_TIMER_UPDATE`) AS `update_latency`,`performance_schema`.`table_io_waits_summary_by_index_usage`.`COUNT_DELETE` AS `rows_deleted`,`format_time`(`performance_schema`.`table_io_waits_summary_by_index_usage`.`SUM_TIMER_DELETE`) AS `delete_latency` from `performance_schema`.`table_io_waits_summary_by_index_usage` where (`performance_schema`.`table_io_waits_summary_by_index_usage`.`INDEX_NAME` is not null) order by `performance_schema`.`table_io_waits_summary_by_index_usage`.`SUM_TIMER_WAIT` desc;

-- --------------------------------------------------------

--
-- Structure for view `schema_object_overview`
--
DROP TABLE IF EXISTS `schema_object_overview`;

CREATE ALGORITHM=TEMPTABLE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `schema_object_overview` AS select `information_schema`.`routines`.`ROUTINE_SCHEMA` AS `db`,`information_schema`.`routines`.`ROUTINE_TYPE` AS `object_type`,count(0) AS `count` from `information_schema`.`routines` group by `information_schema`.`routines`.`ROUTINE_SCHEMA`,`information_schema`.`routines`.`ROUTINE_TYPE` union select `information_schema`.`tables`.`TABLE_SCHEMA` AS `TABLE_SCHEMA`,`information_schema`.`tables`.`TABLE_TYPE` AS `TABLE_TYPE`,count(0) AS `COUNT(*)` from `information_schema`.`tables` group by `information_schema`.`tables`.`TABLE_SCHEMA`,`information_schema`.`tables`.`TABLE_TYPE` union select `information_schema`.`statistics`.`TABLE_SCHEMA` AS `TABLE_SCHEMA`,concat('INDEX (',`information_schema`.`statistics`.`INDEX_TYPE`,')') AS `CONCAT('INDEX (', INDEX_TYPE, ')')`,count(0) AS `COUNT(*)` from `information_schema`.`statistics` group by `information_schema`.`statistics`.`TABLE_SCHEMA`,`information_schema`.`statistics`.`INDEX_TYPE` union select `information_schema`.`triggers`.`TRIGGER_SCHEMA` AS `TRIGGER_SCHEMA`,'TRIGGER' AS `TRIGGER`,count(0) AS `COUNT(*)` from `information_schema`.`triggers` group by `information_schema`.`triggers`.`TRIGGER_SCHEMA` union select `information_schema`.`events`.`EVENT_SCHEMA` AS `EVENT_SCHEMA`,'EVENT' AS `EVENT`,count(0) AS `COUNT(*)` from `information_schema`.`events` group by `information_schema`.`events`.`EVENT_SCHEMA` order by `db`,`object_type`;

-- --------------------------------------------------------

--
-- Structure for view `schema_redundant_indexes`
--
DROP TABLE IF EXISTS `schema_redundant_indexes`;

CREATE ALGORITHM=TEMPTABLE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `schema_redundant_indexes` AS select `redundant_keys`.`table_schema` AS `table_schema`,`redundant_keys`.`table_name` AS `table_name`,`redundant_keys`.`index_name` AS `redundant_index_name`,`redundant_keys`.`index_columns` AS `redundant_index_columns`,`redundant_keys`.`non_unique` AS `redundant_index_non_unique`,`dominant_keys`.`index_name` AS `dominant_index_name`,`dominant_keys`.`index_columns` AS `dominant_index_columns`,`dominant_keys`.`non_unique` AS `dominant_index_non_unique`,if((`redundant_keys`.`subpart_exists` or `dominant_keys`.`subpart_exists`),1,0) AS `subpart_exists`,concat('ALTER TABLE `',`redundant_keys`.`table_schema`,'`.`',`redundant_keys`.`table_name`,'` DROP INDEX `',`redundant_keys`.`index_name`,'`') AS `sql_drop_index` from (`x$schema_flattened_keys` `redundant_keys` join `x$schema_flattened_keys` `dominant_keys` on(((`redundant_keys`.`table_schema` = `dominant_keys`.`table_schema`) and (`redundant_keys`.`table_name` = `dominant_keys`.`table_name`)))) where ((`redundant_keys`.`index_name` <> `dominant_keys`.`index_name`) and (((`redundant_keys`.`index_columns` = `dominant_keys`.`index_columns`) and ((`redundant_keys`.`non_unique` > `dominant_keys`.`non_unique`) or ((`redundant_keys`.`non_unique` = `dominant_keys`.`non_unique`) and (if((`redundant_keys`.`index_name` = 'PRIMARY'),'',`redundant_keys`.`index_name`) > if((`dominant_keys`.`index_name` = 'PRIMARY'),'',`dominant_keys`.`index_name`))))) or ((locate(concat(`redundant_keys`.`index_columns`,','),`dominant_keys`.`index_columns`) = 1) and (`redundant_keys`.`non_unique` = 1)) or ((locate(concat(`dominant_keys`.`index_columns`,','),`redundant_keys`.`index_columns`) = 1) and (`dominant_keys`.`non_unique` = 0))));

-- --------------------------------------------------------

--
-- Structure for view `schema_table_lock_waits`
--
DROP TABLE IF EXISTS `schema_table_lock_waits`;

CREATE ALGORITHM=TEMPTABLE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `schema_table_lock_waits` AS select `g`.`OBJECT_SCHEMA` AS `object_schema`,`g`.`OBJECT_NAME` AS `object_name`,`pt`.`THREAD_ID` AS `waiting_thread_id`,`pt`.`PROCESSLIST_ID` AS `waiting_pid`,`ps_thread_account`(`p`.`OWNER_THREAD_ID`) AS `waiting_account`,`p`.`LOCK_TYPE` AS `waiting_lock_type`,`p`.`LOCK_DURATION` AS `waiting_lock_duration`,`format_statement`(`pt`.`PROCESSLIST_INFO`) AS `waiting_query`,`pt`.`PROCESSLIST_TIME` AS `waiting_query_secs`,`ps`.`ROWS_AFFECTED` AS `waiting_query_rows_affected`,`ps`.`ROWS_EXAMINED` AS `waiting_query_rows_examined`,`gt`.`THREAD_ID` AS `blocking_thread_id`,`gt`.`PROCESSLIST_ID` AS `blocking_pid`,`ps_thread_account`(`g`.`OWNER_THREAD_ID`) AS `blocking_account`,`g`.`LOCK_TYPE` AS `blocking_lock_type`,`g`.`LOCK_DURATION` AS `blocking_lock_duration`,concat('KILL QUERY ',`gt`.`PROCESSLIST_ID`) AS `sql_kill_blocking_query`,concat('KILL ',`gt`.`PROCESSLIST_ID`) AS `sql_kill_blocking_connection` from (((((`performance_schema`.`metadata_locks` `g` join `performance_schema`.`metadata_locks` `p` on(((`g`.`OBJECT_TYPE` = `p`.`OBJECT_TYPE`) and (`g`.`OBJECT_SCHEMA` = `p`.`OBJECT_SCHEMA`) and (`g`.`OBJECT_NAME` = `p`.`OBJECT_NAME`) and (`g`.`LOCK_STATUS` = 'GRANTED') and (`p`.`LOCK_STATUS` = 'PENDING')))) join `performance_schema`.`threads` `gt` on((`g`.`OWNER_THREAD_ID` = `gt`.`THREAD_ID`))) join `performance_schema`.`threads` `pt` on((`p`.`OWNER_THREAD_ID` = `pt`.`THREAD_ID`))) left join `performance_schema`.`events_statements_current` `gs` on((`g`.`OWNER_THREAD_ID` = `gs`.`THREAD_ID`))) left join `performance_schema`.`events_statements_current` `ps` on((`p`.`OWNER_THREAD_ID` = `ps`.`THREAD_ID`))) where (`g`.`OBJECT_TYPE` = 'TABLE');

-- --------------------------------------------------------

--
-- Structure for view `schema_table_statistics`
--
DROP TABLE IF EXISTS `schema_table_statistics`;

CREATE ALGORITHM=TEMPTABLE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `schema_table_statistics` AS select `pst`.`OBJECT_SCHEMA` AS `table_schema`,`pst`.`OBJECT_NAME` AS `table_name`,`format_time`(`pst`.`SUM_TIMER_WAIT`) AS `total_latency`,`pst`.`COUNT_FETCH` AS `rows_fetched`,`format_time`(`pst`.`SUM_TIMER_FETCH`) AS `fetch_latency`,`pst`.`COUNT_INSERT` AS `rows_inserted`,`format_time`(`pst`.`SUM_TIMER_INSERT`) AS `insert_latency`,`pst`.`COUNT_UPDATE` AS `rows_updated`,`format_time`(`pst`.`SUM_TIMER_UPDATE`) AS `update_latency`,`pst`.`COUNT_DELETE` AS `rows_deleted`,`format_time`(`pst`.`SUM_TIMER_DELETE`) AS `delete_latency`,`fsbi`.`count_read` AS `io_read_requests`,`format_bytes`(`fsbi`.`sum_number_of_bytes_read`) AS `io_read`,`format_time`(`fsbi`.`sum_timer_read`) AS `io_read_latency`,`fsbi`.`count_write` AS `io_write_requests`,`format_bytes`(`fsbi`.`sum_number_of_bytes_write`) AS `io_write`,`format_time`(`fsbi`.`sum_timer_write`) AS `io_write_latency`,`fsbi`.`count_misc` AS `io_misc_requests`,`format_time`(`fsbi`.`sum_timer_misc`) AS `io_misc_latency` from (`performance_schema`.`table_io_waits_summary_by_table` `pst` left join `x$ps_schema_table_statistics_io` `fsbi` on(((`pst`.`OBJECT_SCHEMA` = `fsbi`.`table_schema`) and (`pst`.`OBJECT_NAME` = `fsbi`.`table_name`)))) order by `pst`.`SUM_TIMER_WAIT` desc;

-- --------------------------------------------------------

--
-- Structure for view `schema_table_statistics_with_buffer`
--
DROP TABLE IF EXISTS `schema_table_statistics_with_buffer`;

CREATE ALGORITHM=TEMPTABLE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `schema_table_statistics_with_buffer` AS select `pst`.`OBJECT_SCHEMA` AS `table_schema`,`pst`.`OBJECT_NAME` AS `table_name`,`pst`.`COUNT_FETCH` AS `rows_fetched`,`format_time`(`pst`.`SUM_TIMER_FETCH`) AS `fetch_latency`,`pst`.`COUNT_INSERT` AS `rows_inserted`,`format_time`(`pst`.`SUM_TIMER_INSERT`) AS `insert_latency`,`pst`.`COUNT_UPDATE` AS `rows_updated`,`format_time`(`pst`.`SUM_TIMER_UPDATE`) AS `update_latency`,`pst`.`COUNT_DELETE` AS `rows_deleted`,`format_time`(`pst`.`SUM_TIMER_DELETE`) AS `delete_latency`,`fsbi`.`count_read` AS `io_read_requests`,`format_bytes`(`fsbi`.`sum_number_of_bytes_read`) AS `io_read`,`format_time`(`fsbi`.`sum_timer_read`) AS `io_read_latency`,`fsbi`.`count_write` AS `io_write_requests`,`format_bytes`(`fsbi`.`sum_number_of_bytes_write`) AS `io_write`,`format_time`(`fsbi`.`sum_timer_write`) AS `io_write_latency`,`fsbi`.`count_misc` AS `io_misc_requests`,`format_time`(`fsbi`.`sum_timer_misc`) AS `io_misc_latency`,`format_bytes`(`ibp`.`allocated`) AS `innodb_buffer_allocated`,`format_bytes`(`ibp`.`data`) AS `innodb_buffer_data`,`format_bytes`((`ibp`.`allocated` - `ibp`.`data`)) AS `innodb_buffer_free`,`ibp`.`pages` AS `innodb_buffer_pages`,`ibp`.`pages_hashed` AS `innodb_buffer_pages_hashed`,`ibp`.`pages_old` AS `innodb_buffer_pages_old`,`ibp`.`rows_cached` AS `innodb_buffer_rows_cached` from ((`performance_schema`.`table_io_waits_summary_by_table` `pst` left join `x$ps_schema_table_statistics_io` `fsbi` on(((`pst`.`OBJECT_SCHEMA` = `fsbi`.`table_schema`) and (`pst`.`OBJECT_NAME` = `fsbi`.`table_name`)))) left join `x$innodb_buffer_stats_by_table` `ibp` on(((`pst`.`OBJECT_SCHEMA` = `ibp`.`object_schema`) and (`pst`.`OBJECT_NAME` = `ibp`.`object_name`)))) order by `pst`.`SUM_TIMER_WAIT` desc;

-- --------------------------------------------------------

--
-- Structure for view `schema_tables_with_full_table_scans`
--
DROP TABLE IF EXISTS `schema_tables_with_full_table_scans`;

CREATE ALGORITHM=MERGE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `schema_tables_with_full_table_scans` AS select `performance_schema`.`table_io_waits_summary_by_index_usage`.`OBJECT_SCHEMA` AS `object_schema`,`performance_schema`.`table_io_waits_summary_by_index_usage`.`OBJECT_NAME` AS `object_name`,`performance_schema`.`table_io_waits_summary_by_index_usage`.`COUNT_READ` AS `rows_full_scanned`,`format_time`(`performance_schema`.`table_io_waits_summary_by_index_usage`.`SUM_TIMER_WAIT`) AS `latency` from `performance_schema`.`table_io_waits_summary_by_index_usage` where (isnull(`performance_schema`.`table_io_waits_summary_by_index_usage`.`INDEX_NAME`) and (`performance_schema`.`table_io_waits_summary_by_index_usage`.`COUNT_READ` > 0)) order by `performance_schema`.`table_io_waits_summary_by_index_usage`.`COUNT_READ` desc;

-- --------------------------------------------------------

--
-- Structure for view `schema_unused_indexes`
--
DROP TABLE IF EXISTS `schema_unused_indexes`;

CREATE ALGORITHM=MERGE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `schema_unused_indexes` AS select `t`.`OBJECT_SCHEMA` AS `object_schema`,`t`.`OBJECT_NAME` AS `object_name`,`t`.`INDEX_NAME` AS `index_name` from (`performance_schema`.`table_io_waits_summary_by_index_usage` `t` join `information_schema`.`statistics` `s` on(((`t`.`OBJECT_SCHEMA` = `s`.`TABLE_SCHEMA`) and (`t`.`OBJECT_NAME` = `s`.`TABLE_NAME`) and (`t`.`INDEX_NAME` = `s`.`INDEX_NAME`)))) where ((`t`.`INDEX_NAME` is not null) and (`t`.`COUNT_STAR` = 0) and (`t`.`OBJECT_SCHEMA` <> 'mysql') and (`t`.`INDEX_NAME` <> 'PRIMARY') and (`s`.`NON_UNIQUE` = 1) and (`s`.`SEQ_IN_INDEX` = 1)) order by `t`.`OBJECT_SCHEMA`,`t`.`OBJECT_NAME`;

-- --------------------------------------------------------

--
-- Structure for view `session`
--
DROP TABLE IF EXISTS `session`;

CREATE ALGORITHM=UNDEFINED DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `session` AS select `processlist`.`thd_id` AS `thd_id`,`processlist`.`conn_id` AS `conn_id`,`processlist`.`user` AS `user`,`processlist`.`db` AS `db`,`processlist`.`command` AS `command`,`processlist`.`state` AS `state`,`processlist`.`time` AS `time`,`processlist`.`current_statement` AS `current_statement`,`processlist`.`statement_latency` AS `statement_latency`,`processlist`.`progress` AS `progress`,`processlist`.`lock_latency` AS `lock_latency`,`processlist`.`rows_examined` AS `rows_examined`,`processlist`.`rows_sent` AS `rows_sent`,`processlist`.`rows_affected` AS `rows_affected`,`processlist`.`tmp_tables` AS `tmp_tables`,`processlist`.`tmp_disk_tables` AS `tmp_disk_tables`,`processlist`.`full_scan` AS `full_scan`,`processlist`.`last_statement` AS `last_statement`,`processlist`.`last_statement_latency` AS `last_statement_latency`,`processlist`.`current_memory` AS `current_memory`,`processlist`.`last_wait` AS `last_wait`,`processlist`.`last_wait_latency` AS `last_wait_latency`,`processlist`.`source` AS `source`,`processlist`.`trx_latency` AS `trx_latency`,`processlist`.`trx_state` AS `trx_state`,`processlist`.`trx_autocommit` AS `trx_autocommit`,`processlist`.`pid` AS `pid`,`processlist`.`program_name` AS `program_name` from `processlist` where ((`processlist`.`conn_id` is not null) and (`processlist`.`command` <> 'Daemon'));

-- --------------------------------------------------------

--
-- Structure for view `session_ssl_status`
--
DROP TABLE IF EXISTS `session_ssl_status`;

CREATE ALGORITHM=MERGE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `session_ssl_status` AS select `sslver`.`THREAD_ID` AS `thread_id`,`sslver`.`VARIABLE_VALUE` AS `ssl_version`,`sslcip`.`VARIABLE_VALUE` AS `ssl_cipher`,`sslreuse`.`VARIABLE_VALUE` AS `ssl_sessions_reused` from ((`performance_schema`.`status_by_thread` `sslver` left join `performance_schema`.`status_by_thread` `sslcip` on(((`sslcip`.`THREAD_ID` = `sslver`.`THREAD_ID`) and (`sslcip`.`VARIABLE_NAME` = 'Ssl_cipher')))) left join `performance_schema`.`status_by_thread` `sslreuse` on(((`sslreuse`.`THREAD_ID` = `sslver`.`THREAD_ID`) and (`sslreuse`.`VARIABLE_NAME` = 'Ssl_sessions_reused')))) where (`sslver`.`VARIABLE_NAME` = 'Ssl_version');

-- --------------------------------------------------------

--
-- Structure for view `statement_analysis`
--
DROP TABLE IF EXISTS `statement_analysis`;

CREATE ALGORITHM=MERGE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `statement_analysis` AS select `format_statement`(`performance_schema`.`events_statements_summary_by_digest`.`DIGEST_TEXT`) AS `query`,`performance_schema`.`events_statements_summary_by_digest`.`SCHEMA_NAME` AS `db`,if(((`performance_schema`.`events_statements_summary_by_digest`.`SUM_NO_GOOD_INDEX_USED` > 0) or (`performance_schema`.`events_statements_summary_by_digest`.`SUM_NO_INDEX_USED` > 0)),'*','') AS `full_scan`,`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR` AS `exec_count`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_ERRORS` AS `err_count`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_WARNINGS` AS `warn_count`,`format_time`(`performance_schema`.`events_statements_summary_by_digest`.`SUM_TIMER_WAIT`) AS `total_latency`,`format_time`(`performance_schema`.`events_statements_summary_by_digest`.`MAX_TIMER_WAIT`) AS `max_latency`,`format_time`(`performance_schema`.`events_statements_summary_by_digest`.`AVG_TIMER_WAIT`) AS `avg_latency`,`format_time`(`performance_schema`.`events_statements_summary_by_digest`.`SUM_LOCK_TIME`) AS `lock_latency`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_ROWS_SENT` AS `rows_sent`,round(ifnull((`performance_schema`.`events_statements_summary_by_digest`.`SUM_ROWS_SENT` / nullif(`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`,0)),0),0) AS `rows_sent_avg`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_ROWS_EXAMINED` AS `rows_examined`,round(ifnull((`performance_schema`.`events_statements_summary_by_digest`.`SUM_ROWS_EXAMINED` / nullif(`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`,0)),0),0) AS `rows_examined_avg`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_ROWS_AFFECTED` AS `rows_affected`,round(ifnull((`performance_schema`.`events_statements_summary_by_digest`.`SUM_ROWS_AFFECTED` / nullif(`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`,0)),0),0) AS `rows_affected_avg`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_CREATED_TMP_TABLES` AS `tmp_tables`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_CREATED_TMP_DISK_TABLES` AS `tmp_disk_tables`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_SORT_ROWS` AS `rows_sorted`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_SORT_MERGE_PASSES` AS `sort_merge_passes`,`performance_schema`.`events_statements_summary_by_digest`.`DIGEST` AS `digest`,`performance_schema`.`events_statements_summary_by_digest`.`FIRST_SEEN` AS `first_seen`,`performance_schema`.`events_statements_summary_by_digest`.`LAST_SEEN` AS `last_seen` from `performance_schema`.`events_statements_summary_by_digest` order by `performance_schema`.`events_statements_summary_by_digest`.`SUM_TIMER_WAIT` desc;

-- --------------------------------------------------------

--
-- Structure for view `statements_with_errors_or_warnings`
--
DROP TABLE IF EXISTS `statements_with_errors_or_warnings`;

CREATE ALGORITHM=MERGE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `statements_with_errors_or_warnings` AS select `format_statement`(`performance_schema`.`events_statements_summary_by_digest`.`DIGEST_TEXT`) AS `query`,`performance_schema`.`events_statements_summary_by_digest`.`SCHEMA_NAME` AS `db`,`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR` AS `exec_count`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_ERRORS` AS `errors`,(ifnull((`performance_schema`.`events_statements_summary_by_digest`.`SUM_ERRORS` / nullif(`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`,0)),0) * 100) AS `error_pct`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_WARNINGS` AS `warnings`,(ifnull((`performance_schema`.`events_statements_summary_by_digest`.`SUM_WARNINGS` / nullif(`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`,0)),0) * 100) AS `warning_pct`,`performance_schema`.`events_statements_summary_by_digest`.`FIRST_SEEN` AS `first_seen`,`performance_schema`.`events_statements_summary_by_digest`.`LAST_SEEN` AS `last_seen`,`performance_schema`.`events_statements_summary_by_digest`.`DIGEST` AS `digest` from `performance_schema`.`events_statements_summary_by_digest` where ((`performance_schema`.`events_statements_summary_by_digest`.`SUM_ERRORS` > 0) or (`performance_schema`.`events_statements_summary_by_digest`.`SUM_WARNINGS` > 0)) order by `performance_schema`.`events_statements_summary_by_digest`.`SUM_ERRORS` desc,`performance_schema`.`events_statements_summary_by_digest`.`SUM_WARNINGS` desc;

-- --------------------------------------------------------

--
-- Structure for view `statements_with_full_table_scans`
--
DROP TABLE IF EXISTS `statements_with_full_table_scans`;

CREATE ALGORITHM=MERGE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `statements_with_full_table_scans` AS select `format_statement`(`performance_schema`.`events_statements_summary_by_digest`.`DIGEST_TEXT`) AS `query`,`performance_schema`.`events_statements_summary_by_digest`.`SCHEMA_NAME` AS `db`,`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR` AS `exec_count`,`format_time`(`performance_schema`.`events_statements_summary_by_digest`.`SUM_TIMER_WAIT`) AS `total_latency`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_NO_INDEX_USED` AS `no_index_used_count`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_NO_GOOD_INDEX_USED` AS `no_good_index_used_count`,round((ifnull((`performance_schema`.`events_statements_summary_by_digest`.`SUM_NO_INDEX_USED` / nullif(`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`,0)),0) * 100),0) AS `no_index_used_pct`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_ROWS_SENT` AS `rows_sent`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_ROWS_EXAMINED` AS `rows_examined`,round((`performance_schema`.`events_statements_summary_by_digest`.`SUM_ROWS_SENT` / `performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`),0) AS `rows_sent_avg`,round((`performance_schema`.`events_statements_summary_by_digest`.`SUM_ROWS_EXAMINED` / `performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`),0) AS `rows_examined_avg`,`performance_schema`.`events_statements_summary_by_digest`.`FIRST_SEEN` AS `first_seen`,`performance_schema`.`events_statements_summary_by_digest`.`LAST_SEEN` AS `last_seen`,`performance_schema`.`events_statements_summary_by_digest`.`DIGEST` AS `digest` from `performance_schema`.`events_statements_summary_by_digest` where (((`performance_schema`.`events_statements_summary_by_digest`.`SUM_NO_INDEX_USED` > 0) or (`performance_schema`.`events_statements_summary_by_digest`.`SUM_NO_GOOD_INDEX_USED` > 0)) and (not((`performance_schema`.`events_statements_summary_by_digest`.`DIGEST_TEXT` like 'SHOW%')))) order by round((ifnull((`performance_schema`.`events_statements_summary_by_digest`.`SUM_NO_INDEX_USED` / nullif(`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`,0)),0) * 100),0) desc,`format_time`(`performance_schema`.`events_statements_summary_by_digest`.`SUM_TIMER_WAIT`) desc;

-- --------------------------------------------------------

--
-- Structure for view `statements_with_runtimes_in_95th_percentile`
--
DROP TABLE IF EXISTS `statements_with_runtimes_in_95th_percentile`;

CREATE ALGORITHM=MERGE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `statements_with_runtimes_in_95th_percentile` AS select `format_statement`(`stmts`.`DIGEST_TEXT`) AS `query`,`stmts`.`SCHEMA_NAME` AS `db`,if(((`stmts`.`SUM_NO_GOOD_INDEX_USED` > 0) or (`stmts`.`SUM_NO_INDEX_USED` > 0)),'*','') AS `full_scan`,`stmts`.`COUNT_STAR` AS `exec_count`,`stmts`.`SUM_ERRORS` AS `err_count`,`stmts`.`SUM_WARNINGS` AS `warn_count`,`format_time`(`stmts`.`SUM_TIMER_WAIT`) AS `total_latency`,`format_time`(`stmts`.`MAX_TIMER_WAIT`) AS `max_latency`,`format_time`(`stmts`.`AVG_TIMER_WAIT`) AS `avg_latency`,`stmts`.`SUM_ROWS_SENT` AS `rows_sent`,round(ifnull((`stmts`.`SUM_ROWS_SENT` / nullif(`stmts`.`COUNT_STAR`,0)),0),0) AS `rows_sent_avg`,`stmts`.`SUM_ROWS_EXAMINED` AS `rows_examined`,round(ifnull((`stmts`.`SUM_ROWS_EXAMINED` / nullif(`stmts`.`COUNT_STAR`,0)),0),0) AS `rows_examined_avg`,`stmts`.`FIRST_SEEN` AS `first_seen`,`stmts`.`LAST_SEEN` AS `last_seen`,`stmts`.`DIGEST` AS `digest` from (`performance_schema`.`events_statements_summary_by_digest` `stmts` join `x$ps_digest_95th_percentile_by_avg_us` `top_percentile` on((round((`stmts`.`AVG_TIMER_WAIT` / 1000000),0) >= `top_percentile`.`avg_us`))) order by `stmts`.`AVG_TIMER_WAIT` desc;

-- --------------------------------------------------------

--
-- Structure for view `statements_with_sorting`
--
DROP TABLE IF EXISTS `statements_with_sorting`;

CREATE ALGORITHM=MERGE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `statements_with_sorting` AS select `format_statement`(`performance_schema`.`events_statements_summary_by_digest`.`DIGEST_TEXT`) AS `query`,`performance_schema`.`events_statements_summary_by_digest`.`SCHEMA_NAME` AS `db`,`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR` AS `exec_count`,`format_time`(`performance_schema`.`events_statements_summary_by_digest`.`SUM_TIMER_WAIT`) AS `total_latency`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_SORT_MERGE_PASSES` AS `sort_merge_passes`,round(ifnull((`performance_schema`.`events_statements_summary_by_digest`.`SUM_SORT_MERGE_PASSES` / nullif(`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`,0)),0),0) AS `avg_sort_merges`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_SORT_SCAN` AS `sorts_using_scans`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_SORT_RANGE` AS `sort_using_range`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_SORT_ROWS` AS `rows_sorted`,round(ifnull((`performance_schema`.`events_statements_summary_by_digest`.`SUM_SORT_ROWS` / nullif(`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`,0)),0),0) AS `avg_rows_sorted`,`performance_schema`.`events_statements_summary_by_digest`.`FIRST_SEEN` AS `first_seen`,`performance_schema`.`events_statements_summary_by_digest`.`LAST_SEEN` AS `last_seen`,`performance_schema`.`events_statements_summary_by_digest`.`DIGEST` AS `digest` from `performance_schema`.`events_statements_summary_by_digest` where (`performance_schema`.`events_statements_summary_by_digest`.`SUM_SORT_ROWS` > 0) order by `performance_schema`.`events_statements_summary_by_digest`.`SUM_TIMER_WAIT` desc;

-- --------------------------------------------------------

--
-- Structure for view `statements_with_temp_tables`
--
DROP TABLE IF EXISTS `statements_with_temp_tables`;

CREATE ALGORITHM=MERGE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `statements_with_temp_tables` AS select `format_statement`(`performance_schema`.`events_statements_summary_by_digest`.`DIGEST_TEXT`) AS `query`,`performance_schema`.`events_statements_summary_by_digest`.`SCHEMA_NAME` AS `db`,`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR` AS `exec_count`,`format_time`(`performance_schema`.`events_statements_summary_by_digest`.`SUM_TIMER_WAIT`) AS `total_latency`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_CREATED_TMP_TABLES` AS `memory_tmp_tables`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_CREATED_TMP_DISK_TABLES` AS `disk_tmp_tables`,round(ifnull((`performance_schema`.`events_statements_summary_by_digest`.`SUM_CREATED_TMP_TABLES` / nullif(`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`,0)),0),0) AS `avg_tmp_tables_per_query`,round((ifnull((`performance_schema`.`events_statements_summary_by_digest`.`SUM_CREATED_TMP_DISK_TABLES` / nullif(`performance_schema`.`events_statements_summary_by_digest`.`SUM_CREATED_TMP_TABLES`,0)),0) * 100),0) AS `tmp_tables_to_disk_pct`,`performance_schema`.`events_statements_summary_by_digest`.`FIRST_SEEN` AS `first_seen`,`performance_schema`.`events_statements_summary_by_digest`.`LAST_SEEN` AS `last_seen`,`performance_schema`.`events_statements_summary_by_digest`.`DIGEST` AS `digest` from `performance_schema`.`events_statements_summary_by_digest` where (`performance_schema`.`events_statements_summary_by_digest`.`SUM_CREATED_TMP_TABLES` > 0) order by `performance_schema`.`events_statements_summary_by_digest`.`SUM_CREATED_TMP_DISK_TABLES` desc,`performance_schema`.`events_statements_summary_by_digest`.`SUM_CREATED_TMP_TABLES` desc;

-- --------------------------------------------------------

--
-- Structure for view `user_summary`
--
DROP TABLE IF EXISTS `user_summary`;

CREATE ALGORITHM=TEMPTABLE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `user_summary` AS select if(isnull(`performance_schema`.`accounts`.`USER`),'background',`performance_schema`.`accounts`.`USER`) AS `user`,sum(`stmt`.`total`) AS `statements`,`format_time`(sum(`stmt`.`total_latency`)) AS `statement_latency`,`format_time`(ifnull((sum(`stmt`.`total_latency`) / nullif(sum(`stmt`.`total`),0)),0)) AS `statement_avg_latency`,sum(`stmt`.`full_scans`) AS `table_scans`,sum(`io`.`ios`) AS `file_ios`,`format_time`(sum(`io`.`io_latency`)) AS `file_io_latency`,sum(`performance_schema`.`accounts`.`CURRENT_CONNECTIONS`) AS `current_connections`,sum(`performance_schema`.`accounts`.`TOTAL_CONNECTIONS`) AS `total_connections`,count(distinct `performance_schema`.`accounts`.`HOST`) AS `unique_hosts`,`format_bytes`(sum(`mem`.`current_allocated`)) AS `current_memory`,`format_bytes`(sum(`mem`.`total_allocated`)) AS `total_memory_allocated` from (((`performance_schema`.`accounts` left join `x$user_summary_by_statement_latency` `stmt` on((if(isnull(`performance_schema`.`accounts`.`USER`),'background',`performance_schema`.`accounts`.`USER`) = `stmt`.`user`))) left join `x$user_summary_by_file_io` `io` on((if(isnull(`performance_schema`.`accounts`.`USER`),'background',`performance_schema`.`accounts`.`USER`) = `io`.`user`))) left join `x$memory_by_user_by_current_bytes` `mem` on((if(isnull(`performance_schema`.`accounts`.`USER`),'background',`performance_schema`.`accounts`.`USER`) = `mem`.`user`))) group by if(isnull(`performance_schema`.`accounts`.`USER`),'background',`performance_schema`.`accounts`.`USER`) order by sum(`stmt`.`total_latency`) desc;

-- --------------------------------------------------------

--
-- Structure for view `user_summary_by_file_io`
--
DROP TABLE IF EXISTS `user_summary_by_file_io`;

CREATE ALGORITHM=TEMPTABLE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `user_summary_by_file_io` AS select if(isnull(`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER`),'background',`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER`) AS `user`,sum(`performance_schema`.`events_waits_summary_by_user_by_event_name`.`COUNT_STAR`) AS `ios`,`format_time`(sum(`performance_schema`.`events_waits_summary_by_user_by_event_name`.`SUM_TIMER_WAIT`)) AS `io_latency` from `performance_schema`.`events_waits_summary_by_user_by_event_name` where (`performance_schema`.`events_waits_summary_by_user_by_event_name`.`EVENT_NAME` like 'wait/io/file/%') group by if(isnull(`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER`),'background',`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER`) order by sum(`performance_schema`.`events_waits_summary_by_user_by_event_name`.`SUM_TIMER_WAIT`) desc;

-- --------------------------------------------------------

--
-- Structure for view `user_summary_by_file_io_type`
--
DROP TABLE IF EXISTS `user_summary_by_file_io_type`;

CREATE ALGORITHM=MERGE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `user_summary_by_file_io_type` AS select if(isnull(`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER`),'background',`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER`) AS `user`,`performance_schema`.`events_waits_summary_by_user_by_event_name`.`EVENT_NAME` AS `event_name`,`performance_schema`.`events_waits_summary_by_user_by_event_name`.`COUNT_STAR` AS `total`,`format_time`(`performance_schema`.`events_waits_summary_by_user_by_event_name`.`SUM_TIMER_WAIT`) AS `latency`,`format_time`(`performance_schema`.`events_waits_summary_by_user_by_event_name`.`MAX_TIMER_WAIT`) AS `max_latency` from `performance_schema`.`events_waits_summary_by_user_by_event_name` where ((`performance_schema`.`events_waits_summary_by_user_by_event_name`.`EVENT_NAME` like 'wait/io/file%') and (`performance_schema`.`events_waits_summary_by_user_by_event_name`.`COUNT_STAR` > 0)) order by if(isnull(`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER`),'background',`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER`),`performance_schema`.`events_waits_summary_by_user_by_event_name`.`SUM_TIMER_WAIT` desc;

-- --------------------------------------------------------

--
-- Structure for view `user_summary_by_stages`
--
DROP TABLE IF EXISTS `user_summary_by_stages`;

CREATE ALGORITHM=MERGE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `user_summary_by_stages` AS select if(isnull(`performance_schema`.`events_stages_summary_by_user_by_event_name`.`USER`),'background',`performance_schema`.`events_stages_summary_by_user_by_event_name`.`USER`) AS `user`,`performance_schema`.`events_stages_summary_by_user_by_event_name`.`EVENT_NAME` AS `event_name`,`performance_schema`.`events_stages_summary_by_user_by_event_name`.`COUNT_STAR` AS `total`,`format_time`(`performance_schema`.`events_stages_summary_by_user_by_event_name`.`SUM_TIMER_WAIT`) AS `total_latency`,`format_time`(`performance_schema`.`events_stages_summary_by_user_by_event_name`.`AVG_TIMER_WAIT`) AS `avg_latency` from `performance_schema`.`events_stages_summary_by_user_by_event_name` where (`performance_schema`.`events_stages_summary_by_user_by_event_name`.`SUM_TIMER_WAIT` <> 0) order by if(isnull(`performance_schema`.`events_stages_summary_by_user_by_event_name`.`USER`),'background',`performance_schema`.`events_stages_summary_by_user_by_event_name`.`USER`),`performance_schema`.`events_stages_summary_by_user_by_event_name`.`SUM_TIMER_WAIT` desc;

-- --------------------------------------------------------

--
-- Structure for view `user_summary_by_statement_latency`
--
DROP TABLE IF EXISTS `user_summary_by_statement_latency`;

CREATE ALGORITHM=TEMPTABLE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `user_summary_by_statement_latency` AS select if(isnull(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`USER`),'background',`performance_schema`.`events_statements_summary_by_user_by_event_name`.`USER`) AS `user`,sum(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`COUNT_STAR`) AS `total`,`format_time`(sum(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_TIMER_WAIT`)) AS `total_latency`,`format_time`(sum(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`MAX_TIMER_WAIT`)) AS `max_latency`,`format_time`(sum(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_LOCK_TIME`)) AS `lock_latency`,sum(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_ROWS_SENT`) AS `rows_sent`,sum(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_ROWS_EXAMINED`) AS `rows_examined`,sum(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_ROWS_AFFECTED`) AS `rows_affected`,(sum(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_NO_INDEX_USED`) + sum(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_NO_GOOD_INDEX_USED`)) AS `full_scans` from `performance_schema`.`events_statements_summary_by_user_by_event_name` group by if(isnull(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`USER`),'background',`performance_schema`.`events_statements_summary_by_user_by_event_name`.`USER`) order by sum(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_TIMER_WAIT`) desc;

-- --------------------------------------------------------

--
-- Structure for view `user_summary_by_statement_type`
--
DROP TABLE IF EXISTS `user_summary_by_statement_type`;

CREATE ALGORITHM=MERGE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `user_summary_by_statement_type` AS select if(isnull(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`USER`),'background',`performance_schema`.`events_statements_summary_by_user_by_event_name`.`USER`) AS `user`,substring_index(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`EVENT_NAME`,'/',-(1)) AS `statement`,`performance_schema`.`events_statements_summary_by_user_by_event_name`.`COUNT_STAR` AS `total`,`format_time`(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_TIMER_WAIT`) AS `total_latency`,`format_time`(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`MAX_TIMER_WAIT`) AS `max_latency`,`format_time`(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_LOCK_TIME`) AS `lock_latency`,`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_ROWS_SENT` AS `rows_sent`,`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_ROWS_EXAMINED` AS `rows_examined`,`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_ROWS_AFFECTED` AS `rows_affected`,(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_NO_INDEX_USED` + `performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_NO_GOOD_INDEX_USED`) AS `full_scans` from `performance_schema`.`events_statements_summary_by_user_by_event_name` where (`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_TIMER_WAIT` <> 0) order by if(isnull(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`USER`),'background',`performance_schema`.`events_statements_summary_by_user_by_event_name`.`USER`),`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_TIMER_WAIT` desc;

-- --------------------------------------------------------

--
-- Structure for view `version`
--
DROP TABLE IF EXISTS `version`;

CREATE ALGORITHM=UNDEFINED DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `version` AS select '1.5.2' AS `sys_version`,version() AS `mysql_version`;

-- --------------------------------------------------------

--
-- Structure for view `wait_classes_global_by_avg_latency`
--
DROP TABLE IF EXISTS `wait_classes_global_by_avg_latency`;

CREATE ALGORITHM=TEMPTABLE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `wait_classes_global_by_avg_latency` AS select substring_index(`performance_schema`.`events_waits_summary_global_by_event_name`.`EVENT_NAME`,'/',3) AS `event_class`,sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`COUNT_STAR`) AS `total`,`format_time`(cast(sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT`) as unsigned)) AS `total_latency`,`format_time`(min(`performance_schema`.`events_waits_summary_global_by_event_name`.`MIN_TIMER_WAIT`)) AS `min_latency`,`format_time`(ifnull((sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT`) / nullif(sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`COUNT_STAR`),0)),0)) AS `avg_latency`,`format_time`(cast(max(`performance_schema`.`events_waits_summary_global_by_event_name`.`MAX_TIMER_WAIT`) as unsigned)) AS `max_latency` from `performance_schema`.`events_waits_summary_global_by_event_name` where ((`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT` > 0) and (`performance_schema`.`events_waits_summary_global_by_event_name`.`EVENT_NAME` <> 'idle')) group by `event_class` order by ifnull((sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT`) / nullif(sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`COUNT_STAR`),0)),0) desc;

-- --------------------------------------------------------

--
-- Structure for view `wait_classes_global_by_latency`
--
DROP TABLE IF EXISTS `wait_classes_global_by_latency`;

CREATE ALGORITHM=TEMPTABLE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `wait_classes_global_by_latency` AS select substring_index(`performance_schema`.`events_waits_summary_global_by_event_name`.`EVENT_NAME`,'/',3) AS `event_class`,sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`COUNT_STAR`) AS `total`,`format_time`(sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT`)) AS `total_latency`,`format_time`(min(`performance_schema`.`events_waits_summary_global_by_event_name`.`MIN_TIMER_WAIT`)) AS `min_latency`,`format_time`(ifnull((sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT`) / nullif(sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`COUNT_STAR`),0)),0)) AS `avg_latency`,`format_time`(max(`performance_schema`.`events_waits_summary_global_by_event_name`.`MAX_TIMER_WAIT`)) AS `max_latency` from `performance_schema`.`events_waits_summary_global_by_event_name` where ((`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT` > 0) and (`performance_schema`.`events_waits_summary_global_by_event_name`.`EVENT_NAME` <> 'idle')) group by substring_index(`performance_schema`.`events_waits_summary_global_by_event_name`.`EVENT_NAME`,'/',3) order by sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT`) desc;

-- --------------------------------------------------------

--
-- Structure for view `waits_by_host_by_latency`
--
DROP TABLE IF EXISTS `waits_by_host_by_latency`;

CREATE ALGORITHM=MERGE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `waits_by_host_by_latency` AS select if(isnull(`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST`),'background',`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST`) AS `host`,`performance_schema`.`events_waits_summary_by_host_by_event_name`.`EVENT_NAME` AS `event`,`performance_schema`.`events_waits_summary_by_host_by_event_name`.`COUNT_STAR` AS `total`,`format_time`(`performance_schema`.`events_waits_summary_by_host_by_event_name`.`SUM_TIMER_WAIT`) AS `total_latency`,`format_time`(`performance_schema`.`events_waits_summary_by_host_by_event_name`.`AVG_TIMER_WAIT`) AS `avg_latency`,`format_time`(`performance_schema`.`events_waits_summary_by_host_by_event_name`.`MAX_TIMER_WAIT`) AS `max_latency` from `performance_schema`.`events_waits_summary_by_host_by_event_name` where ((`performance_schema`.`events_waits_summary_by_host_by_event_name`.`EVENT_NAME` <> 'idle') and (`performance_schema`.`events_waits_summary_by_host_by_event_name`.`SUM_TIMER_WAIT` > 0)) order by if(isnull(`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST`),'background',`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST`),`performance_schema`.`events_waits_summary_by_host_by_event_name`.`SUM_TIMER_WAIT` desc;

-- --------------------------------------------------------

--
-- Structure for view `waits_by_user_by_latency`
--
DROP TABLE IF EXISTS `waits_by_user_by_latency`;

CREATE ALGORITHM=MERGE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `waits_by_user_by_latency` AS select if(isnull(`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER`),'background',`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER`) AS `user`,`performance_schema`.`events_waits_summary_by_user_by_event_name`.`EVENT_NAME` AS `event`,`performance_schema`.`events_waits_summary_by_user_by_event_name`.`COUNT_STAR` AS `total`,`format_time`(`performance_schema`.`events_waits_summary_by_user_by_event_name`.`SUM_TIMER_WAIT`) AS `total_latency`,`format_time`(`performance_schema`.`events_waits_summary_by_user_by_event_name`.`AVG_TIMER_WAIT`) AS `avg_latency`,`format_time`(`performance_schema`.`events_waits_summary_by_user_by_event_name`.`MAX_TIMER_WAIT`) AS `max_latency` from `performance_schema`.`events_waits_summary_by_user_by_event_name` where ((`performance_schema`.`events_waits_summary_by_user_by_event_name`.`EVENT_NAME` <> 'idle') and (`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER` is not null) and (`performance_schema`.`events_waits_summary_by_user_by_event_name`.`SUM_TIMER_WAIT` > 0)) order by if(isnull(`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER`),'background',`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER`),`performance_schema`.`events_waits_summary_by_user_by_event_name`.`SUM_TIMER_WAIT` desc;

-- --------------------------------------------------------

--
-- Structure for view `waits_global_by_latency`
--
DROP TABLE IF EXISTS `waits_global_by_latency`;

CREATE ALGORITHM=MERGE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `waits_global_by_latency` AS select `performance_schema`.`events_waits_summary_global_by_event_name`.`EVENT_NAME` AS `events`,`performance_schema`.`events_waits_summary_global_by_event_name`.`COUNT_STAR` AS `total`,`format_time`(`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT`) AS `total_latency`,`format_time`(`performance_schema`.`events_waits_summary_global_by_event_name`.`AVG_TIMER_WAIT`) AS `avg_latency`,`format_time`(`performance_schema`.`events_waits_summary_global_by_event_name`.`MAX_TIMER_WAIT`) AS `max_latency` from `performance_schema`.`events_waits_summary_global_by_event_name` where ((`performance_schema`.`events_waits_summary_global_by_event_name`.`EVENT_NAME` <> 'idle') and (`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT` > 0)) order by `performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT` desc;

-- --------------------------------------------------------

--
-- Structure for view `x$host_summary`
--
DROP TABLE IF EXISTS `x$host_summary`;

CREATE ALGORITHM=TEMPTABLE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `x$host_summary` AS select if(isnull(`performance_schema`.`accounts`.`HOST`),'background',`performance_schema`.`accounts`.`HOST`) AS `host`,sum(`stmt`.`total`) AS `statements`,sum(`stmt`.`total_latency`) AS `statement_latency`,(sum(`stmt`.`total_latency`) / sum(`stmt`.`total`)) AS `statement_avg_latency`,sum(`stmt`.`full_scans`) AS `table_scans`,sum(`io`.`ios`) AS `file_ios`,sum(`io`.`io_latency`) AS `file_io_latency`,sum(`performance_schema`.`accounts`.`CURRENT_CONNECTIONS`) AS `current_connections`,sum(`performance_schema`.`accounts`.`TOTAL_CONNECTIONS`) AS `total_connections`,count(distinct `performance_schema`.`accounts`.`USER`) AS `unique_users`,sum(`mem`.`current_allocated`) AS `current_memory`,sum(`mem`.`total_allocated`) AS `total_memory_allocated` from (((`performance_schema`.`accounts` join `x$host_summary_by_statement_latency` `stmt` on((`performance_schema`.`accounts`.`HOST` = `stmt`.`host`))) join `x$host_summary_by_file_io` `io` on((`performance_schema`.`accounts`.`HOST` = `io`.`host`))) join `x$memory_by_host_by_current_bytes` `mem` on((`performance_schema`.`accounts`.`HOST` = `mem`.`host`))) group by if(isnull(`performance_schema`.`accounts`.`HOST`),'background',`performance_schema`.`accounts`.`HOST`);

-- --------------------------------------------------------

--
-- Structure for view `x$host_summary_by_file_io`
--
DROP TABLE IF EXISTS `x$host_summary_by_file_io`;

CREATE ALGORITHM=TEMPTABLE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `x$host_summary_by_file_io` AS select if(isnull(`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST`),'background',`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST`) AS `host`,sum(`performance_schema`.`events_waits_summary_by_host_by_event_name`.`COUNT_STAR`) AS `ios`,sum(`performance_schema`.`events_waits_summary_by_host_by_event_name`.`SUM_TIMER_WAIT`) AS `io_latency` from `performance_schema`.`events_waits_summary_by_host_by_event_name` where (`performance_schema`.`events_waits_summary_by_host_by_event_name`.`EVENT_NAME` like 'wait/io/file/%') group by if(isnull(`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST`),'background',`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST`) order by sum(`performance_schema`.`events_waits_summary_by_host_by_event_name`.`SUM_TIMER_WAIT`) desc;

-- --------------------------------------------------------

--
-- Structure for view `x$host_summary_by_file_io_type`
--
DROP TABLE IF EXISTS `x$host_summary_by_file_io_type`;

CREATE ALGORITHM=MERGE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `x$host_summary_by_file_io_type` AS select if(isnull(`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST`),'background',`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST`) AS `host`,`performance_schema`.`events_waits_summary_by_host_by_event_name`.`EVENT_NAME` AS `event_name`,`performance_schema`.`events_waits_summary_by_host_by_event_name`.`COUNT_STAR` AS `total`,`performance_schema`.`events_waits_summary_by_host_by_event_name`.`SUM_TIMER_WAIT` AS `total_latency`,`performance_schema`.`events_waits_summary_by_host_by_event_name`.`MAX_TIMER_WAIT` AS `max_latency` from `performance_schema`.`events_waits_summary_by_host_by_event_name` where ((`performance_schema`.`events_waits_summary_by_host_by_event_name`.`EVENT_NAME` like 'wait/io/file%') and (`performance_schema`.`events_waits_summary_by_host_by_event_name`.`COUNT_STAR` > 0)) order by if(isnull(`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST`),'background',`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST`),`performance_schema`.`events_waits_summary_by_host_by_event_name`.`SUM_TIMER_WAIT` desc;

-- --------------------------------------------------------

--
-- Structure for view `x$host_summary_by_stages`
--
DROP TABLE IF EXISTS `x$host_summary_by_stages`;

CREATE ALGORITHM=MERGE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `x$host_summary_by_stages` AS select if(isnull(`performance_schema`.`events_stages_summary_by_host_by_event_name`.`HOST`),'background',`performance_schema`.`events_stages_summary_by_host_by_event_name`.`HOST`) AS `host`,`performance_schema`.`events_stages_summary_by_host_by_event_name`.`EVENT_NAME` AS `event_name`,`performance_schema`.`events_stages_summary_by_host_by_event_name`.`COUNT_STAR` AS `total`,`performance_schema`.`events_stages_summary_by_host_by_event_name`.`SUM_TIMER_WAIT` AS `total_latency`,`performance_schema`.`events_stages_summary_by_host_by_event_name`.`AVG_TIMER_WAIT` AS `avg_latency` from `performance_schema`.`events_stages_summary_by_host_by_event_name` where (`performance_schema`.`events_stages_summary_by_host_by_event_name`.`SUM_TIMER_WAIT` <> 0) order by if(isnull(`performance_schema`.`events_stages_summary_by_host_by_event_name`.`HOST`),'background',`performance_schema`.`events_stages_summary_by_host_by_event_name`.`HOST`),`performance_schema`.`events_stages_summary_by_host_by_event_name`.`SUM_TIMER_WAIT` desc;

-- --------------------------------------------------------

--
-- Structure for view `x$host_summary_by_statement_latency`
--
DROP TABLE IF EXISTS `x$host_summary_by_statement_latency`;

CREATE ALGORITHM=TEMPTABLE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `x$host_summary_by_statement_latency` AS select if(isnull(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`HOST`),'background',`performance_schema`.`events_statements_summary_by_host_by_event_name`.`HOST`) AS `host`,sum(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`COUNT_STAR`) AS `total`,sum(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_TIMER_WAIT`) AS `total_latency`,max(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`MAX_TIMER_WAIT`) AS `max_latency`,sum(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_LOCK_TIME`) AS `lock_latency`,sum(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_ROWS_SENT`) AS `rows_sent`,sum(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_ROWS_EXAMINED`) AS `rows_examined`,sum(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_ROWS_AFFECTED`) AS `rows_affected`,(sum(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_NO_INDEX_USED`) + sum(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_NO_GOOD_INDEX_USED`)) AS `full_scans` from `performance_schema`.`events_statements_summary_by_host_by_event_name` group by if(isnull(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`HOST`),'background',`performance_schema`.`events_statements_summary_by_host_by_event_name`.`HOST`) order by sum(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_TIMER_WAIT`) desc;

-- --------------------------------------------------------

--
-- Structure for view `x$host_summary_by_statement_type`
--
DROP TABLE IF EXISTS `x$host_summary_by_statement_type`;

CREATE ALGORITHM=MERGE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `x$host_summary_by_statement_type` AS select if(isnull(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`HOST`),'background',`performance_schema`.`events_statements_summary_by_host_by_event_name`.`HOST`) AS `host`,substring_index(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`EVENT_NAME`,'/',-(1)) AS `statement`,`performance_schema`.`events_statements_summary_by_host_by_event_name`.`COUNT_STAR` AS `total`,`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_TIMER_WAIT` AS `total_latency`,`performance_schema`.`events_statements_summary_by_host_by_event_name`.`MAX_TIMER_WAIT` AS `max_latency`,`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_LOCK_TIME` AS `lock_latency`,`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_ROWS_SENT` AS `rows_sent`,`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_ROWS_EXAMINED` AS `rows_examined`,`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_ROWS_AFFECTED` AS `rows_affected`,(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_NO_INDEX_USED` + `performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_NO_GOOD_INDEX_USED`) AS `full_scans` from `performance_schema`.`events_statements_summary_by_host_by_event_name` where (`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_TIMER_WAIT` <> 0) order by if(isnull(`performance_schema`.`events_statements_summary_by_host_by_event_name`.`HOST`),'background',`performance_schema`.`events_statements_summary_by_host_by_event_name`.`HOST`),`performance_schema`.`events_statements_summary_by_host_by_event_name`.`SUM_TIMER_WAIT` desc;

-- --------------------------------------------------------

--
-- Structure for view `x$innodb_buffer_stats_by_schema`
--
DROP TABLE IF EXISTS `x$innodb_buffer_stats_by_schema`;

CREATE ALGORITHM=TEMPTABLE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `x$innodb_buffer_stats_by_schema` AS select if((locate('.',`ibp`.`TABLE_NAME`) = 0),'InnoDB System',replace(substring_index(`ibp`.`TABLE_NAME`,'.',1),'`','')) AS `object_schema`,sum(if((`ibp`.`COMPRESSED_SIZE` = 0),16384,`ibp`.`COMPRESSED_SIZE`)) AS `allocated`,sum(`ibp`.`DATA_SIZE`) AS `data`,count(`ibp`.`PAGE_NUMBER`) AS `pages`,count(if((`ibp`.`IS_HASHED` = 'YES'),1,NULL)) AS `pages_hashed`,count(if((`ibp`.`IS_OLD` = 'YES'),1,NULL)) AS `pages_old`,round(ifnull((sum(`ibp`.`NUMBER_RECORDS`) / nullif(count(distinct `ibp`.`INDEX_NAME`),0)),0),0) AS `rows_cached` from `information_schema`.`innodb_buffer_page` `ibp` where (`ibp`.`TABLE_NAME` is not null) group by `object_schema` order by sum(if((`ibp`.`COMPRESSED_SIZE` = 0),16384,`ibp`.`COMPRESSED_SIZE`)) desc;

-- --------------------------------------------------------

--
-- Structure for view `x$innodb_buffer_stats_by_table`
--
DROP TABLE IF EXISTS `x$innodb_buffer_stats_by_table`;

CREATE ALGORITHM=TEMPTABLE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `x$innodb_buffer_stats_by_table` AS select if((locate('.',`ibp`.`TABLE_NAME`) = 0),'InnoDB System',replace(substring_index(`ibp`.`TABLE_NAME`,'.',1),'`','')) AS `object_schema`,replace(substring_index(`ibp`.`TABLE_NAME`,'.',-(1)),'`','') AS `object_name`,sum(if((`ibp`.`COMPRESSED_SIZE` = 0),16384,`ibp`.`COMPRESSED_SIZE`)) AS `allocated`,sum(`ibp`.`DATA_SIZE`) AS `data`,count(`ibp`.`PAGE_NUMBER`) AS `pages`,count(if((`ibp`.`IS_HASHED` = 'YES'),1,NULL)) AS `pages_hashed`,count(if((`ibp`.`IS_OLD` = 'YES'),1,NULL)) AS `pages_old`,round(ifnull((sum(`ibp`.`NUMBER_RECORDS`) / nullif(count(distinct `ibp`.`INDEX_NAME`),0)),0),0) AS `rows_cached` from `information_schema`.`innodb_buffer_page` `ibp` where (`ibp`.`TABLE_NAME` is not null) group by `object_schema`,`object_name` order by sum(if((`ibp`.`COMPRESSED_SIZE` = 0),16384,`ibp`.`COMPRESSED_SIZE`)) desc;

-- --------------------------------------------------------

--
-- Structure for view `x$innodb_lock_waits`
--
DROP TABLE IF EXISTS `x$innodb_lock_waits`;

CREATE ALGORITHM=TEMPTABLE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `x$innodb_lock_waits` AS select `r`.`trx_wait_started` AS `wait_started`,timediff(now(),`r`.`trx_wait_started`) AS `wait_age`,timestampdiff(SECOND,`r`.`trx_wait_started`,now()) AS `wait_age_secs`,`rl`.`lock_table` AS `locked_table`,`rl`.`lock_index` AS `locked_index`,`rl`.`lock_type` AS `locked_type`,`r`.`trx_id` AS `waiting_trx_id`,`r`.`trx_started` AS `waiting_trx_started`,timediff(now(),`r`.`trx_started`) AS `waiting_trx_age`,`r`.`trx_rows_locked` AS `waiting_trx_rows_locked`,`r`.`trx_rows_modified` AS `waiting_trx_rows_modified`,`r`.`trx_mysql_thread_id` AS `waiting_pid`,`r`.`trx_query` AS `waiting_query`,`rl`.`lock_id` AS `waiting_lock_id`,`rl`.`lock_mode` AS `waiting_lock_mode`,`b`.`trx_id` AS `blocking_trx_id`,`b`.`trx_mysql_thread_id` AS `blocking_pid`,`b`.`trx_query` AS `blocking_query`,`bl`.`lock_id` AS `blocking_lock_id`,`bl`.`lock_mode` AS `blocking_lock_mode`,`b`.`trx_started` AS `blocking_trx_started`,timediff(now(),`b`.`trx_started`) AS `blocking_trx_age`,`b`.`trx_rows_locked` AS `blocking_trx_rows_locked`,`b`.`trx_rows_modified` AS `blocking_trx_rows_modified`,concat('KILL QUERY ',`b`.`trx_mysql_thread_id`) AS `sql_kill_blocking_query`,concat('KILL ',`b`.`trx_mysql_thread_id`) AS `sql_kill_blocking_connection` from ((((`information_schema`.`innodb_lock_waits` `w` join `information_schema`.`innodb_trx` `b` on((`b`.`trx_id` = `w`.`blocking_trx_id`))) join `information_schema`.`innodb_trx` `r` on((`r`.`trx_id` = `w`.`requesting_trx_id`))) join `information_schema`.`innodb_locks` `bl` on((`bl`.`lock_id` = `w`.`blocking_lock_id`))) join `information_schema`.`innodb_locks` `rl` on((`rl`.`lock_id` = `w`.`requested_lock_id`))) order by `r`.`trx_wait_started`;

-- --------------------------------------------------------

--
-- Structure for view `x$io_by_thread_by_latency`
--
DROP TABLE IF EXISTS `x$io_by_thread_by_latency`;

CREATE ALGORITHM=TEMPTABLE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `x$io_by_thread_by_latency` AS select if(isnull(`performance_schema`.`threads`.`PROCESSLIST_ID`),substring_index(`performance_schema`.`threads`.`NAME`,'/',-(1)),concat(`performance_schema`.`threads`.`PROCESSLIST_USER`,'@',`performance_schema`.`threads`.`PROCESSLIST_HOST`)) AS `user`,sum(`performance_schema`.`events_waits_summary_by_thread_by_event_name`.`COUNT_STAR`) AS `total`,sum(`performance_schema`.`events_waits_summary_by_thread_by_event_name`.`SUM_TIMER_WAIT`) AS `total_latency`,min(`performance_schema`.`events_waits_summary_by_thread_by_event_name`.`MIN_TIMER_WAIT`) AS `min_latency`,avg(`performance_schema`.`events_waits_summary_by_thread_by_event_name`.`AVG_TIMER_WAIT`) AS `avg_latency`,max(`performance_schema`.`events_waits_summary_by_thread_by_event_name`.`MAX_TIMER_WAIT`) AS `max_latency`,`performance_schema`.`events_waits_summary_by_thread_by_event_name`.`THREAD_ID` AS `thread_id`,`performance_schema`.`threads`.`PROCESSLIST_ID` AS `processlist_id` from (`performance_schema`.`events_waits_summary_by_thread_by_event_name` left join `performance_schema`.`threads` on((`performance_schema`.`events_waits_summary_by_thread_by_event_name`.`THREAD_ID` = `performance_schema`.`threads`.`THREAD_ID`))) where ((`performance_schema`.`events_waits_summary_by_thread_by_event_name`.`EVENT_NAME` like 'wait/io/file/%') and (`performance_schema`.`events_waits_summary_by_thread_by_event_name`.`SUM_TIMER_WAIT` > 0)) group by `performance_schema`.`events_waits_summary_by_thread_by_event_name`.`THREAD_ID`,`performance_schema`.`threads`.`PROCESSLIST_ID`,`user` order by sum(`performance_schema`.`events_waits_summary_by_thread_by_event_name`.`SUM_TIMER_WAIT`) desc;

-- --------------------------------------------------------

--
-- Structure for view `x$io_global_by_file_by_bytes`
--
DROP TABLE IF EXISTS `x$io_global_by_file_by_bytes`;

CREATE ALGORITHM=MERGE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `x$io_global_by_file_by_bytes` AS select `performance_schema`.`file_summary_by_instance`.`FILE_NAME` AS `file`,`performance_schema`.`file_summary_by_instance`.`COUNT_READ` AS `count_read`,`performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_READ` AS `total_read`,ifnull((`performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_READ` / nullif(`performance_schema`.`file_summary_by_instance`.`COUNT_READ`,0)),0) AS `avg_read`,`performance_schema`.`file_summary_by_instance`.`COUNT_WRITE` AS `count_write`,`performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_WRITE` AS `total_written`,ifnull((`performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_WRITE` / nullif(`performance_schema`.`file_summary_by_instance`.`COUNT_WRITE`,0)),0.00) AS `avg_write`,(`performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_READ` + `performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_WRITE`) AS `total`,ifnull(round((100 - ((`performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_READ` / nullif((`performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_READ` + `performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_WRITE`),0)) * 100)),2),0.00) AS `write_pct` from `performance_schema`.`file_summary_by_instance` order by (`performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_READ` + `performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_WRITE`) desc;

-- --------------------------------------------------------

--
-- Structure for view `x$io_global_by_file_by_latency`
--
DROP TABLE IF EXISTS `x$io_global_by_file_by_latency`;

CREATE ALGORITHM=MERGE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `x$io_global_by_file_by_latency` AS select `performance_schema`.`file_summary_by_instance`.`FILE_NAME` AS `file`,`performance_schema`.`file_summary_by_instance`.`COUNT_STAR` AS `total`,`performance_schema`.`file_summary_by_instance`.`SUM_TIMER_WAIT` AS `total_latency`,`performance_schema`.`file_summary_by_instance`.`COUNT_READ` AS `count_read`,`performance_schema`.`file_summary_by_instance`.`SUM_TIMER_READ` AS `read_latency`,`performance_schema`.`file_summary_by_instance`.`COUNT_WRITE` AS `count_write`,`performance_schema`.`file_summary_by_instance`.`SUM_TIMER_WRITE` AS `write_latency`,`performance_schema`.`file_summary_by_instance`.`COUNT_MISC` AS `count_misc`,`performance_schema`.`file_summary_by_instance`.`SUM_TIMER_MISC` AS `misc_latency` from `performance_schema`.`file_summary_by_instance` order by `performance_schema`.`file_summary_by_instance`.`SUM_TIMER_WAIT` desc;

-- --------------------------------------------------------

--
-- Structure for view `x$io_global_by_wait_by_bytes`
--
DROP TABLE IF EXISTS `x$io_global_by_wait_by_bytes`;

CREATE ALGORITHM=MERGE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `x$io_global_by_wait_by_bytes` AS select substring_index(`performance_schema`.`file_summary_by_event_name`.`EVENT_NAME`,'/',-(2)) AS `event_name`,`performance_schema`.`file_summary_by_event_name`.`COUNT_STAR` AS `total`,`performance_schema`.`file_summary_by_event_name`.`SUM_TIMER_WAIT` AS `total_latency`,`performance_schema`.`file_summary_by_event_name`.`MIN_TIMER_WAIT` AS `min_latency`,`performance_schema`.`file_summary_by_event_name`.`AVG_TIMER_WAIT` AS `avg_latency`,`performance_schema`.`file_summary_by_event_name`.`MAX_TIMER_WAIT` AS `max_latency`,`performance_schema`.`file_summary_by_event_name`.`COUNT_READ` AS `count_read`,`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_READ` AS `total_read`,ifnull((`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_READ` / nullif(`performance_schema`.`file_summary_by_event_name`.`COUNT_READ`,0)),0) AS `avg_read`,`performance_schema`.`file_summary_by_event_name`.`COUNT_WRITE` AS `count_write`,`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_WRITE` AS `total_written`,ifnull((`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_WRITE` / nullif(`performance_schema`.`file_summary_by_event_name`.`COUNT_WRITE`,0)),0) AS `avg_written`,(`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_WRITE` + `performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_READ`) AS `total_requested` from `performance_schema`.`file_summary_by_event_name` where ((`performance_schema`.`file_summary_by_event_name`.`EVENT_NAME` like 'wait/io/file/%') and (`performance_schema`.`file_summary_by_event_name`.`COUNT_STAR` > 0)) order by (`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_WRITE` + `performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_READ`) desc;

-- --------------------------------------------------------

--
-- Structure for view `x$io_global_by_wait_by_latency`
--
DROP TABLE IF EXISTS `x$io_global_by_wait_by_latency`;

CREATE ALGORITHM=MERGE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `x$io_global_by_wait_by_latency` AS select substring_index(`performance_schema`.`file_summary_by_event_name`.`EVENT_NAME`,'/',-(2)) AS `event_name`,`performance_schema`.`file_summary_by_event_name`.`COUNT_STAR` AS `total`,`performance_schema`.`file_summary_by_event_name`.`SUM_TIMER_WAIT` AS `total_latency`,`performance_schema`.`file_summary_by_event_name`.`AVG_TIMER_WAIT` AS `avg_latency`,`performance_schema`.`file_summary_by_event_name`.`MAX_TIMER_WAIT` AS `max_latency`,`performance_schema`.`file_summary_by_event_name`.`SUM_TIMER_READ` AS `read_latency`,`performance_schema`.`file_summary_by_event_name`.`SUM_TIMER_WRITE` AS `write_latency`,`performance_schema`.`file_summary_by_event_name`.`SUM_TIMER_MISC` AS `misc_latency`,`performance_schema`.`file_summary_by_event_name`.`COUNT_READ` AS `count_read`,`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_READ` AS `total_read`,ifnull((`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_READ` / nullif(`performance_schema`.`file_summary_by_event_name`.`COUNT_READ`,0)),0) AS `avg_read`,`performance_schema`.`file_summary_by_event_name`.`COUNT_WRITE` AS `count_write`,`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_WRITE` AS `total_written`,ifnull((`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_WRITE` / nullif(`performance_schema`.`file_summary_by_event_name`.`COUNT_WRITE`,0)),0) AS `avg_written` from `performance_schema`.`file_summary_by_event_name` where ((`performance_schema`.`file_summary_by_event_name`.`EVENT_NAME` like 'wait/io/file/%') and (`performance_schema`.`file_summary_by_event_name`.`COUNT_STAR` > 0)) order by `performance_schema`.`file_summary_by_event_name`.`SUM_TIMER_WAIT` desc;

-- --------------------------------------------------------

--
-- Structure for view `x$latest_file_io`
--
DROP TABLE IF EXISTS `x$latest_file_io`;

CREATE ALGORITHM=MERGE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `x$latest_file_io` AS select if(isnull(`information_schema`.`processlist`.`ID`),concat(substring_index(`performance_schema`.`threads`.`NAME`,'/',-(1)),':',`performance_schema`.`events_waits_history_long`.`THREAD_ID`),concat(`information_schema`.`processlist`.`USER`,'@',`information_schema`.`processlist`.`HOST`,':',`information_schema`.`processlist`.`ID`)) AS `thread`,`performance_schema`.`events_waits_history_long`.`OBJECT_NAME` AS `file`,`performance_schema`.`events_waits_history_long`.`TIMER_WAIT` AS `latency`,`performance_schema`.`events_waits_history_long`.`OPERATION` AS `operation`,`performance_schema`.`events_waits_history_long`.`NUMBER_OF_BYTES` AS `requested` from ((`performance_schema`.`events_waits_history_long` join `performance_schema`.`threads` on((`performance_schema`.`events_waits_history_long`.`THREAD_ID` = `performance_schema`.`threads`.`THREAD_ID`))) left join `information_schema`.`processlist` on((`performance_schema`.`threads`.`PROCESSLIST_ID` = `information_schema`.`processlist`.`ID`))) where ((`performance_schema`.`events_waits_history_long`.`OBJECT_NAME` is not null) and (`performance_schema`.`events_waits_history_long`.`EVENT_NAME` like 'wait/io/file/%')) order by `performance_schema`.`events_waits_history_long`.`TIMER_START`;

-- --------------------------------------------------------

--
-- Structure for view `x$memory_by_host_by_current_bytes`
--
DROP TABLE IF EXISTS `x$memory_by_host_by_current_bytes`;

CREATE ALGORITHM=TEMPTABLE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `x$memory_by_host_by_current_bytes` AS select if(isnull(`performance_schema`.`memory_summary_by_host_by_event_name`.`HOST`),'background',`performance_schema`.`memory_summary_by_host_by_event_name`.`HOST`) AS `host`,sum(`performance_schema`.`memory_summary_by_host_by_event_name`.`CURRENT_COUNT_USED`) AS `current_count_used`,sum(`performance_schema`.`memory_summary_by_host_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`) AS `current_allocated`,ifnull((sum(`performance_schema`.`memory_summary_by_host_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`) / nullif(sum(`performance_schema`.`memory_summary_by_host_by_event_name`.`CURRENT_COUNT_USED`),0)),0) AS `current_avg_alloc`,max(`performance_schema`.`memory_summary_by_host_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`) AS `current_max_alloc`,sum(`performance_schema`.`memory_summary_by_host_by_event_name`.`SUM_NUMBER_OF_BYTES_ALLOC`) AS `total_allocated` from `performance_schema`.`memory_summary_by_host_by_event_name` group by if(isnull(`performance_schema`.`memory_summary_by_host_by_event_name`.`HOST`),'background',`performance_schema`.`memory_summary_by_host_by_event_name`.`HOST`) order by sum(`performance_schema`.`memory_summary_by_host_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`) desc;

-- --------------------------------------------------------

--
-- Structure for view `x$memory_by_thread_by_current_bytes`
--
DROP TABLE IF EXISTS `x$memory_by_thread_by_current_bytes`;

CREATE ALGORITHM=TEMPTABLE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `x$memory_by_thread_by_current_bytes` AS select `t`.`THREAD_ID` AS `thread_id`,if((`t`.`NAME` = 'thread/sql/one_connection'),concat(`t`.`PROCESSLIST_USER`,'@',`t`.`PROCESSLIST_HOST`),replace(`t`.`NAME`,'thread/','')) AS `user`,sum(`mt`.`CURRENT_COUNT_USED`) AS `current_count_used`,sum(`mt`.`CURRENT_NUMBER_OF_BYTES_USED`) AS `current_allocated`,ifnull((sum(`mt`.`CURRENT_NUMBER_OF_BYTES_USED`) / nullif(sum(`mt`.`CURRENT_COUNT_USED`),0)),0) AS `current_avg_alloc`,max(`mt`.`CURRENT_NUMBER_OF_BYTES_USED`) AS `current_max_alloc`,sum(`mt`.`SUM_NUMBER_OF_BYTES_ALLOC`) AS `total_allocated` from (`performance_schema`.`memory_summary_by_thread_by_event_name` `mt` join `performance_schema`.`threads` `t` on((`mt`.`THREAD_ID` = `t`.`THREAD_ID`))) group by `t`.`THREAD_ID`,if((`t`.`NAME` = 'thread/sql/one_connection'),concat(`t`.`PROCESSLIST_USER`,'@',`t`.`PROCESSLIST_HOST`),replace(`t`.`NAME`,'thread/','')) order by sum(`mt`.`CURRENT_NUMBER_OF_BYTES_USED`) desc;

-- --------------------------------------------------------

--
-- Structure for view `x$memory_by_user_by_current_bytes`
--
DROP TABLE IF EXISTS `x$memory_by_user_by_current_bytes`;

CREATE ALGORITHM=TEMPTABLE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `x$memory_by_user_by_current_bytes` AS select if(isnull(`performance_schema`.`memory_summary_by_user_by_event_name`.`USER`),'background',`performance_schema`.`memory_summary_by_user_by_event_name`.`USER`) AS `user`,sum(`performance_schema`.`memory_summary_by_user_by_event_name`.`CURRENT_COUNT_USED`) AS `current_count_used`,sum(`performance_schema`.`memory_summary_by_user_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`) AS `current_allocated`,ifnull((sum(`performance_schema`.`memory_summary_by_user_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`) / nullif(sum(`performance_schema`.`memory_summary_by_user_by_event_name`.`CURRENT_COUNT_USED`),0)),0) AS `current_avg_alloc`,max(`performance_schema`.`memory_summary_by_user_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`) AS `current_max_alloc`,sum(`performance_schema`.`memory_summary_by_user_by_event_name`.`SUM_NUMBER_OF_BYTES_ALLOC`) AS `total_allocated` from `performance_schema`.`memory_summary_by_user_by_event_name` group by if(isnull(`performance_schema`.`memory_summary_by_user_by_event_name`.`USER`),'background',`performance_schema`.`memory_summary_by_user_by_event_name`.`USER`) order by sum(`performance_schema`.`memory_summary_by_user_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`) desc;

-- --------------------------------------------------------

--
-- Structure for view `x$memory_global_by_current_bytes`
--
DROP TABLE IF EXISTS `x$memory_global_by_current_bytes`;

CREATE ALGORITHM=MERGE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `x$memory_global_by_current_bytes` AS select `performance_schema`.`memory_summary_global_by_event_name`.`EVENT_NAME` AS `event_name`,`performance_schema`.`memory_summary_global_by_event_name`.`CURRENT_COUNT_USED` AS `current_count`,`performance_schema`.`memory_summary_global_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED` AS `current_alloc`,ifnull((`performance_schema`.`memory_summary_global_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED` / nullif(`performance_schema`.`memory_summary_global_by_event_name`.`CURRENT_COUNT_USED`,0)),0) AS `current_avg_alloc`,`performance_schema`.`memory_summary_global_by_event_name`.`HIGH_COUNT_USED` AS `high_count`,`performance_schema`.`memory_summary_global_by_event_name`.`HIGH_NUMBER_OF_BYTES_USED` AS `high_alloc`,ifnull((`performance_schema`.`memory_summary_global_by_event_name`.`HIGH_NUMBER_OF_BYTES_USED` / nullif(`performance_schema`.`memory_summary_global_by_event_name`.`HIGH_COUNT_USED`,0)),0) AS `high_avg_alloc` from `performance_schema`.`memory_summary_global_by_event_name` where (`performance_schema`.`memory_summary_global_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED` > 0) order by `performance_schema`.`memory_summary_global_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED` desc;

-- --------------------------------------------------------

--
-- Structure for view `x$memory_global_total`
--
DROP TABLE IF EXISTS `x$memory_global_total`;

CREATE ALGORITHM=TEMPTABLE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `x$memory_global_total` AS select sum(`performance_schema`.`memory_summary_global_by_event_name`.`CURRENT_NUMBER_OF_BYTES_USED`) AS `total_allocated` from `performance_schema`.`memory_summary_global_by_event_name`;

-- --------------------------------------------------------

--
-- Structure for view `x$processlist`
--
DROP TABLE IF EXISTS `x$processlist`;

CREATE ALGORITHM=TEMPTABLE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `x$processlist` AS select `pps`.`THREAD_ID` AS `thd_id`,`pps`.`PROCESSLIST_ID` AS `conn_id`,if((`pps`.`NAME` in ('thread/sql/one_connection','thread/thread_pool/tp_one_connection')),concat(`pps`.`PROCESSLIST_USER`,'@',`pps`.`PROCESSLIST_HOST`),replace(`pps`.`NAME`,'thread/','')) AS `user`,`pps`.`PROCESSLIST_DB` AS `db`,`pps`.`PROCESSLIST_COMMAND` AS `command`,`pps`.`PROCESSLIST_STATE` AS `state`,`pps`.`PROCESSLIST_TIME` AS `time`,`pps`.`PROCESSLIST_INFO` AS `current_statement`,if(isnull(`esc`.`END_EVENT_ID`),`esc`.`TIMER_WAIT`,NULL) AS `statement_latency`,if(isnull(`esc`.`END_EVENT_ID`),round((100 * (`estc`.`WORK_COMPLETED` / `estc`.`WORK_ESTIMATED`)),2),NULL) AS `progress`,`esc`.`LOCK_TIME` AS `lock_latency`,`esc`.`ROWS_EXAMINED` AS `rows_examined`,`esc`.`ROWS_SENT` AS `rows_sent`,`esc`.`ROWS_AFFECTED` AS `rows_affected`,`esc`.`CREATED_TMP_TABLES` AS `tmp_tables`,`esc`.`CREATED_TMP_DISK_TABLES` AS `tmp_disk_tables`,if(((`esc`.`NO_GOOD_INDEX_USED` > 0) or (`esc`.`NO_INDEX_USED` > 0)),'YES','NO') AS `full_scan`,if((`esc`.`END_EVENT_ID` is not null),`esc`.`SQL_TEXT`,NULL) AS `last_statement`,if((`esc`.`END_EVENT_ID` is not null),`esc`.`TIMER_WAIT`,NULL) AS `last_statement_latency`,`mem`.`current_allocated` AS `current_memory`,`ewc`.`EVENT_NAME` AS `last_wait`,if((isnull(`ewc`.`END_EVENT_ID`) and (`ewc`.`EVENT_NAME` is not null)),'Still Waiting',`ewc`.`TIMER_WAIT`) AS `last_wait_latency`,`ewc`.`SOURCE` AS `source`,`etc`.`TIMER_WAIT` AS `trx_latency`,`etc`.`STATE` AS `trx_state`,`etc`.`AUTOCOMMIT` AS `trx_autocommit`,`conattr_pid`.`ATTR_VALUE` AS `pid`,`conattr_progname`.`ATTR_VALUE` AS `program_name` from (((((((`performance_schema`.`threads` `pps` left join `performance_schema`.`events_waits_current` `ewc` on((`pps`.`THREAD_ID` = `ewc`.`THREAD_ID`))) left join `performance_schema`.`events_stages_current` `estc` on((`pps`.`THREAD_ID` = `estc`.`THREAD_ID`))) left join `performance_schema`.`events_statements_current` `esc` on((`pps`.`THREAD_ID` = `esc`.`THREAD_ID`))) left join `performance_schema`.`events_transactions_current` `etc` on((`pps`.`THREAD_ID` = `etc`.`THREAD_ID`))) left join `x$memory_by_thread_by_current_bytes` `mem` on((`pps`.`THREAD_ID` = `mem`.`thread_id`))) left join `performance_schema`.`session_connect_attrs` `conattr_pid` on(((`conattr_pid`.`PROCESSLIST_ID` = `pps`.`PROCESSLIST_ID`) and (`conattr_pid`.`ATTR_NAME` = '_pid')))) left join `performance_schema`.`session_connect_attrs` `conattr_progname` on(((`conattr_progname`.`PROCESSLIST_ID` = `pps`.`PROCESSLIST_ID`) and (`conattr_progname`.`ATTR_NAME` = 'program_name')))) order by `pps`.`PROCESSLIST_TIME` desc,`last_wait_latency` desc;

-- --------------------------------------------------------

--
-- Structure for view `x$ps_digest_95th_percentile_by_avg_us`
--
DROP TABLE IF EXISTS `x$ps_digest_95th_percentile_by_avg_us`;

CREATE ALGORITHM=TEMPTABLE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `x$ps_digest_95th_percentile_by_avg_us` AS select `s2`.`avg_us` AS `avg_us`,ifnull((sum(`s1`.`cnt`) / nullif((select count(0) from `performance_schema`.`events_statements_summary_by_digest`),0)),0) AS `percentile` from (`x$ps_digest_avg_latency_distribution` `s1` join `x$ps_digest_avg_latency_distribution` `s2` on((`s1`.`avg_us` <= `s2`.`avg_us`))) group by `s2`.`avg_us` having (ifnull((sum(`s1`.`cnt`) / nullif((select count(0) from `performance_schema`.`events_statements_summary_by_digest`),0)),0) > 0.95) order by `percentile` limit 1;

-- --------------------------------------------------------

--
-- Structure for view `x$ps_digest_avg_latency_distribution`
--
DROP TABLE IF EXISTS `x$ps_digest_avg_latency_distribution`;

CREATE ALGORITHM=TEMPTABLE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `x$ps_digest_avg_latency_distribution` AS select count(0) AS `cnt`,round((`performance_schema`.`events_statements_summary_by_digest`.`AVG_TIMER_WAIT` / 1000000),0) AS `avg_us` from `performance_schema`.`events_statements_summary_by_digest` group by `avg_us`;

-- --------------------------------------------------------

--
-- Structure for view `x$ps_schema_table_statistics_io`
--
DROP TABLE IF EXISTS `x$ps_schema_table_statistics_io`;

CREATE ALGORITHM=TEMPTABLE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `x$ps_schema_table_statistics_io` AS select `extract_schema_from_file_name`(`performance_schema`.`file_summary_by_instance`.`FILE_NAME`) AS `table_schema`,`extract_table_from_file_name`(`performance_schema`.`file_summary_by_instance`.`FILE_NAME`) AS `table_name`,sum(`performance_schema`.`file_summary_by_instance`.`COUNT_READ`) AS `count_read`,sum(`performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_READ`) AS `sum_number_of_bytes_read`,sum(`performance_schema`.`file_summary_by_instance`.`SUM_TIMER_READ`) AS `sum_timer_read`,sum(`performance_schema`.`file_summary_by_instance`.`COUNT_WRITE`) AS `count_write`,sum(`performance_schema`.`file_summary_by_instance`.`SUM_NUMBER_OF_BYTES_WRITE`) AS `sum_number_of_bytes_write`,sum(`performance_schema`.`file_summary_by_instance`.`SUM_TIMER_WRITE`) AS `sum_timer_write`,sum(`performance_schema`.`file_summary_by_instance`.`COUNT_MISC`) AS `count_misc`,sum(`performance_schema`.`file_summary_by_instance`.`SUM_TIMER_MISC`) AS `sum_timer_misc` from `performance_schema`.`file_summary_by_instance` group by `table_schema`,`table_name`;

-- --------------------------------------------------------

--
-- Structure for view `x$schema_flattened_keys`
--
DROP TABLE IF EXISTS `x$schema_flattened_keys`;

CREATE ALGORITHM=TEMPTABLE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `x$schema_flattened_keys` AS select `information_schema`.`STATISTICS`.`TABLE_SCHEMA` AS `table_schema`,`information_schema`.`STATISTICS`.`TABLE_NAME` AS `table_name`,`information_schema`.`STATISTICS`.`INDEX_NAME` AS `index_name`,max(`information_schema`.`STATISTICS`.`NON_UNIQUE`) AS `non_unique`,max(if(isnull(`information_schema`.`STATISTICS`.`SUB_PART`),0,1)) AS `subpart_exists`,group_concat(`information_schema`.`STATISTICS`.`COLUMN_NAME` order by `information_schema`.`STATISTICS`.`SEQ_IN_INDEX` ASC separator ',') AS `index_columns` from `INFORMATION_SCHEMA`.`STATISTICS` where ((`information_schema`.`STATISTICS`.`INDEX_TYPE` = 'BTREE') and (`information_schema`.`STATISTICS`.`TABLE_SCHEMA` not in ('mysql','sys','INFORMATION_SCHEMA','PERFORMANCE_SCHEMA'))) group by `information_schema`.`STATISTICS`.`TABLE_SCHEMA`,`information_schema`.`STATISTICS`.`TABLE_NAME`,`information_schema`.`STATISTICS`.`INDEX_NAME`;

-- --------------------------------------------------------

--
-- Structure for view `x$schema_index_statistics`
--
DROP TABLE IF EXISTS `x$schema_index_statistics`;

CREATE ALGORITHM=MERGE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `x$schema_index_statistics` AS select `performance_schema`.`table_io_waits_summary_by_index_usage`.`OBJECT_SCHEMA` AS `table_schema`,`performance_schema`.`table_io_waits_summary_by_index_usage`.`OBJECT_NAME` AS `table_name`,`performance_schema`.`table_io_waits_summary_by_index_usage`.`INDEX_NAME` AS `index_name`,`performance_schema`.`table_io_waits_summary_by_index_usage`.`COUNT_FETCH` AS `rows_selected`,`performance_schema`.`table_io_waits_summary_by_index_usage`.`SUM_TIMER_FETCH` AS `select_latency`,`performance_schema`.`table_io_waits_summary_by_index_usage`.`COUNT_INSERT` AS `rows_inserted`,`performance_schema`.`table_io_waits_summary_by_index_usage`.`SUM_TIMER_INSERT` AS `insert_latency`,`performance_schema`.`table_io_waits_summary_by_index_usage`.`COUNT_UPDATE` AS `rows_updated`,`performance_schema`.`table_io_waits_summary_by_index_usage`.`SUM_TIMER_UPDATE` AS `update_latency`,`performance_schema`.`table_io_waits_summary_by_index_usage`.`COUNT_DELETE` AS `rows_deleted`,`performance_schema`.`table_io_waits_summary_by_index_usage`.`SUM_TIMER_DELETE` AS `delete_latency` from `performance_schema`.`table_io_waits_summary_by_index_usage` where (`performance_schema`.`table_io_waits_summary_by_index_usage`.`INDEX_NAME` is not null) order by `performance_schema`.`table_io_waits_summary_by_index_usage`.`SUM_TIMER_WAIT` desc;

-- --------------------------------------------------------

--
-- Structure for view `x$schema_table_lock_waits`
--
DROP TABLE IF EXISTS `x$schema_table_lock_waits`;

CREATE ALGORITHM=TEMPTABLE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `x$schema_table_lock_waits` AS select `g`.`OBJECT_SCHEMA` AS `object_schema`,`g`.`OBJECT_NAME` AS `object_name`,`pt`.`THREAD_ID` AS `waiting_thread_id`,`pt`.`PROCESSLIST_ID` AS `waiting_pid`,`ps_thread_account`(`p`.`OWNER_THREAD_ID`) AS `waiting_account`,`p`.`LOCK_TYPE` AS `waiting_lock_type`,`p`.`LOCK_DURATION` AS `waiting_lock_duration`,`pt`.`PROCESSLIST_INFO` AS `waiting_query`,`pt`.`PROCESSLIST_TIME` AS `waiting_query_secs`,`ps`.`ROWS_AFFECTED` AS `waiting_query_rows_affected`,`ps`.`ROWS_EXAMINED` AS `waiting_query_rows_examined`,`gt`.`THREAD_ID` AS `blocking_thread_id`,`gt`.`PROCESSLIST_ID` AS `blocking_pid`,`ps_thread_account`(`g`.`OWNER_THREAD_ID`) AS `blocking_account`,`g`.`LOCK_TYPE` AS `blocking_lock_type`,`g`.`LOCK_DURATION` AS `blocking_lock_duration`,concat('KILL QUERY ',`gt`.`PROCESSLIST_ID`) AS `sql_kill_blocking_query`,concat('KILL ',`gt`.`PROCESSLIST_ID`) AS `sql_kill_blocking_connection` from (((((`performance_schema`.`metadata_locks` `g` join `performance_schema`.`metadata_locks` `p` on(((`g`.`OBJECT_TYPE` = `p`.`OBJECT_TYPE`) and (`g`.`OBJECT_SCHEMA` = `p`.`OBJECT_SCHEMA`) and (`g`.`OBJECT_NAME` = `p`.`OBJECT_NAME`) and (`g`.`LOCK_STATUS` = 'GRANTED') and (`p`.`LOCK_STATUS` = 'PENDING')))) join `performance_schema`.`threads` `gt` on((`g`.`OWNER_THREAD_ID` = `gt`.`THREAD_ID`))) join `performance_schema`.`threads` `pt` on((`p`.`OWNER_THREAD_ID` = `pt`.`THREAD_ID`))) left join `performance_schema`.`events_statements_current` `gs` on((`g`.`OWNER_THREAD_ID` = `gs`.`THREAD_ID`))) left join `performance_schema`.`events_statements_current` `ps` on((`p`.`OWNER_THREAD_ID` = `ps`.`THREAD_ID`))) where (`g`.`OBJECT_TYPE` = 'TABLE');

-- --------------------------------------------------------

--
-- Structure for view `x$schema_table_statistics`
--
DROP TABLE IF EXISTS `x$schema_table_statistics`;

CREATE ALGORITHM=TEMPTABLE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `x$schema_table_statistics` AS select `pst`.`OBJECT_SCHEMA` AS `table_schema`,`pst`.`OBJECT_NAME` AS `table_name`,`pst`.`SUM_TIMER_WAIT` AS `total_latency`,`pst`.`COUNT_FETCH` AS `rows_fetched`,`pst`.`SUM_TIMER_FETCH` AS `fetch_latency`,`pst`.`COUNT_INSERT` AS `rows_inserted`,`pst`.`SUM_TIMER_INSERT` AS `insert_latency`,`pst`.`COUNT_UPDATE` AS `rows_updated`,`pst`.`SUM_TIMER_UPDATE` AS `update_latency`,`pst`.`COUNT_DELETE` AS `rows_deleted`,`pst`.`SUM_TIMER_DELETE` AS `delete_latency`,`fsbi`.`count_read` AS `io_read_requests`,`fsbi`.`sum_number_of_bytes_read` AS `io_read`,`fsbi`.`sum_timer_read` AS `io_read_latency`,`fsbi`.`count_write` AS `io_write_requests`,`fsbi`.`sum_number_of_bytes_write` AS `io_write`,`fsbi`.`sum_timer_write` AS `io_write_latency`,`fsbi`.`count_misc` AS `io_misc_requests`,`fsbi`.`sum_timer_misc` AS `io_misc_latency` from (`performance_schema`.`table_io_waits_summary_by_table` `pst` left join `x$ps_schema_table_statistics_io` `fsbi` on(((`pst`.`OBJECT_SCHEMA` = `fsbi`.`table_schema`) and (`pst`.`OBJECT_NAME` = `fsbi`.`table_name`)))) order by `pst`.`SUM_TIMER_WAIT` desc;

-- --------------------------------------------------------

--
-- Structure for view `x$schema_table_statistics_with_buffer`
--
DROP TABLE IF EXISTS `x$schema_table_statistics_with_buffer`;

CREATE ALGORITHM=TEMPTABLE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `x$schema_table_statistics_with_buffer` AS select `pst`.`OBJECT_SCHEMA` AS `table_schema`,`pst`.`OBJECT_NAME` AS `table_name`,`pst`.`COUNT_FETCH` AS `rows_fetched`,`pst`.`SUM_TIMER_FETCH` AS `fetch_latency`,`pst`.`COUNT_INSERT` AS `rows_inserted`,`pst`.`SUM_TIMER_INSERT` AS `insert_latency`,`pst`.`COUNT_UPDATE` AS `rows_updated`,`pst`.`SUM_TIMER_UPDATE` AS `update_latency`,`pst`.`COUNT_DELETE` AS `rows_deleted`,`pst`.`SUM_TIMER_DELETE` AS `delete_latency`,`fsbi`.`count_read` AS `io_read_requests`,`fsbi`.`sum_number_of_bytes_read` AS `io_read`,`fsbi`.`sum_timer_read` AS `io_read_latency`,`fsbi`.`count_write` AS `io_write_requests`,`fsbi`.`sum_number_of_bytes_write` AS `io_write`,`fsbi`.`sum_timer_write` AS `io_write_latency`,`fsbi`.`count_misc` AS `io_misc_requests`,`fsbi`.`sum_timer_misc` AS `io_misc_latency`,`ibp`.`allocated` AS `innodb_buffer_allocated`,`ibp`.`data` AS `innodb_buffer_data`,(`ibp`.`allocated` - `ibp`.`data`) AS `innodb_buffer_free`,`ibp`.`pages` AS `innodb_buffer_pages`,`ibp`.`pages_hashed` AS `innodb_buffer_pages_hashed`,`ibp`.`pages_old` AS `innodb_buffer_pages_old`,`ibp`.`rows_cached` AS `innodb_buffer_rows_cached` from ((`performance_schema`.`table_io_waits_summary_by_table` `pst` left join `x$ps_schema_table_statistics_io` `fsbi` on(((`pst`.`OBJECT_SCHEMA` = `fsbi`.`table_schema`) and (`pst`.`OBJECT_NAME` = `fsbi`.`table_name`)))) left join `x$innodb_buffer_stats_by_table` `ibp` on(((`pst`.`OBJECT_SCHEMA` = `ibp`.`object_schema`) and (`pst`.`OBJECT_NAME` = `ibp`.`object_name`)))) order by `pst`.`SUM_TIMER_WAIT` desc;

-- --------------------------------------------------------

--
-- Structure for view `x$schema_tables_with_full_table_scans`
--
DROP TABLE IF EXISTS `x$schema_tables_with_full_table_scans`;

CREATE ALGORITHM=MERGE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `x$schema_tables_with_full_table_scans` AS select `performance_schema`.`table_io_waits_summary_by_index_usage`.`OBJECT_SCHEMA` AS `object_schema`,`performance_schema`.`table_io_waits_summary_by_index_usage`.`OBJECT_NAME` AS `object_name`,`performance_schema`.`table_io_waits_summary_by_index_usage`.`COUNT_READ` AS `rows_full_scanned`,`performance_schema`.`table_io_waits_summary_by_index_usage`.`SUM_TIMER_WAIT` AS `latency` from `performance_schema`.`table_io_waits_summary_by_index_usage` where (isnull(`performance_schema`.`table_io_waits_summary_by_index_usage`.`INDEX_NAME`) and (`performance_schema`.`table_io_waits_summary_by_index_usage`.`COUNT_READ` > 0)) order by `performance_schema`.`table_io_waits_summary_by_index_usage`.`COUNT_READ` desc;

-- --------------------------------------------------------

--
-- Structure for view `x$session`
--
DROP TABLE IF EXISTS `x$session`;

CREATE ALGORITHM=UNDEFINED DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `x$session` AS select `x$processlist`.`thd_id` AS `thd_id`,`x$processlist`.`conn_id` AS `conn_id`,`x$processlist`.`user` AS `user`,`x$processlist`.`db` AS `db`,`x$processlist`.`command` AS `command`,`x$processlist`.`state` AS `state`,`x$processlist`.`time` AS `time`,`x$processlist`.`current_statement` AS `current_statement`,`x$processlist`.`statement_latency` AS `statement_latency`,`x$processlist`.`progress` AS `progress`,`x$processlist`.`lock_latency` AS `lock_latency`,`x$processlist`.`rows_examined` AS `rows_examined`,`x$processlist`.`rows_sent` AS `rows_sent`,`x$processlist`.`rows_affected` AS `rows_affected`,`x$processlist`.`tmp_tables` AS `tmp_tables`,`x$processlist`.`tmp_disk_tables` AS `tmp_disk_tables`,`x$processlist`.`full_scan` AS `full_scan`,`x$processlist`.`last_statement` AS `last_statement`,`x$processlist`.`last_statement_latency` AS `last_statement_latency`,`x$processlist`.`current_memory` AS `current_memory`,`x$processlist`.`last_wait` AS `last_wait`,`x$processlist`.`last_wait_latency` AS `last_wait_latency`,`x$processlist`.`source` AS `source`,`x$processlist`.`trx_latency` AS `trx_latency`,`x$processlist`.`trx_state` AS `trx_state`,`x$processlist`.`trx_autocommit` AS `trx_autocommit`,`x$processlist`.`pid` AS `pid`,`x$processlist`.`program_name` AS `program_name` from `x$processlist` where ((`x$processlist`.`conn_id` is not null) and (`x$processlist`.`command` <> 'Daemon'));

-- --------------------------------------------------------

--
-- Structure for view `x$statement_analysis`
--
DROP TABLE IF EXISTS `x$statement_analysis`;

CREATE ALGORITHM=MERGE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `x$statement_analysis` AS select `performance_schema`.`events_statements_summary_by_digest`.`DIGEST_TEXT` AS `query`,`performance_schema`.`events_statements_summary_by_digest`.`SCHEMA_NAME` AS `db`,if(((`performance_schema`.`events_statements_summary_by_digest`.`SUM_NO_GOOD_INDEX_USED` > 0) or (`performance_schema`.`events_statements_summary_by_digest`.`SUM_NO_INDEX_USED` > 0)),'*','') AS `full_scan`,`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR` AS `exec_count`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_ERRORS` AS `err_count`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_WARNINGS` AS `warn_count`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_TIMER_WAIT` AS `total_latency`,`performance_schema`.`events_statements_summary_by_digest`.`MAX_TIMER_WAIT` AS `max_latency`,`performance_schema`.`events_statements_summary_by_digest`.`AVG_TIMER_WAIT` AS `avg_latency`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_LOCK_TIME` AS `lock_latency`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_ROWS_SENT` AS `rows_sent`,round(ifnull((`performance_schema`.`events_statements_summary_by_digest`.`SUM_ROWS_SENT` / nullif(`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`,0)),0),0) AS `rows_sent_avg`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_ROWS_EXAMINED` AS `rows_examined`,round(ifnull((`performance_schema`.`events_statements_summary_by_digest`.`SUM_ROWS_EXAMINED` / nullif(`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`,0)),0),0) AS `rows_examined_avg`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_ROWS_AFFECTED` AS `rows_affected`,round(ifnull((`performance_schema`.`events_statements_summary_by_digest`.`SUM_ROWS_AFFECTED` / nullif(`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`,0)),0),0) AS `rows_affected_avg`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_CREATED_TMP_TABLES` AS `tmp_tables`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_CREATED_TMP_DISK_TABLES` AS `tmp_disk_tables`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_SORT_ROWS` AS `rows_sorted`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_SORT_MERGE_PASSES` AS `sort_merge_passes`,`performance_schema`.`events_statements_summary_by_digest`.`DIGEST` AS `digest`,`performance_schema`.`events_statements_summary_by_digest`.`FIRST_SEEN` AS `first_seen`,`performance_schema`.`events_statements_summary_by_digest`.`LAST_SEEN` AS `last_seen` from `performance_schema`.`events_statements_summary_by_digest` order by `performance_schema`.`events_statements_summary_by_digest`.`SUM_TIMER_WAIT` desc;

-- --------------------------------------------------------

--
-- Structure for view `x$statements_with_errors_or_warnings`
--
DROP TABLE IF EXISTS `x$statements_with_errors_or_warnings`;

CREATE ALGORITHM=MERGE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `x$statements_with_errors_or_warnings` AS select `performance_schema`.`events_statements_summary_by_digest`.`DIGEST_TEXT` AS `query`,`performance_schema`.`events_statements_summary_by_digest`.`SCHEMA_NAME` AS `db`,`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR` AS `exec_count`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_ERRORS` AS `errors`,(ifnull((`performance_schema`.`events_statements_summary_by_digest`.`SUM_ERRORS` / nullif(`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`,0)),0) * 100) AS `error_pct`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_WARNINGS` AS `warnings`,(ifnull((`performance_schema`.`events_statements_summary_by_digest`.`SUM_WARNINGS` / nullif(`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`,0)),0) * 100) AS `warning_pct`,`performance_schema`.`events_statements_summary_by_digest`.`FIRST_SEEN` AS `first_seen`,`performance_schema`.`events_statements_summary_by_digest`.`LAST_SEEN` AS `last_seen`,`performance_schema`.`events_statements_summary_by_digest`.`DIGEST` AS `digest` from `performance_schema`.`events_statements_summary_by_digest` where ((`performance_schema`.`events_statements_summary_by_digest`.`SUM_ERRORS` > 0) or (`performance_schema`.`events_statements_summary_by_digest`.`SUM_WARNINGS` > 0)) order by `performance_schema`.`events_statements_summary_by_digest`.`SUM_ERRORS` desc,`performance_schema`.`events_statements_summary_by_digest`.`SUM_WARNINGS` desc;

-- --------------------------------------------------------

--
-- Structure for view `x$statements_with_full_table_scans`
--
DROP TABLE IF EXISTS `x$statements_with_full_table_scans`;

CREATE ALGORITHM=MERGE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `x$statements_with_full_table_scans` AS select `performance_schema`.`events_statements_summary_by_digest`.`DIGEST_TEXT` AS `query`,`performance_schema`.`events_statements_summary_by_digest`.`SCHEMA_NAME` AS `db`,`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR` AS `exec_count`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_TIMER_WAIT` AS `total_latency`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_NO_INDEX_USED` AS `no_index_used_count`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_NO_GOOD_INDEX_USED` AS `no_good_index_used_count`,round((ifnull((`performance_schema`.`events_statements_summary_by_digest`.`SUM_NO_INDEX_USED` / nullif(`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`,0)),0) * 100),0) AS `no_index_used_pct`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_ROWS_SENT` AS `rows_sent`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_ROWS_EXAMINED` AS `rows_examined`,round((`performance_schema`.`events_statements_summary_by_digest`.`SUM_ROWS_SENT` / `performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`),0) AS `rows_sent_avg`,round((`performance_schema`.`events_statements_summary_by_digest`.`SUM_ROWS_EXAMINED` / `performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`),0) AS `rows_examined_avg`,`performance_schema`.`events_statements_summary_by_digest`.`FIRST_SEEN` AS `first_seen`,`performance_schema`.`events_statements_summary_by_digest`.`LAST_SEEN` AS `last_seen`,`performance_schema`.`events_statements_summary_by_digest`.`DIGEST` AS `digest` from `performance_schema`.`events_statements_summary_by_digest` where (((`performance_schema`.`events_statements_summary_by_digest`.`SUM_NO_INDEX_USED` > 0) or (`performance_schema`.`events_statements_summary_by_digest`.`SUM_NO_GOOD_INDEX_USED` > 0)) and (not((`performance_schema`.`events_statements_summary_by_digest`.`DIGEST_TEXT` like 'SHOW%')))) order by round((ifnull((`performance_schema`.`events_statements_summary_by_digest`.`SUM_NO_INDEX_USED` / nullif(`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`,0)),0) * 100),0) desc,`performance_schema`.`events_statements_summary_by_digest`.`SUM_TIMER_WAIT` desc;

-- --------------------------------------------------------

--
-- Structure for view `x$statements_with_runtimes_in_95th_percentile`
--
DROP TABLE IF EXISTS `x$statements_with_runtimes_in_95th_percentile`;

CREATE ALGORITHM=MERGE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `x$statements_with_runtimes_in_95th_percentile` AS select `stmts`.`DIGEST_TEXT` AS `query`,`stmts`.`SCHEMA_NAME` AS `db`,if(((`stmts`.`SUM_NO_GOOD_INDEX_USED` > 0) or (`stmts`.`SUM_NO_INDEX_USED` > 0)),'*','') AS `full_scan`,`stmts`.`COUNT_STAR` AS `exec_count`,`stmts`.`SUM_ERRORS` AS `err_count`,`stmts`.`SUM_WARNINGS` AS `warn_count`,`stmts`.`SUM_TIMER_WAIT` AS `total_latency`,`stmts`.`MAX_TIMER_WAIT` AS `max_latency`,`stmts`.`AVG_TIMER_WAIT` AS `avg_latency`,`stmts`.`SUM_ROWS_SENT` AS `rows_sent`,round(ifnull((`stmts`.`SUM_ROWS_SENT` / nullif(`stmts`.`COUNT_STAR`,0)),0),0) AS `rows_sent_avg`,`stmts`.`SUM_ROWS_EXAMINED` AS `rows_examined`,round(ifnull((`stmts`.`SUM_ROWS_EXAMINED` / nullif(`stmts`.`COUNT_STAR`,0)),0),0) AS `rows_examined_avg`,`stmts`.`FIRST_SEEN` AS `first_seen`,`stmts`.`LAST_SEEN` AS `last_seen`,`stmts`.`DIGEST` AS `digest` from (`performance_schema`.`events_statements_summary_by_digest` `stmts` join `x$ps_digest_95th_percentile_by_avg_us` `top_percentile` on((round((`stmts`.`AVG_TIMER_WAIT` / 1000000),0) >= `top_percentile`.`avg_us`))) order by `stmts`.`AVG_TIMER_WAIT` desc;

-- --------------------------------------------------------

--
-- Structure for view `x$statements_with_sorting`
--
DROP TABLE IF EXISTS `x$statements_with_sorting`;

CREATE ALGORITHM=MERGE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `x$statements_with_sorting` AS select `performance_schema`.`events_statements_summary_by_digest`.`DIGEST_TEXT` AS `query`,`performance_schema`.`events_statements_summary_by_digest`.`SCHEMA_NAME` AS `db`,`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR` AS `exec_count`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_TIMER_WAIT` AS `total_latency`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_SORT_MERGE_PASSES` AS `sort_merge_passes`,round(ifnull((`performance_schema`.`events_statements_summary_by_digest`.`SUM_SORT_MERGE_PASSES` / nullif(`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`,0)),0),0) AS `avg_sort_merges`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_SORT_SCAN` AS `sorts_using_scans`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_SORT_RANGE` AS `sort_using_range`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_SORT_ROWS` AS `rows_sorted`,round(ifnull((`performance_schema`.`events_statements_summary_by_digest`.`SUM_SORT_ROWS` / nullif(`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`,0)),0),0) AS `avg_rows_sorted`,`performance_schema`.`events_statements_summary_by_digest`.`FIRST_SEEN` AS `first_seen`,`performance_schema`.`events_statements_summary_by_digest`.`LAST_SEEN` AS `last_seen`,`performance_schema`.`events_statements_summary_by_digest`.`DIGEST` AS `digest` from `performance_schema`.`events_statements_summary_by_digest` where (`performance_schema`.`events_statements_summary_by_digest`.`SUM_SORT_ROWS` > 0) order by `performance_schema`.`events_statements_summary_by_digest`.`SUM_TIMER_WAIT` desc;

-- --------------------------------------------------------

--
-- Structure for view `x$statements_with_temp_tables`
--
DROP TABLE IF EXISTS `x$statements_with_temp_tables`;

CREATE ALGORITHM=MERGE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `x$statements_with_temp_tables` AS select `performance_schema`.`events_statements_summary_by_digest`.`DIGEST_TEXT` AS `query`,`performance_schema`.`events_statements_summary_by_digest`.`SCHEMA_NAME` AS `db`,`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR` AS `exec_count`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_TIMER_WAIT` AS `total_latency`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_CREATED_TMP_TABLES` AS `memory_tmp_tables`,`performance_schema`.`events_statements_summary_by_digest`.`SUM_CREATED_TMP_DISK_TABLES` AS `disk_tmp_tables`,round(ifnull((`performance_schema`.`events_statements_summary_by_digest`.`SUM_CREATED_TMP_TABLES` / nullif(`performance_schema`.`events_statements_summary_by_digest`.`COUNT_STAR`,0)),0),0) AS `avg_tmp_tables_per_query`,round((ifnull((`performance_schema`.`events_statements_summary_by_digest`.`SUM_CREATED_TMP_DISK_TABLES` / nullif(`performance_schema`.`events_statements_summary_by_digest`.`SUM_CREATED_TMP_TABLES`,0)),0) * 100),0) AS `tmp_tables_to_disk_pct`,`performance_schema`.`events_statements_summary_by_digest`.`FIRST_SEEN` AS `first_seen`,`performance_schema`.`events_statements_summary_by_digest`.`LAST_SEEN` AS `last_seen`,`performance_schema`.`events_statements_summary_by_digest`.`DIGEST` AS `digest` from `performance_schema`.`events_statements_summary_by_digest` where (`performance_schema`.`events_statements_summary_by_digest`.`SUM_CREATED_TMP_TABLES` > 0) order by `performance_schema`.`events_statements_summary_by_digest`.`SUM_CREATED_TMP_DISK_TABLES` desc,`performance_schema`.`events_statements_summary_by_digest`.`SUM_CREATED_TMP_TABLES` desc;

-- --------------------------------------------------------

--
-- Structure for view `x$user_summary`
--
DROP TABLE IF EXISTS `x$user_summary`;

CREATE ALGORITHM=TEMPTABLE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `x$user_summary` AS select if(isnull(`performance_schema`.`accounts`.`USER`),'background',`performance_schema`.`accounts`.`USER`) AS `user`,sum(`stmt`.`total`) AS `statements`,sum(`stmt`.`total_latency`) AS `statement_latency`,ifnull((sum(`stmt`.`total_latency`) / nullif(sum(`stmt`.`total`),0)),0) AS `statement_avg_latency`,sum(`stmt`.`full_scans`) AS `table_scans`,sum(`io`.`ios`) AS `file_ios`,sum(`io`.`io_latency`) AS `file_io_latency`,sum(`performance_schema`.`accounts`.`CURRENT_CONNECTIONS`) AS `current_connections`,sum(`performance_schema`.`accounts`.`TOTAL_CONNECTIONS`) AS `total_connections`,count(distinct `performance_schema`.`accounts`.`HOST`) AS `unique_hosts`,sum(`mem`.`current_allocated`) AS `current_memory`,sum(`mem`.`total_allocated`) AS `total_memory_allocated` from (((`performance_schema`.`accounts` left join `x$user_summary_by_statement_latency` `stmt` on((if(isnull(`performance_schema`.`accounts`.`USER`),'background',`performance_schema`.`accounts`.`USER`) = `stmt`.`user`))) left join `x$user_summary_by_file_io` `io` on((if(isnull(`performance_schema`.`accounts`.`USER`),'background',`performance_schema`.`accounts`.`USER`) = `io`.`user`))) left join `x$memory_by_user_by_current_bytes` `mem` on((if(isnull(`performance_schema`.`accounts`.`USER`),'background',`performance_schema`.`accounts`.`USER`) = `mem`.`user`))) group by if(isnull(`performance_schema`.`accounts`.`USER`),'background',`performance_schema`.`accounts`.`USER`) order by sum(`stmt`.`total_latency`) desc;

-- --------------------------------------------------------

--
-- Structure for view `x$user_summary_by_file_io`
--
DROP TABLE IF EXISTS `x$user_summary_by_file_io`;

CREATE ALGORITHM=TEMPTABLE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `x$user_summary_by_file_io` AS select if(isnull(`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER`),'background',`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER`) AS `user`,sum(`performance_schema`.`events_waits_summary_by_user_by_event_name`.`COUNT_STAR`) AS `ios`,sum(`performance_schema`.`events_waits_summary_by_user_by_event_name`.`SUM_TIMER_WAIT`) AS `io_latency` from `performance_schema`.`events_waits_summary_by_user_by_event_name` where (`performance_schema`.`events_waits_summary_by_user_by_event_name`.`EVENT_NAME` like 'wait/io/file/%') group by if(isnull(`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER`),'background',`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER`) order by sum(`performance_schema`.`events_waits_summary_by_user_by_event_name`.`SUM_TIMER_WAIT`) desc;

-- --------------------------------------------------------

--
-- Structure for view `x$user_summary_by_file_io_type`
--
DROP TABLE IF EXISTS `x$user_summary_by_file_io_type`;

CREATE ALGORITHM=MERGE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `x$user_summary_by_file_io_type` AS select if(isnull(`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER`),'background',`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER`) AS `user`,`performance_schema`.`events_waits_summary_by_user_by_event_name`.`EVENT_NAME` AS `event_name`,`performance_schema`.`events_waits_summary_by_user_by_event_name`.`COUNT_STAR` AS `total`,`performance_schema`.`events_waits_summary_by_user_by_event_name`.`SUM_TIMER_WAIT` AS `latency`,`performance_schema`.`events_waits_summary_by_user_by_event_name`.`MAX_TIMER_WAIT` AS `max_latency` from `performance_schema`.`events_waits_summary_by_user_by_event_name` where ((`performance_schema`.`events_waits_summary_by_user_by_event_name`.`EVENT_NAME` like 'wait/io/file%') and (`performance_schema`.`events_waits_summary_by_user_by_event_name`.`COUNT_STAR` > 0)) order by if(isnull(`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER`),'background',`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER`),`performance_schema`.`events_waits_summary_by_user_by_event_name`.`SUM_TIMER_WAIT` desc;

-- --------------------------------------------------------

--
-- Structure for view `x$user_summary_by_stages`
--
DROP TABLE IF EXISTS `x$user_summary_by_stages`;

CREATE ALGORITHM=MERGE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `x$user_summary_by_stages` AS select if(isnull(`performance_schema`.`events_stages_summary_by_user_by_event_name`.`USER`),'background',`performance_schema`.`events_stages_summary_by_user_by_event_name`.`USER`) AS `user`,`performance_schema`.`events_stages_summary_by_user_by_event_name`.`EVENT_NAME` AS `event_name`,`performance_schema`.`events_stages_summary_by_user_by_event_name`.`COUNT_STAR` AS `total`,`performance_schema`.`events_stages_summary_by_user_by_event_name`.`SUM_TIMER_WAIT` AS `total_latency`,`performance_schema`.`events_stages_summary_by_user_by_event_name`.`AVG_TIMER_WAIT` AS `avg_latency` from `performance_schema`.`events_stages_summary_by_user_by_event_name` where (`performance_schema`.`events_stages_summary_by_user_by_event_name`.`SUM_TIMER_WAIT` <> 0) order by if(isnull(`performance_schema`.`events_stages_summary_by_user_by_event_name`.`USER`),'background',`performance_schema`.`events_stages_summary_by_user_by_event_name`.`USER`),`performance_schema`.`events_stages_summary_by_user_by_event_name`.`SUM_TIMER_WAIT` desc;

-- --------------------------------------------------------

--
-- Structure for view `x$user_summary_by_statement_latency`
--
DROP TABLE IF EXISTS `x$user_summary_by_statement_latency`;

CREATE ALGORITHM=TEMPTABLE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `x$user_summary_by_statement_latency` AS select if(isnull(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`USER`),'background',`performance_schema`.`events_statements_summary_by_user_by_event_name`.`USER`) AS `user`,sum(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`COUNT_STAR`) AS `total`,sum(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_TIMER_WAIT`) AS `total_latency`,sum(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`MAX_TIMER_WAIT`) AS `max_latency`,sum(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_LOCK_TIME`) AS `lock_latency`,sum(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_ROWS_SENT`) AS `rows_sent`,sum(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_ROWS_EXAMINED`) AS `rows_examined`,sum(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_ROWS_AFFECTED`) AS `rows_affected`,(sum(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_NO_INDEX_USED`) + sum(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_NO_GOOD_INDEX_USED`)) AS `full_scans` from `performance_schema`.`events_statements_summary_by_user_by_event_name` group by if(isnull(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`USER`),'background',`performance_schema`.`events_statements_summary_by_user_by_event_name`.`USER`) order by sum(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_TIMER_WAIT`) desc;

-- --------------------------------------------------------

--
-- Structure for view `x$user_summary_by_statement_type`
--
DROP TABLE IF EXISTS `x$user_summary_by_statement_type`;

CREATE ALGORITHM=MERGE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `x$user_summary_by_statement_type` AS select if(isnull(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`USER`),'background',`performance_schema`.`events_statements_summary_by_user_by_event_name`.`USER`) AS `user`,substring_index(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`EVENT_NAME`,'/',-(1)) AS `statement`,`performance_schema`.`events_statements_summary_by_user_by_event_name`.`COUNT_STAR` AS `total`,`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_TIMER_WAIT` AS `total_latency`,`performance_schema`.`events_statements_summary_by_user_by_event_name`.`MAX_TIMER_WAIT` AS `max_latency`,`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_LOCK_TIME` AS `lock_latency`,`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_ROWS_SENT` AS `rows_sent`,`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_ROWS_EXAMINED` AS `rows_examined`,`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_ROWS_AFFECTED` AS `rows_affected`,(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_NO_INDEX_USED` + `performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_NO_GOOD_INDEX_USED`) AS `full_scans` from `performance_schema`.`events_statements_summary_by_user_by_event_name` where (`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_TIMER_WAIT` <> 0) order by if(isnull(`performance_schema`.`events_statements_summary_by_user_by_event_name`.`USER`),'background',`performance_schema`.`events_statements_summary_by_user_by_event_name`.`USER`),`performance_schema`.`events_statements_summary_by_user_by_event_name`.`SUM_TIMER_WAIT` desc;

-- --------------------------------------------------------

--
-- Structure for view `x$wait_classes_global_by_avg_latency`
--
DROP TABLE IF EXISTS `x$wait_classes_global_by_avg_latency`;

CREATE ALGORITHM=TEMPTABLE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `x$wait_classes_global_by_avg_latency` AS select substring_index(`performance_schema`.`events_waits_summary_global_by_event_name`.`EVENT_NAME`,'/',3) AS `event_class`,sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`COUNT_STAR`) AS `total`,sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT`) AS `total_latency`,min(`performance_schema`.`events_waits_summary_global_by_event_name`.`MIN_TIMER_WAIT`) AS `min_latency`,ifnull((sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT`) / nullif(sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`COUNT_STAR`),0)),0) AS `avg_latency`,max(`performance_schema`.`events_waits_summary_global_by_event_name`.`MAX_TIMER_WAIT`) AS `max_latency` from `performance_schema`.`events_waits_summary_global_by_event_name` where ((`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT` > 0) and (`performance_schema`.`events_waits_summary_global_by_event_name`.`EVENT_NAME` <> 'idle')) group by `event_class` order by ifnull((sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT`) / nullif(sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`COUNT_STAR`),0)),0) desc;

-- --------------------------------------------------------

--
-- Structure for view `x$wait_classes_global_by_latency`
--
DROP TABLE IF EXISTS `x$wait_classes_global_by_latency`;

CREATE ALGORITHM=TEMPTABLE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `x$wait_classes_global_by_latency` AS select substring_index(`performance_schema`.`events_waits_summary_global_by_event_name`.`EVENT_NAME`,'/',3) AS `event_class`,sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`COUNT_STAR`) AS `total`,sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT`) AS `total_latency`,min(`performance_schema`.`events_waits_summary_global_by_event_name`.`MIN_TIMER_WAIT`) AS `min_latency`,ifnull((sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT`) / nullif(sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`COUNT_STAR`),0)),0) AS `avg_latency`,max(`performance_schema`.`events_waits_summary_global_by_event_name`.`MAX_TIMER_WAIT`) AS `max_latency` from `performance_schema`.`events_waits_summary_global_by_event_name` where ((`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT` > 0) and (`performance_schema`.`events_waits_summary_global_by_event_name`.`EVENT_NAME` <> 'idle')) group by substring_index(`performance_schema`.`events_waits_summary_global_by_event_name`.`EVENT_NAME`,'/',3) order by sum(`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT`) desc;

-- --------------------------------------------------------

--
-- Structure for view `x$waits_by_host_by_latency`
--
DROP TABLE IF EXISTS `x$waits_by_host_by_latency`;

CREATE ALGORITHM=MERGE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `x$waits_by_host_by_latency` AS select if(isnull(`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST`),'background',`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST`) AS `host`,`performance_schema`.`events_waits_summary_by_host_by_event_name`.`EVENT_NAME` AS `event`,`performance_schema`.`events_waits_summary_by_host_by_event_name`.`COUNT_STAR` AS `total`,`performance_schema`.`events_waits_summary_by_host_by_event_name`.`SUM_TIMER_WAIT` AS `total_latency`,`performance_schema`.`events_waits_summary_by_host_by_event_name`.`AVG_TIMER_WAIT` AS `avg_latency`,`performance_schema`.`events_waits_summary_by_host_by_event_name`.`MAX_TIMER_WAIT` AS `max_latency` from `performance_schema`.`events_waits_summary_by_host_by_event_name` where ((`performance_schema`.`events_waits_summary_by_host_by_event_name`.`EVENT_NAME` <> 'idle') and (`performance_schema`.`events_waits_summary_by_host_by_event_name`.`SUM_TIMER_WAIT` > 0)) order by if(isnull(`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST`),'background',`performance_schema`.`events_waits_summary_by_host_by_event_name`.`HOST`),`performance_schema`.`events_waits_summary_by_host_by_event_name`.`SUM_TIMER_WAIT` desc;

-- --------------------------------------------------------

--
-- Structure for view `x$waits_by_user_by_latency`
--
DROP TABLE IF EXISTS `x$waits_by_user_by_latency`;

CREATE ALGORITHM=MERGE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `x$waits_by_user_by_latency` AS select if(isnull(`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER`),'background',`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER`) AS `user`,`performance_schema`.`events_waits_summary_by_user_by_event_name`.`EVENT_NAME` AS `event`,`performance_schema`.`events_waits_summary_by_user_by_event_name`.`COUNT_STAR` AS `total`,`performance_schema`.`events_waits_summary_by_user_by_event_name`.`SUM_TIMER_WAIT` AS `total_latency`,`performance_schema`.`events_waits_summary_by_user_by_event_name`.`AVG_TIMER_WAIT` AS `avg_latency`,`performance_schema`.`events_waits_summary_by_user_by_event_name`.`MAX_TIMER_WAIT` AS `max_latency` from `performance_schema`.`events_waits_summary_by_user_by_event_name` where ((`performance_schema`.`events_waits_summary_by_user_by_event_name`.`EVENT_NAME` <> 'idle') and (`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER` is not null) and (`performance_schema`.`events_waits_summary_by_user_by_event_name`.`SUM_TIMER_WAIT` > 0)) order by if(isnull(`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER`),'background',`performance_schema`.`events_waits_summary_by_user_by_event_name`.`USER`),`performance_schema`.`events_waits_summary_by_user_by_event_name`.`SUM_TIMER_WAIT` desc;

-- --------------------------------------------------------

--
-- Structure for view `x$waits_global_by_latency`
--
DROP TABLE IF EXISTS `x$waits_global_by_latency`;

CREATE ALGORITHM=MERGE DEFINER=`mysql.sys`@`localhost` SQL SECURITY INVOKER VIEW `x$waits_global_by_latency` AS select `performance_schema`.`events_waits_summary_global_by_event_name`.`EVENT_NAME` AS `events`,`performance_schema`.`events_waits_summary_global_by_event_name`.`COUNT_STAR` AS `total`,`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT` AS `total_latency`,`performance_schema`.`events_waits_summary_global_by_event_name`.`AVG_TIMER_WAIT` AS `avg_latency`,`performance_schema`.`events_waits_summary_global_by_event_name`.`MAX_TIMER_WAIT` AS `max_latency` from `performance_schema`.`events_waits_summary_global_by_event_name` where ((`performance_schema`.`events_waits_summary_global_by_event_name`.`EVENT_NAME` <> 'idle') and (`performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT` > 0)) order by `performance_schema`.`events_waits_summary_global_by_event_name`.`SUM_TIMER_WAIT` desc;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `sys_config`
--
ALTER TABLE `sys_config`
  ADD PRIMARY KEY (`variable`);
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
