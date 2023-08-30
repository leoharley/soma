<?php

$id = '';
$nome = '';
$perimetro = '';
$dt_inicio = '';
$dt_final = '';

if ($this->uri->segment(2) == 'editar') {
if(!empty($infoProjeto))
{
    foreach ($infoProjeto as $r)
    {
        $id = $r->id;
        $nome = $r->nome;
        $perimetro = $r->perimetro;
        $dt_inicio = $r->dt_inicio;
        $dt_final = $r->dt_final;
    }
}
}

?>

<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            <i class="fa fa-users"></i> <?php echo ($this->uri->segment(2) == 'cadastrar') ? 'Cadastrar Projetos' : 'Editar Projetos' ; ?>
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
                    <form role="form" id="addProjeto" action="<?php echo ($this->uri->segment(2) == 'cadastrar') ? base_url().'adicionaProjeto' : base_url().'editaProjeto'; ?>" method="post" role="form">
                        <div class="box-body">
                            <div class="row">

                                <!-- VARCHAR/INTEGER/FLOAT -->
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="nome">Nome</label>
                                        <input type="text" class="form-control required" value="<?php echo ($this->uri->segment(2) == 'cadastrar') ? set_value('nome') : $nome ; ?>" id="nome" name="nome" maxlength="128">
                                        <input type="hidden" value="<?php echo $id; ?>" name="id" id="id" />
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="chz-select">Teste</label>
                                        <select id="chz-select" name="chz-select" data-placeholder="Select...">
                                            <option value="1">Tom & Jerry</option>
                                            <option value="2">Andy & Jamie</option>
                                            <option value="3">Mark & Amy</option>
                                        </select>
                                    </div>
                                </div>
                                
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="perimetro">Perímetro</label>
                                        <input type="text" class="form-control required" id="perimetro" value="<?php echo ($this->uri->segment(2) == 'cadastrar') ? set_value('perimetro') : $perimetro; ?>" name="perimetro"
                                            maxlength="14">
                                    </div>
                                </div>

                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="dt_inicio">Data de início</label>
                                        <input type="date" class="form-control required" value="<?php echo ($this->uri->segment(2) == 'cadastrar') ? set_value('dt_inicio') : $dt_inicio; ?>" id="dt_inicio" name="dt_inicio">
                                    </div>
                                </div>
                            
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="dt_final">Data final</label>
                                        <input type="date" class="form-control required" value="<?php echo ($this->uri->segment(2) == 'cadastrar') ? set_value('dt_final') : $dt_final; ?>" id="dt_final" name="dt_final">
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
    $('#chz-select').select2();
});
</script>