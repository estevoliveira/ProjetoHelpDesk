<?php
    session_start;
    require 'conexao.php';
    require '../config/config.php';
    
    $conexao =criarConexão();
    $tbl = DB_PREFIX."usuario";
    $sql = "SELECT * FROM {$tbl} WHERE login=".$_POST['login']."AND senha=".$_POST['login'].";";

?>