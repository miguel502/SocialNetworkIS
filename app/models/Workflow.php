<?php 

/**
* @brief      Workflow
* @details    Clase encargada del flujo de trabajo    
*
* @author     Victor Peña
* @date       30/11/2014
* @version    v1.0
*       
*
*/

class Workflow extends Eloquent{
	
	//Identificador de workflow en la BD
	protected $table = 'workflow';
   
    //Constructor de la clase
	public static function newWorkflow($type) {
		
		$wf = new Workflow;
       	$wf->ui_type = $type;
	   	$wf->save();
	   
	   	return $wf;
   	}
	
	//Funcion encargada de añadir un Rol
	public function addRole($role_id){
		
		$this->role_id = $role_id;
		$this->save();
		
		return this;
	}
	
	//Function encargada de remover un rol
	public function removeRole($role_id){
		
		$this->role_id = NULL;
		$this->save();
		
		return this;
	}
	
	//Funcion encargada de intercambiar Roles
	public function exchangeRole($role1, $role2){

	}
	
	public function getRole(){
		return $this->belongsTo('role','role_id');
	}
	
	public function getStage(){
		return $this->belongsToMany('stage', 'workflow_stage', 'stage_id', 'workflow_id');
	}
	
	public function getPostVersion(){
		return $this->hasMany('post_version');
	}
	
}

?>
