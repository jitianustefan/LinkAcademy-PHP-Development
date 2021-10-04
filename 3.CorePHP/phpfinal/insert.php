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
            <li><a href="show.php" title="Afisati toti utilizatorii"><i class="fas fa-users"></i></a></li>
            <li><a href="remove.php" title="Stergeti utilizator"><i class="fas fa-user-minus"></i></a></li>
        </ul>
        <form action="#" method="POST" class="formular">
            <label>Nume : <br>   
        <input type="text" name="nume">
            </label><br>
            <label>Prenume : <br>   
        <input type="text" name="prenume">
            </label><br>
            <label>Telefon : <br>   
        <input type="text" name="telefon">
            </label><br>
            <label>E-mail : <br>   
        <input type="email" name="email">
            </label><br><br>
        <input type="submit" name="inregistreaza" value="inregistreaza"></br>
        </form>
        </div>
        <div class="mesaje">
        <?php 

            if(isset($_POST['inregistreaza']))
            {

                if(isset($_POST['nume']) && isset($_POST['prenume']) && isset($_POST['telefon']) && isset($_POST['email']))
                {

                    if(!empty($_POST['nume']) && !empty($_POST['prenume']) && !empty($_POST['telefon']) && !empty($_POST['email']))
                    {
                        $nume=trim($_POST['nume']);
                        $prenume=trim($_POST['prenume']);
                        $telefon=trim($_POST['telefon']);
                        $email=trim($_POST['email']);

                        require("inc/connect.php");
                        $nume = mysqli_real_escape_string($con,$nume);
                        $prenume = mysqli_real_escape_string($con,$prenume);
                        $telefon = mysqli_real_escape_string($con,$telefon);
                        $email = mysqli_real_escape_string($con,$email);

                        $query= "INSERT INTO utilizatori (nume, prenume, telefon, email) VALUES ('{$nume}','{$prenume}','{$telefon}','{$email}')";
                        if(mysqli_query($con,$query) === TRUE){
                            echo "Noua intrare creata cu succes! ";
                        }else
                        {
                            echo "Error!";
                        }
                    }else
                    {
                        echo "Toti parametri sunt obligatorii";
                    }

                }else
                {
                    echo "Toti parametri sunt obligatorii";
                }

            }
        ?>
        </div>
   
    </div>
</body>
</html>