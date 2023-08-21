<?php

$id = '';
$id_projeto = '';
$nu_ano_emissao = '';
$nu_inscricao_car = '';
$nu_ccir = '';
$proprietario = '';
$no_propriedade = '';
$cnpj = '';
$cpf = '';
$liberado_campo = '';

if ($this->uri->segment(2) == 'editar') {
if(!empty($infoPropriedade))
{
    foreach ($infoPropriedade as $r)
    {
        $id = $r->id;
        $id_projeto = $r->id_projeto;
        $nu_ano_emissao = $r->nu_ano_emissao;
        $nu_inscricao_car = $r->nu_inscricao_car;
        $nu_ccir = $r->nu_ccir;
        $proprietario = $r->proprietario;
        $no_propriedade = $r->no_propriedade;
        $cnpj = $r->cnpj;
        $cpf = $r->cpf;
        $liberado_campo = $r->liberado_campo;
    }
}
}

?>

<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            <i class="fa fa-users"></i> <?php echo ($this->uri->segment(2) == 'cadastrar') ? 'Cadastrar Propriedades' : 'Editar Propriedades' ; ?>
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
                    <form role="form" id="addUser" action="<?php echo ($this->uri->segment(2) == 'cadastrar') ? base_url().'adicionaPropriedade' : base_url().'editaPropriedade'; ?>" method="post" role="form">
                        <div class="box-body">
                            <div class="row">

                                <!-- VARCHAR/INTEGER/FLOAT -->
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="id_perfil">Projeto</label>
                                        <select class="form-control required" id="id_projeto " name="id_projeto" required>
                                            <option value="" disabled selected>SELECIONE</option>
                                            <?php
                                            if(!empty($infoProjetos))
                                            {
                                                foreach ($infoProjetos as $projeto)
                                                {
                                                    ?>
                                                <option value="<?php echo $projeto->id ?>" <?php if ($this->uri->segment(2) == 'editar' && $projeto->id  == $id_projeto) { echo 'selected'; } ?>>
                                                    <?php echo $projeto->id.' - '.$projeto->nome ?>
                                                </option>
                                                <?php
                                                }
                                            }
                                            ?>
                                        </select>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="ds_nome">Ano emissão</label>
                                        <input type="text" class="form-control required" value="<?php echo ($this->uri->segment(2) == 'cadastrar') ? set_value('nu_ano_emissao') : $nu_ano_emissao ; ?>" id="nu_ano_emissao" name="nu_ano_emissao">
                                        <input type="hidden" value="<?php echo $id; ?>" name="id" id="id" />
                                    </div>
                                </div>
                                
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="nu_inscricao_car">Inscrição</label>
                                        <input type="text" class="form-control required" id="nu_inscricao_car" value="<?php echo ($this->uri->segment(2) == 'cadastrar') ? set_value('nu_inscricao_car') : $nu_inscricao_car; ?>" name="nu_inscricao_car">
                                    </div>
                                </div>

                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="nu_ccir">CCIR</label>
                                        <input type="text" class="form-control required" value="<?php echo ($this->uri->segment(2) == 'cadastrar') ? set_value('nu_ccir') : $nu_ccir; ?>" id="nu_ccir" name="nu_ccir">
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="proprietario">Proprietário</label>
                                        <input type="text" class="form-control required" value="<?php echo ($this->uri->segment(2) == 'cadastrar') ? set_value('proprietario') : $nu_ccir; ?>" id="proprietario" name="proprietario">
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="no_propriedade">Nome da propriedade</label>
                                        <input type="text" class="form-control required" value="<?php echo ($this->uri->segment(2) == 'cadastrar') ? set_value('no_propriedade') : $no_propriedade; ?>" id="no_propriedade" name="no_propriedade">
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="cnpj">CNPJ</label>
                                        <input data-inputmask="'mask': '99.999.999/9999-99'" type="text" class="form-control required" value="<?php echo ($this->uri->segment(2) == 'cadastrar') ? set_value('cnpj') : $cnpj; ?>" id="cnpj" name="cnpj">
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="cpf">CPF</label>
                                        <input data-inputmask="'mask': '999.999.999-99'" type="text" class="form-control required" value="<?php echo ($this->uri->segment(2) == 'cadastrar') ? set_value('cpf') : $cpf; ?>" id="cpf" name="cpf">
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="liberado_campo">Campo liberado?</label>
                                        <select class="form-control required" id="liberado_campo" name="liberado_campo">
                                            <option value="S" <?php if ($this->uri->segment(2) == 'editar' && $liberado_campo == 'S') { echo 'selected'; } ?>>Sim</option>
                                            <option value="N" <?php if ($this->uri->segment(2) == 'editar' && $liberado_campo == 'N') { echo 'selected'; } else if ($this->uri->segment(2) == 'cadastrar') { echo 'selected'; } ?>>Não</option>
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
<script src="<?php echo base_url(); ?>assets/js/<?php echo ($this->uri->segment(2) == 'cadastrar') ?'addUser.js':'addUserEditar.js';?>" type="text/javascript"></script>
<script>
$(document).ready(function(){
    $(":input").inputmask();
});
</script>