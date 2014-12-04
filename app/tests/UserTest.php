<?php

class UserTest extends TestCase {

	/**
	 * Prueba la busqueda de un user por username
	 */
	public function testGetUserByUsername(){
		$user = User::getUser('msaiz');
		$this->assertTrue($user->name == 'miguel');
		$this->assertTrue($user->lastname == 'saiz');
	}

	/**
	 * Prueba la busqueda de un user por id
	 */
	public function testGetUserByID(){
		$user = User::getUserWithID(1);

		$this->assertTrue($user->name == 'miguel');
		$this->assertTrue($user->lastname == 'saiz');

		$user1 = User::getUserWithID(10);
		$this->assertTrue($user1 == null);
	}

	/**
	* Prueba la busqueda de usuarios por rol
	*/
	public function testGetUserByRole(){
		$group1 = User::getUsersWithRoleID(5);
		$this->assertTrue($group1->count() == 1);

		$group2 = User::getUsersWithRoleID(1);
		$this->assertTrue($group2->count() == 2);

		$group3 = User::getUsersWithRoleID(10);
		$this->assertTrue($group3->count() == 0);
	}

	/**
	 * Prueba el login
	 */
	public function testLogin(){
		$user = User::authentication('msaiz', 'miguel123');
		$this->assertTrue($user != null);
		$user = User::authentication('msaiz', 'invalido');
		$this->assertTrue($user == null);
		$user = User::authentication('invalido', 'invalido');
		$this->assertTrue($user == null);
	}

	/**
	*  Prueba de creación de usuario.
	*/
	public function testNewUser() {
		$user = User::newUser('juan', 'perez', 'jperez', '123123', '2', 'j.perez@hotmail.com');
		$this->assertTrue(User::getUser('jperez') != null);
		$this->assertTrue(User::authentication('jperez', '123123') != null);
		$user->delete();
	}

	/*
	* Probar el cambio de password.
	*/
	public function testChangePassword() {
		$user = User::authentication('msaiz', 'miguel123');
		$this->assertTrue(User::authentication('msaiz', '123123') == null);
		$this->assertTrue(User::authentication('msaiz', 'miguel123') != null);

		$this->assertTrue($user->changePassword('miguel123', '123123'));
		$this->assertTrue(User::authentication('msaiz', '123123') != null);
		$this->assertTrue(User::authentication('msaiz', 'miguel123') == null);

		//Reiniciar el password
		$user->password = 'miguel123';
		$user->save();
	}

	/*
	* Probar la obtención de proyectos
	*/
	public function testGetProjects() {
		$user = User::getUser('msaiz');
		$this->assertTrue(count($user->getProjects()) > 0);
	}

	/*
	* Probar los responsables de un post
	*/
	public function testResponsible() {
		$user = User::getUser('msaiz');
		$this->assertTrue(count($user->responsibleForPosts()) > 0);
	}

	/*
	* Probar la obtención de posts
	*/
	public function testGetPosts() {
		$user = User::getUser('lpaulino');
		$this->assertTrue(count($user->getPosts()) > 0);
	}
}
