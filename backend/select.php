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
else if($datafor=="usersug"){
	$uid = $_POST['uid'];
	$sql="SELECT um.user_id, um.username, um.fullname, um.pfp FROM user_master um WHERE um.isadmin='0' AND NOT EXISTS (SELECT 1 FROM friend f WHERE ((f.user_id1 = um.user_id AND f.user_id2 = $uid) OR (f.user_id1 = $uid AND f.user_id2 = um.user_id)) AND f.status IN (0, 1))";
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
else if($datafor=="userprof"){
	$uid = $_POST['uid'];
	$sql="select fullname,username,email_id,gender,pfp from user_master where user_id='$uid'";
	$result = mysqli_query($conn,$sql);
	if(mysqli_num_rows($result) > 0){
	while($row = mysqli_fetch_assoc($result))
	{
		$data4[] = $row;
	}
	echo json_encode($data4);
	}
	else{
		echo json_encode([]);
	}
}
else if($datafor=="booksbyuser"){
	$uid = $_POST['uid'];
	$sql="select count(book_id) as bookcnt from book_master where uploaded_by='$uid'";
	$result = mysqli_query($conn,$sql);
	if(mysqli_num_rows($result) > 0){
	while($row = mysqli_fetch_assoc($result))
	{
		$data5[] = $row;
	}
	echo json_encode($data5);
	}
	else{
		echo json_encode([]);
	}
}
else if($datafor=="freqs"){
	$uid = $_POST['uid'];
	$sql="SELECT um.user_id as userid, um.username as username, um.fullname as fullname, um.pfp as pfp, f.time as ts, f.frd_id as fid FROM user_master um JOIN friend f ON um.user_id = f.user_id1 WHERE f.user_id2 = $uid AND f.status = 0;";
	$result = mysqli_query($conn,$sql);
	if(mysqli_num_rows($result) > 0){
	while($row = mysqli_fetch_assoc($result))
	{
		$data6[] = $row;
	}
	echo json_encode($data6);
	}
	else{
		echo json_encode([]);
	}
}
else if($datafor=="freqsc"){
	$uid = $_POST['uid'];
	$ts = $_POST['ts'];
	$sql="SELECT count(frd_id) as cnt FROM friend WHERE user_id2 = $uid AND status = 0 AND time > '$ts'";
	$result = mysqli_query($conn,$sql);
	if(mysqli_num_rows($result) > 0){
	while($row = mysqli_fetch_assoc($result))
	{
		$data7[] = $row;
	}
	echo json_encode($data7);
	}
	else{
		echo json_encode([]);
	}
}
else if($datafor=="freqpend"){
	$uid = $_POST['uid'];
	$sql="SELECT count(frd_id) as cnt FROM friend WHERE user_id2 = $uid AND status = 0";
	$result = mysqli_query($conn,$sql);
	if(mysqli_num_rows($result) > 0){
	while($row = mysqli_fetch_assoc($result))
	{
		$data8[] = $row;
	}
	echo json_encode($data8);
	}
	else{
		echo json_encode([]);
	}
}
else if($datafor=="friends"){
	$uid = $_POST['uid'];
	$sql="SELECT um.user_id AS userid, um.username AS username, um.fullname AS fullname, um.pfp AS pfp, f.time AS ts, f.frd_id AS fid FROM user_master um JOIN friend f ON um.user_id = f.user_id1 OR um.user_id = f.user_id2 WHERE (f.user_id1 = $uid OR f.user_id2 = $uid) AND um.user_id<>$uid AND f.status = 1";
	$result = mysqli_query($conn,$sql);
	if(mysqli_num_rows($result) > 0){
	while($row = mysqli_fetch_assoc($result))
	{
		$data9[] = $row;
	}
	echo json_encode($data9);
	}
	else{
		echo json_encode([]);
	}
}
?>