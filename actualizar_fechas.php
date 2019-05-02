<?php
  $page_title = 'Inteligencias Multiples';
  require_once('includes/load.php');
?>
<?php include_once('layouts/header.php'); ?>

<?php
  $fecha_inicio = new DateTime(find_by_id('fecha_evento', 1)['fecha_inicio']);
  $fecha_fin = new DateTime(find_by_id('fecha_evento', 1)['fecha_fin']);
?>

<?php
  if (isset($_POST['actualizar'])) {
    $new_inicio = $_POST['fecha_inicio'];
    $new_fin = $_POST['fecha_fin'];

    $sql = "UPDATE fecha_evento SET fecha_inicio ='{$new_inicio}', fecha_fin='{$new_fin}' WHERE id=1";
    $db->query($sql);
    redirect('actualizar_fechas.php', true);
  }

?>


<div class="actual">
  <h2>Fecha actual: <?php  echo $fecha_inicio->format('d-m-Y');?> - <?php echo $fecha_fin->format('d-m-Y'); ?> </h2>

</div>

<div class="table">
  <form class="form" action="actualizar_fechas.php" method="post">
    <label for="fecha_inicio">Fecha de inicio</label>
    <input type="date" name="fecha_inicio" value="">
    <label for="fecha_inicio">Fecha de finalización</label>
    <input type="date" name="fecha_fin" value="">
    <button type="submit" class="btn btn-success" name="actualizar">Cambiar Fecha</button>
  </form>
</div>























<?php include_once('layouts/footer.php'); ?>
