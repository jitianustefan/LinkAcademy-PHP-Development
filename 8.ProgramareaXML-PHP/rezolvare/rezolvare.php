<?php

$xml = simplexml_load_file("rezolvare_1.xml");
?>
<form method="POST" action="">
<select name="rssfeed" > <?php
foreach($xml as $adresses)
    {
        $chi = $adresses->children();
        ?><option value="<?php echo $chi[1] ?>" ><?php echo $chi[0]?></option><?php
    }
?></select>
<br><br>
<input type="submit" value="Alege">
</form> 
<p id="demo"></p>

<?php 

if(isset($_POST['rssfeed'])){
$xml1 = simplexml_load_file($_POST['rssfeed']);
foreach($xml1 as $news)
{
    $cha = $news->children();
    echo "Titlu : " . $cha[0] . "</br>";
    echo "Descriere : " . $cha[1] . "</br>";
}}

?>