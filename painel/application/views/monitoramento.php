<div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <section class="content-header">
    <h1>
      <i class="fa fa-users"></i> Monitoramento
    </h1>
  </section>
  <section class="content" style="height:1800px">
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
                    <th> ID da atividade</th> 
                    <th> Aluno</th>              
                    <th> Cpf </th>
                    <th style="width:15%"> Passos </th>
                    <th style="width:15%"> Distância </th>
                    <th style="width:15%"> Duração </th>
                    <th style="width:15%"> Pace </th>
                    <th style="width:15%"> Calorias médias </th>
                    <th> Ações </th>
                  </tr>
                </thead>
                <tbody>
                  
                    <tr>
                      <td>
                        43
                      </td>
                      <td>
                        Leonardo
                      </td>
                      <td>
                        89090888187
                      </td>
                      <td>
                      4.000
                      </td>
                      <td>
                      5.2 km
                      </td>
                      <td>
                      16.6 min
                      </td>
                      <td>
                      8 min/km
                      </td>
                      <td>
                      800 kcal
                      </td>
                      <td class="text-center">
                        <a class="btn btn-sm btn-info" href="" title="Editar">
                          <i class="fa fa-pencil"></i>
                        </a>
                        <a class="btn btn-sm btn-danger deleteUser" href="" data-userid=""
                          title="Deletar">
                          <i class="fa fa-trash"></i>
                        </a>
                        <a class="btn btn-sm btn-primary" href="" title="Finalizar tarefa">
                          <i class="fa fa-check-circle"></i>
                        </a>
                      </td>
                    </tr>
                   
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


