<style>
  table {
    border-color: #808080!important;
  }
  th {
    border-color: #808080!important;
    color: black;
    background-color: #d0d0d0;
    }
  td {
    border-color: #808080!important;
    color: black;
    }
  .box {
    width: 100%!important;
  }   
</style>

<div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <section class="content-header">
    <h1>
      <i class="fa fa-users"></i> Listar Projetos
      <small>Listar</small>
    </h1>
  </section>
  <section class="content">
    <div class="col-xs-12">
      <div class="text-left">
        <a class="btn btn-primary" href="<?php echo base_url(); ?>principalProjeto/cadastrar">
          <i class="fa fa-plus"></i> Adicionar projeto</a>
      </div>
      <br/>
      <div class="box">
        <div class="box-header">
          <div class="box-tools">
          </div>
        </div>
        <!-- /.box-header -->
        <div class="box-body table-responsive no-padding">
          <?php
                    $this->load->helper('form');
                    $error = $this->session->flashdata('error');
                    if($error)
                    {
                ?>
            <div class="alert alert-danger alert-dismissable">
              <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
              <?php echo $this->session->flashdata('error'); ?>
            </div>
            <?php } ?>
            <?php  
                    $success = $this->session->flashdata('success');
                    if($success)
                    {
                ?>
            <div class="alert alert-success alert-dismissable">
              <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
              <?php echo $this->session->flashdata('success'); ?>
            </div>
            <?php } ?>
            <div class="panel-body">
              <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                <thead>
                  <tr>
                    <th>Id</th>
                    <th>Nome</th>
                    <th>Perímetro</th>
                    <th>Dt. Início</th>
                    <th>Dt. Final</th>
                  <!--  <th>Admin?</th> -->
                  <!--  <th>Data ativo</th>
                    <th>Data inativo</th> -->                    
                    <th>Ações</th>
                  </tr>
                </thead>
                <tbody>
                  <?php
                      if(!empty($registrosProjetos))
                      {
                          foreach($registrosProjetos as $registro)
                          {
                      ?>
                    <tr>
                      <td>
                        <?php echo $registro->id ?>
                      </td>
                      <td>
                        <?php echo $registro->nome ?>
                      </td>
                      <td>
                        <?php echo $registro->perimetro ?>
                      </td>
                      <td>
                        <?php echo date("d/m/Y", strtotime($registro->dt_inicio)) ?>
                      </td>
                      <td>
                        <?php echo date("d/m/Y", strtotime($registro->dt_final)) ?>
                      </td>
                    <!--  <td>
                        <?php //echo ($registro->Admin == 'S') ? 'Sim' : 'Não'; ?>
                      </td> -->
                  <!--    <td>
                        <?php //echo ($registro->Dt_Ativo != null) ? date("d/m/Y", strtotime($registro->Dt_Ativo)) : ''; ?>
                      </td>
                      <td>
                        <?php //echo ($registro->Dt_Inativo != null) ? date("d/m/Y", strtotime($registro->Dt_Inativo)) : ''; ?>
                      </td> -->
                      <td class="text-center">
                          <a class="btn btn-sm btn-info" href="<?= base_url().'principalProjeto/editar/'.$registro->id ?>" title="Editar">
                              <i class="fa fa-pencil"></i>
                          </a>
                          <a class="btn btn-sm btn-danger" href="<?= base_url().'apagaProjeto/'.$registro->id ?>" data-userid="<?= $registro->id ?>" title="Excluir">
                              <i class="fa fa-trash-o"></i>
                          </a>
                      </td>
                    </tr>
                    <?php
                          }
                      }
                      ?>
                </tbody>
              </table>
            </div>
        </div>
        <!-- /.box-body -->
      </div>
      <!-- /.box -->
    </div>
</div>
</section>
</div>