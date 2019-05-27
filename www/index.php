<?php
# Author: https://github.com/electronicsleep
# Git: https://github.com/electronicsleep/MediaPi
# Purpose: Media player for the Rasberry Pi
# Released under the BSD license

function listFolderFiles($dir) {
 $ffs = scandir($dir);
  $d3_videos .= "name,radius,distance\n";
  foreach($ffs as $ff){
   if($ff != '.' && $ff != '..') {
    $ext=substr($ff, -3, 3);
    $beg=substr($ff, 0, 1);
    if ($ext == 'MP4' or $ext == 'mp4' and $beg!='.') {
     $d3_videos .= $ff;
     if(is_dir($dir.'/'.$ff)) {
      listFolderFiles($dir.'/'.$ff);
     }
     $d3_videos .= ",";
     $d3_videos .= filesize($dir.'/'.$ff);
     $d3_videos .= ",$ff\n";
    }
   }
  }
 $file = 'videos.csv';
 file_put_contents($file, $d3_videos);
}

session_start();

?>
<style>
body {
    //background-image: url("background.jpg");
    background-color: #cccccc;
    font-family: "Lucida Grande", "Luxi Sans", helvetica, verdana, arial, sans-serif;
    font-size: 10px;
    width: 800px;
} 

div.transbox {
    margin: 30px;
    background-color: #ffffff;
    border: 1px solid black;
    opacity: 0.6;
    filter: alpha(opacity=60); 
    padding: 20px;
    margin: 20px;
}

div.transbox p {
    margin: 5%;
    font-weight: bold;
    color: #000000;
}

a:link {
    color: #000000;
}

a:active, a:visited {
    color: #222222;
}

a:hover {
    color: #111111;
}

</style>

<title></title>
<?php

print '<div class="background"><div class="transbox">';
print '<br><h1><a href="/">MediaPi</a></h1>';

//Show playing now

$file = '/tmp/mediapi-playing-now.txt';
$playing_now = file_get_contents($file);
$playing_now = basename($playing_now);

if ($playing_now != "") {
 print "<br><h2>Playing Now: $playing_now</h2>";
} else{
 print "<br><h2>Not Playing</h2>";
}

//Post comment on movie

if ($_REQUEST['post']) {
 $post = $_REQUEST['post'];
 $user = $_REQUEST['user'];
 $rating = $_REQUEST['rating'];
 print "<br>Movie: $playing_now";
 $_SESSION['user'] = $user;
 $user = $_SESSION['user'];

 print "<br>Post: $post";
 print "<br>Rating: $rating";

 //Write text file of comments

 $file = 'posts.txt';
 $posts = file_get_contents($file);
 $posts .= " Movie: $playing_now User: $user\n Rating: $rating\n Post: $post\n\n";
 print '<div class="background"><div class="transbox">';
 print "<pre>$posts</pre>";
 print '</div></div>';
 file_put_contents($file, $posts);

 } else {

 //Form to enter comments on movie

 $user = $_SESSION['user'];

 /*
 print '<table><form method="POST" action="./">';
 print '<tr><td>User:</td><td><input type="text" name="user" value="'.$user.'"></td></tr>';
 print '<tr><td>Comment:</td><td> <input type="text" name="post"></td></tr>';
 print '<tr><td>Rating:</td><td>';

 print '<select name="rating"><option value="good">Good</option><option value="bad">Fix</option></select></td></tr>';

 print '<tr><td colspan=2><input type="submit" value="submit"></td></tr>';
 print '</form></table>';
 */

}

//Write the playlist file to start playing movies

if ($_REQUEST['movies'] != '') {

 $movies = $_REQUEST['movies'];
 if ($movies == "stop") {
  $file = '/tmp/mediapi-stop.txt';
 } else {
  $file = '/tmp/mediapi-play-mp4.txt';
 }
 $current .= "$movies\n";
 file_put_contents($file, $current);

 //$file = file_get_contents('/tmp/mediapi-play-mp4.txt', true);

//Write the playlist for to start playing music

} elseif ($_REQUEST['music'] != '') {

 $music = $_REQUEST['music'];
 if ($music == "stop") {
  $file = '/tmp/mediapi-stop.txt';
 } else {
  $file = '/tmp/mediapi-play-mp3.txt';
 }
 $current .= "$music\n";
 file_put_contents($file, $current);

 //$file = file_get_contents('/tmp/mediapi-play-mp3.txt', true);

} else {
 print '<br><a href="./?movies=folder">Play movie folder</a>';
 print '<br><a href="./?music=folder">Play music folder</a>';
 //For different playlists
 //print '<br><a href="./?movies=default">Play movie playlist default</a>';
 //print '<br><a href="./?movies=featured">Play movie playlist featured</a>';
 listFolderFiles('/media/usb/video/default');
 print '<br><a href="./?movies=stop">Stop media</a>';
 print '<br>';
}

/*
print '<h1>Videos disk space:</h1>';
print '<iframe src="d3-disk-space.php" width="600" height="400" frameborder=0 scrolling="no"></iframe>';
print '<h1>Fix/Good Ratings:</h1>';
print '<iframe src="d3-rating.php" width="600" height="400" frameborder=0 scrolling="no"></iframe>';
*/

print '</div></div>';
?>
