<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://kit.fontawesome.com/bd4466d718.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
    <div class="wrap" >
        <div class="search">
        <ul class="meniu">
            <li><a href="show.php" title="Afisati toti utilizatorii"><i class="fas fa-users"></i></a></li>
            <li><a href="insert.php" title="Adaugati utilizator nou"><i class="fas fa-user-plus"></i></a></li>
            <li><a href="remove.php" title="Stergeti utilizator"><i class="fas fa-user-minus"></i></a></li>
        </ul>
        <form action="#" method="GET" class="formular">
            <input type="text" name="criteriu"  placeholder="Cautati Utilizator">
            <input type="submit" value="Cauta" > <br><br>
        </form>
        </div>
    <?php
        include_once("inc/createdb.php");
        include("inc/getresults.php");
        
    ?>
        
    </div>
</body>
</html>