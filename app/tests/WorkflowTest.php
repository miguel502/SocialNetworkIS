<?php

class WorkflowTest extends TestCase {

	/**
	 * .
	 *
	 * @return void
	 */
	public function testnewWorkflow(){
		$workFlow = Workflow::newWorkflow('1','1');
		$workFlow->save();

		$this->assertTrue(Workflow::find($workFlow->id) != null);

		$workFlow->delete();
	}


	public function testgetRole()
	{
		$vaina = Workflow::find(1)->getRole();

		log::info($vaina);

		$this->assertTrue(True);
	}

	public function testgetStage()
	{
		$vaina = Workflow::find(1)->getStage();


		$this->assertNotCount(0, $vaina);
	}

}

?>