<?php
  $page_title = 'Inteligencias Multiples';
  require_once('includes/load.php');
?>
<?php include_once('layouts/header.php'); ?>


<div class="menu">
  <ul>
    <li> <a href="elegir_equipo.php">EVALUAR GRUPOS</a> </li>
    <li> <a href="crear_informes.php">CREAR INFORMES FINALES</a> </li>
    <br>

    <li> <a href="crud_alumnos.php">GESTIONAR ALUMNOS</a> </li>
    <li> <a href="crud_actividades.php">GESTIONAR ACTIVIDADES Y CRITERIOS DE EVALUACIÓN</a> </li>
    <li> <a href="actualizar_fechas.php">CAMBIAR FECHA DEL EVENTO</a> </li>
    <li> <a href="#">RESETEAR BASE DE DATOS (Alumnos, Actividades y Evaluaciones)</a> </li>
  </ul>
</div>

<?php include_once('layouts/footer.php'); ?>
