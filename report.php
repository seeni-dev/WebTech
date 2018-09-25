<?php

$servername="localhost:3305";
$username="root";
$password="";

echo "Report";

//connection
$conn= mysqli_connect($servername,$username,$password,"jobkar");

if(!$conn){
	print ("Connection Error");
}
echo "Connected Sucessfully<br/>";

#select all matching jobs and noa >0
$sq="SELECT * FROM JOBS ";

$result=mysqli_query($conn,$sq);

if(mysqli_num_rows($result)>0){
	echo "QUALIFICATION   LOCATION   NOA<br/>";
	while ($row=mysqli_fetch_array($result) ){
				$qual=$row['qual'];
				$location=$row['location'];
				$noa=(int)$row['noa'];
				print("{$qual} {$location} {$noa} <br />");
	}
}
else{
    echo "No Jobs Found";
}

mysqli_close($conn);
?>