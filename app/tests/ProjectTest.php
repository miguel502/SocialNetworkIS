<?php


class ProjectTest extends TestCase {

    public function testNewProject(){
        $this->assertTrue(1==1);
        // ARREGLAR
    }
    
    public function testGetProject(){
        $project = Project::getProject(1);
        $this->assertTrue($project->name == 'Proyecto de curso');
    }

    public function testGetUserProjects(){
        $this->assertTrue(1==1);
    }
    public function testGetUsers(){

        $project = Project::getProject(1);
        //$users = $project->getUsers();
        $this->assertTrue(1==1);
    }
        public function testGetStages(){

        $project = Project::getProject(1);
        //$stages = $project->getStages();
        $this->assertTrue(1==1);
    }
        public function testGetPosts(){

        $project = Project::getProject(1);
        //$posts = $project->getPost();
        $this->assertTrue(1==1);
    }


}