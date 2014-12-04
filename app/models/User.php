<?php
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
	  *  @brief: Esta funcion retorna todos los que este usuario ha hecho.
	  *  @autor Leonel Paulino
	  *  @return postversion
	 */
	public function getPosts(){
		return $this->hasMany('postversion');
	}
	/**
	 *	@brief: Retorna todos los proyectos al que pertenece este usuario.
	 *	@autor Leonel Paulino
	 *	@return Projects  
	*/
	public function getProjects(){
			return $this->BelongsToMany('project','project_user_role','user_id','project_id');
	}
	/*
	* @brief Retorna los posts de los que este usuario esta encargado.
	* @author Miguel Saiz
	* @returns El listado de los posts del que este es responsable. 
	*/
	public function responsibleForPosts() {
		return $this->belongsToMany('post', 'project_user_role_post','user_id','post_id');
	}
	/**
	*	@brief: Crea un nuevo usuario en la base de datos y retorna el usuario creado. 
	*	@autor Leonel Paulino
	*	@param name		nombre del usuario que se va crear
	*	@param lastname 	apellido del usuario que se va crear.
	*	@param username 	nombre de usuario.
	*	@param intialpass   contraseña del usuario.
	*	@param defaultid 	El id por default del usuario.
	*	@param email 		email del usuario.
	*	@return User 		
	*/
	public static function newUser($name,$lastname,$username,$intialpass,$defaultid,$email){
		$user = new User;
		$user->name = $name;
		$user->lastname = $lastname;
		$user->username = $username;
		$user->password = $intialpass;
		$user->default_role_id = $defaultid;
		$user->email = $email;
		$user->active = 1;
		$user->save();
		return $user;
	}
	/**
	*	@brief Esta clase se encarga de retorna un usuario de la base de datos dado el nombre de usuario.
	*	@autor Leonel Paulino
	*	@param username Nombre de usuario
	* 	@return Un usuario.
	*/
	public static function getUser($username){
		try {
			return User::where('username', '=',$username)->firstOrFail();
		}
		catch(Exception $e){
			return NULL;
		}
	}

	/**
	*	@brief Esta funcion se encarga de autenticar el usuario con su contraseña.
	*	@autor Leonel Paulino
	*	@param username nombre de usuario
	*	@param password contraseña del usuario.
	* 	@return retorna el usuario si se pudo autententicar de lo contrario retorna NULL.
	*/
	public static function authentication($username , $password){
		$user = User::getUser($username);
		if ( is_null($user) || $user->password != $password){
			return NULL;
		}
		return $user; 
		
	}
	/**
	*	@brief Esta funcion retorna todos los post pendiente del usuario.
	*	@autor Leonel Paulino
	* 	@return return yield. post .
	*/
	public function getPendingPost(){
		$posts = $this->getpostVersion();
		foreach ($post as $posts)
		{
			if ( $post->pending ){
				yield $post;
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

	/*
	*	@brief Esta clase se encarga de retorna un usuario de la base de datos dado el id del usuario.
	*	@autor Leonel Paulino
	*	@param userID El id de un usuario.
	* 	@return Un usuario o null si el usuario no existe.
	*/
	public static function getUserWithID($userID) {
		try {
			$user = User::findOrFail($userID);
			return $user;
		}
		catch(Exception $e){
			return NULL;
		} 
	}
	/*
	*	@brief Esta clase se encarga de retorna un usuario de la base de datos dado el id del rol de los usuarios.
	*	@autor Leonel Paulino
	*	@param roleID El id del rol.
	* 	@return Una lista de usuarios o null si no existe ninguno.
	*/
	public static function getUsersWithRoleID($roleID) {
			try {
			 $users  = Users::where('default_role_id' ,'=', $roleID);
			 return $users;
			}
			catch(Exception $e){
				return NULL;
			}
	}
	/*
	*	@brief Esta clase se encarga de retorna un usuario de la base de datos dado el rol de los usuarios.
	*	@autor Miguel Saiz
	*	@param role El rol.
	* 	@return Una lista de usuarios o  null si no existe ninguno.
	*/
	public static function getUsersWithRole($role) {
		return User::getUserWithRole($role->$roleID);
	}
	/*
	*	@brief Cambiar el password del usuario.
	*	@autor Leonel Paulino
	*	@param oldPass El password viejo.
	*	@param newPass El password nuevo.
	* 	@return True si se pudo cambiar.
	*/
	public function changePassword($oldPass, $newPass) {
		if ($this->password == $oldpass){
			$this->password = $newpass;
			$this->save();
			return true;
		}
		else {
			return false;
		}
	}
}
