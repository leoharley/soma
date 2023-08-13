<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <title>
    <?php echo $pageTitle; ?>
  </title>
  <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
  <!-- Bootstrap 3.3.4 -->
  <link href="<?php echo base_url(); ?>assets/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
  <!-- FontAwesome 4.3.0 -->
  <link href="<?php echo base_url(); ?>assets/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
  <!-- Ionicons 2.0.0 -->
  <link href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet" type="text/css" />
  <!-- Theme style -->
  <link href="<?php echo base_url(); ?>assets/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
  <!-- Datatables style -->
  <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/bs4/jszip-2.5.0/dt-1.10.16/af-2.2.2/b-1.5.1/b-colvis-1.5.1/b-flash-1.5.1/b-html5-1.5.1/b-print-1.5.1/cr-1.4.1/fc-3.2.4/fh-3.1.3/kt-2.3.2/r-2.2.1/rg-1.0.2/rr-1.2.3/sc-1.4.4/sl-1.2.5/datatables.min.css"
  />
  <!-- AdminLTE Skins. Choose a skin from the css/skins 
         folder instead of downloading all of them to reduce the load. -->
  <link href="<?php echo base_url(); ?>assets/dist/css/skins/_all-skins.min.css" rel="stylesheet" type="text/css" />
  <style>
    .main-header li.user-header {
      background-color: #2d6c5d!important;
    }
    .main-header .logo {
      background-color: #1d463c!important;
    }
    .navbar { 
      background-color: #2d6c5d!important;
    }
    .skin-blue .sidebar-menu>li:hover>a, .skin-blue .sidebar-menu>li.active>a {
    border-left-color: #3cbc3c!important;
    }
    .error {
      color: red;
      font-weight: normal;
    }
  </style>
  <!-- jQuery 2.1.4 -->
  <script src="<?php echo base_url(); ?>assets/js/jQuery-2.1.4.min.js"></script>
  <script type="text/javascript">
    var baseURL = "<?php echo base_url(); ?>";
  </script>


<script>
$(function() {
        const collapseExample = $("#cadastro");
        collapseExample.on("shown.bs.collapse", function() {
            localStorage.setItem("collapseExample", "show");
        });
        collapseExample.on("hidden.bs.collapse", function() {
            localStorage.setItem("collapseExample", "hide");
        });
        const showExampleCollapse = localStorage.getItem("collapseExample");
        if (showExampleCollapse === "show") {
            collapseExample.collapse("show");
        } else {
            collapseExample.collapse("hide");
        }

        const collapseExample2 = $("#principal");
        collapseExample2.on("shown.bs.collapse", function() {
            localStorage.setItem("collapseExample2", "show");
        });
        collapseExample2.on("hidden.bs.collapse", function() {
            localStorage.setItem("collapseExample2", "hide");
        });
        const showExampleCollapse2 = localStorage.getItem("collapseExample2");
        if (showExampleCollapse2 === "show") {
            collapseExample2.collapse("show");
        } else {
            collapseExample2.collapse("hide");
        }

        const collapseExample3 = $("#auxiliar");
        collapseExample3.on("shown.bs.collapse", function() {
            localStorage.setItem("collapseExample3", "show");
        });
        collapseExample3.on("hidden.bs.collapse", function() {
            localStorage.setItem("collapseExample3", "hide");
        });
        const showExampleCollapse3 = localStorage.getItem("collapseExample3");
        if (showExampleCollapse3 === "show") {
            collapseExample3.collapse("show");
        } else {
            collapseExample3.collapse("hide");
        }

        const collapseExample4 = $("#pacote");
        collapseExample4.on("shown.bs.collapse", function() {
            localStorage.setItem("collapseExample4", "show");
        });
        collapseExample4.on("hidden.bs.collapse", function() {
            localStorage.setItem("collapseExample4", "hide");
        });
        const showExampleCollapse4 = localStorage.getItem("collapseExample4");
        if (showExampleCollapse4 === "show") {
            collapseExample4.collapse("show");
        } else {
            collapseExample4.collapse("hide");
        }

      });
