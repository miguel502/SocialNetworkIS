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

    public function getWorkflowStage()
    {
        return $this->belongsTo('work_flow_stage');
    }


    public function getProjectStage()
    {
        return $this->belongsTo('project_stage');
    }

    /*
        @brief: Retorna todos los checklist al que pertenece la etapa.
        @return Projects  
        @autor Michael M. Rosario
    */
    public function getCheckList(){
        return $this->belongsToMany('project', 'project_user_role', 'user_id', 'project_id');
    }

    /*
    * @brief Crea una nueva version de post usando el id del proximo workflow_stage. 
    * @author N/A
    * @note Requerido por post_version ~Miguel Saiz
    */
    public static function nextWorkflow($postVersion, $workflow_stage_id) {
        //STUB: NOT IMPLEMENTED
        //Encontrar el workflow id correspondiente y llamar:
        //PostVersion::newPostVersion($postVersion, $workflowId);
    }

    /*
    * @brief Crea una nueva version de post usando el id del principio del workflow_stage. 
    * @author N/A
    * @note Requerido por post_version ~Miguel Saiz
    */
    public static function firstWorkflow($postVersion, $workflow_stage_id) {
        //STUB: NOT IMPLEMENTED
        //Encontrar el workflow id correspondiente y llamar:
        //PostVersion::newPostVersion($postVersion, $workflowId);
    }
}
