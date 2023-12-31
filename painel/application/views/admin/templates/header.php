<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <!--<title>CI Gallery</title> -->

    <!-- Bootstrap -->
    <link href="<?= base_url('asset/bootstrap-3.3.6-dist/css/bootstrap.min.css')?>" rel="stylesheet">

    <!-- Datepicker -->
    <link href="<?= base_url('asset/bootstrap-datepicker/bootstrap-datepicker.css')?>" rel="stylesheet">

    <!-- Costum css -->
    <link href="<?= base_url('asset/site/css/main.css')?>" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
    <div class="container">
      <br/>
      <!-- Navbar -->
      <nav class="navbar navbar-default" style="margin-bottom:-5px!important">
        <div class="container-fluid">

             <!-- Admin menubar -->
            <ul class="nav navbar-nav">
              <li><?php echo anchor('admin/'.$ds_categoria.'/'.$id_categoria, 'Arquivos'); ?></li>
              <li><?php echo anchor('admin/upload/'.$ds_categoria.'/'.$id_categoria, 'Upload de arquivos'); ?></li>              
            </ul>

            </form>

        </div>
      </nav>
