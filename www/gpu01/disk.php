<?php 
$file = 'gpu01-disk-test-1.html';
if($f = fopen($file, 'r')){
  $line = fgets($f); 
  fclose($f);
}
echo $line;
?>
