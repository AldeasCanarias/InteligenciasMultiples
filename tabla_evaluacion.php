<?php
  $page_title = 'Inteligencias Multiples';
  require_once('includes/load.php');
?>
<?php include_once('layouts/header.php'); ?>

<?php
  $equipo_id = $_POST['equipo'];
  $actividad_id = $_POST['actividad'];

  $alumnos = find_by_sql('SELECT * FROM alumnos WHERE equipo_id =' . $equipo_id);
  $subacts = find_by_sql('SELECT * FROM subact WHERE actividad_id =' . $actividad_id);

  global $db;
  if (isset($_POST['evaluar'])) {
    $notas = $_POST['nota'];
    foreach ($subacts as $subact) {
      foreach ($alumnos as $alumno) {
        $nota = $notas[$subact['id']][$alumno['id']];
        $existe = find_by_sql("SELECT id FROM evaluaciones WHERE subact_id = '{$subact['id']}' AND alumno_id = '{$alumno['id']}' ");

        if ($existe != null) {
          $sql = "UPDATE evaluaciones SET nota ='{$nota}' WHERE subact_id = '{$subact['id']}' AND alumno_id = '{$alumno['id']}'";
          $db->query($sql);
        } else{
          $sql = "INSERT INTO evaluaciones (subact_id, alumno_id, nota) VALUES ( '{$subact['id']}', '{$alumno['id']}', $nota )";
          $db->query($sql);
        }

      }
    }
  }

?>
<a href="elegir_equipo.php" class="text-light mb-5"><i class="fas fa-chevron-left"></i> ATRÁS</a>

<div class="">
  <table class="table text-center table-borderless table-striped">
    <thead>
      <th></th>
      <?php foreach ($alumnos as $alumno): ?>
        <th> <?php echo $alumno['nombre'] ?></th>
      <?php endforeach; ?>
    </thead>
    <tbody>

      <form class="" action="tabla_evaluacion.php" method="post">
      <?php foreach ($subacts as $subact): ?>
        <tr>
          <td><?php echo $subact['descripcion'] ?></td>
          <?php foreach ($alumnos as $alumno): ?>
            <td>
              <input type="number" name="nota[<?php echo $subact['id'] ?>][<?php echo $alumno['id'] ?>]" min="0" max="3"> <?php //VALUE DE BBDD ?>
            </td>
          <?php endforeach; ?>
        </tr>
      <?php endforeach; ?>
      <input type="hidden" name="equipo" value="<?php echo $equipo_id ?>">
      <input type="hidden" name="actividad" value="<?php echo $actividad_id ?>">
      <button type="submit" class="btn-success mb-3 float-right" name="evaluar">EVALUAR</button>
      </form>

    </tbody>
  </table>
</div>















<?php include_once('layouts/footer.php'); ?>
