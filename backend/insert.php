<?php
header('Access-Control-Allow-Origin:http://localhost:3000'); 

$host = "localhost";
$username = "root";
$password = "";
$database = "book_db.sql";
$conn=mysqli_connect($host, $username, $password, $database);

$datafor=$_GET['datafor'];

if($datafor == "register"){
$name = $_POST['fname'];
$uname = $_POST['uname'];
$email = $_POST['email'];
$pwd = $_POST['pwd'];
$gender = $_POST['gender'];
$pfp = $_POST['pfp'];

$sql = "INSERT INTO user_master(fullname,username,email_id,pwd,gender,pfp) VALUES('$name','$uname','$email','$pwd','$gender','$pfp')";
if(mysqli_query($conn,$sql)){
		$data=array("regstat"=>"success");
		echo json_encode($data);
	}
	else{
		$data=array("regstat"=>"fail");
		echo json_encode($data);
	}
}
else if($datafor == "addfriend"){
	$uid = $_POST['uid'];
	$fid = $_POST['fid'];
	$st = 0;
	$sql = "INSERT INTO friend(user_id1,user_id2,status) VALUES('$uid','$fid','$st')";
	if(mysqli_query($conn,$sql)){
		$data=array("fr"=>"success");
		echo json_encode($data);
	}
	else{
		$data=array("fr"=>"fail");
		echo json_encode($data);
	}
}
?>