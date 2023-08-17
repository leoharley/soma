<?php

$id_permissao = '';
$ds_perfil = '';
$ds_tela = '';
$atualizar = '';
$Inserir = '';
$excluir = '';
$consultar = '';
$imprimir = '';

if(!empty($infoPermissao))
{
    foreach ($infoPermissao as $r)
    {
        $id_permissao  = $r->id_permissao ;
        $ds_perfil = $r->ds_perfil;
        $ds_tela = $r->ds_tela;
        $atualizar = $r->atualizar;
        $Inserir = $r->Inserir;
        $excluir = $r->excluir;
        $consultar = $r->consultar;
        $imprimir = $r->imprimir;
    }
}

?>

<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            <i class="fa fa-users"></i> Editar Permissão
            <small>Editar</small>
        </h1>
    </section>

    <section class="content">

        <div class="row">
            <!-- left column -->
            <div class="col-md-8">
                <!-- general form elements -->



                <div class="box box-primary">
                    <div class="box-header">
                        <h3 class="box-title">Selecione os campos abaixo</h3>
                    </div>
                    <!-- /.box-header -->
                    <!-- form start -->
                    <?php $this->load->helper("form"); ?>
                    <form role="form" id="addUser" action="<?php echo base_url() ?>editaPermissao" method="post" role="form">
                        <div class="box-body">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="Ds_Perfil">Perfil</label>
                                        <input type="text" class="form-control required" value="<?php echo $ds_perfil ; ?>" id="ds_perfil" name="ds_perfil" maxlength="128" disabled>
                                        <input type="hidden" value="<?php echo $id_permissao; ?>" name="id_permissao" id="id_permissao" />
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="ds_tela">Tela</label>
                                        <input type="text" class="form-control required" value="<?php echo $ds_tela ; ?>" id="ds_tela" name="ds_tela" maxlength="128" disabled>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="atualizar">Atualizar</label>
                                        <select class="form-control required" id="atualizar" name="atualizar">
                                            <option value="S" <?php if ($atualizar == 'S') { echo 'selected'; } ?>>Sim</option>
                                            <option value="N" <?php if ($atualizar == 'N') { echo 'selected'; } ?>>Não</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="Inserir">Inserir</label>
                                        <select class="form-control required" id="Inserir" name="Inserir">
                                            <option value="S" <?php if ($Inserir == 'S') { echo 'selected'; } ?>>Sim</option>
                                            <option value="N" <?php if ($Inserir == 'N') { echo 'selected'; } ?>>Não</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="excluir">Excluir</label>
                                        <select class="form-control required" id="excluir" name="excluir">
                                            <option value="S" <?php if ($excluir == 'S') { echo 'selected'; } ?>>Sim</option>
                                            <option value="N" <?php if ($excluir == 'N') { echo 'selected'; } ?>>Não</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="consultar">Consultar</label>
                                        <select class="form-control required" id="consultar" name="consultar">
                                            <option value="S" <?php if ($consultar == 'S') { echo 'selected'; } ?>>Sim</option>
                                            <option value="N" <?php if ($consultar == 'N') { echo 'selected'; } ?>>Não</option>
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="imprimir">Imprimir</label>
                                        <select class="form-control required" id="imprimir" name="imprimir">
                                            <option value="S" <?php if ($imprimir == 'S') { echo 'selected'; } ?>>Sim</option>
                                            <option value="N" <?php if ($imprimir == 'N') { echo 'selected'; } ?>>Não</option>
                                        </select>
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