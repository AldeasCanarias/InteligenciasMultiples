<?php
  $page_title = 'Inteligencias Multiples';
  require_once('includes/load.php');
?>
<?php include_once('layouts/header.php'); ?>

<?php $all_actividades = find_by_sql('SELECT * FROM actividades ORDER BY tipo_inteligencia_id'); ?>
<?php $all_tipos_inteligencia = find_all('tipos_inteligencia'); ?>
<?php $all_subacts = find_all('subact'); ?>


<?php
  //AÑADIR ACTIVIDADES Y CRITERIOS DE EVALUACION
  if (isset($_POST['agregar_act'])) {
    $nombre = $_POST['nombre'];
    $t_int_id = $_POST['tipo_inteligencia_id'];

    $sql = "INSERT INTO actividades (nombre, tipo_inteligencia_id) VALUES ('{$nombre}', '{$t_int_id}')";

    if ($db->query($sql)){
      redirect('crud_actividades.php', true);
    } else {
      $session->msg('d',' Lo siento, registro falló.');
      redirect('crud_actividades.php', false);
    }
  }

  if (isset($_POST['agregar_subact'])) {
    $descripcion = $_POST['descripcion'];
    $actividad_id = $_POST['actividad_id'];

    $sql = "INSERT INTO subact (descripcion, actividad_id) VALUES ('{$descripcion}', '{$actividad_id}')";

    if ($db->query($sql)){
      redirect('crud_actividades.php', true);
    } else {
      $session->msg('d',' Lo siento, registro falló.');
      redirect('crud_actividades.php', false);
    }
  }

  //BORRAR ACTIVIDADES O CRITERIOS DE EVALUACION
  if (isset($_GET['borrar_act'])) {
    $id = $_GET['id'];
    $sql = "DELETE FROM actividades WHERE id='{$id}'";

    if ($db->query($sql)){
      redirect('crud_actividades.php', true);
    } else {
      $session->msg('d',' Lo siento, registro falló.');
      redirect('crud_actividades.php', false);
    }
  }
  if (isset($_GET['borrar_subact'])) {
      $id = $_GET['id'];
      $sql = "DELETE FROM subact WHERE id='{$id}'";

      if ($db->query($sql)){
        redirect('crud_actividades.php', true);
      } else {
        $session->msg('d',' Lo siento, registro falló.');
        redirect('crud_actividades.php', false);
      }
  }
?>

<h1 class="mb-5">Actividades y Criterios de Evaluación</h1>

<div class="formulario-actividades mb-5">
  <form class="" action="crud_actividades.php" method="post">
    <input type="text" name="nombre" value="" placeholder="Nombre de la Actividad">
    <select class="" name="tipo_inteligencia_id">
      <?php foreach ($all_tipos_inteligencia as $t_int): ?>
        <option value="<?php echo $t_int['id']; ?>"><?php echo $t_int['nombre']; ?></option>
      <?php endforeach; ?>
    </select>
    <button type="submit" name="agregar_act" class="btn-success">Añadir Actividad</button>
  </form>
</div>

<div class="tablas-actividades">
  <?php foreach ($all_actividades as $actividad): ?>
    <table class="table table-dark">
      <thead>
        <th><?php echo $actividad['nombre'] ?></th>
        <th> <a href="crud_actividades.php?borrar_act=1&id=<?php echo $actividad['id'] ?>" class="btn-danger">BORRAR</a> </th>
      </thead>
      <tbody>
        <?php $subacts = find_by_sql("SELECT * FROM subact WHERE actividad_id='{$actividad['id']}'") ?>
        <?php foreach ($subacts as $sub): ?>
          <tr>
            <td><?php echo $sub['descripcion'] ?></td>
            <td> <a href="crud_actividades.php?borrar_subact=1&id=<?php echo $sub['id']?>">BORRAR</a></td>
          </tr>
        <?php endforeach; ?>
        <tr>
          <td>
            <form class="" action="crud_actividades.php" method="post">
              <input type="text" name="descripcion" value="" placeholder="Descripción de criterio evaluador">
              <input type="hidden" name="actividad_id" value="<?php echo $actividad['id']; ?>">
              <button type="submit" name="agregar_subact" class="btn-primary">Añadir</button>
            </form>
          </td>
        </tr>
      </tbody>
    </table>
  <?php endforeach; ?>
</div>

<?php include_once('layouts/footer.php'); ?>
