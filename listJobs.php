<?php

$servername="localhost:3305";
$username="root";
$password="";
$qualification=$_POST["qualification"];

echo "qualification:".$qualification;

//conncetion
$conn= mysqli_connect($servername,$username,$password);

if(!$conn){
	print ("Connection Error");

}

echo "connected sucessfully";

?>