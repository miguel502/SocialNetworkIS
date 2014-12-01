<?php

/*
	@brief  Clase que representa un usuario de la base de datos.
	@autor  Leonel Paulino
*/

class User extends Eloquent {

	/**
	 * variable que almacena el nombre de la tabla  que va usar la clase.
	 *
	 * @var string
	 */
	protected $table = 'Users';
	/*
	 *  @brief: Esta funcion retorna todos los post que contiene  este usuario 
	 *	@return @posversion
	 */
	public function getpostVersion(){
		return $this->hasMany('post_version');
	}
	/*
		@brief: Retorna todos los proyectos al que pertenece este usuario.
		@return Projects  
		@autor Leonel Paulino
	*/
	public function getProjects(){
		return $this->belongsToMany('project', 'project_user_role', 'user_id', 'project_id');
	}
	/*
		@brief: Crea un nuevo usuario en la base de datos y retorna el usuario creado. 
		@param nombre		nombre del usuario que se va crear
		@param lastname 	apellido del usuario que se va crear.
		@param username 	nombre de usuario.
		@param intialpass   contraseña del usuario.
		@param defaultid 	El id por default del usuario.
		@param email 		email del usuario.
		@return User 		
		@autor Leonel Paulino
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
}
