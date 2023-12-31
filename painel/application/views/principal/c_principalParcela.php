<?php


$id = '';
$id_propriedade = '';
$nu_ano_emissao = '';
$nu_parcela = '';
//$id_estagio_regeneracao = '';
//$id_grau_epifitismo = '';
$id_tipo_bioma = '';
$id_tipo_parcela = '';
$tamanho_parcela = '';
$carbono_vegetacao = '';
$biomassa_vegetacao_total = '';
$biomassa_arbustiva = '';
$biomassa_hectare = '';
$carbono_total = '';
$latitude = '';
$longitude = '';


if ($this->uri->segment(2) == 'editar') {
if(!empty($infoParcela))
{
    foreach ($infoParcela as $r)
    {
        $id = $r->id;
        $id_propriedade = $r->id_propriedade;
        $nu_ano_emissao = $r->nu_ano_emissao;
        $nu_parcela =  $r->nu_parcela;
        //$id_estagio_regeneracao = $r->id_estagio_regeneracao;
        //$id_grau_epifitismo = $r->id_grau_epifitismo;
        $id_tipo_bioma = $r->id_tipo_bioma;
        $id_tipo_parcela = $r->id_tipo_parcela;
        $tamanho_parcela = $r->tamanho_parcela;
        $carbono_vegetacao = $r->carbono_vegetacao;
        $biomassa_vegetacao_total = $r->biomassa_vegetacao_total;
        $biomassa_arbustiva = $r->biomassa_arbustiva;
        $biomassa_hectare = $r->biomassa_hectare;
        $carbono_total = $r->carbono_total;
        $latitude = str_replace(array('"','°'), "", $r->latitude_gms);
        $longitude = str_replace(array('"','°'), "", $r->longitude_gms);
		
    }
}
}

?>

<style>
    .content-wrapper{
      height:1210px!important;
    }
</style>    

