

<?php

if($_SERVER['REQUEST_METHOD'] == 'POST'){
class Calculator {
    var $number1;
    var $number2;
    var $total;
    var $op;

    public function atribuire(){
        $this->number1=$_POST['nr1'];
        $this->number2=$_POST['nr2'];
        
    }
    // public function verificare(){
    //     $number1= "" . $_POST['nr1'];
    //     if(!empty($_REQUEST['nr1'])){

    //     }
    //     if(!isset($_POST['nr1'])){
    //         echo  " Ati introdus date corecte ." ;
    //     }else {
    //         echo  " Nu ati introdus un numar in unul dintre campuri. ";
            
    //     }
    // }
    public function adunare(){
        $this->total = $this->number1 + $this->number2;
    }
    public function scadere(){
        $this->total = $this->number1 - $this->number2;
    }
    public function inmultire(){
        $this->total = $this->number1 * $this->number2;
    }
    public function impartire(){
        $this->total = $this->number1 / $this->number2;
    }
    public function rezultat(){
        echo "Rezulatul dumneavostra este : " . $this->total;
    }

}
$calc= new Calculator();
$calc->atribuire();
// $calc->verificare();
if(empty($_REQUEST['nr1'])){
    echo "Primul camp este gol." . "<br/> Completati ambele campuri.";
}elseif(empty($_REQUEST['nr2'])){
    echo "Al doilea camp este gol. " . "<br/> Completati ambele campuri.";

}
else{
if($_POST['operation'] === "+"){
    $calc->adunare();
}else if($_POST['operation'] === "-"){
    $calc->scadere();
}else if($_POST['operation'] === "*"){
    $calc->inmultire();
}else {
    $calc->impartire();
}
$calc->rezultat();
}
}
?>

<form action="#" method="post">
        <input type="number" name="nr1"/>
        <select name="operation">
            <option value="+">+</option>
            <option value="-">-</option>
            <option value="*">*</option>
            <option value="/">/</option>
        </select>
        <input type="number" name="nr2"/>
        <input type="submit" name="submit" value="Calculeaza"/>
        <input type="reset" name="reset" value="Reseteaza"/>
    </form>
