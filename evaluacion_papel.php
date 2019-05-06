<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>Informes</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker3.min.css" />
    <link rel="stylesheet" href="libs/css/print-horizontal.css" />
  </head>

  <body>

    <button type="submit" name="imprimir" value="" class="btn-success imprimir mt-5 " onclick="window.print();">Imprimir Informes</button>

    <?php
      $page_title = 'Inteligencias Multiples';
      require_once('includes/load.php');
    ?>

    <?php
      $equipos = find_all('equipos');
      $actividades = find_all('actividades');
    ?>

    <?php foreach ($actividades as $actividad): ?>
      <div class="ficha-eval">
        <h1 class="mb-5"><?php echo $actividad["nombre"]; ?></h1>
        <?php foreach ($equipos as $equipo): ?>
          <?php $alumnos = find_alumnos_by_equipo($equipo['id'])  ?>
          <h2> <?php echo $equipo["nombre"]; ?></h2>
          <table class="table table-sm table-bordered mb-5 text-center">
            <thead>
                <th></th>
              <?php foreach ($alumnos as $alumno): ?>
                <th><?php echo $alumno["nombre"] ?></th>
              <?php endforeach; ?>
            </thead>
            <tbody>
              <?php $subacts = find_subact_by_actividad($actividad['id']) ?>
              <?php foreach ($subacts as $subact): ?>
                <tr>
                  <td ><?php echo $subact['descripcion'] ?></td>
                  <?php foreach ($alumnos as $alumno): ?>
                    <td></td>
                  <?php endforeach; ?>
                </tr>
              <?php endforeach; ?>
            </tbody>
          </table>
        <?php endforeach; ?>
      </div>
    <?php endforeach; ?>





  </body>
</html>
