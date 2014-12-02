<?php namespace models;

use Illuminate\Database\Eloquent\Model as Eloquent;
/**
* @name      Project
* @details    
* @author     Miguel Calderon
* @date       28/11/2014
*/

class Project extends Eloquent {
	

	//Identificador para eloquent
	protected $table = 'project';
   

	public function post(){

		return $this->hasMany('post');

	}

	public function getChecklist(){

		return $this->hasMany('checklist');

	}

	public function getRedsocial(){


		return $this->hasMany('redsocial');
	}

	public function getUsers(){

		return $this->$belongsToMany('users','client_id');

	}

    /*
    *
    * @brief Constructor de la clase
    * @author Miguel Calderon
    * @Param $proyectName Nombre del proyecto que se va a crear
    * @Param $proyectDesc Descripcion del proyecto que se va a crear
    * @return El objeto project creado
    *
    */
	public static function newProject($proyectName ,$proyectDesc ) {
		
       $this->name = $proyectName;
	   $this->description = $proyectDescription;
	   $this->save();

	   return $this;
	   
   	}
	
	//Funcion encargada de conseguir un proyecto
	public static function GetProject($projectID){
		
		$project = Project::find($projectID);
		return $project;
	}
	
	//Function encargada de conseguir los proyectos de un usuario
	public static function GetProjects($userID){
		
		
		return $projects;
		
	}
	
	public function flush(){return true;}
	
}
?>
