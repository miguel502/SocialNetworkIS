<?php


class ProjectTest extends TestCase {

    public function testNewProject(){
        //$this->assertTrue(1==1);
        //ARREGLAR
    }
    
    public function testGetProject(){
        $project = Project::getProject(1);
        $this->assertTrue($project->name == 'Proyecto de curso');
    }

    public function testGetUsers(){

        $project = Project::getProject(1);
        $users = $project->getUsers();
        $this->assertTrue(count($users)==1);
    }
    public function testGetStages(){
        
        $project = Project::getProject(2);
        $stages = $project->getStage()->get()->toArray();
        $this->assertTrue($stages[0]['title'] == 'Creación de contenido');
        $this->assertTrue($stages[1]['title'] == 'Diseño');
    }
    public function testGetPosts(){

        $project = Project::getProject(2);
        $posts = $project->getPost()->get()->toArray();
        $this->assertTrue($posts[0]['project_id']==2);
    }

    public function testGetlastPostVersion(){
        //GetLastPostVersion esta mal implementada
            
    }

    public function testgetUsersByRole(){
       // GetUserByRole esta mal implementada.
    }


}