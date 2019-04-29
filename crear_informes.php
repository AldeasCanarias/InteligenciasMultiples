<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>Informes</title>
    <link rel="stylesheet" href="libs/css/print.css" />
  </head>
  <body>
    <?php
      $page_title = 'Inteligencias Multiples';
      require_once('includes/load.php');
    ?>

    <?php include( 'GoogChart.class.php' ); ?>

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


      //Calcular media de cada actividad (valores de notas de sus correspondientes subacts) para cada alumno
      //echo "MEDIAS POR ACTIVIDAD";
      //echo "<br>";
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

          //echo "ALUMNO: " . $alumno['nombre'] . " ACTIVIDAD: " . $actividad['nombre'] . " MEDIA: " . $media_alumno_actividad[$alumno['id']][$actividad['id']];
          //echo "<br>";
        }
      }



      //Calcular medias por tipo de inteligencia de cada actividad
    //  echo "<br>";
    //  echo "MEDIAS POR INTELIGENCIA***********";
    //  echo "<br>";
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
            //echo "ALUMNO: " . $alumno['nombre'] . " Inteligencia: " . $t_int['nombre'] . " MEDIA: " . $suma_inteligencias[$alumno['id']][$t_int['id']];
            //echo "<br>";
          } else {
            //echo "ALUMNO: " . $alumno['nombre'] . " Inteligencia: " . $t_int['nombre'] . " MEDIA: No hay datos";
            //echo "<br>";
          }
        }
        //echo "------------------------------------";
        //echo "<br>";
      }
    ?>

    <?php foreach ($alumnos as $alumno): ?>
      <!--PAGINA UNO-->
      <div class="informe">
        <header id="pageHeader">
          <img src="img/logo-aldeas.jpg" alt="logo-aldeas">
        </header>
        <h1>Informe sobre los Talentos Observados</h1>

        <p>
          El siguiente informe muestra la valoración de los talentos de la niña o el niño durante el Campamento de Inteligencias Múltiples celebrado por Aldeas Infantiles SOS entre el 24 y el 28 de junio de 2019.

          La información que aquí se aporta se ha obtenido a través de una metodología observacional y con el uso de hojas de registro, tras la participación de la niña o niño en <?php echo count($actividades) ?> talleres diferentes durante la semana en la que se desarrolló en campamento.

          Los talentos evaluados parten de la adaptación de la Teoría de las Inteligencias Múltiples de H. Gardner, donde nuestra agrupación de talentos a observar queda de la siguiente manera: Científico (lógico-matemático), Naturalista, Artístico y Corporal (espacial), Musical, Existencial (espiritual), Emocional (intrapersonal e interpersonal), y Lingüístico. Como apéndice a este informe se encuentra el desarrollo del significado de cada talento para facilitar su interpretación.</p>

        <h2 class="nombre"><?php echo $alumno['nombre'] ?> </h2>
        <h2 class="resultados">Resultados: </h2>

        <p>Talentos observados y valoración en una escala del 1 al 3, donde “1” indica talento poco observado (a reforzar durante el próximo curso) y “3” indica talento muy observado (a seguir fomentando durante el próximo curso)</p>

        <div class="graficos">
          <?php foreach ($tipos_inteligencia as $t_int): ?>
            <div class="grafica-ind">

              <?php $chart = new GoogChart();
                    $data = array(' ' => $suma_inteligencias[$alumno['id']][$t_int['id']], '' => 3 - $suma_inteligencias[$alumno['id']][$t_int['id']]);
                    if ($suma_inteligencias[$alumno['id']][$t_int['id']] <= 1) {
                      $c = '#820000';
                    } elseif($suma_inteligencias[$alumno['id']][$t_int['id']] > 1 && $suma_inteligencias[$alumno['id']][$t_int['id']] <= 2){
                      $c = '#d5bc18';
                    } else{
                      $c = '#99C754';
                    }
                    $color = array(
                    			$c,
                    			'#54C7C5',
                    			'#e9e9e9',
                    );
                    $chart->setChartAttrs( array(
                    	'type' => 'pie',
                    	'title' => '',
                    	'data' => $data,
                    	'size' => array( 120, 170 ),
                    	'color' => $color
                    	));
                    // Print chart
                    echo $chart;
              ?>
              <h3><?php
                    echo $t_int['nombre'];
                    echo ":  ";
                    echo $suma_inteligencias[$alumno['id']][$t_int['id']];
                  ?>
              </h3>
            </div>
          <?php endforeach; ?>
        </div>
    </div>

    <!--PAGINA DOS+-->
    <div class="informe">

      <h1>Descripción de los Talentos</h1>

      <div class="descripcion-int">
        <h3>Corporal</h3>
        <p>DESCRIPCIÓN</p>
        <p>
          <b>Aspectos tomados en cuenta:</b>
          <?php $subacts = subacts_by_nombre_inteligencia('Corporal'); ?>
          <ul>
            <?php foreach ($subacts as $sub): ?>
              <li><?php echo $sub['descripcion']; ?></li>
            <?php endforeach; ?>
          </ul>
        </p>
      </div>

      <div class="descripcion-int">
        <h3>Lógico-Matemática</h3>
        <p>DESCRIPCIÓN</p>
        <p>
          <b>Aspectos tomados en cuenta:</b>
          <?php $subacts = subacts_by_nombre_inteligencia('Lógico-Matemática'); ?>
          <ul>
            <?php foreach ($subacts as $sub): ?>
              <li><?php echo $sub['descripcion']; ?></li>
            <?php endforeach; ?>
          </ul>
        </p>
      </div>

      <div class="descripcion-int">
        <h3>Artística</h3>
        <p>DESCRIPCIÓN</p>
        <p>
          <b>Aspectos tomados en cuenta:</b>
          <?php $subacts = subacts_by_nombre_inteligencia('Artística'); ?>
          <ul>
            <?php foreach ($subacts as $sub): ?>
              <li><?php echo $sub['descripcion']; ?></li>
            <?php endforeach; ?>
          </ul>
        </p>
      </div>

      <div class="descripcion-int">
        <h3>Naturalista</h3>
        <p>DESCRIPCIÓN</p>
        <p>
          <b>Aspectos tomados en cuenta:</b>
          <?php $subacts = subacts_by_nombre_inteligencia('Naturalista'); ?>
          <ul>
            <?php foreach ($subacts as $sub): ?>
              <li><?php echo $sub['descripcion']; ?></li>
            <?php endforeach; ?>
          </ul>
        </p>
      </div>

      <div class="descripcion-int">
        <h3>Musical</h3>
        <p>DESCRIPCIÓN</p>
        <p>
          <b>Aspectos tomados en cuenta:</b>
          <?php $subacts = subacts_by_nombre_inteligencia('Musical'); ?>
          <ul>
            <?php foreach ($subacts as $sub): ?>
              <li><?php echo $sub['descripcion']; ?></li>
            <?php endforeach; ?>
          </ul>
        </p>
      </div>

      <div class="descripcion-int">
        <h3>Lingüística</h3>
        <p>DESCRIPCIÓN</p>
        <p>
          <b>Aspectos tomados en cuenta:</b>
          <?php $subacts = subacts_by_nombre_inteligencia('Lingüística'); ?>
          <ul>
            <?php foreach ($subacts as $sub): ?>
              <li><?php echo $sub['descripcion']; ?></li>
            <?php endforeach; ?>
          </ul>
        </p>
      </div>

      <div class="descripcion-int">
        <h3>Existencial</h3>
        <p>DESCRIPCIÓN</p>
        <p>
          <b>Aspectos tomados en cuenta:</b>
          <?php $subacts = subacts_by_nombre_inteligencia('Existencial'); ?>
          <ul>
            <?php foreach ($subacts as $sub): ?>
              <li><?php echo $sub['descripcion']; ?></li>
            <?php endforeach; ?>
          </ul>
        </p>
      </div>

      <div class="descripcion-int">
        <h3>Emocional</h3>
        <p>DESCRIPCIÓN</p>
        <p>
          <b>Aspectos tomados en cuenta:</b>
          <?php $subacts = subacts_by_nombre_inteligencia('Emocional'); ?>
          <ul>
            <?php foreach ($subacts as $sub): ?>
              <li><?php echo $sub['descripcion']; ?></li>
            <?php endforeach; ?>
          </ul>
        </p>
      </div>

    </div>


    <?php endforeach; ?>
  </body>
</html>



















<?php /**/ ?>
