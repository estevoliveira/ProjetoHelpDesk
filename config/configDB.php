<?php
    define('DB_HOSTNAME','localhost');
    define('DB_USERNAME','root');
    define('DB_PASSAWAORD',null);
    define('DB_DATABASE','helpdesk_mip');
    define('DB_PREFIX','tbl');
    define('DB_CHARSET','utf8');

    function fazerConexao(){
        $conexao = new mysqli(DB_HOSTNAME,DB_USERNAME,DB_PASSAWAORD,DB_DATABASE);
        
        if($conexao->connect_error) {
            die("Connection failed: " . $conexao->connect_error);
        } else{
            $conexao->query("SET NAMES 'utf8'");
            $conexao->query('SET character_set_connection=utf8');
            $conexao->query('SET character_set_client=utf8');
            $conexao->query('SET character_set_results=utf8');
            return $conexao;
        }
        
    }
?>