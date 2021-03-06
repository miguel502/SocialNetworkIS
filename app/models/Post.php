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
		return $this->hasMany('postversion');
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
	static public function newPost($project, $postVersion) {
		$this->project = $project->id;
		$this->author = $postVersion;
		$this->post_version = $postVersion;
		$this->save();
		return $this;
	}

	/*
	* @brief Consigue el post dado un ID.
	* @author Miguel Saiz
	* @returns El post.
	*/
	public static function getPost($postId) {
		return Post::Find($postId);
	}

	/*
	* @brief Consigue la ultima version de un post dado un id.
	* @author Miguel Saiz
	* @returns El PostVersion.
	* 
	*  Error de Unit-Test:  Llamada a metodo undefinido (explota)
	*/
	public static function getLastVersionByID($postId) {
		return Post::getPost($postId)->versions->orderBy('created_at', 'desc')->first();
	}

	/*
	* @brief Consigue la ultima version de un post.
	* @author Miguel Saiz
	* @returns El PostVersion.
	*
	*  Error de Unit-Test:  Llamada a metodo undefinido (explota)
	*/
	public static function getLastVersion($post) {
		return Post::getLastVersionByID($post->id);
	}
}

