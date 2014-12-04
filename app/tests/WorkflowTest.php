<?php

class WorkflowTest extends TestCase {

	/**
	 * .
	 *
	 * @return void
	 */
	public function testNewWorkflow(){
		
		
		$workflow = Workflow::newWorkflow('cliente');
			
		//$workflow->assertTrue($ui_type == 'cliente');
	}

}

?>