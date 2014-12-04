<?php namespace Workflow;

/**
* @brief      Workflow
* @details    
*
* @author     Victor Peña
* @date       30/11/2014
* @version    v1.0
*       
*
*/

class Workflow{
	
	//Identificador de workflow en la BD
	protected $table = 'Workflow';
   
    //Constructor de la clase
	public static function newWorkflow($typo) {
		
       $this->type = $typo;
	   $this->save();
	   
	   return this;
   	}
	
	//Funcion encargada de añadir un Rol
	public static function AddRole($role){
		
	}
	
	//Function encargada de remover un rol
	public static function RemoveRole($role){
		
	}
	
	//Funcion encargada de intercambiar Roles
	public static function ExchangeRole($role1, $role2){
		
	}
	
	public function getRole(){
		return this->belongsTo('Role','role_id');
	}
	
	public function getStage(){
		return this->belongsToMany('Stage, workflow_stage');
	}
	
	public function getPostVersion(){
		return this->hasMany('Post_Version');
	}
	
	public function flush(){return true;}
	
}

?>
