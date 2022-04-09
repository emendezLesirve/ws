<?php

	include 'conexion.php';
	
	$pdo = new Conexion();
	
	//Listar registros y consultar registro
	      if($_SERVER['REQUEST_METHOD'] == 'GET'){
                $sql=$pdo->prepare(
                "SELECT n.calificacion,a.nombre 
                 FROM nota as n 
                 INNER JOIN alumno as a ON(n.id_alumno=a.id_alumno)
                 WHERE a.nombre='maria'
                 "
                );
			$sql->execute();
			$sql->setFetchMode(PDO::FETCH_ASSOC);
            //respuesta http
			header("HTTP/1.1 200 hay datos");
            //retornar en json
			echo json_encode($sql->fetchAll());
			exit;				
	}

 ?>   