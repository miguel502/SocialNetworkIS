<?php namespace Project;

/**
* @brief      Project
* @details    Esta clase aloja y 
*
* @author     Miguel Calderon
* @date       28/11/2014
* @version    v1.0
*
* @todo       Verificar como utilizaremos las base de dtos
*
* @bug        Errores conocidos de esta clase
*
* @exception  NombreDeLaExcepcionException
*             Descripcion de la excepcion
*             <code>condicion1</code> and
*             <code>condicion2</code> o
*             <code>condicion3</code>
*
* @see        Controller
* @see        http://ellislab.com/codeigniter/user-guide/general/controllers.html
*/

class Project{
	
	//Identificador unico por proyecto
	public $ID;
	
	//Nombre del proyecto 
	public $Name;
   
    //Constructor de la clase
	public function __construct($identifier ,$proyectName ) {
		
       $this->ID = $identifier;
	   $this->Name = $ProyectName;
	   
	   DB::insert('insert into projects (id, name) values (?, ?)', array($identifier, $proyectName));
	   
   	}
	
	//Funcion encargada de conseguir un proyecto
	public static function GetProject($projectID){
		
		$project = DB::select('select * from projects where id = ?', array($projectID));
		return $project;
	}
	
	//Function encargada de conseguir los proyectos de un usuario
	public static function GetProjects($userID){
		
		$projects = DB::select('select * from projects where id = ?', array($userID));
		return $projects;
		
	}
	
	public function flush(){return true;}
	
}
?>
