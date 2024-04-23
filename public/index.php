<?php 

require_once __DIR__ . '/../includes/app.php';

use Controllers\APIController;
use Controllers\CitaController;
use Controllers\LoginController;
use MVC\Router;
$router = new Router();


// Iniciar Sesión
$router->get('/', [LoginController::class, 'login']);
$router->post('/', [LoginController::class, 'login']);
$router->get('/logout', [LoginController::class, 'logout']);


// Recuperación de contraseña
$router->get('/olvide', [LoginController::class, 'olvide']);
$router->post('/olvide', [LoginController::class, 'olvide']);
$router->get('/recuperar', [LoginController::class, 'recuperar']);
$router->post('/recuperar', [LoginController::class, 'recuperar']);

// Crear una cuenta
$router->get('/crear-cuenta', [LoginController::class, 'crear']);
$router->post('/crear-cuenta', [LoginController::class, 'crear']);

// Confirmación de cuenta
$router->get('/confirmar-cuenta', [LoginController::class, 'confirmar']);
$router->get('/mensaje', [LoginController::class, 'mensaje']);

//Area privada
$router->get('/cita', [CitaController::class, 'index']);

// api de citas
$router->get('/api/servicios', [APIController::class, 'index']);


// Comprueba y valida las rutas, que existan y les asigna las funciones del Controlador
$router->comprobarRutas();