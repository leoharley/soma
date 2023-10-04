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
      <i class="fa fa-users"></i> Listar Animais
      <small>Listar</small>
    </h1>
  </section>
  <section class="content">
    <div class="col-xs-12">
      <div class="text-left">
        <a class="btn btn-primary" href="<?php echo base_url(); ?>principalAnimal/cadastrar">
          <i class="fa fa-plus"></i> Adicionar animal</a>
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
                    <th>Som</th>
                    <th>Classificação</th>
                    <th>Latitude</th>
                    <th>Longitude</th>
                    <th>Dt. cadastro</th>           
                    <th>Ações</th>
                  </tr>
                </thead>
                <tbody>
                  <?php
                      if(!empty($registrosAnimal))
                      {
                          foreach($registrosAnimal as $registro)
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
                        <?php echo $registro->nome_fauna_tipo_observacao  ?>
                      </td>
                      <td>
                        <?php echo $registro->nome_classificacao ?>
                      </td>
                      <td>
                        <?php echo $registro->latitude_gms ?>
                      </td>
                      <td>
                        <?php echo $registro->longitude_gms ?>
                      </td>
                      <td>
                        <?= ($registro->dt_cadastro == '0000-00-00')?'<font style="color:red;font-weight:bold;">NÃO CADASTRADO
                        </font>':date("d/m/Y", strtotime($registro->dt_cadastro)); ?>
                      </td>
                      <td class="text-center">
                          <a class="btn btn-sm btn-info" href="<?= base_url().'principalAnimal/editar/'.$registro->id ?>" title="Editar">
                              <i class="fa fa-pencil"></i>
                          </a>
                          <a class="btn btn-sm btn-danger deleteUser" href="#" data-toggle="modal" data-target="#confirma-exclusao<?= $registro->id ?>"><i class="fa fa-trash-o"></i></a>
                      </td>
                    </tr>

                    <div class="modal fade" id="confirma-exclusao<?= $registro->id ?>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                            
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                    <h4 class="modal-title" id="myModalLabel"><strong>Confirmação</strong></h4>
                                </div>
                            
                                <div class="modal-body">
                                    <p>Tem certeza que deseja excluir? Esta ação não poderá ser revertida!</p>
                                </div>
                                
                                <div class="modal-footer">  
                                    <a class="btn btn-sm btn-danger deleteUser" href="<?= base_url().'apagaAnimal/'.$registro->id ?>" data-userid="<?= $registro->id ?>" title="Excluir">
                                    Confirmar
                                    </a>                       
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                                </div>
                            </div>
                        </div>
                    </div>

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