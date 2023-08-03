<div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <section class="content-header">
    <h1>
      <i class="fa fa-users"></i> Cadastro de Inscrições
      <small>Todas as tarefas em nosso painel</small>
    </h1>
  </section>
  <section class="content" style="height:800px">
    <div class="col-xs-12">
      <div class="text-right">
        <a class="btn btn-primary" href="<?php echo base_url(); ?>addNewTask">
          <i class="fa fa-plus"></i> Adicionar inscrição</a>
      </div>
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
                    <th> ID da inscrição</th>              
                    <th> Nome </th>
                    <th> CPF do aluno </th>
                    <th> Atividade </th>
                    <th> Status </th>
                    <th> Avaliação </th>
                    <th> Professor </th>
                    <th> Ações </th> 
                  </tr>
                </thead>
                <tbody>
                  <?php
                      if(!empty($inscricoesDados))
                      {
                          foreach($inscricoesDados as $record)
                          {
                      ?>
                    <tr>
                      <td>
                        <?php echo $record->co_seq_inscricao ?>
                      </td>
                      <td>
                        <?php echo 'Leonardo' ?>
                      </td>
                      <td>
                        <?php echo $record->nu_cpf ?>
                      </td>
                      <td>
                        <?php echo $record->ds_titulo ?>
                      </td>
                      <td>
                        <?php echo $record->ds_situacao ?>
                      </td>

                      <td>
                        <?php echo $record->nu_avaliacao_individual ?>
                      </td>
                      <td>
                        <?php echo $record->ds_nome ?>
                      </td>
                      <td class="text-center">
                        <a class="btn btn-sm btn-info" href="<?php echo base_url().'editOldTask/'.$record->co_seq_cadastro_atividade; ?>" title="Editar">
                          <i class="fa fa-pencil"></i>
                        </a>
                        <a class="btn btn-sm btn-danger deleteUser" href="<?php echo base_url().'deleteTask/'.$record->co_seq_cadastro_atividade; ?>" data-userid="<?php echo $record->co_seq_cadastro_atividade; ?>"
                          title="Deletar">
                          <i class="fa fa-trash"></i>
                        </a>
                        <a class="btn btn-sm btn-primary" href="<?= base_url().'endTask/'.$record->co_seq_cadastro_atividade; ?>" title="Finalizar tarefa">
                          <i class="fa fa-check-circle"></i>
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