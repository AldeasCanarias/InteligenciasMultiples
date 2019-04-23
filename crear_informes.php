<?php
  $page_title = 'Inteligencias Multiples';
  require_once('includes/load.php');
?>
<?php include_once('layouts/header.php'); ?>

<?php
  $evaluaciones = find_all('evaluaciones');
  $alumnos = find_all('alumnos');
  $actividades = find_all('actividades');
  $tipos_inteligencia = find_all('tipos_inteligencia');
?>

<?php
  $media_alumno_actividad=0; //Hacer matriz

  foreach ($alumnos as $alumno) {
    foreach ($actividades as $actividad) {
      $notas = get_notas_by_alumno_actividad($alumno['id'], $actividad['id']);
    }
  }


  //Ejemplo para 1 alumno. Obtiene la media de las subacts de la actividad 1
  $notas = get_notas_by_alumno_actividad(1, 1);
  var_dump($notas);
  foreach ($notas as $nota) {
    $media_alumno_actividad += $nota['nota'];
  }
  $media_alumno_actividad /= count($notas);
  echo "MEDIA" . $media_alumno_actividad;
?>
