<tr>
<td>gpu01</td>

<td>disk test 1</td>

<td>
<?php
$output = shell_exec('/usr/bin/test_result.sh /var/www/html/gpu01/hdparm-t.result time');
echo "$output";
?>
</td>

<td>
<?php include 'hdparm-T.result'; ?>
</td>

<td>
<?php
$output = shell_exec('/usr/bin/test_result.sh /var/www/html/gpu01/hdparm-t.result more 1200');
echo "$output";
?>
</td>

</tr>
