<?php

$id = '';
$id_parcela = '';
$descricao = '';
$latitude = '';
$longitude = '';

if ($this->uri->segment(2) == 'editar') {
if(!empty($infoHidrologia))
{
    foreach ($infoHidrologia as $r)
    {
        $id = $r->id;
        $id_parcela = $r->id_parcela;
        $descricao = $r->descricao;
        $latitude = $r->latitude_gms;
        $longitude = $r->longitude_gms;
    }
}
}

?>

<style>
    .content-wrapper{
      height:990px!important;
    }
</style>    

<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            <i class="fa fa-users"></i> <?php echo ($this->uri->segment(2) == 'cadastrar') ? 'Cadastrar Hidrologia' : 'Editar Hidrologia' ; ?>
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
                    <form role="form" id="addUser" action="<?php echo ($this->uri->segment(2) == 'cadastrar') ? base_url().'adicionaHidrologia' : base_url().'editaHidrologia'; ?>" method="post" role="form">
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
                            </div>

                            <div class="row">     
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="descricao">Descrição</label>
                                        <textarea id="descricao" name="descricao" rows="5" cols="38" style="resize: none;">
                                        <?php echo ($this->uri->segment(2) == 'cadastrar') ? set_value('descricao') : $descricao; ?>
                                        </textarea>
                                        <input type="hidden" value="<?php echo $id; ?>" name="id" id="id" />
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

        <section class="content-header">
        <h1><i class="fa fa-paperclip"></i> Gerenciador de Anexos</h1>
        </section>
        <br/>   
        <iframe style="width:82%;height:500px;border-top: 3px solid #3c8dbc;border-left:none" src="<?php echo base_url(); ?>admin/hidrologia/<?= $this->uri->segment(2) == 'cadastrar'?$nextIdHidrologia->id:$id ?>" title="" ></iframe>
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
});

</script>