<div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <section class="content-header">
    <h1>
      Painel de gerenciamento
    </h1>
  </section>

  <section class="content">
    <div class="row">
      <div class="col-lg-3 col-xs-6">
        <!-- small box -->
        <div class="small-box bg-aqua">
          <div class="inner">
            <h3>
              <?php if(isset($UsuariosCount)) { echo $UsuariosCount; } else { echo '0'; } ?>
            </h3>
            <p>Usuários</p>
          </div>
          <div class="icon">
            <i class="fa fa-tasks"></i>
          </div>
          <a href="<?php echo base_url(); ?>cadastroUsuario/listar" class="small-box-footer">Mais Informações
            <i class="fa fa-arrow-circle-right"></i>
          </a>
        </div>
      </div>
      <!-- ./col -->
      <div class="col-lg-3 col-xs-6">
        <!-- small box -->
        <div class="small-box bg-green">
          <div class="inner">
            <h3>
              <?php if(isset($ProjetosCount)) { echo $ProjetosCount; } else { echo '0'; } ?>
            </h3>
            <p>Projetos</p>
          </div>
          <div class="icon">
            <i class="ion ion-pie-graph"></i>
          </div>
          <a href="<?php echo base_url(); ?>principalProjeto/listar" class="small-box-footer">Mais Informações
            <i class="fa fa-arrow-circle-right"></i>
          </a>
        </div>
      </div>      
      <!-- ./col -->
      <div class="col-lg-3 col-xs-6">
        <!-- small box -->
        <div class="small-box bg-red">
          <div class="inner">
            <h3>
              <?php if(isset($logsCount)) { echo $logsCount; } else { echo '0'; } ?>
            </h3>
            <p>Log</p>
          </div>
          <div class="icon">
            <i class="fa fa-archive"></i>
          </div>
          <a href="<?php echo base_url(); ?>log-history" class="small-box-footer">Mais Informações
            <i class="fa fa-arrow-circle-right"></i>
          </a>
        </div>
      </div>
      <!-- ./col -->
    </div>
  </section>
</div>