<?php

$id = '';
$id_parcela = '';
$id_familia = '';
$id_genero = '';
$id_especie = '';
$id_som = '';
$id_fauna_tp_contato = '';
$id_classificacao  = '';
$grau_protecao = '';
$latitude = '';
$longitude = '';

if ($this->uri->segment(2) == 'editar') {
if(!empty($infoAnimal))
{
    foreach ($infoAnimal as $r)
    {
        $id = $r->id;
        $id_parcela = $r->id_parcela;
        $id_familia = $r->id_familia;
        $id_genero = $r->id_genero;
        $id_especie = $r->id_especie;
        $id_som = $r->id_som;
        $id_fauna_tp_contato = $r->id_fauna_tp_contato;
        $id_classificacao = $r->id_classificacao;
        $grau_protecao = $r->grau_protecao;
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
            <i class="fa fa-users"></i> <?php echo ($this->uri->segment(2) == 'cadastrar') ? 'Cadastrar Animais' : 'Editar Animais' ; ?>
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
                            
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="id_familia">Família</label>
                                        <select class="form-control required" id="id_familia" name="id_familia" required>
                                            <option value="" disabled selected>SELECIONE</option>
                                            <?php
                                            if(!empty($infoFamiliasFauna))
                                            {
                                                foreach ($infoFamiliasFauna as $familia)
                                                {
                                                    ?>
                                                <option value="<?php echo $familia->id ?>" <?php if ($this->uri->segment(2) == 'editar' && $familia->id  == $id_familia) { echo 'selected'; } ?>>
                                                    <?php echo $familia->id.' - '.$familia->nome ?>
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
                                        <label for="id_genero">Gênero</label>
                                        <select class="form-control required" id="id_genero" name="id_genero" required>
                                            <option value="" disabled selected>SELECIONE</option>
                                            <?php
                                            if(!empty($infoGenerosFauna))
                                            {
                                                foreach ($infoGenerosFauna as $genero)
                                                {
                                                    ?>
                                                <option value="<?php echo $genero->id ?>" <?php if ($this->uri->segment(2) == 'editar' && $genero->id  == $id_genero) { echo 'selected'; } ?>>
                                                    <?php echo $genero->id.' - '.$genero->nome ?>
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
                                        <label for="id_especie">Espécie</label>
                                        <select class="form-control required" id="id_especie" name="id_especie">
                                        </select>
                                    </div>
                                </div>
                            </div>
                                                    

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="id_som">Som (**campo aberto ou select?**)</label>
                                        <input type="text" class="form-control required" id="id_som" value="<?php echo ($this->uri->segment(2) == 'cadastrar') ? set_value('id_som') : $id_som; ?>" name="id_som">
                                    </div>
                                </div>                              
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="id_fauna_tp_contato">Contato (**campo aberto ou select?**)</label>
                                        <input type="text" class="form-control required" id="nova" value="<?php echo ($this->uri->segment(2) == 'cadastrar') ? set_value('id_fauna_tp_contato') : $id_fauna_tp_contato; ?>" name="id_fauna_tp_contato">
                                    </div>
                                </div>                                
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="id_classificacao">Classificação</label>
                                        <input type="text" class="form-control required" id="id_classificacao" value="<?php echo ($this->uri->segment(2) == 'cadastrar') ? set_value('id_classificacao') : $id_classificacao; ?>" name="id_classificacao">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="grau_protecao">Grau de proteção</label>
                                        <input type="text" class="form-control required" id="grau_protecao" value="<?php echo ($this->uri->segment(2) == 'cadastrar') ? set_value('grau_protecao') : $grau_protecao; ?>" name="grau_protecao">
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

function selectElement(id, valueToSelect) {    
    let element = document.getElementById(id);
    element.value = valueToSelect;
    }

$(document).ready(function(){
    $(":input").inputmask();

    var idFamilia = $('#id_familia').val();
        $.ajax({
            url: '<?php echo base_url(); ?>consultaGeneroFauna/'+idFamilia,
            type: "GET",
            dataType: "json",
            success:function(data) {
                $('select[name="id_genero"]').empty();
                $('select[name="id_genero"]').append('<option value="" disabled selected>SELECIONE</option>');
                $.each(data, function(key, value) {
                    $('select[name="id_genero"]').append('<option value="'+ value.id +'">'+ value.id +' - '+ value.nome +'</option>');
                });
            }
        });

    $('select[name="id_familia"]').on('change', function() {
        var idFamilia = $(this).val();
        if(idFamilia) {
            $.ajax({
                url: '<?php echo base_url(); ?>consultaGeneroFauna/'+idFamilia,
                type: "GET",
                dataType: "json",
                success:function(data) {
                    $('select[name="id_genero"]').empty();
                    $('select[name="id_genero"]').append('<option value="" disabled selected>SELECIONE</option>');
                    $.each(data, function(key, value) {
                        $('select[name="id_genero"]').append('<option value="'+ value.id +'">'+ value.id +' - '+ value.nome +'</option>');
                    });
                }
            });
        }else{
      //      $('select[name="id_genero"]').empty();
       //     $('select[name="id_especie"]').empty();
        }
    });


    var idGenero = $('#id_genero').val();
        $.ajax({
            url: '<?php echo base_url(); ?>consultaEspecieFauna/'+idGenero,
            type: "GET",
            dataType: "json",
            success:function(data) {
                $('select[name="id_especie"]').empty();
                $('select[name="id_especie"]').append('<option value="" disabled selected>SELECIONE</option>');
                $.each(data, function(key, value) {
                    if (value.no_popular !== '') {
                        $('select[name="id_especie"]').append('<option value="'+ value.id +'">'+ value.id +' - '+ value.nome +' (' + value.no_popular + ')</option>');
                    } else {
                        $('select[name="id_especie"]').append('<option value="'+ value.id +'">'+ value.id +' - '+ value.nome +'</option>');
                    }    
                });  
            }
        });

    $('select[name="id_genero"]').on('change', function() {
        var idGenero = $(this).val();
        if(idGenero) {
            $.ajax({
                url: '<?php echo base_url(); ?>consultaEspecieFauna/'+idGenero,
                type: "GET",
                dataType: "json",
                success:function(data) {
                    $('select[name="id_especie"]').empty();
                    $('select[name="id_especie"]').append('<option value="" disabled selected>SELECIONE</option>');
                    $.each(data, function(key, value) {
                        if (value.no_popular !== '') {
                            $('select[name="id_especie"]').append('<option value="'+ value.id +'">'+ value.id +' - '+ value.nome +' (' + value.no_popular + ')</option>');
                        } else {
                            $('select[name="id_especie"]').append('<option value="'+ value.id +'">'+ value.id +' - '+ value.nome +'</option>');
                        }
                    });
                }
            });
        }else{
        //    $('select[name="id_especie"]').empty();
        }
    });

    setTimeout(function(){
        selectElement('id_genero', '<?php echo $id_genero ?>');
    }, 100);
    setTimeout(function(){
        selectElement('id_especie', '<?php echo $id_especie ?>');
    }, 100);                

});

</script>