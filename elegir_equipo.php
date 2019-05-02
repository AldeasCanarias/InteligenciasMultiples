<?php
  $page_title = 'Inteligencias Multiples';
  require_once('includes/load.php');
?>
<?php include_once('layouts/header.php'); ?>

<?php
  $all_equipos = find_all('equipos');
  $all_actividades = find_all('actividades');
?>


<div class="selector_filtros">
  <form class="" action="tabla_evaluacion.php" method="post">
    <select class="equipo" name="equipo">
      <?php foreach ($all_equipos as $equipo): ?>
        <option value="<?php echo $equipo['id'] ?>"> <?php echo $equipo['nombre'] ?> </option>
      <?php endforeach; ?>
    </select>

    <select class="actividad" name="actividad">
      <?php foreach ($all_actividades as $actividad): ?>
        <option value="<?php echo $actividad['id'] ?>"> <?php echo $actividad['nombre'] ?> </option>
      <?php endforeach; ?>
    </select>

    <button class="btn-success" type="submit" name="button">Evaluar Grupo</button>
  </form>
</div>







<?php include_once('layouts/footer.php'); ?>
