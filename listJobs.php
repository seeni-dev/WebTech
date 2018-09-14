<?php

$servername="localhost:3305";
$username="root";
$password="";
$qualification=$_GET["qualification"];

echo "qualification:".$qualification."<br/>";

//conncetion
$conn= mysqli_connect($servername,$username,$password);

if(!$conn){
	print ("Connection Error");

}

echo "connected sucessfully";

?>