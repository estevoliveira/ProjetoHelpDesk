<?php
    header('Content-Type: text/html; charset=utf-8');
    require 'config/configDB.php';
    session_start();
    $_SESSION['USARIO']= "";
    $_SESSION['TIPOFUNCAO']="Abrir";

    $conexao =fazerConexao();

    $login = $senha = $erros="" ;
    if($_SERVER["REQUEST_METHOD"]=="POST"){
        $login = $_POST["login"];
        $senha = $_POST["senha"];

        if(empty($login) || empty($senha)){
            $erros ="Precisa preencher todos os campos!";
        }else{
            $sql = "SELECT id_usuario,login,senha,nome FROM tbl_usuario WHERE login ='".$login."' and senha ='".$senha."';";
    
            $result = $conexao->query($sql);
        
            if($result->num_rows>0){
                while($linha = $result->fetch_assoc()) {
                    $_SESSION['USARIO'] = $linha['nome'];
                    $_SESSION['IDUSUARIO'] = $linha['id_usuario'];
                }
                $conexao->close();
                header("Location:view/home.php");
            }else{
                $erros="Usuario não cadastrado";
            }
            $conexao->close();
            

        }
    }
    

?>
<!doctype html>
<html lang="br">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link rel="shortcut icon" href="favicom.png" />
    <title>Help desk MIP</title>
    <style>
        .container-login{
            width:30%;
            margin-top:10%;
        }
        .negrito{
            font-weight:bold;
            margin:0;
            padding:0
        }
        .letra-pequena{
            margin:0;
            padding:0;
            margin-bottom:8%;
        }
        .erro{
            color:red;
        }
    </style>

  </head>
  <body>
    <div class="container container-login">
        <h3 class="card-title negrito">Help Desk MIP</h3>
        <p class="letra-pequena card-title">Portal do cliente</p>
        <form action="index.php" method="POST">
            <div class="form-group">
                <label class="negrito">Login</label>
                <input type="text" class="form-control" name="login" value="<?php echo($login)?>" placeholder="Login" requared>
            </div>
            <div class="form-group">
                <label class="negrito">Senha</label>
                <input type="password" class="form-control" name="senha" value="<?php echo($senha)?>" placeholder="Senha" requared>
            </div>
            <button type="submit" class="btn btn-primary">Entrar</button>
            <p class="erro"><?php echo($erros);?></p>
        </form>
    </div>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
  </body>
</html>