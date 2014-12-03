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
	public function getPost() {
		return $this->belongsTo('post');
	}

	/*
	* @brief El workflow al que este post esta asociado.
	* @author Miguel Saiz
	* @returns El workflow.
	*/
	public function getWorkflow() {
		return $this->belongsTo('workflow');
	}

	/*
	* @brief Consigue el historial de todas las versiones del post.
	* @author Miguel Saiz
	* @returns Todas las versiones.
	*/
	public function getHistory() {
		return $this->getPost()->versions();
	}

	/*
	* @brief La persona que hizo esta versión.
	* @author Miguel Saiz
	* @returns El usuario.
	*/
	public function getAuthor() {
		return $this->hasOne('Users', 'users_id');
	}

	/*
	* @brief Rechaza esta version del post.
	* @author Miguel Saiz
	* @param user El usuario que rechazo el post.
	* @todo Debería agregarse un comentario y adicionalmente, asignar al encargado.
	*/
	public function reject($user, $feedback) {
		$this->approval_state = 0;
		$this->feedback = $feedback;
		$this->save();
	}

	/*
	* @brief Acepta esta version del post.
	* @author Miguel Saiz
	* @param user El usuario que aceptó el post.
	*/
	public function accept($user) {
		$this->approval_state = 1;
		$this->save();
	}

	/*
	* @brief Copia un postversion con el fin de pasarlo al proximo workflow.
	* @author Miguel Saiz
	* @returns Un postversion sin newPostVersion
	*/
	public function newPostVersion($postVersion, $workflow_stage_id) {
		$newPostVersion->post_id = $postVersion->$post_id;
		$newPostVersion->image_url = $postVersion->$image_url;
		$newPostVersion->publication_date = $postVersion->$publication_date;
		$newPostVersion->pending = 1;
		$newPostVersion->tipo = $postVersion->$tipo;
		$newPostVersion->objetivo = $postVersion->$objetivo;
		$newPostVersion->copy = $postVersion->$copy;
		$newPostVersion->hashtag = $postVersion->$hashtag;
		$newPostVersion->nota = $postVersion->$nota;
		$newPostVersion->textoarte_url = $postVersion->$textoarte_url;
		$newPostVersion->textoarte_text = $postVersion->$textoarte_text;
		$newPostVersion->fuente = $postVersion->$fuente;
		$newPostVersion->workflow_stage_id = $workflow_stage_id;
		return $newPostVersion;
	}
}
