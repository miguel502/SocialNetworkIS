<?php
   /**
	*	@brief  Clase que representa un usuario de la base de datos.
	*	@autor  Leonel Paulino
	*/

   /**
	*	@brief  Clase que representa un usuario de la base de datos.
	*	@autor  Leonel Paulino
	*/

class User  extends Eloquent {

	/**
	 * variable que almacena el nombre de la tabla  que va usar la clase.
	 *
	 * @var string
	 */
	protected $table = 'Users';
	/**
	  *  @brief: Esta funcion retorna todos los post que contiene  este usuario
	  *  @autor Leonel Paulino
	  *  @return @posversion
	 */
	public function getpostVersion(){
		return $this->hasMany('post_version');
	}
	/**
	 *	@brief: Retorna todos los proyectos al que pertenece este usuario.
	 *	@autor Leonel Paulino
	 *	@return Projects  
	*/
	public function getProjects(){
		return $this->belongsToMany('project', 'project_user_role', 'user_id', 'project_id');
	}
	/**
	*	@brief: Crea un nuevo usuario en la base de datos y retorna el usuario creado. 
	*	@autor Leonel Paulino
	*	@param nombre		nombre del usuario que se va crear
	*	@param lastname 	apellido del usuario que se va crear.
	*	@param username 	nombre de usuario.
	*	@param intialpass   contraseña del usuario.
	*	@param defaultid 	El id por default del usuario.
	*	@param email 		email del usuario.
	*	@return User 		
	*/
	public static function newUser($nombre,$lastname,$username,$intialpass,$defaultid,$email){
		$this->nombre = $nombre;
		$this->lastname = $lastname;
		$this->username = $username;
		$this->password = $intialpass;
		$this->default_role_id = $defaultid;
		$this->email = $email;
		$this->save();
		return $this;
	}
	/**
	*	@brief Esta clase se encarga de retorna un usuario de la base de datos dado el nombre de usuario.
	*	@autor Leonel Paulino
	*	@param username Nombre de usuario
	* 	@return Un usuario.
	*/
	public static function getUser($username){
		return User::where('username', '=',$username)->get();
	}
	/**
	*	@brief Esta funcion se encarga de autetificar el usuario con su contraseña.
	*	@autor Leonel Paulino
	*	@param username nombre de usuario
	*	@param password contraseña del usuario.
	* 	@return el usuario  si se pudo autentificar de lo contrario retorna false.
	*/
	public static function authentication($username,$password){
		return $this->getuser($username);
	}
	/**
	*	@brief Esta funcion retorna todos los post pendiente del usuario.
	*	@autor Leonel Paulino
	* 	@return return yield. post .
	*/
	public function getPendingPost(){
		$posts = $this->getpostVersion();
		log::info('paso');
		foreach ($post as $posts)
		{
			if ( $post->pending ){
				yield $post;
			}
		}
	}
	/**
	*	@brief Esta funcion retorna todos los proyectos activos en el que esta el usuario.
	*	@autor Leonel Paulino
	* 	@return return yield. projects .
	*/
	public function getActiveProjects(){
		$projects = $this->getProjects();
		foreach ($project as $projects)
		{
			if ( $project->active){
				yield $project;
			}
		}
	}
	/**
	*	@brief Esta funcion retorna todos los usuario de la base de datos.
	*	@autor Leonel Paulino
	* 	@return  users .
	*/
	public static function getAllUsers(){
		return User::all();
	}
}
