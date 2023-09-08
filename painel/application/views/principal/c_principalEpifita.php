<?php

$id = '';
$id_parcela = '';
$latitude = '';
$longitude = '';
$id_familia = '';
$id_genero = '';
$id_especie = '';

if ($this->uri->segment(2) == 'editar') {
if(!empty($infoEpifita))
{
    foreach ($infoEpifita as $r)
    {
        $id = $r->id;
        $id_parcela = $r->id_parcela;
        $latitude = $r->latitude;
        $longitude = $r->longitude;
        $id_familia = $r->id_familia;
        $id_genero = $r->id_genero;
        $id_especie = $r->id_especie;
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
                    <form role="form" id="addUser" action="<?php echo ($this->uri->segment(2) == 'cadastrar') ? base_url().'adicionaEpifita' : base_url().'editaEpifita'; ?>" method="post" role="form">
                        <div class="box-body">
                            <div class="row">

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="id_parcela">Parcela</label>
                                        <select id="id_parcela" name="id_parcela" required>
                                            <option></option>
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
                                        <input type="text" class="form-control required" id="latitude" value="<?php echo ($this->uri->segment(2) == 'cadastrar') ? set_value('latitude') : $latitude; ?>" name="latitude">
                                        <input type="hidden" value="<?php echo $id; ?>" name="id" id="id" />
                                    </div>
                                </div>

                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="longitude">Longitude</label>
                                        <input type="text" class="form-control required" id="longitude" value="<?php echo ($this->uri->segment(2) == 'cadastrar') ? set_value('longitude') : $longitude; ?>" name="longitude">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="id_familia">Família</label>
                                        <select id="id_familia" name="id_familia" required>
                                            <option></option>
                                            <?php
                                            if(!empty($infoFamilias))
                                            {
                                                foreach ($infoFamilias as $familia)
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
                                        <select id="id_genero" name="id_genero" required>
                                            <option></option>
                                            <?php
                                            if(!empty($infoGeneros))
                                            {
                                                foreach ($infoGeneros as $genero)
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
                                        <select id="id_especie" name="id_especie">
                                            <option></option>
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

function selectElement(id, valueToSelect) {    
    $(id).val(valueToSelect);
    $(id).trigger('change');
    }

$(document).ready(function(){
    $(":input").inputmask();
    
    $("#longitude").inputmask({
    mask: ['99°M9\'P9.99"S', '[1]79°M9\'S9.99"S'],
    definitions: {
      D: {
        validator: '[nN|sS]',
        cardinality: 1,
        casing: 'upper'
      },
      M: {
        validator: '[0-5]',
        cardinality: 1
      },
      P: {
        validator: '[0-5]',
        cardinality: 1
      },
      7: {
        validator: '[0-7]',
        cardinality: 1
      }
    }
    });

        $("#latitude").inputmask({
        mask: '89°M9\'P9.99"O',
        definitions: {
        D: {
            validator: '[eE|oO]',
            cardinality: 1,
            casing: 'upper'
        },
        M: {
            validator: '[0-5]',
            cardinality: 1
        },
        P: {
            validator: '[0-5]',
            cardinality: 1
        },
        8: {
            validator: '[0-8]',
            cardinality: 1
        }
        }
    });

    $('#id_parcela').select2(
        {
            placeholder: "SELECIONE"
        }
    );

    $('#id_familia').select2(
        {
            placeholder: "SELECIONE"
        }
    );

    $('#id_genero').select2(
        {
            placeholder: "SELECIONE"
        }
    );

    $('#id_especie').select2(
        {
            placeholder: "SELECIONE"
        }
    );

    var idFamilia = $('#id_familia').val();
        $.ajax({
            url: '<?php echo base_url(); ?>consultaGenero/'+idFamilia,
            type: "GET",
            dataType: "json",
            success:function(data) {
                $("#id_genero").select2("val", null);
                $("#id_especie").select2("val", null);
                $.each(data, function(key, value) {
                    $('select[name="id_genero"]').append('<option value="'+ value.id +'">'+ value.id +' - '+ value.nome +'</option>');
                });
            }
        });

    $('select[name="id_familia"]').on('change', function() {
        $('select[name="id_familia"]').on('click', function() {
            var idFamilia = $(this).val();
            if(idFamilia) {
                $.ajax({
                    url: '<?php echo base_url(); ?>consultaGenero/'+idFamilia,
                    type: "GET",
                    dataType: "json",
                    success:function(data) {
                        $("#id_genero").select2("val", null);
                        $("#id_especie").select2("val", null);
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
    });

    var idGenero = $('#id_genero').val();
        $.ajax({
            url: '<?php echo base_url(); ?>consultaEspecie/'+idGenero,
            type: "GET",
            dataType: "json",
            success:function(data) {
                $("#id_especie").select2("val", null);
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
        $('select[name="id_genero"]').on('click', function() {
            var idGenero = $(this).val();
            if(idGenero) {
                $.ajax({
                    url: '<?php echo base_url(); ?>consultaEspecie/'+idGenero,
                    type: "GET",
                    dataType: "json",
                    success:function(data) {
                        $("#id_especie").select2("val", null);
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
    });

    setTimeout(function(){
        selectElement('#id_genero', '<?php echo $id_genero ?>');
    }, 200);
    setTimeout(function(){
        selectElement('#id_especie', '<?php echo $id_especie ?>');
    }, 200); 

});

</script>