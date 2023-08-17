<?php

$co_seq_cadastro_pessoa = '';
$id_perfil = '';
$ds_nome = '';
$ds_email = '';
$nu_cpf = '';
$st_admin = '';

if ($this->uri->segment(2) == 'editar') {
if(!empty($infoUsuario))
{
    foreach ($infoUsuario as $r)
    {
        $co_seq_cadastro_pessoa = $r->co_seq_cadastro_pessoa;
        $id_perfil = $r->$id_perfil;
        $ds_nome = $r->ds_nome;
        $ds_email = $r->ds_email;
        $nu_cpf = $r->nu_cpf;
        $st_admin = $r->st_admin;
    }
}
}

?>

<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            <i class="fa fa-users"></i> <?php echo ($this->uri->segment(2) == 'cadastrar') ? 'Cadastrar Usuários' : 'Editar Usuários' ; ?>
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
                        <h3 class="box-title">Preencha os campos abaixos</h3>
                    </div>
                    <!-- /.box-header -->
                    <!-- form start -->
                    <?php $this->load->helper("form"); ?>
                    <form role="form" id="addUser" action="<?php echo ($this->uri->segment(2) == 'cadastrar') ? base_url().'adicionaUsuario' : base_url().'editaUsuario'; ?>" method="post" role="form">
                        <div class="box-body">
                            <div class="row">

                                <!-- VARCHAR/INTEGER/FLOAT -->
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="ds_nome">Nome</label>
                                        <input type="text" class="form-control required" value="<?php echo ($this->uri->segment(2) == 'cadastrar') ? set_value('ds_nome') : $Nome_Usuario ; ?>" id="ds_nome" name="ds_nome" maxlength="128">
                                        <input type="hidden" value="<?php echo $co_seq_cadastro_pessoa; ?>" name="co_seq_cadastro_pessoa" id="co_seq_cadastro_pessoa" />
                                    </div>
                                </div>
                                
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="nu_cpf">CPF</label>
                                        <input data-inputmask="'mask': '999.999.999-99'" type="text" class="form-control required cpf_usuario" id="nu_cpf" value="<?php echo ($this->uri->segment(2) == 'cadastrar') ? set_value('Cpf_Usuario') : $Cpf_Usuario; ?>" name="nu_cpf"
                                            maxlength="14">
                                    </div>
                                </div>

                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="ds_email">Email</label>
                                        <input type="text" class="form-control email required" value="<?php echo ($this->uri->segment(2) == 'cadastrar') ? set_value('ds_email') : $ds_email; ?>" id="ds_email" name="ds_email" maxlength="128">
                                    </div>
                                </div>
                            
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="id_perfil">Perfil</label>
                                        <select class="form-control required" id="id_perfil" name="id_perfil" required>
                                            <option value="" disabled selected>SELECIONE</option>
                                            <?php
                                            if(!empty($infoPerfil))
                                            {
                                                foreach ($infoPerfil as $perfil)
                                                {
                                                    ?>
                                                <option value="<?php echo $perfil->id_perfil ?>" <?php if ($this->uri->segment(2) == 'editar' && $perfil->id_perfil  == $id_perfil) { echo 'selected'; } ?>>
                                                    <?php echo $perfil->id_perfil.' - '.$perfil->ds_perfil ?>
                                                </option>
                                                <?php
                                                }
                                            }
                                            ?>
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <div class="row">                                
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="ds_senha">Senha</label>
                                        <input type="password" class="form-control <?php echo ($this->uri->segment(2) == 'cadastrar') ? 'required' : '' ; ?>" id="ds_senha" name="ds_senha" maxlength="20">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="resenha">Redigite a senha</label>
                                        <input type="password" class="form-control <?php echo ($this->uri->segment(2) == 'cadastrar') ? 'required' : '' ; ?> equalTo" id="resenha" name="resenha" maxlength="20">
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
<script src="<?php echo base_url(); ?>assets/js/<?php echo ($this->uri->segment(2) == 'cadastrar') ?'addUser.js':'addUserEditar.js';?>" type="text/javascript"></script>
<script>
$(document).ready(function(){
    $(":input").inputmask();
});
</script>