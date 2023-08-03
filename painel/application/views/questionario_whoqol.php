<div class="content-wrapper">
  <!-- Content Header (Page header) -->
  <section class="content-header">
    <h1>
      <i class="fa fa-users"></i> Formulário WhoQol
    </h1>
  </section>
  <section class="content" style="height:1800px">
    <div class="col-xs-12">
      <div class="box">
        <div class="box-header">
          <div class="box-tools">
          </div>
        </div>
        <!-- /.box-header -->
        <div class="box-body table-responsive no-padding">
          <?php
                    $this->load->helper('form');
                    $error = $this->session->flashdata('error');
                    if($error)
                    {
                ?>
            <div class="alert alert-danger alert-dismissable">
              <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
              <?php echo $this->session->flashdata('error'); ?>
            </div>
            <?php } ?>
            <?php  
                    $success = $this->session->flashdata('success');
                    if($success)
                    {
                ?>
            <div class="alert alert-success alert-dismissable">
              <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
              <?php echo $this->session->flashdata('success'); ?>
            </div>
            <?php } ?>
            <div class="panel-body">
              <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                <thead>
                  <tr>
                    <th> Aluno</th>              
                    <th> Cpf </th>
                    <th style="width:15%"> Você recebe dos outros o apoio de que necessita? </th>
                    <th style="width:15%"> Como você avaliaria sua qualidade de vida? </th>
                    <th style="width:15%"> Quão satisfeito(a) você está com a sua saúde? </th>
                    <th style="width:15%"> Em que medida você acha que sua dor (física) impede você de fazer o que você precisa? </th>
                    <th style="width:15%"> O quanto você precisa de algum tratamento médico para levar sua vida diária? </th>
                    <th style="width:15%"> O quanto você aproveita a vida? </th>
                    <th style="width:15%"> Em que medida você acha que a sua vida tem sentido? </th>
                    <th style="width:15%"> O quanto você consegue se concentrar? </th>
                    <th style="width:15%"> Quão seguro(a) você se sente em sua vida diária? </th>
                    <th style="width:15%"> Quão saudável é o seu ambiente físico (clima, barulho, poluição, atrativos)? </th>
                    <th style="width:15%"> Você tem energia suficiente para seu dia-a-dia? </th>
                    <th style="width:15%"> Você é capaz de aceitar sua aparência física? </th>
                    <th style="width:15%"> Você tem dinheiro suficiente para satisfazer suas necessidades? </th>
                    <th style="width:15%"> Quão disponíveis para você estão as informações que precisa no seu dia-a-dia? </th>
                    <th style="width:15%"> Em que medida você tem oportunidades de atividade de lazer? </th>
                    <th style="width:15%"> Quão bem você é capaz de se locomover? </th>
                    <th style="width:15%"> Quão satisfeito(a) você está com o seu sono? </th>
                    <th> Ações </th>
                  </tr>
                </thead>
                <tbody>
                  
                    <tr>
                    <td>
                        Leonardo
                      </td>
                      <td>
                        89090888187
                      </td>
                      <td>
                      Médio
                      </td>
                      <td>
                      Muito
                      </td>
                      <td>
                      Completamente
                      </td>
                      <td>
                      Médio
                      </td>
                      <td>
                      Muito pouco
                      </td>
                      <td>
                      Muito
                      </td>
                      <td>
                      Muito
                      </td>
                      <td>
                      Muito
                      </td>
                      <td>
                      Muito
                      </td>
                      <td>
                      Muito
                      </td>
                      <td>
                      Muito
                      </td>
                      <td>
                      Muito
                      </td>
                      <td>
                      Muito
                      </td>
                      <td>
                      Muito
                      </td>
                      <td>
                      Muito
                      </td>
                      <td>
                      Muito
                      </td>
                      <td>
                      Muito
                      </td>
                      <td class="text-center">
                        <a class="btn btn-sm btn-info" href="" title="Editar">
                          <i class="fa fa-pencil"></i>
                        </a>
                        <a class="btn btn-sm btn-danger deleteUser" href="" data-userid=""
                          title="Deletar">
                          <i class="fa fa-trash"></i>
                        </a>
                        <a class="btn btn-sm btn-primary" href="" title="Finalizar tarefa">
                          <i class="fa fa-check-circle"></i>
                        </a>
                      </td>
                    </tr>
                   
                </tbody>
              </table>
            </div>
        </div>
        <!-- /.box-body -->
      </div>
      <!-- /.box -->
    </div>
</div>
</section>
</div>


