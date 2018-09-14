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

$sq="SELECT * FROM JOBS where qual=\"$qualification\"";

$result=mysqli_query($conn,$sq);

if(mysqli_num_rows($result)>0){
	echo "QUALIFICATION   LOCATION   NOA<br/>";
	while ($row=mysqli_fetch_assoc($result) {
		print($row["qual"]."  ".$row["location"]." ".$row["noa"]);
	}
}

mysqli_close($conn);
?>