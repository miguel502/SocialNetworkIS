<?php

/*
	@brief: Clase que representa un usuario de la base de datos.

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
	*/
	public function getProjects(){
		return $this->belongsToMany('project', 'project_user_role', 'user_id', 'project_id');
	}
}
