<?php
 $to = "nms@drupal256.com";
  $subject = "500 error";
   $body = "500 error";
   $date = shell_exec('date');
   $host = shell_exec('hostname');
   $uptime = shell_exec('uptime');
   $memory = shell_exec('free');
   $ssig = shell_exec('cat /etc/drupal256/ssig.json');
    mail($to, $host."-".$subject,$date.$host.$uptime.$memory.$ssig);
    echo "<html>";    
    echo "<head>\n"; 
    echo "<html>\n<head><title>Ooops!</title>\n"; 
    echo "</head>\n"; 
    echo "<body>\n"; 
    echo "<img src=\"/error/500.png\" title=\"Error\" alt=\"Error\" />";  
    echo "</body>\n";     
    echo "</html>";
?>