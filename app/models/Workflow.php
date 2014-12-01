<?php namespace Workflow;

/**
* @brief      Workflow
* @details    
*
* @author     Victor Peña
* @date       30/11/2014
* @version    v1.0
*
* @todo       
*
*/

class Workflow{
	
	//Identificador de workflow en la BD
	protected $table = 'Workflow';
	
	//Identificador unico por proyecto
	public $Type;
   
    //Constructor de la clase
	public function __construct($Typo) {
		
       $this->Type = $Typo;
	   
	   //
	   
   	}
	
	//Funcion encargada de añadir un Rol
	public static function AddRole(){
		
		
	}
	
	//Function encargada de 
	public static function RemoveRole($userID){
		
		
	}
	
	public function flush(){return true;}
	
}
?>
