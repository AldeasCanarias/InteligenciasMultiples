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
  $media_alumno_actividad; //Hacer matriz

  foreach ($alumnos as $alumno) {
    foreach ($actividades as $actividad) {
      $notas = get_notas_by_alumno_actividad($alumno['id'], $actividad['id']);
    }
  }


  //Ejemplo para 1 alumno. Obtiene la media de las subacts de la actividad 1
/*
  $notas = get_notas_by_alumno_actividad(1, 1);
  var_dump($notas);
  foreach ($notas as $nota) {
    $media_alumno_actividad += $nota['nota'];
  }
  $media_alumno_actividad /= count($notas);
  echo "MEDIA" . $media_alumno_actividad;
*/



  //Calcular media de cada actividad (valores de notas de sus correspondientes subacts) para cada alumno
  echo "MEDIAS POR ACTIVIDAD";
  echo "<br>";
  foreach ($alumnos as $alumno) {
    foreach ($actividades as $actividad) {
      $notas = get_notas_by_alumno_actividad($alumno['id'], $actividad['id']);
      $media_alumno_actividad[$alumno['id']][$actividad['id']] = 0;

      foreach ($notas as $nota) {
        $media_alumno_actividad[$alumno['id']][$actividad['id']] += $nota['nota'];
      }

      if (count($notas) > 0) {
        $media_alumno_actividad[$alumno['id']][$actividad['id']] /= count($notas);
      } else {
        $media_alumno_actividad[$alumno['id']][$actividad['id']] = "-1";
      }

      echo "ALUMNO: " . $alumno['nombre'] . " ACTIVIDAD: " . $actividad['nombre'] . " MEDIA: " . $media_alumno_actividad[$alumno['id']][$actividad['id']];
      echo "<br>";
    }
  }



  //Calcular medias por tipo de inteligencia de cada actividad
  echo "<br>";
  echo "MEDIAS POR INTELIGENCIA***********";
  echo "<br>";
  foreach ($alumnos as $alumno) {
    foreach ($tipos_inteligencia as $t_int) {
      $suma_inteligencias[$alumno['id']][$t_int['id']] = 0;
      $divisor[$alumno['id']][$t_int['id']] = 0;
    }
  }

  foreach ($alumnos as $alumno) {
    foreach ($actividades as $actividad) {
      $tipo_int = get_tipo_inteligencia_by_actividad_id($actividad['id'])[0];
      if ($media_alumno_actividad[$alumno['id']][$actividad['id']] > -1) {
        $suma_inteligencias[$alumno['id']][$tipo_int['tipo_inteligencia_id']] += $media_alumno_actividad[$alumno['id']][$actividad['id']];
        $divisor[$alumno['id']][$tipo_int['tipo_inteligencia_id']]++;
      }
    }
  }

  foreach ($alumnos as $alumno) {
    foreach ($tipos_inteligencia as $t_int) {
      if ($divisor[$alumno['id']][$t_int['id']] > 0) {
        $suma_inteligencias[$alumno['id']][$t_int['id']] /= $divisor[$alumno['id']][$t_int['id']];
        echo "ALUMNO: " . $alumno['nombre'] . " Inteligencia: " . $t_int['nombre'] . " MEDIA: " . $suma_inteligencias[$alumno['id']][$t_int['id']];
        echo "<br>";
      } else {
        echo "ALUMNO: " . $alumno['nombre'] . " Inteligencia: " . $t_int['nombre'] . " MEDIA: No hay datos";
        echo "<br>";
      }
    }
    echo "------------------------------------";
    echo "<br>";
  }
?>


<div class="">
  <?php
  /********************************CREAR INFORMES****************************************/
  
  ?>
</div>
























<?php /**/ ?>
