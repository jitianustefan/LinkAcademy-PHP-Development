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
            
            <li><a href="index.php" title="Reveniti la formularul de cautare"><i class="fas fa-undo"></i></a></li>
            <li><a href="insert.php" title="Adaugati utilizator nou"><i class="fas fa-user-plus"></i></a></li>
            <li><a href="remove.php" title="Stergeti utilizator"><i class="fas fa-user-minus"></i></a></li>
        </ul>
        </div>
        <?php

        require("inc/connect.php");
        $query="SELECT * FROM utilizatori";
        $result = mysqli_query($con,$query);

        if(mysqli_num_rows($result)>0) {
            
            while($row = mysqli_fetch_assoc($result))
            {
                ?>
                <div class="result">

                    <p><b>Nume: </b><?php echo $row['nume'] . " " . $row['prenume'] ; ?></p>
                    <p><b>Telefon: </b><?php echo $row['telefon'] ; ?></p>
                    <p><b>E-mail: </b><?php echo $row['email'] ; ?></p>
                </div>
                <?php
            }

        }else
        {
            echo "Nu exista contacte";
        }

        ?>
        
   
    </div>
</body>
</html>