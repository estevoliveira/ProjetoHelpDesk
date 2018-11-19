<?php

    function criarConexão(){
        $conexao = @mysqli_connect(DB_HOSTNAME,DB_USERNAME,DB_PASSAWAORD,DB_DATABASE) 
        or die(mysqli_connect_error);
        mysqli_set_charset($conexao,DB_CHARSET) or die(mysql_error($conexao));

        return $conexao;
    }

    function fecharDB($conexao){
        @mysql_close($conexao) or die(mysql_error($conexao));
    }

    function dbEscape($dados){
        if(!is_array($dados)){
            $dados = mysqli_real_escape_string(criarConexão(),$dados);
        }else{
            $arr = $dados;
            foreach($arr as $key=>$value){
                $key = mysqli_real_escape_string(criarConexão(),$key);
                $value = mysqli_real_escape_string(criarConexão(),$value);

                $dados[$key]=value;
            }
        }
    }
?>