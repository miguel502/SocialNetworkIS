<?php


/**
* @name      ProjectTest
* @details    
* @author     Miguel Calderon
* @date       02/12/2014
*/
class ProjectTest extends TestCase {

    public function testNewProject()
    {
        parent::setUp();
    	$project = true;
    	$this->assertTrue($project == true);
    }
    
    public function testGetProject()
    {
        parent::setUp();
    	$projectid = 1;
    	
        $project = Project::GetProject($projectid);
        
        //$project = Project::find($projectid);

        $this->assertTrue($project->name == 'amadita');
    }



}