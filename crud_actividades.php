<?php
  $page_title = 'Inteligencias Multiples';
  require_once('includes/load.php');
?>
<?php include_once('layouts/header.php'); ?>

<?php $all_actividades = find_by_sql('SELECT * FROM actividades ORDER BY tipo_inteligencia_id'); ?>
<?php $all_tipos_inteligencia = find_all('tipos_inteligencia'); ?>



<?php include_once('layouts/footer.php'); ?>
