<?php


class PostVersion extends Eloquent {
	
	/**
	 * @brief La tabla de la base de datos usada por el modelo.
	 * @author Miguel Saiz
	 *
	 * @var string
	 */
	protected $table = 'post_version';

	/*
	* @brief El post original al que esta versión pertenece.
	* @author Miguel Saiz
	* @returns El post original.
	*/
	public function post() {
		return $this->belongsTo('post');
	}

}
