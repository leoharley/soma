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

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
