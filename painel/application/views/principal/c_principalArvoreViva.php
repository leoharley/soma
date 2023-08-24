<?php

$id = '';
$id_parcela = '';
$latitude = '';
$longitude = '';
$nu_biomassa = '';
$nova = '';
$grau_protecao = '';
$nu_circunferencia = '';
$nu_altura = '';
$nu_altura_total = '';
$nu_altura_fuste = '';
$nu_altura_copa = '';
$isolada = '';
$floracao_frutificacao = '';

if ($this->uri->segment(2) == 'editar') {
if(!empty($infoArvoreViva))
{
    foreach ($infoArvoreViva as $r)
    {
        $id = $r->id;
        $id_parcela = $r->id_parcela;
        $latitude = $r->latitude;
        $longitude = $r->longitude;
        $nu_biomassa = $r->nu_biomassa;
        $nova = $r->nova;
        $grau_protecao = $r->grau_protecao;
        $nu_circunferencia = $r->nu_circunferencia;
        $nu_altura = $r->nu_altura;
        $nu_altura_total = $r->nu_altura_total;
        $nu_altura_fuste = $r->nu_altura_fuste;
        $nu_altura_copa = $r->nu_altura_copa;
        $isolada = $r->isolada;
        $floracao_frutificacao = $r->floracao_frutificacao;
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
            <i class="fa fa-users"></i> <?php echo ($this->uri->segment(2) == 'cadastrar') ? 'Cadastrar Árvores Vivas' : 'Editar Árvores Vivas' ; ?>
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
                    <form role="form" id="addUser" action="<?php echo ($this->uri->segment(2) == 'cadastrar') ? base_url().'adicionaArvoreViva' : base_url().'editaArvoreViva'; ?>" method="post" role="form">
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
                            
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="id_familia">Família</label>
                                        <input type="text" class="form-control required" id="id_familia" value="<?php echo ($this->uri->segment(2) == 'cadastrar') ? set_value('id_familia') : $id_familia; ?>" name="id_familia">
                                    </div>
                                </div>
                            </div>


                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="id_genero">Gênero</label>
                                        <input type="text" class="form-control required" id="id_genero" value="<?php echo ($this->uri->segment(2) == 'cadastrar') ? set_value('id_genero') : $id_genero; ?>" name="id_genero">
                                    </div>
                                </div>
                            
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="id_especie">Espécie</label>
                                        <input type="text" class="form-control required" id="id_especie" value="<?php echo ($this->uri->segment(2) == 'cadastrar') ? set_value('id_especie') : $id_especie; ?>" name="id_especie">
                                    </div>
                                </div>
                            </div>
                                                    

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="nu_biomassa">Biomassa</label>
                                        <input type="text" class="form-control required" id="nu_biomassa" value="<?php echo ($this->uri->segment(2) == 'cadastrar') ? set_value('nu_biomassa') : $nu_biomassa; ?>" name="nu_biomassa">
                                    </div>
                                </div>                              
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="nova">Nova</label>
                                        <input type="text" class="form-control required" id="nova" value="<?php echo ($this->uri->segment(2) == 'cadastrar') ? set_value('nova') : $nova; ?>" name="nova">
                                    </div>
                                </div>                                
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="grau_protecao">Grau de proteção</label>
                                        <input type="text" class="form-control required" id="grau_protecao" value="<?php echo ($this->uri->segment(2) == 'cadastrar') ? set_value('grau_protecao') : $grau_protecao; ?>" name="grau_protecao">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="nu_circunferencia">Circunferência</label>
                                        <input type="text" class="form-control required" id="nu_circunferencia" value="<?php echo ($this->uri->segment(2) == 'cadastrar') ? set_value('nu_circunferencia') : $nu_circunferencia; ?>" name="nu_circunferencia">
                                    </div>
                                </div>                                                                                                
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="nu_altura">Altura</label>
                                        <input type="text" class="form-control required" id="nu_altura" value="<?php echo ($this->uri->segment(2) == 'cadastrar') ? set_value('nu_altura') : $nu_altura; ?>" name="nu_altura">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="nu_altura_total">Altura total</label>
                                        <input type="text" class="form-control required" id="nu_altura_total" value="<?php echo ($this->uri->segment(2) == 'cadastrar') ? set_value('nu_altura_total') : $nu_altura_total; ?>" name="nu_altura_total">
                                    </div>
                                </div>                               
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="nu_altura_fuste">Altura fuste</label>
                                        <input type="text" class="form-control required" id="nova" value="<?php echo ($this->uri->segment(2) == 'cadastrar') ? set_value('nu_altura_fuste') : $nu_altura_fuste; ?>" name="nu_altura_fuste">
                                    </div>
                                </div> 
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="nu_altura_copa">Altura da copa</label>
                                        <input type="text" class="form-control required" id="nu_altura_copa" value="<?php echo ($this->uri->segment(2) == 'cadastrar') ? set_value('nu_altura_copa') : $nu_altura_copa; ?>" name="nu_altura_copa">
                                    </div>
                                </div>                               
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="isolada">Isolada</label>
                                        <input type="text" class="form-control required" id="isolada" value="<?php echo ($this->uri->segment(2) == 'cadastrar') ? set_value('isolada') : $isolada; ?>" name="isolada">
                                    </div>
                                </div> 
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="floracao_frutificacao">Floração/Frutificação</label>
                                        <input type="text" class="form-control required" id="floracao_frutificacao" value="<?php echo ($this->uri->segment(2) == 'cadastrar') ? set_value('floracao_frutificacao') : $floracao_frutificacao; ?>" name="floracao_frutificacao">
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