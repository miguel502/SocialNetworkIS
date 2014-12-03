<?php

use Illuminate\Database\Eloquent\Model as Eloquent;
/**
* @name      Project
* @details    Esta contiene las relaciones y funcionalidades que tiene el
* 			  proyecto en el sistema de Redes Sociales.
* @author     Miguel Calderon
* @date       28/11/2014
*/

class Project extends Eloquent {
	

	/**
	 * variable que almacena el nombre de la tabla  que va usar la clase.
	 *
	 * @var string
	 */
	protected $table = 'project';
   

	/**
	  *  @brief: Esta funcion retorna todos los post que contiene este proyecto
	  *  @author Miguel Calderon
	  *  @return @post
	 */
	public function post(){

		return $this->hasMany('post');

	}

	/**
	  *  @brief: Esta funcion retorna todos stages que contiene este proyecto
	  *  @author Miguel Calderon
	  *  @return @stage
	 */
	public function getStage(){

		return $this->hasMany('stage');

	}

	/**
	  *  @brief: Esta funcion retorna las redes sociales que contiene este proyecto
	  *  @author Miguel Calderon
	  *  @return @redSocial
	 */
	public function getRedsocial(){


		return $this->hasMany('redsocial');
	}

	/**
	  *  @brief: Esta funcion retorna los proyectos asignados a un cliente
	  *  @author Miguel Calderon
	  *  @return @Proyects
	 */
	public function getClientProyects(){

		return $this->$belongsToMany('users','client_id');

	}

	/**
	  *  @brief: Esta funcion retorna los proyectos asignados a un usuario
	  *  @author Miguel Calderon
	  *  @return @Proyects
	 */
	public function getUserProyects(){

		return $this->$belongsToMany('users', 'project_user_role', 'user_id', 'project_id');

	}

    /*
    *
    * @brief Crea un nuevo proyecto en la base de datos y lo retorna
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
	
	/*
    *
    * @brief consigue un proyecto dado en base a su Identificador unico
    * @author Miguel Calderon
    * @Param $projectID la llave unica por la que se buscara el proyecto
    * @return El proyecto al que pertenece el Id de entrada
    *
    */
	public static function GetProject($projectID){
		
		$project = Project::findOrFail($projectID);
		return $project;
	}
	
	/*
    *
    * @brief Devuelve la lista de proyectos de un cliente dado
    * @author Miguel Calderon
    * @Param $client_ID el identificador unico del cliente para buscar
    * los proyectos que posee
    * @return Los proyectos de este cliente
    *
    */
	public static function GetClientProjects($client_ID){
		
	
		$Projects = Project::where('client_id', '=', $client_ID)->get();

		return $projects;
		
	}

	/*
    *
    * @brief Devuelve la lista de proyectos de un usuario dado
    * @author Miguel Calderon
    * @Param $userID el identificador unico del usuario para buscar
    * los proyectos que posee
    * @return Los proyectos de este usuario
    *
    */
	public static function GetUserProjects($user_ID){
		
		//return $projects;
		
	}
	
}
?>
