<link href="/mydream2021/assets/css/style.css" rel="stylesheet" type="text/css">
<header class="header" id="header">
	<div>
<img src="/mydream2021/assets/images/university.jpg" alt="university"/>
	
<span>Proiect 2021</span>
		</div>
<nav class="nav">
  <ul>
    <li <?php if(isset($page) && $page == 'acasa'):?> class="activ" <?php endif ?>><a href="/mydream2021/index.php" title="Prima pagina proiect" accesskey="A" tabindex="1" >Acasa</a></li>
    <li <?php if(isset($page) && $page == 'despre'):?> class="activ" <?php endif?>><a href="despre.php" tabindex="2" title="Descriere companie" accesskey="D">Despre noi</a></li>
	<li><a href="/mydream2021/text.php" tabindex="3" title="Pagina text1" accesskey="T">Text</a></li>
	<li><a href="/mydream2021/linkuri.php" tabindex="4" title="Pagina Linkuri" accesskey="L">Linkuri</a></li>
	<li><a href="imagini.php" tabindex="5" title="Imagini demo.Harti mapate">Imagini </a></li>
	<li><a href="liste.php" tabindex="6" title="Liste" accesskey="L">Liste</a></li>
	<li><a href="/mydream2021/imaginispeciale.php" tabindex="10" title="iamgini speciale" accesskey="I">Imagini Speciale</a></li>
	  <li><a href="/mydream2021/div.php">Div</a></li>
  </ul>
</nav>
</header>
