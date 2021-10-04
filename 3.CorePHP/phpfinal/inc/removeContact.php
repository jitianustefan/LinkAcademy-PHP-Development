<?php

if(isset($_GET['id']))
{
    $id = $_GET['id'];
    require("connect.php");
    $query="DELETE FROM utilizatori WHERE id = {$id}";

    mysqli_query($con,$query);

    header("Location: ../remove.php");
}

?>