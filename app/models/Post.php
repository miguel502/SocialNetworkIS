<?php


class Post extends Eloquent {

	/**
	 * @brief La tabla de la base de datos usada por el modelo.
	 * @author Miguel Saiz
	 *
	 * @var string
	 */
	protected $table = 'post';

	/*
	* @brief Las diferentes versiones del post actual.
	* @author Miguel Saiz
	* @returns El listado de todas las versiones.
	*/
	public function versions() {
		return $this->hasMany('post_version');
	}

	/*
	* @brief El proyecto al que este post pertenece.
	* @author Miguel Saiz
	* @returns El proyecto.
	*/
	public function project() {
		return $this->belongsTo('project');
	}

	/*
	* @author Miguel Saiz
	* @returns El listado de los responsables.
	* @todo Revisar la documentacion del belong to many. 
	*/
	public function responsible() {
		return $this->belongsToMany('project_user_role', 'project_user_role_post');
	}

	/*
	* @brief Crea un nuevo post en la base de datos dada un PostVersion.
	* @author Miguel Saiz
	* @returns El post creado.
	*/
	static public function newPost($project, $author, $postVersion) {
		$this->project = $project;
		$this->author = $postVersion;
		$this->post_version = $postVersion;
		$this->save();
		return $this;
	}
}

