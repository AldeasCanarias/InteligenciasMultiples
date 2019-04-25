<?php
  $page_title = 'Inteligencias Multiples';
  require_once('includes/load.php');
?>
<?php include_once('layouts/header.php'); ?>

<?php $all_alumnos = find_by_sql('SELECT * FROM alumnos ORDER BY equipo_id'); ?>
<?php $all_equipos = find_all('equipos') ?>

<?php
  //AÑADIR NUEVO ALUMNO
  if (isset($_POST['agregar'])) {
    global $db;
    $nombre = $_POST['nombre'];
    $equipo_id = $_POST['equipo'];

    $sql = "INSERT INTO alumnos (nombre, equipo_id) VALUES ('{$nombre}', '{$equipo_id}')";

    if ($db->query($sql)){
      redirect('crud_alumnos.php', true);
    } else {
      $session->msg('d',' Lo siento, registro falló.');
      redirect('crud_alumnos.php', false);
    }
  }

  //BORRAR ALUMNO
  if (isset($_GET['borrar'])) {
    $id = $_GET['id'];

    $sql = "DELETE FROM alumnos WHERE id='{$id}'";

    if ($db->query($sql)){
      redirect('crud_alumnos.php', true);
    } else {
      $session->msg('d',' Lo siento, registro falló.');
      redirect('crud_alumnos.php', false);
    }
  }
?>

<div class="formulario">
  <form class="" action="crud_alumnos.php" method="post">
    <input type="text" name="nombre" value="" placeholder="Nombre y Apellidos">
    <select class="" name="equipo">
        <?php foreach ($all_equipos as $equipo): ?>
          <option value=<?php echo $equipo['id']; ?>><?php echo $equipo['nombre']; ?></option>
        <?php endforeach; ?>
    </select>
    <button type="submit" name="agregar" class="btn-success">AÑADIR</button>
  </form>
</div>

<div class="tabla-alumnos">
  <table class="table">
    <thead>
      <th>Nombre</th>
      <th>Equipo</th>
    </thead>
    <tbody>
      <?php foreach ($all_alumnos as $alumno): ?>
        <?php $equipo = find_by_sql("SELECT * FROM equipos WHERE id='{$alumno['equipo_id']}'"); ?>
        <tr>
          <td><?php echo $alumno['nombre']; ?></td>
          <td><?php echo $equipo[0]['nombre'] ?></td>
          <td> <a href="crud_alumnos.php?borrar=1&id=<?php echo $alumno['id']; ?>">BORRAR</a> </td>
        </tr>
      <?php endforeach; ?>
    </tbody>
  </table>
</div>

<?php include_once('layouts/footer.php'); ?>
