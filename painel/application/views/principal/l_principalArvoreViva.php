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
      <i class="fa fa-users"></i> Listar árvores vivas
      <small>Listar</small>
    </h1>
  </section>
  <section class="content">
    <div class="col-xs-12">
      <div class="text-left">
        <a class="btn btn-primary" href="<?php echo base_url(); ?>principalArvoreViva/cadastrar">
          <i class="fa fa-plus"></i> Adicionar árvore viva</a>
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
            <div class="table-responsive">
              <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                <thead>
                  <tr>
                    <th>Id</th>
                    <th>Parcela ID: Propriedade</th>
                    <th>Cadastrado por</th>
                    <th>Latitude</th>
                    <th>Longitude</th>
                    <th>Biomassa</th>
                    <th>Nova</th>
                    <th>Grau proteção</th>
                    <th>Circunferência</th>
                    <th>Altura</th>
                    <th>Altura total</th>
                    <th>Altura fuste</th>
                    <th>Altura copa</th>
                    <th>Isolada</th>
                    <th>Floração frutificação</th>
                    <th>Dt. cadastro</th>           
                    <th>Ações</th>
                  </tr>
                </thead>
                <tbody>
                  <?php
                      if(!empty($registrosArvoreViva))
                      {
                          foreach($registrosArvoreViva as $registro)
                          {
                      ?>
                    <tr>
                      <td>
                        <?php echo $registro->id ?>
                      </td>
                      <td>
                        <?php echo $registro->id_parcela.': '.$registro->no_propriedade ?>
                      </td>
                      <td>
                        <?php echo $registro->ds_nome ?>
                      </td>
                      <td>
                        <?php echo $registro->latitude ?>
                      </td>
                      <td>
                        <?php echo $registro->longitude ?>
                      </td>
                      <td>
                        <?php echo $registro->nu_biomassa ?>
                      </td>
                      <td>
                        <?php echo $registro->nova ?>
                      </td>
                      <td>
                        <?php echo $registro->grau_protecao ?>
                      </td>
                      <td>
                        <?php echo $registro->nu_circunferencia ?>
                      </td>
                      <td>
                        <?php echo $registro->nu_altura ?>
                      </td>
                      <td>
                        <?php echo $registro->nu_altura_total ?>
                      </td>
                      <td>
                        <?php echo $registro->nu_altura_fuste ?>
                      </td>
                      <td>
                        <?php echo $registro->nu_altura_copa ?>
                      </td>
                      <td>
                        <?php echo $registro->isolada ?>
                      </td>
                      <td>
                        <?php echo $registro->floracao_frutificacao ?>
                      </td>
                      <td>
                        <?php echo $registro->dt_cadastro ?>
                      </td>
                      <td class="text-center">
                          <a class="btn btn-sm btn-info" href="<?= base_url().'principalArvoreViva/editar/'.$registro->id ?>" title="Editar">
                              <i class="fa fa-pencil"></i>
                          </a>
                          <a class="btn btn-sm btn-danger" href="<?= base_url().'apagaArvoreViva/'.$registro->id ?>" data-userid="<?= $registro->id ?>" title="Excluir">
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
        </div>
        <!-- /.box-body -->
      </div>
      <!-- /.box -->
    </div>
</div>
</section>
</div>