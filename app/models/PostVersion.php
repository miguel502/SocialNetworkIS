<?php


class PostVersion extends Eloquent {
	
	/**
	 * @brief La tabla de la base de datos usada por el modelo.
	 * @author Miguel Saiz
	 *
	 * @var string
	 */
	protected $table = 'postversion';

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
	* @brief Acepta esta version del post.
	* @author Miguel Saiz
	* @param user El usuario que aceptó el post.
	*/
	public function accept($user) {
		$this->approval_state = 1;
		$this->save();
		Stage::nextWorkflow($this, $this->$workflow_stage_id);
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
		Stage::previousWorkflow($this, $this->$workflow_stage_id);
	}

	/*
	* @brief Copia un postversion con el fin de cambiarlo a la BD.
	* @author Miguel Saiz
	* @param postVersion El objeto postversion.
	* @param workflowStageId El id del workflowstage actual.
	* @returns El postversion creado.
	*/
	public static function newVersion($postVersion, $workflowStageId) {
		$newPostVersion = new PostVersion;
		
		//El copiado
		$newPostVersion->post_id = $postVersion->$post_id;
		$newPostVersion->image_url = $postVersion->$image_url;
		$newPostVersion->publication_date = $postVersion->$publication_date;
		$newPostVersion->tipo = $postVersion->$tipo;
		$newPostVersion->objetivo = $postVersion->$objetivo;
		$newPostVersion->copy = $postVersion->$copy;
		$newPostVersion->hashtag = $postVersion->$hashtag;
		$newPostVersion->nota = $postVersion->$nota;
		$newPostVersion->textoarte_url = $postVersion->$textoarte_url;
		$newPostVersion->textoarte_text = $postVersion->$textoarte_text;
		$newPostVersion->fuente = $postVersion->$fuente;

		//Los cambios para marcarlo como pendiente
		$newPostVersion->pending = 1;
		$newPostVersion->workflow_stage_id = $workflow_stage_id;

		$newPostVersion->save();
		return $newPostVersion;
	}

	/*
	* @brief Crear una version para un post nuevo.
	* @author Miguel Saiz
	* @param project El proyecto.
	* @param author El pusuario que hizo la versión.
	* @param publication_date La fecha de publicación del post.
	* @param tipo El de post.
	* @param objetivo El objetivo del post.
	* @param copy El titulo que se agregará en la red social.
	* @param hashtag Un texto con los hashtags del proyecto.
	* @param nota Una nota.
	* @param textoarte_text El contenido del post (texto).
	* @param fuente La fuente de donde se extrajo.
	*/
	public static function newPostVersion($project, $author, $publication_date, $tipo, $objetivo, $copy, $hashtag, $nota, $textoarte_text, $fuente) {
		$postVersion = new PostVersion;
		$postVersion->users_id = $author;
		$postVersion->publication_date = $publication_date;
		$postVersion->tipo = $tipo;
		$postVersion->objetivo = $objetivo;
		$postVersion->copy = $copy;
		$postVersion->hashtag = $hashtag;
		$postVersion->nota = $nota;
		$postVersion->textoarte_text = $textoarte_text;
		$postVersion->fuente = $fuente;
		$postVersion->save();

		$post = new Post;
		$post->post_version = $postVersion;
		$post->save();

		return $postVersion;
	}
}
