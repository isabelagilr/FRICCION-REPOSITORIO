<?php ?>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="mystyle.css" />
        <script type="text/javascript" src="jquery/js/jquery.min.js"></script>
        <script type="text/javascript" src="jquery/js/jquery.ui.min.js"></script>
        <title>FRICCION</title>
        <script type="text/javascript">
        </script>
    </head>
    <body>
        <section id="top">
            <header id="header">
                <h1>BIENVENIDOS AL SISTEMA DE FRICCION:</h1>
            </header>
        </section>
        <section id="menus">
            <nav id="top_menu">
                <ul>
                </ul>
            </nav>
        </section>
        <div id="wrapper">
            <section id="cuerpo">
                <form action="login.php" method="post">
                    <p>Entra con tu nombre de usuario y password </p>
                    <table>
                        <tr>
                            <td>Usuario:</td>
                            <td><input type="text" class="input_field" name="usuario"/></td>
                        </tr>
                        <tr>
                             <td>Password:</td>
                             <td><input class="input_field" type="password" name="password"/></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><input type="submit" value="aceptar"/></td>
                        </tr>
                    </table>
                </form>
            </section>
        </div>
    </body>
</html>
