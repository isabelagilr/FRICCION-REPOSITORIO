<?php

ini_set('display_errors','off');
ini_set('display_startup_errors','off');
error_reporting(0);

function Conectarse()
{
  
   $link = mysqli_connect("localhost","root","","bdfriccionfinal");
   
   if(!$link)
    {
        echo"Error conectando a la base de datos.";
        exit();
    }

    return $link;
}

?>