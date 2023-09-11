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
      <i class="fa fa-users"></i> Listar Permissões
      <small>Listar</small>
    </h1>
  </section>
  <section class="content">
    <div class="col-xs-12">
      
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
                    <th>Perfil</th>
                    <th>Tela</th>
                    <th>Atualizar</th>
                    <th>Inserir</th>
                    <th>Excluir</th>
                    <th>Consultar</th>
                    <th>Imprimir</th>
                    <th>Ações</th>
                  </tr>
                </thead>
                <tbody>  
                  <?php
                      if(!empty($registrosPermissao))
                      {
                          foreach($registrosPermissao as $registro)
                          {
                      ?>
                    <tr>
                      <td>
                        <?php echo $registro->ds_perfil ?>
                      </td>
                      <td>
                        <?php echo $registro->ds_tela ?>
                      </td>
                      <td>
                        <?php echo ($registro->atualizar == 'S')?'Sim':'Não'; ?>
                      </td>
                      <td>
                        <?php echo ($registro->Inserir == 'S')?'Sim':'Não'; ?>
                      </td>
                      <td>
                        <?php echo ($registro->excluir == 'S')?'Sim':'Não'; ?>
                      </td>
                      <td>
                        <?php echo ($registro->consultar == 'S')?'Sim':'Não'; ?>
                      </td>
                      <td>
                        <?php echo ($registro->imprimir == 'S')?'Sim':'Não'; ?>
                      </td>
                      <td class="text-center">
                        <!--  <a class="btn btn-sm btn-primary" href="<?php //echo base_url().'log-history/'.$record->userId; ?>" title="Log geçmişi">
                              <i class="fa fa-history"></i>
                          </a> -->
                          <a class="btn btn-sm btn-danger deleteUser" href="#" data-toggle="modal" data-target="#confirma-exclusao<?= $registro->id_permissao ?>"><i class="fa fa-trash-o"></i></a>
                      </td>
                    </tr>

                    <div class="modal fade" id="confirma-exclusao<?= $registro->id_permissao ?>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
                                    <a class="btn btn-sm btn-danger deleteUser" href="<?php echo base_url().'cadastroPermissao/editar/'.$registro->id_permissao ; ?>" data-userid="<?php echo $registro->id_permissao; ?>" title="Excluir">
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
        <!-- /.box-body -->
      </div>
      <!-- /.box -->
    </div>
</div>
</section>
</div>