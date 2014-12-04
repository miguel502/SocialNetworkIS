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
    // El Stage_id y role_id son obligatorios al crear un WorkFlow.
	public static function newWorkflow($role, $type) {
		$workflow = new Workflow;
      	$workflow->ui_type = $type;
      	$workflow->role_id = $role;
      	$workflow->save();
	   
	   	return $workflow;
   	}

   	//Este método no me hace sentido, ya el rol se asigna de manera obligatoria al crear el workflow.
   	//Me hace más sentido el de cambiar rol.
	//Funcion encargada de añadir un Rol
	public function addRole($role_id){
		
		$this->role_id = $role_id;
		$this->save();
		
		return $this;
	}
	
	//Este método no hace sentido, El rol es obligatorio en el WorkFlow.
	//Function encargada de remover un rol
	public function removeRole($role_id){
		
		$this->role_id = NULL;
		$this->save();
		
		return $this;
	}
	
	//Funcion encargada de intercambiar Roles
	public function exchangeRole($role){
        $this->role_id = $role;
        $this->save();

        return $this;

	}

	//Este método manda el siguiente error:
	/*
	PHP Fatal error:  Cannot redeclare Role::getUsersWithDefaultRole() in /Applications/XAMPP/xamppfiles/htdocs/SocialNetworkIS/app/models/role.php on line 60
	*/
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
