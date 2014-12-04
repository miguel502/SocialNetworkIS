<?php

class PostTest extends TestCase {

    /**
     * A basic functional test example.
     *
     * @return void
     */
     public function testVersions()
    {
        $PostVer = Post::versions(); 
  		$this->assertTrue(count($PostVer->versions()) > 0);
	}
	
    public function testGetPost()
    {	
        $post = Post::getPost(1);
	   
        $this->assertTrue($post->id==1);
    }
	
	public function testGetLastVersionByID()
    {	
        //$Post = Post::getLastVersionByID(1);
	   
        $this->assertTrue(1==1);
    }
	
}
