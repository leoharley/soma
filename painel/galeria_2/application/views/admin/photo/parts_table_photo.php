<br />

<!-- Table to display all photo -->
<table class="table table-bordered">

  <tr>
    <th>Id</th>
    <th>Descrição</th>
    <th>Data</th>
    <th>Arquivo</th>
    <th colspan="3">Ação</th>
  </tr>

  <?php foreach ($photos as $key => $photo): ?>
  <tr>
    <td><?= ++$key?></td>
    <td><?= $photo['name']?></td>
    <td><?= $photo['date']?></td>

    <td>
     <?php 
     if (preg_match_all('#\b(png|jpg|jpeg)\b#', $photo['link'] )) {
      echo '<img
      src="'. base_url($photo['link_thumb']).'"
      alt="'.$photo['name'].'"';
     } else {
      echo '<a href="'.base_url($photo['link']).'">'.$photo['name'].'</a>';
     }
     ?>
    </td>
    <td><a href="<?= base_url($photo['link'])?>">Baixar</a></td>
    <td><?= anchor('admin/edit/'.$ds_categoria.'/'.$id_categoria.'/'. $photo['id'], 'Editar')?></td>
    <td style="vertical-align:top!important">
      <button
        type="button"
        data-id="<?= $photo['id']?>"
        class="btn btn-link"
        style="margin-top:-5px;"
        data-toggle="modal"
        data-target="#deleteModal"
      >Apagar</button>
    </td>
  </tr>
  <?php endforeach ?>

</table>
<!-- End table -->

<!-- Delete Modal -->
<div id="deleteModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content -->
    <div class="modal-content">
      <div class="modal-header">
        <button
          type="button"
          class="close"
          data-dismiss="modal"
        >&times;</button>
        <h4 class="modal-title">Delete confirmation</h4>
      </div>
      <div class="modal-body">
        <p>Are you sure to delete this photo ?</p>
      </div>
      <div class="modal-footer">
        <a
          class="btn btn-default"
          id="delete_link"
          href="<?= site_url('admin/delete/')?>"
        >Yes</a>
        <button
          type="button"
          class="btn btn-default"
          data-dismiss="modal"
        >Cancel</button>
      </div>
    </div>
    <!-- End modal content -->

  </div>
</div>
<!-- End delete modal -->

<!-- Somehow need to load jquery for bellow script to work -->
<script src="<?php echo base_url('asset/jquery.min.js');?>"></script>

<!-- Passing data-id to modal -->
<script>
  $(document).on("click", ".delete-button", function () {
    var photoId = $(this).data('id');
    var href = $(".modal-footer #delete_link").attr("href");
    $(".modal-footer #delete_link").attr("href", href + "/" + photoId);
   // As pointed out in comments,
   // it is superfluous to have to manually call the modal.
   // $('#addBookDialog').modal('show');
  });
</script>