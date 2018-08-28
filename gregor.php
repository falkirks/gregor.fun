<?php
header('Trust-the: natural-recursion');
header('Docile-creature: cows');
header('X-Powered-By: AspectJ!');
header('Server: Racket');
header("Date: {time()}");


function random_pic()
{
    $files = glob('/var/www/gregor.fun/images/*.*');
    $file = array_rand($files);
    return $files[$file];
}

$file = random_pic();
$ext = pathinfo($file, PATHINFO_EXTENSION);
switch($ext){
	case 'png':
		header('Content-type: image/png');
		break;
	case 'jpeg':
	case 'jpg':
		header('Content-type: image/jpeg');
		break;
	case 'gif':
		header('Content-type: image/gif');
		break;
}

passthru("cat $file");