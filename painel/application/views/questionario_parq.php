<div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <section class="content-header">
    <h1>
      <i class="fa fa-users"></i> Formulário Parq
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
                    <th> Aluno</th>              
                    <th> Cpf </th>
                    <th style="width:15%"> Algum médico já disse que você possui algum problema de coração e que só deveria realizar atividade física supervisionado por profissionais de saúde? </th>
                    <th style="width:15%"> Sente dores no peito quando pratica atividade física? </th>
                    <th style="width:15%"> No último mês, você sentiu dores no peito quando praticou atividade física? </th>
                    <th style="width:15%"> Apresenta desequilíbrio devido a tontura ou perda de consciência? </th>
                    <th style="width:15%"> Possui algum problema ósseo ou articular que poderia ser piorado pela atividade física? </th>
                    <th style="width:15%"> Toma atualmente algum medicamento para pressão arterial ou problema de coração? </th>
                    <th style="width:15%"> Sabe de alguma outra razão pela qual você não deve praticar atividade física? </th>
                    <th> Ações </th>
                  </tr>
                </thead>
                <tbody>
                  <?php
                      if(!empty($formParqDados))
                      {
                          foreach($formParqDados as $record)
                          {
                      ?>
                    <tr>
                    <td>
                        <?php echo $record->ds_nome ?>
                      </td>
                      <td>
                        <?php echo $record->nu_cpf ?>
                      </td>
                      <td>
                        <?php echo $record->ds_resposta_1 ?>
                      </td>
                      <td>
                        <?php echo $record->ds_resposta_2 ?>
                      </td>
                      <td>
                        <?php echo $record->ds_resposta_3 ?>
                      </td>
                      <td>
                        <?php echo $record->ds_resposta_4 ?>
                      </td>
                      <td>
                        <?php echo $record->ds_resposta_5 ?>
                      </td>
                      <td>
                        <?php echo $record->ds_resposta_6 ?>
                      </td>
                      <td>
                        <?php echo $record->ds_resposta_7 ?>
                      </td>
                      <td class="text-center">
                        <a class="btn btn-sm btn-info" href="<?php echo base_url().'editOldTask/'.$record->co_seq_formulario_parq; ?>" title="Editar">
                          <i class="fa fa-pencil"></i>
                        </a>
                        <a class="btn btn-sm btn-danger deleteUser" href="<?php echo base_url().'deleteTask/'.$record->co_seq_formulario_parq; ?>" data-userid="<?php echo $record->co_seq_formulario_parq; ?>"
                          title="Deletar">
                          <i class="fa fa-trash"></i>
                        </a>
                        <a class="btn btn-sm btn-primary" href="<?= base_url().'endTask/'.$record->co_seq_formulario_parq; ?>" title="Finalizar tarefa">
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


