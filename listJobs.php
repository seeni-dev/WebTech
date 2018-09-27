<?php

$servername="localhost:3306";
$username="root";
$password="";
$qualification=$_GET["qualification"];

echo "qualification:".$qualification."<br/>";

//conncetion
$conn= mysqli_connect($servername,$username,$password,"jobkar");

if(!$conn){
	print ("Connection Error");
}
echo "connected sucessfully<br/>";

#select all matching jobs and noa >0
$sq="SELECT * FROM JOBS where qual=\"$qualification\" and noa > 0";
$result=mysqli_query($conn,$sq);
if(mysqli_num_rows($result)>0){
	echo "QUALIFICATION   LOCATION   NOA<br/>";
	while ($row=mysqli_fetch_array($result) ){
				$qual=$row['qual'];
				$location=$row['location'];
				$noa=(int)$row['noa']-1;
				print("{$qual} {$location} {$noa} <br />");
				#subtract the count and update it
				$uq="UPDATE jobs set noa = {$noa} where qual = \"{$qualification}\" and location =\"{$location}\"";
				mysqli_query($conn,$uq);
	}
}

#delete records whose noa is 0
$sq="DELETE FROM JOBS where noa = 0";
mysqli_query($conn,$sq);

mysqli_close($conn);
?>