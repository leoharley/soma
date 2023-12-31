<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            <i class="fa fa-users"></i> Gerenciamento de usuários
            <small>Adicionar, Editar, Excluir</small>
        </h1>
    </section>
    <section class="content">
        <div class="row">
            <div class="col-xs-12 text-right">
                <div class="form-group">
                    <a class="btn btn-primary" href="<?php echo base_url(); ?>addNew">
                        <i class="fa fa-plus"></i> Adicionar usuário</a>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <div class="box-header">
                        <h3 class="box-title">Lista de usuários</h3>
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
                                <th>ID</th>
                                <th>Nome</th>
                                <th>Email</th>
                                <th>Telefone de contato</th>
                                <th>Permissão</th>
                                <th>Transações</th>
                            </tr>
                  </thead>
                  <tbody>
                            <?php
                    if(!empty($userRecords))
                    {
                        foreach($userRecords as $record)
                        {
                    ?>
                                <tr>
                                    <td>
                                        <?php echo $record->userId ?>
                                    </td>
                                    <td>
                                        <?php echo $record->name ?>
                                    </td>
                                    <td>
                                        <?php echo $record->email ?>
                                    </td>
                                    <td>
                                        <?php echo $record->mobile ?>
                                    </td>
                                    <td>
                                        <?php echo $record->role ?>
                                    </td>
                                    <td class="text-center">
                                        <a class="btn btn-sm btn-primary" href="<?= base_url().'log-history/'.$record->userId; ?>" title="Histórico de log">
                                            <i class="fa fa-history"></i>
                                        </a> |
                                        <a class="btn btn-sm btn-info" href="<?php echo base_url().'editOld/'.$record->userId; ?>" title="Editar">
                                            <i class="fa fa-pencil"></i>
                                        </a>
                                        <a class="btn btn-sm btn-danger deleteUser" href="#" data-userid="<?php echo $record->userId; ?>" title="Deletar">
                                            <i class="fa fa-trash"></i>
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
<script type="text/javascript" src="<?php echo base_url(); ?>assets/js/common.js" charset="utf-8"></script>