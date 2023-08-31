<?php

$id = '';
$id_propriedade = '';
$nu_ano_emissao = '';
$estagio_regeneracao = '';
$grau_epifitismo = '';
$tipo_bioma = '';
$tipo_parcela = '';
$tamanho_parcela = '';
$carbono_vegetacao = '';
$biomassa_vegetacao_total = '';
$biomassa_arbustiva = '';
$biomassa_hectare = '';
$carbono_total = '';

if ($this->uri->segment(2) == 'editar') {
if(!empty($infoParcela))
{
    foreach ($infoParcela as $r)
    {
        $id = $r->id;
        $id_propriedade = $r->id_propriedade;
        $nu_ano_emissao = $r->nu_ano_emissao;
        $estagio_regeneracao = $r->estagio_regeneracao;
        $grau_epifitismo = $r->grau_epifitismo;
        $tipo_bioma = $r->tipo_bioma;
        $tipo_parcela = $r->tipo_parcela;
        $tamanho_parcela = $r->tamanho_parcela;
        $carbono_vegetacao = $r->carbono_vegetacao;
        $biomassa_vegetacao_total = $r->biomassa_vegetacao_total;
        $biomassa_arbustiva = $r->biomassa_arbustiva;
        $biomassa_hectare = $r->biomassa_hectare;
        $carbono_total = $r->carbono_total;
    }
}
}

?>

<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
            <i class="fa fa-users"></i> <?php echo ($this->uri->segment(2) == 'cadastrar') ? 'Cadastrar Parcelas' : 'Editar Parcelas' ; ?>
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
                                        <select class="form-control required" id="id_propriedade" name="id_propriedade" required>
                                            <option value="" disabled selected>SELECIONE</option>
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
                                        <label for="ds_nome">Ano emissão</label>
                                        <input type="text" class="form-control required" value="<?php echo ($this->uri->segment(2) == 'cadastrar') ? set_value('nu_ano_emissao') : $nu_ano_emissao ; ?>" id="nu_ano_emissao" name="nu_ano_emissao">
                                        <input type="hidden" value="<?php echo $id; ?>" name="id" id="id" />
                                    </div>
                                </div>
                                        
                            </div>

                            <div class="row">

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="estagio_regeneracao">Estágio Regeneração</label>
                                        <br/>
                                        <select id="estagio_regeneracao" name="estagio_regeneracao" data-placeholder="SELECIONE">
                                            <option></option>
                                            <option value="1">Nativa</option>
                                        </select>
                                    </div>
                                </div>

                            <!--    <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="estagio_regeneracao">Estágio Regeneração</label>
                                        <input type="text" class="form-control required" id="estagio_regeneracao" value="<?php //echo ($this->uri->segment(2) == 'cadastrar') ? set_value('estagio_regeneracao') : $estagio_regeneracao; ?>" name="estagio_regeneracao">
                                    </div>
                                </div> -->
                                
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="grau_epifitismo">Grau epifitismo</label>
                                        <br/>
                                        <select id="grau_epifitismo" name="grau_epifitismo" data-placeholder="SELECIONE">
                                            <option></option>
                                            <option value="1">Alto</option>
                                            <option value="2">Médio</option>
                                            <option value="3">Baixo</option>
                                        </select>
                                    </div>
                                </div>

                               <!-- <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="grau_epifitismo">Grau epifitismo</label>
                                        <input type="text" class="form-control required" value="<?php //echo ($this->uri->segment(2) == 'cadastrar') ? set_value('grau_epifitismo') : $grau_epifitismo; ?>" id="grau_epifitismo" name="grau_epifitismo">
                                    </div>
                                </div> -->

                            </div>

                            <div class="row">

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="tipo_bioma">Tipo de bioma</label>
                                        <br/>
                                        <select id="tipo_bioma" name="tipo_bioma" data-placeholder="SELECIONE">
                                            <option></option>
                                            <option value="1">Floresta Amazônica</option>
                                            <option value="2">Cerrado</option>
                                            <option value="3">Mata Atlântica</option>
                                            <option value="4">Caatinga</option>
                                            <option value="5">Pantanal</option>
                                            <option value="6">Pampa</option>
                                            <option value="7">Mata de Araucárias</option>
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
                                        <label for="tipo_parcela">Tipo de parcela</label>
                                        <br/>
                                        <select id="tipo_parcela" name="tipo_parcela" data-placeholder="SELECIONE">
                                            <option></option>
                                            <option value="1">Quadrada</option>
                                            <option value="2">Redonda</option>
                                            <option value="3">Triangular</option>
                                            <option value="4">Retangular</option>
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
                                        <label for="tamanho_parcela">Tamanho de parcela</label>
                                        <input type="text" class="form-control required" value="<?php echo ($this->uri->segment(2) == 'cadastrar') ? set_value('tamanho_parcela') : $tamanho_parcela; ?>" id="tamanho_parcela" name="tamanho_parcela">
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="carbono_vegetacao">Carbono vegetação</label>
                                        <input type="text" class="form-control required 2decimais" value="<?php echo ($this->uri->segment(2) == 'cadastrar') ? set_value('carbono_vegetacao') : $carbono_vegetacao; ?>" id="carbono_vegetacao" name="carbono_vegetacao">
                                    </div>
                                </div>                                
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="biomassa_vegetacao_total">Biomassa vegetação total</label>
                                        <input type="text" class="form-control required 2decimais" value="<?php echo ($this->uri->segment(2) == 'cadastrar') ? set_value('biomassa_vegetacao_total') : $biomassa_vegetacao_total; ?>" id="biomassa_vegetacao_total" name="biomassa_vegetacao_total">
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="biomassa_arbustiva">Biomassa arbustiva</label>
                                        <input type="text" class="form-control required 2decimais" value="<?php echo ($this->uri->segment(2) == 'cadastrar') ? set_value('biomassa_arbustiva') : $biomassa_arbustiva; ?>" id="biomassa_arbustiva" name="biomassa_arbustiva">
                                    </div>
                                </div>                                
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="biomassa_hectare">Biomassa hectare</label>
                                        <input type="text" class="form-control required 2decimais" value="<?php echo ($this->uri->segment(2) == 'cadastrar') ? set_value('biomassa_hectare') : $biomassa_hectare; ?>" id="biomassa_hectare" name="biomassa_hectare">
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="carbono_total">Carbono total</label>
                                        <input type="text" class="form-control required 2decimais" value="<?php echo ($this->uri->segment(2) == 'cadastrar') ? set_value('carbono_total') : $carbono_total; ?>" id="carbono_total" name="carbono_total">
                                        <input type="text" class="custom2" /><br>
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
    $(".custom2").inputmask({
        rightAlign: true,
        'groupSeparator': '.',
        'autoGroup': true
    });
    
    $('#estagio_regeneracao').select2(
        {
            placeholder: "SELECIONE"
        }
    );
    $('#grau_epifitismo').select2(
        {
            placeholder: "SELECIONE"
        }
    );
    $('#tipo_bioma').select2(
        {
            placeholder: "SELECIONE"
        }
    );
    $('#tipo_parcela').select2(
        {
            placeholder: "SELECIONE"
        }
    );
});
</script>