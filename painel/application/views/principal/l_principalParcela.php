<?php
function mask($val, $mask) {
  $maskared = '';
  $k = 0;
  for($i = 0; $i<=strlen($mask)-1; $i++) {
      if($mask[$i] == '#') {
          if(isset($val[$k])) $maskared .= $val[$k++];
      } else {
          if(isset($mask[$i])) $maskared .= $mask[$i];
      }
  }
  return $maskared;
}
?>
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
      <i class="fa fa-users"></i> Listar parcelas
      <small>Listar</small>
    </h1>
  </section>
  <section class="content">
    <div class="col-xs-12">
      <div class="text-left">
        <a class="btn btn-primary" href="<?php echo base_url(); ?>principalPropriedade/cadastrar">
          <i class="fa fa-plus"></i> Adicionar parcela</a>
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
                    <th>Propriedade</th>
                    <th>Ano emissão</th>
                    <th>Estágio regeneração</th>
                    <th>Grau epifitismo</th>
                    <th>Tipo bioma</th>
                  <!--  <th>Admin?</th> -->
                  <!--  <th>Data ativo</th>
                    <th>Data inativo</th> -->                    
                    <th>Ações</th>
                  </tr>
                </thead>
                <tbody>
                  <?php
                      if(!empty($registrosParcelas))
                      {
                          foreach($registrosParcelas as $registro)
                          {
                      ?>
                    <tr>
                      <td>
                        <?php echo $registro->id ?>
                      </td>
                      <td>
                        <?php echo $registro->no_propriedade ?>
                      </td>
                      <td>
                        <?php echo $registro->estagio_regeneracao ?>
                      </td>
                      <td>
                        <?php echo $registro->grau_epifitismo ?>
                      </td>
                      <td>
                        <?php echo $registro->tipo_bioma ?>
                      </td>
                  <!--    <td>
                        <?php //echo ($registro->Dt_Ativo != null) ? date("d/m/Y", strtotime($registro->Dt_Ativo)) : ''; ?>
                      </td>
                      <td>
                        <?php //echo ($registro->Dt_Inativo != null) ? date("d/m/Y", strtotime($registro->Dt_Inativo)) : ''; ?>
                      </td> -->
                      <td class="text-center">
                          <a class="btn btn-sm btn-info" href="<?= base_url().'principalParcela/editar/'.$registro->id ?>" title="Editar">
                              <i class="fa fa-pencil"></i>
                          </a>
                          <a class="btn btn-sm btn-danger" href="<?= base_url().'apagaParcela/'.$registro->id ?>" data-userid="<?= $registro->id ?>" title="Excluir">
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