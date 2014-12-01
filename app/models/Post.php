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
	* @brief Las diferentes del post.
	* @author Miguel Saiz
	* @returns El listado de todas las versiones.
	*/
	public function versions() {
		return $this->hasMany('post_version');
	}

}
