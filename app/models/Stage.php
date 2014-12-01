<<<<<<< HEAD
<?php


class Stage extends Eloquent {

	/**
	 * @brief La tabla de la base de datos usada por el modelo.
	 *
	 * @var string
	 */
	protected $table = 'stage';

}
=======
<?php 

class Stage extends Eloquent {

    // Tabla que usa el modelo!
	protected $table = 'stage';

	protected $fillable = array('project_id', 'title', 'description', 'position', 'id_checklist');

    public static function newStage($position, $project_id)
    {
    	return true;
    }

    public static function getStage($position, $project_id)
    {
    	$model = User::where('position', '=', $position)->firstOrFail();

    	return $model;
    }

}
>>>>>>> michael-stage
