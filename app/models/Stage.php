<?php

class Stage extends Eloquent {

	/**
	 * @brief La tabla de la base de datos usada por el modelo.
	 * @author Michael Rosario
	 *
	 * @var string
	 */
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

    /*
    * @brief Retorna el id del proximo workflow_stage. 
    * @author N/A
    * @returns id del workflow_stage. 
    * @note Requerido por post_version ~Miguel Saiz
    */
    public static function nextWorkflow($workflow_stage_id) {
        //STUB: NOT IMPLEMENTED
    }

    /*
    * @brief Retorna el id del principio del workflow_stage. 
    * @author N/A
    * @returns id del workflow_stage. 
    * @note Requerido por post_version ~Miguel Saiz
    */
    public static function firstWorkflow($workflow_stage_id) {
        //STUB: NOT IMPLEMENTED
    }
}