<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            <i class="fa fa-users"></i> <?php echo ($this->uri->segment(2) == 'cadastrar') ? 'Cadastrar Parcelas' : 'Editar Parcela nº '.$nu_parcela ; ?>
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
                    <form role="form" id="addUser" action="<?php echo ($this->uri->segment(2) == 'cadastrar') ? base_url().'adicionaParcela' : base_url().'editaParcela'; ?>" method="post" role="form">
                        <div class="box-body">
                            <div class="row">

                                <!-- VARCHAR/INTEGER/FLOAT -->
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="id_propriedade">Propriedade</label>
                                        <select id="id_propriedade" name="id_propriedade" <?= ($this->uri->segment(2) == 'cadastrar')?'':'disabled'; ?>>
                                            <option></option>
                                            <?php
                                            if(!empty($infoPropriedades))
                                            {
                                                foreach ($infoPropriedades as $propriedade)
                                                {
                                                    ?>
                                                <option value="<?php echo $propriedade->id ?>" <?php if ($this->uri->segment(2) == 'editar' && $propriedade->id  == $id_propriedade) { echo 'selected'; } ?>>
                                                    <?php echo $propriedade->id.' - '.$propriedade->no_propriedade ?>
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
                                        <label for="nu_ano_emissao">Ano emissão</label>
                                        <input type="text" class="form-control required" value="<?php echo ($this->uri->segment(2) == 'cadastrar') ? set_value('nu_ano_emissao') : $nu_ano_emissao ; ?>" id="nu_ano_emissao" name="nu_ano_emissao">
                                        <input type="hidden" value="<?php echo $id; ?>" name="id" id="id" />
                                    </div>
                                </div>
                                        
                            </div>

                         <!--   <div class="row">

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="id_estagio_regeneracao">Estágio Regeneração</label>
                                        <select id="id_estagio_regeneracao" name="id_estagio_regeneracao" required>
                                            <option></option>
                                            <?php
                                            /*if(!empty($infoEstagiosRegeneracao))
                                            {
                                                foreach ($infoEstagiosRegeneracao as $registro)
                                                {
                                                    ?>
                                                <option value="<?php echo $registro->id ?>" <?php if ($this->uri->segment(2) == 'editar' && $registro->id  == $id_estagio_regeneracao) { echo 'selected'; } ?>>
                                                    <?php echo $registro->id.' - '.$registro->nome ?>
                                                </option>
                                                <?php
                                                }
                                            }*/
                                            ?>
                                        </select>
                                    </div>
                                </div>
                                
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="id_grau_epifitismo">Grau Epifitismo</label>
                                        <select id="id_grau_epifitismo" name="id_grau_epifitismo" required>
                                            <option></option>
                                            <?php
                                            /*if(!empty($infoGrausEpifitismo))
                                            {
                                                foreach ($infoGrausEpifitismo as $registro)
                                                {
                                                    ?>
                                                <option value="<?php echo $registro->id ?>" <?php if ($this->uri->segment(2) == 'editar' && $registro->id  == $id_grau_epifitismo) { echo 'selected'; } ?>>
                                                    <?php echo $registro->id.' - '.$registro->nome ?>
                                                </option>
                                                <?php
                                                }
                                            }*/
                                            ?>
                                        </select>
                                    </div>
                                </div>                            

                            </div> -->

                            <div class="row">
     
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="id_tipo_bioma">Tipo de Bioma</label>
                                        <select id="id_tipo_bioma" name="id_tipo_bioma" required>
                                            <option></option>
                                            <?php
                                            if(!empty($infoTiposBioma))
                                            {
                                                foreach ($infoTiposBioma as $registro)
                                                {
                                                    ?>
                                                <option value="<?php echo $registro->id ?>" <?php if ($this->uri->segment(2) == 'editar' && $registro->id  == $id_tipo_bioma) { echo 'selected'; } ?>>
                                                    <?php echo $registro->id.' - '.$registro->nome ?>
                                                </option>
                                                <?php
                                                }
                                            }
                                            ?>
                                        </select>
                                    </div>
                                </div>

                               <!-- <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="tipo_bioma">Tipo de bioma</label>
                                        <input type="text" class="form-control required" value="<?php //echo ($this->uri->segment(2) == 'cadastrar') ? set_value('tipo_bioma') : $tipo_bioma; ?>" id="tipo_bioma" name="tipo_bioma">
                                    </div>
                                </div> -->

                                <div class="col-md-6">
                                    <div class="form-group">

                                        <label for="id_tipo_parcela">Tipo de Parcela</label>
                                        <select id="id_tipo_parcela" name="id_tipo_parcela" required>
                                            <option></option>
                                            <?php
                                            if(!empty($infoTiposParcela))
                                            {
                                                foreach ($infoTiposParcela as $registro)
                                                {
                                                    ?>
                                                <option value="<?php echo $registro->id ?>" <?php if ($this->uri->segment(2) == 'editar' && $registro->id  == $id_tipo_parcela) { echo 'selected'; } ?>>
                                                    <?php echo $registro->id.' - '.$registro->nome ?>
                                                </option>
                                                <?php
                                                }
                                            }
                                            ?>
                                        </select> 
                                    </div>
                                </div>

                               <!-- <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="tipo_parcela">Tipo de parcela</label>
                                        <input type="text" class="form-control required" value="<?php //echo ($this->uri->segment(2) == 'cadastrar') ? set_value('tipo_parcela') : $tipo_parcela; ?>" id="tipo_parcela" name="tipo_parcela">
                                    </div>
                                </div>-->                        
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="tamanho_parcela">Tamanho de parcela (m2)</label>
                                        <input type="text" class="form-control required" value="<?php echo ($this->uri->segment(2) == 'cadastrar') ? set_value('tamanho_parcela') : $tamanho_parcela; ?>" id="tamanho_parcela" name="tamanho_parcela">
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="carbono_vegetacao">Carbono vegetação</label>
                                        <input type="text" class="form-control 2decimais" value="<?php echo ($this->uri->segment(2) == 'cadastrar') ? set_value('carbono_vegetacao') : $carbono_vegetacao; ?>" id="carbono_vegetacao" name="carbono_vegetacao" disabled>
                                    </div>
                                </div>                                
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="biomassa_vegetacao_total">Biomassa vegetação total</label>
                                        <input type="text" class="form-control 2decimais" value="<?php echo ($this->uri->segment(2) == 'cadastrar') ? set_value('biomassa_vegetacao_total') : $biomassa_vegetacao_total; ?>" id="biomassa_vegetacao_total" name="biomassa_vegetacao_total" disabled>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="biomassa_arbustiva">Biomassa arbustiva</label>
                                        <input type="text" class="form-control 2decimais" value="<?php echo ($this->uri->segment(2) == 'cadastrar') ? set_value('biomassa_arbustiva') : $biomassa_arbustiva; ?>" id="biomassa_arbustiva" name="biomassa_arbustiva" disabled>
                                    </div>
                                </div>                                
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="biomassa_hectare">Biomassa hectare</label>
                                        <input type="text" class="form-control ....2decimais" value="<?php echo ($this->uri->segment(2) == 'cadastrar') ? set_value('biomassa_hectare') : $biomassa_hectare; ?>" id="biomassa_hectare" name="biomassa_hectare" disabled>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="carbono_total">Carbono total</label>
                                        <input type="text" class="form-control 2decimais" value="<?php echo ($this->uri->segment(2) == 'cadastrar') ? set_value('carbono_total') : $carbono_total; ?>" id="carbono_total" name="carbono_total" disabled>
                                    </div>
                                </div>   
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="latitude">Latitude</label>
                                        <input type="text" class="form-control required" id="latitude" value="<?php echo ($this->uri->segment(2) == 'cadastrar') ? set_value('latitude') : $latitude; ?>" name="latitude">
                                        <input type="hidden" value="<?php echo $id; ?>" name="id" id="id" />
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="longitude">Longitude</label>
                                        <input type="text" class="form-control required" id="longitude" value="<?php echo ($this->uri->segment(2) == 'cadastrar') ? set_value('longitude') : $longitude; ?>" name="longitude">
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
        <iframe style="width:82%;height:500px;border-top: 3px solid #3c8dbc;border-left:none" src="<?php echo base_url(); ?>admin/parcelas/<?= $this->uri->segment(2) == 'cadastrar'?$nextIdParcela->id:$id ?>" title="" ></iframe>
    </section>
</div>

<script src="<?php echo base_url(); ?>assets/js/<?php echo ($this->uri->segment(2) == 'cadastrar') ?'addUser.js':'addUserEditar.js';?>" type="text/javascript"></script>
<script>
$(document).ready(function(){
	
    $(":input").inputmask();
    
    $("#longitude").inputmask({
    mask: ['99°M9\'P9.99"D', '[1]79°M9\'S9.99"D'],
    definitions: {
      D: {
        validator: '[eE|wW]',
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
    mask: '89°M9\'P9.99"D',
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
        8: {
            validator: '[0-8]',
            cardinality: 1
        }
        }
    });
	
    $(".2decimais").inputmask({
        alias: "decimal",
        digits: "2",
        rightAlign: false,
        suffix: "",
        integerDigits: 8,
        digitsOptional: true,
        allowPlus: true,
        allowMinus: true,
        placeholder: "0",
        min: -1000,
        max: 1000,
        numericInput: true
    });
    
    $('#id_propriedade').select2(
        {
            placeholder: 'SELECIONE'
        }
    );

    /*$('#id_estagio_regeneracao').select2(
        {
            placeholder: 'SELECIONE'
        }
    );
    $('#id_grau_epifitismo').select2(
        {
            placeholder: 'SELECIONE'
        }
    );*/
    $('#id_tipo_bioma').select2(
        {
            placeholder: 'SELECIONE'
        }
    );
    $('#id_tipo_parcela').select2(
        {
            placeholder: 'SELECIONE'
        }
    );

    $("#nu_ano_emissao").datepicker({
     format: "yyyy",
     viewMode: "years", 
     minViewMode: "years",
     autoclose:true
    });

});
</script>