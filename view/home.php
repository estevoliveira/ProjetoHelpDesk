<?php
    header('Content-Type: text/html; charset=utf-8');
    require '../config/configDB.php';
    session_start();

    $conexao =fazerConexao();

    $sql = "SELECT * FROM view_chamados_web where id_usuario=".$_SESSION['IDUSUARIO']." order by id_chamados;";
    $result = $conexao->query($sql);

    //if($_SERVER["REQUEST_METHOD"]=="POST"){

    //}
?>
<!doctype html>
<html lang="br">
  <head>
    <!-- Required meta tags -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link rel="shortcut icon" href="../favicom.png" />
    <title>Help desk MIP</title>
    <style>
        .container-home{
            margin-top:3%;
            width:90%;
            height:100%;
            
        }
        .negrito{
            font-weight:bold;
        }

        .cor-dark{
            color:black;
        }

        .titulo-pagina{
            margin-bottom:30px;
        }
    </style>

  </head>
  <body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <span class="navbar-brand">Bem vindo <?php echo($_SESSION['USARIO'])?>!</span>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link cor-dark" href="home.php">Home</a>
            </li>
            <li class="nav-item">
                <a class="nav-link cor-dark" href="abrir_problema.php">Abrir chamado</a>
            </li>
            <li class="nav-item">
                <a class="nav-link cor-dark" href="../index.php">Logout</a>
            </li>
            </ul>
        </div>
    </nav> 
    <div class="container container-home">
        <h3 class="card-title titulo-pagina">Lista de chamados</h3>
        <form action="home.php">
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">Descrição</th>
                        <th scope="col">Data abertura</th>
                        <th scope="col">Status</th>
                        <th scope="col"></th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                        if($result->num_rows>0){
                            
                        while($linha = $result->fetch_assoc()){                 
                    ?>
                    <tr>
                        <th scope="row"><?php echo($linha['id_chamados'])?></th>
                        <td><?php echo($linha['descricao'])?></td>
                        <td><?php echo($linha['Data de abertura'])?></td>
                        <td><?php echo($linha['Status'])?></td>
                        <td>
                            <button type="submit" class="btn btn-dark">Editar</button>
                            <button type="submit" class="btn btn-danger">Cancelar</button>
                        </td>
                    </tr>
                    <?php }}?>
                </tbody>
            </table>
        </form>
    </div>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
  </body>
</html>