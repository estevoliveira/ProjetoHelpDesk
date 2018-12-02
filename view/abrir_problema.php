<?php
    header('Content-Type: text/html; charset=utf-8');
    require '../config/configDB.php';
    session_start();
    date_default_timezone_set('America/Sao_Paulo');

    $conexao =fazerConexao();

    $tipoProblema = $descricao = $contato= $erro="";

    $sqlTipoProblema = "SELECT * FROM tbl_problema order by id_problema;";
    $resultTipoProblema = $conexao->query($sqlTipoProblema);
    $titulo = "Abrir";
    $btnString="Realizar";

    if($_SESSION['TIPOFUNCAO']==="Editar"){
        echo("vamos editar");
        $btnString = "Editar";
        $titulo = "Editar";
        $sqlEditar ="SELECT descricao_chamado, contato FROM tbl_listachamados where id_chamados =".$_SESSION['IDEDITAR'].";";

        $result = $conexao->query($sqlEditar);
        if($result->num_rows>0){
            while($linha = $result->fetch_assoc()){ 
                $descricao=$linha['descricao_chamado'];
                $contato=$linha['contato'];
            }
        }
    }
   
    if($_SERVER["REQUEST_METHOD"]=="POST"){
        
        $tipoProblema = $_POST["tipo-problema"];
        $descricao = $_POST["descricao"];
        $contato = $_POST["contato"];

        if(empty($descricao) || empty($contato)){
            $erro = "Preencha os campos obrigatórios * !";
        }else{
            $data = date('Y-m-d');
            $hora = date('H:i:s');
            if($_SESSION['TIPOFUNCAO']=="Editar"){
                $sql="UPDATE tbl_listachamados SET id_problema=".$tipoProblema.", descricao_chamado='".$descricao."', contato='".$contato."' WHERE id_chamados=".$_SESSION['IDEDITAR'].";";
            }else{
                $sql= "INSERT INTO tbl_listachamados (id_usuario_afetado,id_tecnico,id_problema,descricao_chamado,data_abertura,data_fechamento,status,contato,solucao,id_tecnico_fechou) 
                    VALUES (".$_SESSION['IDUSUARIO'].",null,".$tipoProblema.",'".$descricao."','".$data." ".$hora."',null,'aberto','".$contato."',null,null)";
            } 
            
            if ($conexao->query($sql) === TRUE) {
               // unset($_SESSION['TIPOFUNCAO']);
                //unset($_SESSION['IDEDITAR']);
                header("Location:home.php");
            }else{
                echo($sql);
                echo($conexao->error);
            }  
        }
        $conexao->close();
        
    }
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
        .erro{
            color:red;
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
            <li class="nav-item nav-item-left">
                <a class="nav-link cor-dark" href="../index.php">Logout</a>
            </li>
            </ul>
        </div>
    </nav> 
    <div class="container container-home">
        <h3 class="card-title titulo-pagina"><?php echo($titulo)?> chamado</h3>
        <form action="abrir_problema.php" method="POST">
            <div class="form-group">
                <label>Tipo de problema</label>
                <select class="form-control" name="tipo-problema">
                    <?php
                        if($resultTipoProblema->num_rows>0){
                            while($linha = $resultTipoProblema->fetch_assoc()){  
                        
                    ?>
                    <option value="<?php echo($linha['id_problema']);?>" selected><?php echo($linha['descricao_problema']);?></option>
                    <?php   }}?>
                </select>
            </div>
            <div class="form-group">
                <label>Descrição*</label>
                <textarea class="form-control" rows="6" name="descricao"><?php echo($descricao);?></textarea>
            </div>
            <div class="form-group">
                <label>Contato*</label>
                <input type="text" class="form-control" name="contato" value="<?php echo($contato);?>">
            </div>
            <p class="erro"><?php echo($erro);?></p>
            <button type="submit" class="btn btn-primary"><?php echo($btnString)?> chamado</button>
            <!--Realizar chamado-->
        </form>
    </div>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
  </body>
</html>