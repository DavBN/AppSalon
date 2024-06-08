// tests/UsuarioTest.php
<?php

require 'DatabaseTestCase.php';
require 'models/ActiveRecord.php'; 
require 'models/Usuario.php'; 

use Model\Usuario;

class UsuarioTest extends DatabaseTestCase

{
    
    public function testCrearRegistro()
    {
        $usuario = new Usuario([
            'nombre' => 'Oscar',
            'apellido' => 'Gallego',
            'email' => 'oscar@gmail.com',
            'password' => '123456',
            'telefono' => '1234567890',
            'admin' => '0',
            'confirmado' => '0',
            'token' => ''
        ]);
        $usuario->hashPassword();
        $usuario->crearToken();

        $result = $usuario->guardar();

        $this->assertTrue($result['resultado']);
        $this->assertNotNull($result['id']);

        $query = "SELECT * FROM usuarios WHERE id = " . $result['id'];
        $result = $this->mysqli->query($query);
        $data = $result->fetch_assoc();

        $this->assertEquals('Oscar', $data['nombre']);
        $this->assertEquals('Gallego', $data['apellido']);
        $this->assertEquals('oscar@gmail.com', $data['email']);
        $this->assertNotEquals('123456', $data['password']); 
        $this->assertEquals('1234567890', $data['telefono']);
        $this->assertEquals('0', $data['admin']);
        $this->assertEquals('0', $data['confirmado']);
        $this->assertNotEmpty($data['token']);
    }

    public function testActualizarRegistro()
    {
        $usuario = new Usuario([
            'nombre' => 'Oscar',
            'apellido' => 'Gallego',
            'email' => 'oscar@gmail.com',
            'password' => '123456',
            'telefono' => '1234567890',
            'admin' => '0',
            'confirmado' => '0',
            'token' => ''
        ]);
        $usuario->hashPassword();
        $usuario->crearToken();
        $usuario->guardar();

        // Obtener el ID del usuario creado
        $userId = $this->mysqli->insert_id;
        $usuario->id = $userId;

        $usuario->nombre = 'Oscar';
        $usuario->apellido = 'Gallego';
        $result = $usuario->guardar();

        $this->assertTrue($result);

        $query = "SELECT * FROM usuarios WHERE id = " . $userId;
        $result = $this->mysqli->query($query);
        $data = $result->fetch_assoc();

        $this->assertEquals('Oscar', $data['nombre']);
        $this->assertEquals('Gallego', $data['apellido']);
    }

    public function testEliminarRegistro()
    {
        $usuario = new Usuario([
            'nombre' => 'Oscar',
            'apellido' => 'Gallego',
            'email' => 'oscar@gmail.com',
            'password' => '123456',
            'telefono' => '1234567890',
            'admin' => '0',
            'confirmado' => '0',
            'token' => ''
        ]);
        $usuario->hashPassword();
        $usuario->crearToken();
        $usuario->guardar();

        // Obtener el ID del usuario creado
        $userId = $this->mysqli->insert_id;
        $usuario->id = $userId;

        $result = $usuario->eliminar();

        $this->assertTrue($result);

        $query = "SELECT * FROM usuarios WHERE id = " . $userId;
        $result = $this->mysqli->query($query);

        $this->assertEquals(0, $result->num_rows);
    }
}

