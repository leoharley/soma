<?php

$id_perfil  = '';
$ds_perfil = '';
$st_admin = '';

if ($this->uri->segment(2) == 'editar') {
if(!empty($infoPerfil))
{
    foreach ($infoPerfil as $r)
    {
        $id_perfil = $r->id_perfil;
        $ds_perfil = $r->ds_perfil;
        $st_admin = $r->st_admin;
    }
}
}
?>

<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            <i class="fa fa-users"></i> <?php echo ($this->uri->segment(2) == 'cadastrar') ? 'Cadastrar Perfil' : 'Editar Perfil' ; ?>
            <small><?php echo ($this->uri->segment(2) == 'cadastrar') ? 'Adicionar' : 'Editar' ; ?></small>
        </h1>
    </section>

    <section class="content">

        <div class="row">
            <!-- left column -->
            <div class="col-md-8">
                <!-- general form elements -->

                <div class="box box-primary">
                    <div class="box-header">
                        <h3 class="box-title">Preencha o campo abaixo</h3>
                    </div>
                    <!-- /.box-header -->
                    <!-- form start -->
                    <?php $this->load->helper("form"); ?>
                    <form role="form" id="addPerfil" action="<?php echo ($this->uri->segment(2) == 'cadastrar') ? base_url().'adicionaPerfil' : base_url().'editaPerfil'; ?>" method="post" role="form">
                        <div class="box-body">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="ds_perfil">Descrição</label>
                                        <input type="text" class="form-control required" value="<?php echo ($this->uri->segment(2) == 'cadastrar') ? set_value('ds_perfil') : $ds_perfil ; ?>" id="ds_perfil" name="ds_perfil" maxlength="128">
                                        <input type="hidden" value="<?php echo $id_perfil; ?>" name="id_perfil" id="id_perfil" />
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="st_admin">Perfil Admin?</label>
                                        <select class="form-control required" id="st_admin" name="st_admin">
                                            <option value="S" <?php if ($this->uri->segment(2) == 'editar' && $st_admin == 'S') { echo 'selected'; } ?>>Sim</option>
                                            <option value="N" <?php if ($this->uri->segment(2) == 'editar' && $st_admin == 'N') { echo 'selected'; } else if ($this->uri->segment(2) == 'cadastrar') { echo 'selected'; } ?>>Não</option>
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="st_campo">Técnico de campo?</label>
                                        <input type="text" class="form-control required" value="<?php echo ($this->uri->segment(2) == 'cadastrar') ? set_value('st_campo') : $st_campo ; ?>" id="st_campo" name="st_campo" maxlength="128">
                                    </div>
                                </div>
                            </div>

                            
                        </div>
                        <!-- /.box-body -->

                        <div class="box-footer">
                            <input type="submit" class="btn btn-primary" value="Salvar" />
                            <input type="reset" class="btn btn-default" value="Limpar" />
                        </div>
                    </form>
                </div>
            </div>
            <div class="col-md-4">
                    <div class="row">
                        <div class="col-md-12">
                            <?php echo validation_errors('<div class="alert alert-danger alert-dismissable">', ' <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button></div>'); ?>
                        </div>
                    </div>
            </div>
        </div>
    </section>
</div>
<script src="<?php echo base_url(); ?>assets/js/addUser.js" type="text/javascript"></script>