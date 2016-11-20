<?php
# Author: Chris Robertson <electronicsleep@gmail.com>
# Git: https://github.com/electronicsleep/MediaPi
# Date: 03/15/2016
# Purpose: Movie Looper for the Rasberry Pi
# Released under the BSD license

//Play music with MediaPI

print '<img src="logo.jpg">';
print '<p><a href="./index.php">music page</a> | ';
print '<a href="./play-movie.php">movie page</a>';

if ($_REQUEST['song'] != '') {

$file = '/tmp/play-mp3.txt';
$current = file_get_contents($file);
$current .= "song1\n";
file_put_contents($file, $current);

$file = file_get_contents('/tmp/play-mp3.txt', true);

print '<h1>Playlist</h1>';
echo $file;

} elseif (file_exists('/tmp/mp3-playing.txt')) {

print "<p>music already playing file exists";

} elseif (file_exists('/tmp/mp4-playing.txt')) {

print "<p>movie already playing file exists";


} else {

print "<p>music not playing...";
print '<p><a href="./?song=test">play music</a>';

}

?>
