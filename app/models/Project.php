<?php


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
	public function getPost(){

		return $this->hasMany('post');

	}

	/**
	  *  //ESTA CLASE EXPLOTA
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
	  *  
	  *  @brief: Esta funcion retorna los proyectos asignados a un usuario
	  *  @author Miguel Calderon
	  *  @return @Projects
	 */
	public function getUsers(){

		return $this->BelongsToMany('user', 'project_user_role', 'user_id', 'project_id');

	}

	/**
	* @brief Esta funcion se encarga de retornar la lista de post relacionados al proyecto en su ultima 
	*	     version
	* @author Miguel Calderon
	* @return PostVersion
	*  @TODO 
	*/
	public function getlastPostVersion(){

		$posts = $this->getPost();

		foreach($post as $posts){

			yield Post::getlastPostVersion($post);

		}
			
	}

	/**
	  *  @brief: Esta funcion retornas todos los usuarios asignados a un proyecto dado un rol.
	  *  @param  Role rol por el cuale se van a buscar los usuarios.
	  *  @author 
	  *  @return @User
	  *  @TODO 
	 */
	public function getUsersByRole($role){

		//Devuelve los ids de los users que tienen ese rol en el proyecto
		$users = DB::select('select user_id from project_user_role where role_id = ?',array($role->role_id));


		foreach($users as $user){

			try {
				
				yield  Users::findOrFail($user);
			
			}

			catch(Exception $e){
		
				return NULL;
			}
		
		}

	}

    /*
    * 
    * @brief Crea un nuevo proyecto en la base de datos y lo retorna
    * @author Miguel Calderon
    * @Param $proyectName Nombre del proyecto que se va a crear
    * @Param $proyectDesc Descripcion del proyecto que se va a crear
    * @return El objeto project creado
    * 
    *
    */
	public static function newProject($proyectName ,$proyectDesc,$stages,$users,$socialNetwork ) {
		
		$nProject = new Project;
		$nProject->name = $proyectName;
		$nProject->description =  $proyectDesc;
	    
		$nProject->stage()->saveMany($stages);

		$nProject->redSocial()->saveMany($socialNetwork);

		$nProject->user()->attach($users);

		$nProject->push();

		return $nProject;
   	}

   	/*
    * 
    * @brief Agrega un nuevo post a un proyecto
    * @author Miguel Calderon
    * @Param $project_id el id del proyecto al que se agregara el post
    * @Param $post post que se agregara al proyecto
    * @return El proyecto ahora con nuevo post
    * 
    *
    */
	public static function addPostToProject($project_id,$post) {
		
		$project = Project::getProject($project_id);
		$project->post()->save($post);
		$project->push();

		return $project;
   	}

	
	/*
    *
    * @brief consigue un proyecto dado en base a su Identificador unico
    * @author Miguel Calderon
    * @Param $projectID la llave unica por la que se buscara el proyecto
    * @return El proyecto al que pertenece el Id de entrada
    * 
    */
	public static function getProject($projectID){
		
		try {
			return  Project::findOrFail($projectID);
		}

		catch(Exception $e){

			return NULL;
		}
	}

	
}
?>
