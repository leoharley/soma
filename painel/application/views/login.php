<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <title>SOMA SUSTENTABILIDADE - Login do Painel Administrativo</title>
  <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
  <link href="<?php echo base_url(); ?>assets/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css"
  />
  <link href="<?php echo base_url(); ?>assets/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body class="login-page" style="background-image: url('<?php echo base_url(); ?>assets/images/bg.jpg'); background-size: cover;">
  <div class="login-box" style="margin-top:60px">
    <div class="login-logo">
      <img src="<?php echo base_url(); ?>assets/images/logo2.png" style="width:60%;height:auto">
      <br/>
      <a href="#">
       <span style="color:white;font-size:0.8em"><b>Panel Administrativo</b></span></a>
    </div>
    <!-- /.login-logo -->
    <div class="login-box-body">
      <!--<p class="login-box-msg">Login</p> -->
      <?php $this->load->helper('form'); ?>
      <div class="row">
        <div class="col-md-12">
          <?php echo validation_errors('<div class="alert alert-danger alert-dismissable">', ' <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button></div>'); ?>
        </div>
      </div>
      <?php
        $this->load->helper('form');
        $error = $this->session->flashdata('error');
        if($error)
        {
            ?>
        <div class="alert alert-danger alert-dismissable">
          <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
          <?php echo $error; ?>
        </div>
        <?php }
        $success = $this->session->flashdata('success');
        if($success)
        {
            ?>
        <div class="alert alert-success alert-dismissable">
          <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
          <?php echo $success; ?>
        </div>
        <?php } ?>

        <form action="<?php echo base_url(); ?>loginMe" method="post">
          
          <div class="form-group has-feedback" style="margin-top:20px!important;">
            <input type="cpf" class="form-control" placeholder="CPF" name="cpf" required />
            <span class="glyphicon glyphicon-modal-window form-control-feedback"></span>
          </div>
          <div class="form-group has-feedback">
            <input type="password" class="form-control" placeholder="Senha" name="senha" required />
            <span class="glyphicon glyphicon-lock form-control-feedback"></span>
          </div>
          <div class="row">
            <div class="col-xs-8">
              <!-- <div class="checkbox icheck">
                <label>
                  <input type="checkbox"> Remember Me
                </label>
              </div>  -->
            </div>
            <!-- /.col -->
            <div class="col-xs-4">
              <input type="submit" class="btn btn-success btn-block btn-flat" value="Conecte-se" />
            </div>
            <!-- /.col -->
          </div>
        </form>

        <a href="<?php echo base_url() ?>forgotPassword">Esqueci a minha senha</a>
        <br>

    </div>
    <!-- /.login-box-body -->
  </div>
  <!-- /.login-box -->

  <script src="<?php echo base_url(); ?>assets/js/jQuery-2.1.4.min.js"></script>
  <script src="<?php echo base_url(); ?>assets/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
</body>

</html>