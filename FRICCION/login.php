<?php

include('conexion.php');


$con = Conectarse();
session_start();

$usuario=$_POST['usuario'];

$password=sha1($_POST['password']);



$query = "SELECT * FROM tbusuario WHERE usuario= '".$usuario."' AND password= '".$password."'";


$q = mysqli_query($con, $query);


$num_rows = mysqli_num_rows($q);


try{

if($q){
	if($num_rows > 0)
	{
            $_SESSION['usuario']=$usuario;
            header("Location: bienvenida.php");
            
	} else {
		echo "usuario o contraseña invalidos";
	}
}
} catch (Exception $error) {}


$mysqli_close = mysqli_close($con);