<link href="/stilizare_CSS/assets/css/style.css" rel="stylesheet" type="text/css">
<header class="header">
	
	<p id="retete"><a href="/stilizare_CSS/index.php" title="Acasa">Gastronomie</a></p>
	
<nav class="nav">
<ul>
	<li <?php if(isset($page) && $page == 'acasa'):?> class="activ" <?php endif ?>><a href="index.php" tabindex="1" title="Acasa" accesskey="A">Acasa</a></li>
	<li <?php if(isset($page) && $page == 'reteta'):?> class="activ" <?php endif ?>><a href="retete.php" tabindex="2" title="Retete Romanesti" accesskey="R">Retete Romanesti</a>
		<ul>
			<li <?php if(isset($page) && $page == 'ardelenesti'):?> class="activ" <?php endif ?>><a href="/stilizare_CSS/reteteArdelenesti.php">Retete din Ardeal</a></li>
			<li <?php if(isset($page) && $page == 'dobrogea'):?> class="activ" <?php endif ?>><a href="/stilizare_CSS/reteteDobrogene.php">Retete din Dobrogea</a></li>
			<li <?php if(isset($page) && $page == 'moldovenesti'):?> class="activ" <?php endif ?>><a href="/stilizare_CSS/reteteMoldovenesti.php">Retete din Moldova</a></li>
		
		</ul></li>
	<li <?php if(isset($page) && $page == 'bucatari'):?> class="activ" <?php endif ?>><a href="bucatari_faimosi.php" tabindex="3" title="Bucatari Faimosi" accesskey="B">Bucatari Faimosi</a></li>
</ul>
</nav>
</header>