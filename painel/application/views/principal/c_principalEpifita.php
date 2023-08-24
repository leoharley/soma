<?php

$id = '';
$id_parcela = '';
$latitude = '';
$longitude = '';

if ($this->uri->segment(2) == 'editar') {
if(!empty($infoAnimal))
{
    foreach ($infoAnimal as $r)
    {
        $id = $r->id;
        $id_parcela = $r->id_parcela;
        $latitude = $r->latitude;
        $longitude = $r->longitude;
    }
}
}

?>

<style>
    .content-wrapper{
      height:800px!important;
    }
</style>    

<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            <i class="fa fa-users"></i> <?php echo ($this->uri->segment(2) == 'cadastrar') ? 'Cadastrar Epífita' : 'Editar Epífita' ; ?>
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
                    <form role="form" id="addUser" action="<?php echo ($this->uri->segment(2) == 'cadastrar') ? base_url().'adicionaAnimal' : base_url().'editaAnimal'; ?>" method="post" role="form">
                        <div class="box-body">
                            <div class="row">

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="id_parcela">Parcela</label>
                                        <select class="form-control required" id="id_parcela" name="id_parcela" required>
                                            <option value="" disabled selected>SELECIONE</option>
                                            <?php
                                            if(!empty($infoParcelas))
                                            {
                                                foreach ($infoParcelas as $parcela)
                                                {
                                                    ?>
                                                <option value="<?php echo $parcela->id ?>" <?php if ($this->uri->segment(2) == 'editar' && $parcela->id  == $id_parcela) { echo 'selected'; } ?>>
                                                    <?php echo 'Parcela ID: '.$parcela->id.' / Propriedade: '.$parcela->no_propriedade ?>
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
                                        <label for="latitude">Latitude</label>
                                        <input data-inputmask="'mask': '99.99999999'" type="text" class="form-control required" id="latitude" value="<?php echo ($this->uri->segment(2) == 'cadastrar') ? set_value('latitude') : $latitude; ?>" name="latitude">
                                        <input type="hidden" value="<?php echo $id; ?>" name="id" id="id" />
                                    </div>
                                </div>

                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="longitude">Longitude</label>
                                        <input data-inputmask="'mask': '99.99999999'" type="text" class="form-control required" id="longitude" value="<?php echo ($this->uri->segment(2) == 'cadastrar') ? set_value('longitude') : $longitude; ?>" name="longitude">
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