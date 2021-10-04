<?php

require("connect.php");

if(isset($_GET['criteriu'])) {

    if(!empty($_GET['criteriu'])){

        $criteriu = trim($_GET['criteriu']);
        $criteriu = mysqli_real_escape_string($con,$criteriu);
        $query= "SELECT * FROM utilizatori WHERE nume LIKE '%{$criteriu}%' OR prenume LIKE '%{$criteriu}%' ";

        $result = mysqli_query($con,$query);

            if(mysqli_num_rows($result)>0)
            {

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
                echo "Total utilizatori" . " " . mysqli_num_rows($result);
            }  
                else
            {
                echo "Nu exista rezultat";
            }

    }else
    {
        echo "Criteriul este gol";
    }
}
?>