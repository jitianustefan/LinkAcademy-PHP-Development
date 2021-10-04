<?php 
$con = mysqli_connect( "localhost", "root", "" );
mysqli_query( $con, "CREATE DATABASE temapersonalizata1" );
mysqli_select_db( $con, "temapersonalizata1" );
mysqli_query($con, "CREATE TABLE utilizatori (id int primary key auto_increment, nume varchar(256), prenume varchar(255), telefon varchar(255), email varchar(255))");
$query="SELECT * FROM utilizatori";
        $result = mysqli_query($con,$query);

        if(mysqli_num_rows($result)>0){
}else
{
    
$utilizatori = array(array("Petrica", "Ionel", "0722 123 456", "ionel@yah.com"), array("Mirel", "Ionescu", "0727 645 222", "mirel@yah.com") );
foreach($utilizatori as $utilizator){
    mysqli_query($con,"INSERT INTO utilizatori (nume, prenume, telefon, email) VALUES ('{$utilizator[0]}', '{$utilizator[1]}', '{$utilizator[2]}', '{$utilizator[3]}')");
}

}
?>