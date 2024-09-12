<?php
header('Access-Control-Allow-Origin:http://localhost:3000');

$host = "localhost";
$username = "root";
$password = "";
$database = "book_db.sql";
$conn=mysqli_connect($host, $username, $password, $database);

$datafor=$_POST['datafor'];

if($datafor=="login"){
	$email = $_POST['email'];
	$pwd = $_POST['pwd'];
	$sql="select user_id,isadmin from user_master where email_id='$email' and pwd='$pwd'";
	$result = mysqli_query($conn,$sql);
	if(mysqli_num_rows($result) > 0){
		while($row = mysqli_fetch_assoc($result))
		{
		  $data1[] = $row;
		}
		echo json_encode($data1);
	}
	else{
		echo json_encode([]);
	}
}
else if($datafor=="users"){
	$sql="select username,fullname,pfp from user_master";
	$result = mysqli_query($conn,$sql);
	if(mysqli_num_rows($result) > 0){
	while($row = mysqli_fetch_assoc($result))
	{
		$data2[] = $row;
	}
	echo json_encode($data2);
	}
	else{
		echo json_encode([]);
	}
}
else if($datafor=="books"){
	$sql="select * from book_master";
	$result = mysqli_query($conn,$sql);
	if(mysqli_num_rows($result) > 0){
	while($row = mysqli_fetch_assoc($result))
	{
		$data3[] = $row;
	}
	echo json_encode($data3);
	}
	else{
		echo json_encode([]);
	}
}
?>