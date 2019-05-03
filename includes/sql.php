<?php
  require_once('includes/load.php');

/*--------------------------------------------------------------*/
/* Function for find all database table rows by table name
/*--------------------------------------------------------------*/
function find_all($table) {
   global $db;
   if(tableExists($table))
   {
     return find_by_sql("SELECT * FROM ".$db->escape($table));
   }
}




/*--------------------------------------------------------------*/
/* Function for Perform queries
/*--------------------------------------------------------------*/
function find_by_sql($sql)
{
  global $db;
  $result = $db->query($sql);
  $result_set = $db->while_loop($result);
 return $result_set;
}




/*--------------------------------------------------------------*/
/*  Function for Find data from table by id
/*--------------------------------------------------------------*/
function find_by_id($table,$id)
{
  global $db;
  $id = (int)$id;
    if(tableExists($table)){
          $sql = $db->query("SELECT * FROM {$db->escape($table)} WHERE id='{$db->escape($id)}' LIMIT 1");
          if($result = $db->fetch_assoc($sql))
            return $result;
          else
            return null;
     }
}




/*--------------------------------------------------------------*/
/* Function for Delete data from table by id
/*--------------------------------------------------------------*/
function delete_by_id($table,$id)
{
  global $db;
  if(tableExists($table))
   {
    $sql = "DELETE FROM ".$db->escape($table);
    $sql .= " WHERE id=". $db->escape($id);
    $sql .= " LIMIT 1";
    $db->query($sql);
    return ($db->affected_rows() === 1) ? true : false;
   }
}




/*--------------------------------------------------------------*/
/* Function for Count id  By table name
/*--------------------------------------------------------------*/
function count_by_id($table){
  global $db;
  if(tableExists($table))
  {
    $sql    = "SELECT COUNT(id) AS total FROM ".$db->escape($table);
    $result = $db->query($sql);
     return($db->fetch_assoc($result));
  }
}




/*--------------------------------------------------------------*/
/* Determine if database table exists
/*--------------------------------------------------------------*/
function tableExists($table){
  global $db;
  $table_exit = $db->query('SHOW TABLES FROM '.DB_NAME.' LIKE "'.$db->escape($table).'"');
      if($table_exit) {
        if($db->num_rows($table_exit) > 0)
              return true;
         else
              return false;
      }
  }



function join_evaluaciones_subact(){
  global $db;

  $sql =  " SELECT e.subact_id, e.nota, e.alumno_id, s.actividad_id as actividad_id ";
  $sql .= " FROM evaluaciones e ";
  $sql .= " LEFT JOIN subact s ON s.id = e.subact_id ";

  return find_by_sql($sql);
}


function get_notas_by_alumno_actividad($alumno, $actividad) {
  global $db;

  $sql =  " SELECT nota";
  $sql .= " FROM evaluaciones e ";
  $sql .= " LEFT JOIN subact s ON s.id = e.subact_id ";
  $sql .= " WHERE alumno_id='{$alumno}' AND s.actividad_id='{$actividad}' ";

  return find_by_sql($sql);
}


function get_tipo_inteligencia_by_actividad_id($actividad_id){
  global $db;

  $sql =  " SELECT tipo_inteligencia_id FROM actividades WHERE id='{$actividad_id}'";

  return find_by_sql($sql);
}



function get_inteligencia_id_by_nombre($nombre){
  global $db;

  $sql = "SELECT id FROM tipos_inteligencia WHERE nombre='{$nombre}'";

  return find_by_sql($sql);
}



function subacts_by_nombre_inteligencia($nombre_int){
    global $db;
    $inteligencia_id = get_inteligencia_id_by_nombre($nombre_int)[0];

    $sql = " SELECT s.descripcion, act.tipo_inteligencia_id ";
    $sql .=" FROM subact s ";
    $sql .=" LEFT JOIN actividades act ON act.id = s.actividad_id ";
    $sql .=" WHERE act.tipo_inteligencia_id = '{$inteligencia_id['id']}' ";

    return find_by_sql($sql);
}


/*---------------//-----------------BORRAR DE AQUI PARA ABAJO--------------//---------------------------*/



?>
