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
		$client = User::getUsersWithRoleID(5);
		$this->assertTrue($users->count() == 1);

		$client = User::getUsersWithRoleID(1);
		$this->assertTrue($users->count() == 2);

		$client = User::getUsersWithRoleID(10);
		$this->assertTrue($users->count() == 0);
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
		$this->assertTrue(User::authentication('msaiz', '123123') != null);

		$this->assertTrue($user->changePassword('miguel123', '123123'));
		$this->assertTrue(User::authentication('msaiz', '123123') != null);
		$this->assertTrue(User::authentication('msaiz', 'miguel123') == null);

		//Reiniciar el password
		$this->assertTrue($user->changePassword('123123', 'miguel123'));
	}
}
