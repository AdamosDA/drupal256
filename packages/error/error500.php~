<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8" />

  <!-- Always force latest IE rendering engine (even in intranet) & Chrome Frame 
       Remove this if you use the .htaccess -->
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

  <title>Error 500 - We are having an issue</title>
  <meta name="description" content="" />
  <meta name="author" content="More than themes" />
  <meta name="viewport" content="width=device-width; initial-scale=1.0" />
  <!-- Replace favicon.ico & apple-touch-icon.png in the root of your domain and delete these references -->
  <link rel="shortcut icon" href="/favicon.ico" />
  <link rel="apple-touch-icon" href="/apple-touch-icon.png" />
  <style>
  	body{
  		margin: 0;
  		padding: 0;
  		text-align: center;

		background: none repeat scroll 0 0 #F6F7F7;
	    color: #464646;
	    font: 14px Helvetica,Arial,sans-serif;
	    margin: 0;
	    padding: 0;
	    color: #646464;
  	}
  	
  	header{
	  	background-image: -moz-linear-gradient(center top , #B0C1D1 0%, #F6F7F7 50%);
	    padding: 6px 0;
  	}
  	
  	header img{
  		margin-top: 40px;
  		margin-bottom: 10px;
  	}
  	
  	h1{
  		font-size: 22px;
  	}
	/*
	 * Social
	 */
	#socials{
		text-align: center;
		margin: 0 auto;
		padding: 40px 0;
	}
	a#button-facebook,
	a#button-twitter,
	a#button-youtube,
	a#button-flickr,
	a#button-mail,
	a#button-mail {
		display: inline-block;
		/*float: left;*/
		height: 55px;
		margin: 16px 8px;
		text-indent: -9999px;
		width: 55px;
	}
	
	a#button-facebook {
	    background-image: url("http://2a1748330879bfee8bc2-fa474147421aa55eff0f5bec1fe20b93.r15.cf1.rackcdn.com//social-facebook.png");
	}
	
	a#button-twitter {
	    background-image: url("http://2a1748330879bfee8bc2-fa474147421aa55eff0f5bec1fe20b93.r15.cf1.rackcdn.com//social-twitter.png");
	}
	
	a#button-youtube {
	    background-image: url("http://2a1748330879bfee8bc2-fa474147421aa55eff0f5bec1fe20b93.r15.cf1.rackcdn.com//social-youtube.png");
	}
	
	a#button-flickr {
	    background-image: url("http://2a1748330879bfee8bc2-fa474147421aa55eff0f5bec1fe20b93.r15.cf1.rackcdn.com//social-flickr.png");
	}
	
	a#button-mail {
	    background-image: url("http://2a1748330879bfee8bc2-fa474147421aa55eff0f5bec1fe20b93.r15.cf1.rackcdn.com//social-mail.png");
	}

	footer{
		background: url("http://2a1748330879bfee8bc2-fa474147421aa55eff0f5bec1fe20b93.r15.cf1.rackcdn.com/footer_bg_repeat-x.png") repeat-x scroll center bottom #F7F7F7;
	    clear: both;
	    display: block;
	    overflow: hidden;
	}
	footer p {
		font-size: 12px;
		
	}
  </style>
</head>

<body>
  <div>
    <header>
      	<img src="http://2a1748330879bfee8bc2-fa474147421aa55eff0f5bec1fe20b93.r15.cf1.rackcdn.com/logo.png"/>
    </header>
    <div>
    	<img src="http://2a1748330879bfee8bc2-fa474147421aa55eff0f5bec1fe20b93.r15.cf1.rackcdn.com/slogan.png"/>
      	<h1>It's one of those (rare) times<br/>that we are having an issue.</h1>
      	<p>Suddenly, the load feels too heavy for our server to lift.<br/>
      		The hamsters have already dropped a line to the nerds<br/>
      		and somebody's looking into this. </p>
    </div>
    <footer>
	<div id="socials"> 
		<h1>Rather than just wait, how about<br/>
			checking for our updates on social media<br/>
			or dropping us a line?</h1>
		<a href="http://www.facebook.com/morethan.just.themes" target="_blank" id="button-facebook" title="More than Themes Facebook">.</a>
		<a href="https://twitter.com/#!/morethanthemes" target="_blank" id="button-twitter" title="More than Themes Twitter">.</a>
		<a href="http://www.youtube.com/user/morethanthemes/" target="_blank" id="button-youtube" title="More than Themes YouTube">.</a>
		<a href="http://www.flickr.com/photos/morethanthemes/sets/" target="_blank" id="button-flickr" title="More than Themes Flickr">.</a>
		<a href="http://mtt.desk.com/customer/portal/emails/new" target="_blank" id="button-mail" title="Contact More than Themes">.</a>
	</div><!-- /social -->
     	<p>2010-2013 &copy; <strong>MorethanThemes.com</strong>. All rights reserved.</p>
    </footer>
  </div>
	<?php
//        $ipx=$_SERVER['HTTP_X_FORWARDED_FOR'];
        $ip=$_SERVER['REMOTE_ADDR'];
	$uri=$_SERVER['REQUEST_URI'];
	$srv=$_SERVER['HTTP_HOST'];
	$url= "http://whatismyipaddress.com/ip/".$ip."/";
//        $urlx= "http://whatismyipaddress.com/ip/".$ipx."/";
	 $to = "nms@drupal256.com";
	  $subject = "Error 500";
	   $body = "500 error";
	   $date = shell_exec('date');
	   $host = shell_exec('hostname');
	   $uptime = shell_exec('uptime');
	   $memory = shell_exec('free');
	   $ssig = shell_exec('cat /etc/drupal256/ssig.json');
	   mail($to, $subject." | ".$srv.$uri,"Cloud server affected: ".$host."URI: http://".$srv.$uri."\nDate of occurrence: ".$date."Client IP address: ".$ip."\n"."Client details: ".$url."\n"."X-forwarder IP address: "./*$ipx.*/"\n"."X-forwarder details: "./*$urlx.*/"\n"."Server uptime: ".$uptime."\nMemory details: \n".$memory."\n\nServer signature below:".$ssig);
	?>
</body>
</html>
