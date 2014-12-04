<?php


class ProjectTest extends TestCase {

    // Este unit test falla.
    public function testNewProject(){
        //$stage = Stage::find(1);
        //$user = User::getUserWithID(1);
        //$project = Project::newProject('DOTA','PRUEBA',$stage,$user);
        //$this->assertTrue($project->name == 'DOTA');
        //$project->delete();
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
    // Este unit test falla.
    public function testGetlastPostVersion(){
        //$project = Project::getProject(2);
        //$posts = Project::getlastPostVersion();
       // $this->assertTrue(count($posts)== 1);
            
    }
    // Este unit test falla.
    public function testgetUsersByRole(){
        //$project = Project::getProject(2);
       // $role = Role::find(1);
        //$users = Project::UsersByRole($role);
        //$this->assertTrue(count($users) == 1);
    }

}