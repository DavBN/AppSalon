<?php

require 'DatabaseTestCase.php';
require 'models/ActiveRecord.php'; 
require 'models/Usuario.php'; 
require 'controllers/LoginController.php';

use Controllers\LoginController;
use Model\Usuario;
use MVC\Router;

class LoginControllerTest extends DatabaseTestCase
{
    public function testLoginSuccess()
    {
        // Configurar la solicitud POST simulada
        $_SERVER['REQUEST_METHOD'] = 'POST';
        $_POST['email'] = 'hola@hola';
        $_POST['password'] = '123456789';

        // Crear un nuevo usuario para las pruebas
        $usuario = new Usuario([
            'nombre' => 'david',
            'apellido' => 'garcia',
            'email' => 'hola@hola',
            'password' => password_hash('contraseña', PASSWORD_DEFAULT), 
            'telefono' => '1234567890',
            'admin' => '0',
            'confirmado' => '1', 
        ]);
        $usuario->guardar(); 

     
        ob_start(); 
        LoginController::login(new Router()); 
        ob_end_clean(); 

        // Verificar que se haya iniciado la sesión
        $this->assertTrue(isset($_SESSION['id']));
        $this->assertTrue($_SESSION['login']);
    }

  
}
