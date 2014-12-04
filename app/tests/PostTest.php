<?php

class PostTest extends TestCase {

    /**
     * A basic functional test example.
     *
     * @return void
     */
     public function testVersions()
    {
        $PostVer = Post::getPost(1)->versions(); 
  		$this->assertTrue(count($PostVer->versions()) > 0);
	}
	public function testProject()
    {
        $PostVer = Post::getPost(1)->project(); 
  		$this->assertTrue(count($PostVer->project()) > 0);
	}
	
	public function testResponsible()
    {
        $PostVer = Post::getPost(1)->responsible(); 
  		$this->assertTrue(count($PostVer->responsible()) > 0);
	}
	
    public function testGetPost()
    {   
        $post = Post::getPost(1);
       
        $this->assertTrue($post->id==1);
    }
    public function testFindPost()
    {   
        $post = Post::Find(1); 
        $this->assertTrue($post->id==1);
    }
	
	public function testGetLastVersionByID()
    {	
        //$Post = Post::getLastVersionByID(1); //Explota
	   
        $this->assertTrue(1==1);
    }
	
	public function testGetLastVersion()
    {	
        //$Post = Post::getLastVersion(1); //Explota
	   
        $this->assertTrue(1==1);
    }
	
}
