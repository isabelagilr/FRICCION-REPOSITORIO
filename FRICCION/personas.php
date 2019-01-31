<?php

session_start();

include 'conexion.php';

$link = Conectarse();


?>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
        <title>Registro de personas</title>

        <!-- Bootstrap -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- librerías opcionales que activan el soporte de HTML5 para IE8 -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    <body>
        <div class="row">
            <div class="col-lg-12 col-sm-8">
                <nav class="navbar navbar-default" role="navigation">
                    <div class="container-fluid">
                        <!-- Brand and toggle get grouped for better mobile display -->
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle collapsed" 
                                    data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                            <a class="navbar-brand" href="bienvenida.php">FRICCION</a>
                        </div>
                        <!-- Collect the nav links, forms, and other content for toggling -->
                        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                            <ul class="nav navbar-nav">
                                <li class="active"><a href="#">Maquinas <span class="sr-only">(current)</span></a></li>
                                
                                <li><a href="#">categorias</a></li>
                                <li><a href="#">estados</a></li>
                                <li><a href="#">almacenes</a></li>
                                <li><a href="#">productos</a></li>
                                
                                
                                <li><a href="#">informes</a></li>
                                <li><a href="#">movimientos</a></li>
                                <li><a href="#">conteo</a></li>
                             
                                
                     
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" 
                                       aria-expanded="false">Parametros <span class="caret"></span>
                                    </a>
                                    <ul class="dropdown-menu" role="menu">
                                        <li><a href="personas.php">Personas</a></li>
                                        <li><a href="#">Usuarios</a></li>
                                        <li><a href="#">Something else here</a></li>
                                        <li class="divider"></li>
                                        <li><a href="#">Separated link</a></li>
                                        <li class="divider"></li>
                                        <li><a href="#">One more separated link</a></li>
                                    </ul>
                                </li>
                            </ul>
                            <ul class="nav navbar-nav navbar-right">
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
                                        <?php echo $_SESSION['usuario']; ?> <span class="caret"></span>
                                    </a>
                                    <ul class="dropdown-menu" role="menu">
                                        <li><a href="perfil.php">Ver Perfil</a></li>
                                        <li><a href="cambiarclave.php"> Cambiar Clave</a></li>
                                        <li class="divider"></li>
                                        <li><a href="salir.php">Cerrar Sesion</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div><!-- /.navbar-collapse -->
                    </div><!-- /.container-fluid -->
                </nav>
            </div>
        </div>

        <div id="wrapper">
            <div class="container">
                <div class="row" id="listaPersonas">
                    <h3>Listado de Personas Registradas</h3>
                    <a href="per_nuevo.php" class="btn btn-primary">Nuevo Resgistro</a> 
                    <table class="table table-responsive table-striped">
                        <tr>
                            <th>Id</th>
                            <th>Nombres</th>
                            <th>Apellidos</th>
                            <th>Cargo</th>
                            <th>Telefono</th>
                            <th>Email</th>
                        </tr>
                        <?php
                            $sql="SELECT `idpersona`, `nombres`, `apellidopaterno`, `apellidomaterno`, `cargo`, `telefono`, `email` FROM `tbpersona`";
                            $result = mysqli_query($link,$sql) or die ("Error");
                            
                            while($row = mysqli_fetch_row($result)){
                        ?>
                        <tr>
                            <td><?php echo $row[0]; ?></td>
                            <td><?php echo $row[1]; ?></td>
                            <td><?php echo $row[2] ." ".$row[3]; ?></td>
                            <td><?php echo $row[4]; ?></td>
                            <td><?php echo $row[5]; ?></td>
                            <td><?php echo $row[6]; ?></td>
                        </tr>
                        <?php
                            }
                        ?>
                    </table>
                </div>
            </div>
        </div>
        <!-- Librería jQuery requerida por los plugins de JavaScript -->
        <script src="js/jquery-1.11.1.min.js"></script>
        <!-- Todos los plugins JavaScript de Bootstrap (también puedes
             incluir archivos JavaScript individuales de los únicos
             plugins que utilices) -->
        <script src="js/bootstrap.min.js"></script>
    </body>
</html>
