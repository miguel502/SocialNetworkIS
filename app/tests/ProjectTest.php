<?php


/**
* @name      ProjectTest
* @details    
* @author     Miguel Calderon
* @date       02/12/2014
*/
class ProjectTest extends TestCase {

    public function testNewProject(){

    	$project = true;
    	$this->assertTrue($project == true);
    }
    
    public function testGetProject(){

    	$projectid = 1;
        $project = Project::GetProject($projectid);
        
        //fwrite(STDERR, print_r(, TRUE));
        $this->assertTrue($project->name == 'Proyecto de curso');

    }

    public function testGetClientProjects(){

        //$projectid = 6;
        //$projects = Project::GetClientProjects($projectid);
        //fwrite(STDERR,print_r($projects,TRUE));

    }

    public function testGetUserProjects(){

        


    }



}