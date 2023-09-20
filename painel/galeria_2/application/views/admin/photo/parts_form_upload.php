<div class="panel panel-default">
  <div class="panel-body">
    <?php
      if ($msg) {
        echo
          '<div class="alert alert-info">
            <strong>Info!</strong> '.$msg.'
          </div>';
      }
    ?>

    <?= form_open_multipart('admin/upload')?>

      <div class="form-group">
        <label for="photo">Photo</label>
        <input type="file" name="photo"/>
      </div>

      <div class="form-group">
        <label for="name">Nome</label>
        <input type="text" name="name" class="form-control" placeholder="Nome de referência" />
      </div>

      <div class="form-group">
        <label for="description">Descrição</label>
        <textarea
          type="text"
          name="description"
          class="form-control"
          placeholder="Descreva o arquivo"></textarea>
      </div>

      <div class="form-group">
        <label for="date">Data</label>
        <div class="input-group date" data-provide="datepicker">
          <input
            type="text"
            name="date"
            class="form-control"
            placeholder="Data"
          >
          <div class="input-group-addon">
            <span class="glyphicon glyphicon-th"></span>
          </div>
        </div>
      </div>

     <!-- <div class="form-group">
        <label for="Location">Location</label>
        <input
          type="text"
          name="location"
          class="form-control"
          placeholder="Where this photo taken"
        />
      </div> -->

      <input type="hidden" value="<?php echo $ds_categoria; ?>" name="ds_categoria" id="ds_categoria" />
      <input type="hidden" value="<?php echo $id_categoria; ?>" name="id_categoria" id="id_categoria" />

      <input type="submit" class="btn btn-default" value="Enviar" />
    </form>

  </div>
</div>