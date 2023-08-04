--USAR PARA A SOMA
CREATE TABLE IF NOT EXISTS `tb_acesso` (
  `co_seq_acesso` int(11) NOT NULL,
  `nu_cpf` varchar(12) NOT NULL,
  `ds_senha` varchar(45) NOT NULL,
  `tp_cadastro` varchar(10) DEFAULT NULL,
  `st_registro_ativo` varchar(2) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `tb_cadastro_pessoa` (
  `co_seq_cadastro_pessoa` int(11) NOT NULL,
  `ds_nome` varchar(45) DEFAULT NULL,
  `ds_sobrenome` varchar(45) DEFAULT NULL,
  `nu_cpf` varchar(12) DEFAULT NULL,
  `ds_email` varchar(45) DEFAULT NULL,
  `nu_telefone` varchar(15) DEFAULT NULL,
  `ds_sexo` varchar(45) DEFAULT NULL,
  `dt_nascimento` varchar(12) DEFAULT NULL,
  `tp_cadastro` varchar(10) DEFAULT NULL,
  `st_registro_ativo` varchar(2) DEFAULT NULL,
  `co_acesso` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS `rl_notificacao` (
  `co_seq_notificacao` int(11) NOT NULL,
  `nu_horario` int(11) DEFAULT NULL,
  `dt_envio` date DEFAULT NULL,
  `co_descricao_notificacao` int(11) NOT NULL,
  `co_acesso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS `tb_descricao_notificacao` (
  `co_seq_descricao_notificacao` int(11) NOT NULL,
  `ds_descricao` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE public.tb_log (
	id bigserial NOT NULL,
	"id_usuario" int8 NULL,
	"nome" varchar(128) NULL,
	"acao" varchar(1024) NOT NULL,
	"funcaoAcao" varchar(1024) NOT NULL,
	"idPerfil" int8 NULL,
	"dsPerfil" varchar(128) NULL,
	"ip" varchar(1024) NOT NULL,
	"dsNavegador" varchar(128) NOT NULL,
	"stringNavegador" varchar(1024) NOT NULL,
	"plataforma" varchar(128) NOT NULL,
	"dtCriacao" timestamp NOT NULL DEFAULT now(),
	"TRIAL985" bpchar(1) NULL,
	CONSTRAINT pk_tbl_log PRIMARY KEY (id)
)

CREATE TABLE public.tb_perfil (
	"idPerfil" smallserial NOT NULL,
	"dsPerfil" varchar(50) NOT NULL,
	"TRIAL504" bpchar(1) NULL,
	CONSTRAINT pk_tbl_roles PRIMARY KEY ("idPerfil")
);



