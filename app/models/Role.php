<?php


class Role extends Eloquent {

	/**
	 * @brief La tabla de la base de datos usada por el modelo.
	 * @author Miguel Saiz
	 *
	 * @var string
	 */
	protected $table = 'role';

	/*
	* @brief Devuelve a todos los usuarios con un rol.
	* @author Miguel Saiz
	* @returns Arreglo de usuarios.
	*/
	public function getUsers() {
		return $this->$belongsToMany('users', 'project_user_role', 'user_id', 'role_id');
	}

	/*
	* @brief Devuelve todos los usuarios que tienen este rol por defecto.
	* @author Miguel Saiz
	* @brief Lista de usuarios
	*/
	public function getUsersWithDefaultRole(){
		$this->hasMany('users', 'default_role_id');
	}

	/*
	* @brief Devuelve todos los workflows con el cual este rol esta asociado.
	* @author Miguel Saiz
	* @brief Lista de workflow
	*/
	public function getWorkflow(){
		$this->hasMany('workflow', 'role_id');
	}

	/*
	* @brief Devuelve todos los usuarios que tienen un rolID como rol por defecto.
	* @author Miguel Saiz
	* @param roleID El id del rol.
	* @brief Lista de usuarios
	*/
	public static function getUsersWithDefaultRoleID($roleID){
		$role = Role::Find($roleID);
		if ($role != null) {
			return $role->getUsers();
		}
		return null;
	}
	/*
	* @brief Devuelve todos los usuarios que tienen un rol como rol por defecto.
	* @author Miguel Saiz
	* @param role El rol.
	* @brief Lista de usuarios
	*/
	public static function getUsersWithDefaultRole($role){
		return Role::getUsersWithDefaultRoleID($role->id);
	}
}