</script>

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body class="skin-blue sidebar-mini">
  <div class="wrapper">

    <header class="main-header">
      <!-- Logo -->
      <a href="<?php echo base_url(); ?>" class="logo">
        <!-- mini logo for sidebar mini 50x50 pixels -->
        <span class="logo-mini">
          <b>SOMA</b></span>
        <!-- logo for regular state and mobile devices -->
        <span class="logo-lg">
          <b>SOMA</b></span>
      </a>
      <!-- Header Navbar: style can be found in header.less -->
      <nav class="navbar navbar-static-top" role="navigation">
        <!-- Sidebar toggle button-->
        <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
          <span class="sr-only">Toggle navigation</span>
        </a>
        <div class="navbar-custom-menu">
          <ul class="nav navbar-nav">
            <li class="dropdown tasks-menu">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
                <i class="fa fa-history"></i>
              </a>
              <ul class="dropdown-menu">
                <li class="header"> Último Login :
                  <i class="fa fa-clock-o"></i>
                  <?= empty($last_login) ? "Primeiro Login" : $last_login; ?>
                </li>
              </ul>
            </li>
            <!-- User Account: style can be found in dropdown.less -->
            <li class="dropdown user user-menu">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                <img src="<?php echo base_url(); ?>assets/dist/img/avatar.png" class="user-image" alt="User Image" />
                <span class="hidden-xs">
                  <?php echo $name; ?>
                </span>
              </a>
              <ul class="dropdown-menu">
                <!-- User image -->
                <li class="user-header">
                  <img src="<?php echo base_url(); ?>assets/dist/img/avatar.png" class="img-circle" alt="User Image" />
                  <p>
                    <?php echo $name; ?>
                    <small>
                      <?php echo $role_text; ?>
                    </small>
                  </p>
                </li>
                <!-- Menu Footer-->
                <li class="user-footer">
                  <div class="pull-left">
                    <a href="<?php echo base_url(); ?>userEdit" class="btn btn-default btn-flat">
                      <i class="fa fa-key"></i> Configurações da conta </a>
                  </div>
                  <div class="pull-right">
                    <a href="<?php echo base_url(); ?>logout" class="btn btn-default btn-flat">
                      <i class="fa fa-sign-out"></i> Sair</a>
                  </div>
                </li>
              </ul>
            </li>
          </ul>
        </div>
      </nav>
    </header>
    <!-- Left side column. contains the logo and sidebar -->
    <aside class="main-sidebar">
      <!-- sidebar: style can be found in sidebar.less -->
      <section class="sidebar">
        <!-- sidebar menu: : style can be found in sidebar.less -->
        <ul class="sidebar-menu">
          <li class="header">
          </li>
          <li class="treeview">
            <a href="<?php echo base_url(); ?>changePassword">
              <i class="fa fa-dashboard"></i>
              <span>Alterar a senha</span>
              </i>
            </a>
          </li>


            <?php
            // Rol definetion in application/config/constants.php
            // if($role == ROLE_ADMIN)
           //  {
            ?>
            <hr>

            <li class="treeview" data-toggle="collapse" data-target="#cadastro" style="margin-bottom: 10px!important;cursor: pointer!important;<?php if ($this->session->userdata('isAdmin') != 'S') { echo 'display:none'; } ?>">
                    
                    <h4 style="margin-left:18px!important;color:white"><b><i class="fa fa-chevron-circle-down" style="margin-right:5px"></i>  CADASTRO</b></h4>

                    <ul class="nav nav-list collapse" style="margin-top:10px" id="cadastro">

                <li class="treeview" <?php if ($this->session->userdata('isAdmin') != 'S') { echo 'style=display:none'; } ?>>
                  <a href="<?php echo base_url(); ?>cadastroUsuario/listar">
                    <i class="fa fa-th" style="margin-right:5px"></i>
                    <span>Usuário</span>
                  </a>
                </li>
                <li class="treeview" <?php if ($this->session->userdata('isAdmin') != 'S') { echo 'style=display:none'; } ?>>
                  <a href="<?php echo base_url(); ?>cadastroEmpresa/listar">
                    <i class="fa fa-th" style="margin-right:5px"></i>
                    <span>Empresa</span>
                  </a>
                </li>
                <li class="treeview" <?php if ($this->session->userdata('isAdmin') != 'S') { echo 'style=display:none'; } ?>>
                    <a href="<?php echo base_url(); ?>cadastroPerfil/listar">
                        <i class="fa fa-th" style="margin-right:5px"></i>
                        <span>Perfil</span>
                    </a>
                </li>
                <li class="treeview" <?php if ($this->session->userdata('isAdmin') != 'S') { echo 'style=display:none'; } ?>>
                    <a href="<?php echo base_url(); ?>cadastroTelas/listar">
                        <i class="fa fa-th" style="margin-right:5px"></i>
                        <span>Telas</span>
                    </a>
                </li>
                <li class="treeview" <?php if ($this->session->userdata('isAdmin') != 'S') { echo 'style=display:none'; } ?>>
                    <a href="<?php echo base_url(); ?>cadastroPermissao/listar">
                        <i class="fa fa-th" style="margin-right:5px"></i>
                        <span>Permissão</span>
                    </a>
                </li>
                <li class="treeview" <?php if ($this->session->userdata('isAdmin') != 'S') { echo 'style=display:none'; } ?>>
                    <a href="<?php echo base_url(); ?>cadastroUsuarioEmpresa/listar">
                        <i class="fa fa-th" style="margin-right:5px"></i>
                        <span>Usuário/Empresa</span>
                    </a>
                </li>
                
                </ul>
                </li>

                <hr>

              <!--  <h4 style="margin-left:18px!important;color:white"><b> PRINCIPAL </b></h4> -->

                <li class="treeview" data-toggle="collapse" data-target="#principal" style="margin-bottom: 10px!important;cursor: pointer!important;">
                    
                    <h4 style="margin-left:18px!important;color:white"><b><i class="fa fa-chevron-circle-down" style="margin-right:5px"></i>  PRINCIPAL</b></h4>

                    <ul class="nav nav-list collapse" style="margin-top:10px" id="principal">

                  <li class="treeview">
                    <a href="<?php echo base_url(); ?>principalConvenio/listar">
                        <i class="fa fa-th" style="margin-right:5px!important"></i>
                        <span>Convênio</span>
                    </a>
                  </li>

                  <li class="treeview">
                      <a href="<?php echo base_url(); ?>principalPlano/listar">
                          <i class="fa fa-th" style="margin-right:5px!important"></i>
                          <span>Plano</span>
                      </a>
                  </li>

                  </ul>
                  </li>

                  <hr>
                  
                  <li class="treeview" data-toggle="collapse" data-target="#pacote" style="margin-bottom: 10px!important;cursor: pointer!important;<?php if (strpos($_SERVER['REQUEST_URI'], 'homologacao') == FALSE) {echo 'display:none;';}?>">
                    
                    <h4 style="margin-left:18px!important;color:white"><b><i class="fa fa-chevron-circle-down" style="margin-right:5px"></i>  PACOTE</b></h4>

                    <ul class="nav nav-list collapse" style="margin-top:10px" id="pacote">

                  <li class="treeview">
                    <a href="<?php echo base_url(); ?>pacotePacote/listar">
                        <i class="fa fa-th" style="margin-right:5px!important"></i>
                        <span>Pacote</span>
                    </a>
                  </li>

                  <li class="treeview">
                      <a href="<?php echo base_url(); ?>pacoteSubstancia/listar">
                          <i class="fa fa-th" style="margin-right:5px!important"></i>
                          <span>Substância</span>
                      </a>
                  </li>

                  <li class="treeview">
                      <a href="<?php echo base_url(); ?>pacoteSetor/listar">
                          <i class="fa fa-th" style="margin-right:5px!important"></i>
                          <span>Setor</span>
                      </a>
                  </li>

                  <li class="treeview">
                      <a href="<?php echo base_url(); ?>pacoteExcecaoProcedimento/listar">
                          <i class="fa fa-th" style="margin-right:5px!important"></i>
                          <span>Exceção Procedimento</span>
                      </a>
                  </li>

                  </ul>
                  </li>
              <hr>

            
        </ul>
      </section>
      <!-- /.sidebar -->
    </aside>