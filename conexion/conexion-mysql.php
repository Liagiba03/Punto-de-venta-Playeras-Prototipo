<?php
    $servidor = "localhost";
    $usuario = "root";
    $nomBaseDatos = "negocio";
    $password= "SusSand#";
    // Conectando a la base de datos
    $conexion = mysqli_connect($servidor,$usuario,$password, $nomBaseDatos);
    if(!$conexion){
        echo "Problemas al conectar la db";
    }else{
        echo "conexion";
    }

?>