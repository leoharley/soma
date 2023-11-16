<?php

$id = '';
$id_parcela = '';
$id_familia = '';
$id_genero = '';
$id_especie = '';
$id_tipo_observacao = '';
$id_classificacao  = '';
$id_grau_protecao = '';
$latitude = '';
$longitude = '';
$descricao = '';

if ($this->uri->segment(2) == 'editar') {
if(!empty($infoAnimal))
{
    foreach ($infoAnimal as $r)
    {
        $id = $r->id;
        $id_parcela = $r->id_parcela;
        $id_familia = $r->id_familia;
        $no_familia = $r->no_familia;
        $id_genero = $r->id_genero;
        $no_genero = $r->no_genero;
        $id_especie = $r->id_especie;
        $no_especie = $r->no_especie;
        $id_tipo_observacao = $r->id_tipo_observacao;
        $id_classificacao = $r->id_classificacao;
        $id_grau_protecao = $r->id_grau_protecao;
        $latitude = $r->latitude_campo_gms;
        $longitude = $r->longitude_campo_gms;
        $descricao = $r->descricao;
    }
}
}

?>

<style>
    .content-wrapper{
      height:1140px!important;
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
                                        <select id="id_parcela" name="id_parcela" <?php echo ($this->uri->segment(2) == 'cadastrar') ? '' : 'disabled'; ?>>
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
                                        <input type="text" class="form-control required" id="latitude" value="<?php echo ($this->uri->segment(2) == 'cadastrar') ? set_value('latitude') : $latitude; ?>" name="latitude" <?php echo ($this->uri->segment(2) == 'cadastrar') ? '' : 'disabled'; ?>>
                                        <input type="hidden" value="<?php echo $id; ?>" name="id" id="id" />
                                    </div>
                                </div>

                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="longitude">Longitude</label>
                                        <input type="text" class="form-control required" id="longitude" value="<?php echo ($this->uri->segment(2) == 'cadastrar') ? set_value('longitude') : $longitude; ?>" name="longitude" <?php echo ($this->uri->segment(2) == 'cadastrar') ? '' : 'disabled'; ?>>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="id_familia">Família</label>
                                        <input type="text" class="form-control" id="id_familia" value="<?php echo ($this->uri->segment(2) == 'cadastrar') ? set_value('id_familia') : $id_familia.' - '.$no_familia; ?>" name="id_familia">
                                    </div>
                                </div>
                            
                              <!--  <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="id_familia">Família</label>
                                        <select id="id_familia" name="id_familia" disabled>
                                            <option></option>
                                            <?php
                                            /*if(!empty($infoFamiliasFauna))
                                            {
                                                foreach ($infoFamiliasFauna as $familia)
                                                {
                                                    ?>
                                                <option value="<?php echo $familia->id ?>" <?php if ($this->uri->segment(2) == 'editar' && $familia->id  == $id_familia) { echo 'selected'; } ?>>
                                                    <?php echo $familia->id.' - '.$familia->nome ?>
                                                </option>
                                                <?php
                                                }
                                            }*/
                                            ?>
                                        </select>
                                    </div>
                                </div> -->
                            </div>


                            <div class="row">

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="id_genero">Gênero</label>
                                        <input type="text" class="form-control" id="id_genero" value="<?php echo ($this->uri->segment(2) == 'cadastrar') ? set_value('id_genero') : $id_genero.' - '.$no_genero; ?>" name="id_genero">
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="id_especie">Espécie</label>
                                        <input type="text" class="form-control" id="id_especie" value="<?php echo ($this->uri->segment(2) == 'cadastrar') ? set_value('id_especie') : $id_especie.' - '.$no_especie; ?>" name="id_especie">
                                    </div>
                                </div>

                              <!--  <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="id_genero">Gênero</label>
                                        <select id="id_genero" name="id_genero" disabled>
                                        <option></option>
                                        </select>
                                    </div>
                                </div> -->

                              <!--  <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="id_especie">Espécie</label>                                    
                                        <select id="id_especie" name="id_especie" disabled>
                                        <option></option>
                                        </select>
                                    </div>
                                </div> -->
                            </div>
                                                    

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="id_tipo_observacao">Tipo de observação</label>
                                        <select id="id_tipo_observacao" name="id_tipo_observacao">
                                            <option></option>
                                            <?php
                                            if(!empty($infoTiposObservacao))
                                            {
                                                foreach ($infoTiposObservacao as $registro)
                                                {
                                                    ?>
                                                <option value="<?php echo $registro->id ?>" <?php if ($this->uri->segment(2) == 'editar' && $registro->id  == $id_tipo_observacao) { echo 'selected'; } ?>>
                                                    <?php echo $registro->id.' - '.$registro->nome ?>
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
                                        <label for="id_classificacao">Classificação</label>
                                        <select id="id_classificacao" name="id_classificacao">
                                            <option></option>
                                            <?php
                                            if(!empty($infoFaunaClassificacoes))
                                            {
                                                foreach ($infoFaunaClassificacoes as $registro)
                                                {
                                                    ?>
                                                <option value="<?php echo $registro->id ?>" <?php if ($this->uri->segment(2) == 'editar' && $registro->id  == $id_classificacao) { echo 'selected'; } ?>>
                                                    <?php echo $registro->id.' - '.$registro->nome ?>
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
                                        <label for="id_grau_protecao">Grau de proteção</label>
                                        <select id="id_grau_protecao" name="id_grau_protecao">
                                            <option></option>
                                            <?php
                                            if(!empty($infoGrausProtecao))
                                            {
                                                foreach ($infoGrausProtecao as $registro)
                                                {
                                                    ?>
                                                <option value="<?php echo $registro->id ?>" <?php if ($this->uri->segment(2) == 'editar' && $registro->id  == $id_grau_protecao) { echo 'selected'; } ?>>
                                                    <?php echo $registro->id.' - '.$registro->nome ?>
                                                </option>
                                                <?php
                                                }
                                            }
                                            ?>
                                        </select>                                        
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <label for="descricao">Descrição</label>
                                        <div class="form-group">                                        
                                            <textarea id="descricao" name="descricao" rows="5" cols="41" style="text-align:left;resize: none;">
                                            <?php echo ($this->uri->segment(2) == 'cadastrar') ? set_value('descricao') : $descricao; ?>
                                            </textarea>                                            
                                        </div>
                                </div>
                            </div> 
                        </div>
                        <!-- /.box-body -->

                        <div class="box-footer">
                            <!--<input type="submit" class="btn btn-primary" value="Salvar"/>
                            <input type="reset" class="btn btn-default" value="Limpar" />-->
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

        <section class="content-header">
        <h1><i class="fa fa-paperclip"></i> Gerenciador de Anexos</h1>
        </section>
        <br/>   
        <iframe style="width:82%;height:500px;border-top: 3px solid #3c8dbc;border-left:none" src="<?php echo base_url(); ?>admin/animais/<?= $this->uri->segment(2) == 'cadastrar'?$nextIdAnimal->id:$id ?>" title="" ></iframe>
    </section>
</div>
<script src="<?php echo base_url(); ?>assets/js/<?php echo ($this->uri->segment(2) == 'cadastrar') ?'addUser.js':'addUserEditar.js';?>" type="text/javascript"></script>
<script>
function selectElement(id, valueToSelect) {    
    $(id).val(valueToSelect);
    $(id).trigger('change');
    }

$(document).ready(function(){
    /*$("#longitude").inputmask({
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
  });*/

    $('#id_parcela').select2(
        {
            placeholder: "SELECIONE"
        }
    );

    /*$('#id_familia').select2(
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
    );*/

    $('#id_tipo_observacao').select2(
        {
            placeholder: "SELECIONE"
        }
    );

    $('#id_classificacao').select2(
        {
            placeholder: "SELECIONE"
        }
    );

    $('#id_grau_protecao').select2(
        {
            placeholder: "SELECIONE"
        }
    );

   /* var idFamilia = $('#id_familia').val();
        $.ajax({
            url: '<?php //echo base_url(); ?>consultaGeneroFauna/'+idFamilia,
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
                    url: '<?php //echo base_url(); ?>consultaGeneroFauna/'+idFamilia,
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
            url: '<?php //echo base_url(); ?>consultaEspecieFauna/'+idGenero,
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
                    url: '<?php //echo base_url(); ?>consultaEspecieFauna/'+idGenero,
                    type: "GET",
                    dataType: "json",
                    success:function(data) {
                        $("#id_especie").select2("val", null);
                        $("#id_especie").empty();
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
        selectElement('#id_genero', '<?php //echo $id_genero ?>');
    }, 1000);
    setTimeout(function(){
        selectElement('#id_especie', '<?php //echo $id_especie ?>');
    }, 1000);  */

});

</script>