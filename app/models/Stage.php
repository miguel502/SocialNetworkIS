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

    /*
        @brief: Retorna todos los work_flow al que pertenece la etapa.
        @return work_flow  
        @autor Michael M. Rosario
    */
    public function getWorkflowStage()
    {
        return $this->belongsTo('work_flow_stage');
    }

    /*
        @brief: Retorna todas las etapas asociadas al projecto.
        @return Projects_stage
        @autor Michael M. Rosario
    */
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
    * @author Michael M. Rosario
    * @note Requerido por post_version ~Miguel Saiz
    */
    public static function nextWorkflow($postVersion, $workflow_stage_id) {
        //STUB: NOT IMPLEMENTED
        //Encontrar el workflow id correspondiente y llamar:
        //PostVersion::newPostVersion($postVersion, $workflowId);

        //Obtengo el workflow de la etapa del post.
        $workFlowStage = Workflow::getStage()->where('workflow_stage_id', '=', $postVersion->workflow_stage_id);
        
        //Del workflow anterior indentifico cuál es el paso siguiente de ese workflow.
        $nextWorkFlowStage = workflow::getStage()->where('position', '=', $workFlowStage->position + 1)
                                                 ->get();

        //Si no existe un paso siguiente, se crea una nueva versión del post y se asigna a la ETAPA siguiente.
        if ($nextWorkFlowStage == null)
        {
            PostVersion::newPostVersion($postVersion, $nextWorkFlowStage->id);
        }
        //En caso contrario se crea una nueva versión del post y se asigna al paso siguiente del WORKFLOW.
        else if ($nextWorkFlowStage != null) {
            $nextWorkflow = DB::table('workflow')
                                            ->where('stage_id', '=', $workflow_stage_id)
                                            ->where('id', '>', $postVersion->workflow_id)
                                            ->orderBy('id', 'ASC')
                                            ->first();

            PostVersion::newPostVersion($postVersion, $nextWorkflow->id);

        } 

    }

    /*
    * @brief Crea una nueva version de post usando el id del principio del workflow_stage. 
    * @author Michael M. Rosario
    * @note Requerido por post_version ~Miguel Saiz
    */
    public static function previousWorkflow($postVersion, $workflow_stage_id) {
        //Obtengo el workflow de la etapa del post.
        $workFlowStage = Workflow::getStage()->where('workflow_stage_id', '=', $postVersion->workflow_stage_id);
        
        //Del workflow anterior indentifico cuál es el paso anterior de ese workflow.
        $previousWorkFlowStage = workflow::getStage()->where('position', '<', $workFlowStage->position)
                                                     ->orderBy('position','DESC')
                                                     ->first();

        //Creo una nueva versión del post basado en el actual y lo asigno al paso anterior del workflow.
        PostVersion::newPostVersion($postVersion, $previousWorkFlowStage->id);


    }
}
