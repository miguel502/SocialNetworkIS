<?php


class PostVersion extends Eloquent {
	
	/**
	 * @brief La tabla de la base de datos usada por el modelo.
	 *
	 * @var string
	 */
	protected $table = 'post_version';

	/*
	* @brief El post original al que esta versión pertenece.
	* @returns El post original.
	*/
	public function post() {
		return $this->belongsTo('post');
	}

}
