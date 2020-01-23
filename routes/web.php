<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It is a breeze. Simply tell Lumen the URIs it should respond to
| and give it the Closure to call when that URI is requested.
|
*/

$router->get('/', function () use ($router) {
    return $router->app->version();
});

// Generate Application Key
$router->get('/key', 'ExampleController@generateKey');
$router->group(['prefix' => 'api/v1'], function() use ($router) {
    // Ortu
    $router->get('ortu', 'OrtuController@index');
    $router->get('ortu/{id}', 'OrtuController@show');
    $router->post('ortu', 'OrtuController@create');
    $router->delete('ortu/{id}', 'OrtuController@destroy');
    $router->put('ortu/{id}', 'OrtuController@update');

    // Anak
    $router->get('anak', 'AnakController@index');
    $router->get('anak/{id}', 'AnakController@show');
    $router->post('anak', 'AnakController@create');
    $router->delete('anak/{id}', 'AnakController@destroy');
    $router->put('anak/{id}', 'AnakController@update');

    // TPA
    $router->get('tpa', 'TpaController@index');
    $router->get('tpa/{id}', 'TpaController@show');
    $router->post('tpa', 'TpaController@create');
    $router->delete('tpa/{id}', 'TpaController@destroy');
    $router->put('tpa/{id}', 'TpaController@update');

    // Kegiatan
    $router->get('kegiatan', 'KegiatanController@index');
    $router->get('kegiatan/{id}', 'KegiatanController@show');
    $router->post('kegiatan', 'KegiatanController@create');
    $router->delete('kegiatan/{id}', 'KegiatanController@destroy');
    $router->put('kegiatan/{id}', 'KegiatanController@update');

    // login ortu
    $router->post("/login", "AuthController@login");
});