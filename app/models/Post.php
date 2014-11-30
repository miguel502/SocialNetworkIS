<?php


class Post extends Eloquent {

	/**
	 * @brief La tabla de la base de datos usada por el modelo.
	 *
	 * @var string
	 */
	protected $table = 'post';

	/*
	* @brief Las diferentes del post.
	* @returns El listado de todas las versiones.
	*/
	public function versions() {
		return $this->hasMany('post_version');
	}

}
