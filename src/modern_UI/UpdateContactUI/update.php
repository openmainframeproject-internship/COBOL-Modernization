<?php

session_start();
// Check user login or not
if(!isset($_SESSION['uid'])){
    header('Location: index.php');
}

// logout
if(isset($_POST['but_logout'])){
    session_destroy();
    header('Location: index.php');
}

# If form is submitted
if(isset($_POST['but_submit'])){
	
	# fetch data
	$uid = $_SESSION['uid'];
	$addr1 = $_POST['addr1'];
	$addr2 = $_POST['addr2'];
	$state = $_POST['state'];
	$country = $_POST['country'];
	$pstcode = $_POST['pstcode'];
	$email = $_POST['email'];
	$send_mail = $_POST['send_mail'];
	$send_email = $_POST['send_email'];

	# build curl request
	$service_url = 'http://ec2-3-65-59-191.eu-central-1.compute.amazonaws.com:9879/cics/updateaddr';
	$curl = curl_init($service_url);
	$curl_post_data = json_encode(array(
	 "updat" => array(
	  "BRE_INP_INPUT_STRUCTURE" => array(
	   "BRE_I_CD02I_CONTACT" => $uid,
	   "BRE_I_CD02I_CONTACT0" => $addr1,
	   "BRE_I_CD02I_CONTACT1" => $addr2,
	   "BRE_I_CD02I_CONTACT2" => $state,
	   "BRE_I_CD02I_CONTACT3" => $country,
	   "BRE_I_CD02I_CONTACT4" => $pstcode,
	   "BRE_I_CD02I_CONTACT5" => $email,
	   "BRE_I_CD02I_CONTACT6" => $send_mail,
	   "BRE_I_CD02I_CONTACT7" => $send_email,
	  )
	 )
	));
	curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
	curl_setopt($curl, CURLOPT_POST, true);
	curl_setopt($curl, CURLOPT_POSTFIELDS, $curl_post_data);

	# execute the request
	$curl_response = curl_exec($curl);
	if ($curl_response === false) {
	    $info = curl_getinfo($curl);
	    curl_close($curl);
	    die('error occured during curl exec. Additioanl info: ' . var_export($info));
	}
	curl_close($curl);

	# decode the response
	$decoded = json_decode($curl_response);
	if (isset($decoded->response->status) && $decoded->response->status == 'ERROR') {
	    die('error occured: ' . $decoded->response->errormessage);
	}
	
	$result = $decoded->updatResponse->BRE_OUT_OUTPUT_STRUCTURE->BRE_O_CD02O_DATA->BRE_O_CD02O_CONTACT8;
	if($result === 'Update OK'){
		# data updated, redirect to home.php
        	echo "<script>
		alert(' $result ');
		window.location.href='home.php'; </script>";
	} else{
		echo "<script>alert('$result')</script>";
	}
}

?>
<!doctype html>
<html>
<head>
<link rel="stylesheet" href="style.css">
<style>
/* Login */
#div_login{
    border: 1px solid gray;
    background-color: #04048c;
    border-radius: 3px;
    width: 700px;
    height: 650px;
    box-shadow: 0px 2px 2px 0px  gray;
    margin: 0 auto;
}
#div_login .textbox{
    width: 50%;
    padding: 7px;
}

label{
    color: white;
    font-weight: bold;
}

b {
    color: white;
    margin-left: 5px;
    margin-bottom: 5px;
}

label {
  display: inline-block;
  width: 140px;
  text-align: left;
}
</style>
</head>
<div class="container">
    <form method="post" action="">
        <div id="div_login">
            <h1>Update the Contact Information</h1>
	    <b> <?php echo 'User ID: ' . $_SESSION['uid']; ?> </b><br>
	    <b> <?php echo 'User Name: ' . $_SESSION['uname']; ?> </b><br>
            <div>
                <label for="addr1">Address 1:</label>
		<input type="text" class="textbox" id="addr1" name="addr1" value="<?php echo $_SESSION['addr1']?>" />
            </div>
            <div>
                <label for="addr2">Address 2:</label>
		<input type="text" class="textbox" id="addr2" name="addr2" value="<?php echo $_SESSION['addr2']?>" />
            </div>
            <div>
                <label for="state">State:</label>
		<input type="text" class="textbox" id="state" name="state" value="<?php echo $_SESSION['state']?>" />
            </div>
            <div>
                <label for="country">Country:</label>
		<input type="text" class="textbox" id="country" name="country" value="<?php echo $_SESSION['country']?>" />
            </div>
            <div>
                <label for="pstcode">Postal Code:</label>
		<input type="text" class="textbox" id="pstcode" name="pstcode" value="<?php echo $_SESSION['pstcode']?>" />
            </div>

	    <br><b> <?php echo 'Telephone No.: ' . $_SESSION['telno']; ?> </b><br>
            <div>
                <label for="email">Email ID.:</label>
		<input type="text" class="textbox" id="email" name="email" value="<?php echo $_SESSION['email']?>" />
            </div>
            <div>
                <label for="send_mail">Send info by mail:</label>
		<input type="text" class="textbox" id="send_mail" name="send_mail" value="<?php echo $_SESSION['send_mail']?>" />
            </div>
            <div>
                <label for="send_email">Send info by email:</label>
		<input type="text" class="textbox" id="send_email" name="send_email" value="<?php echo $_SESSION['send_email']?>" />
            </div>

            <div>
		<input type="submit" value="Logout" name="but_logout">
                <input type="submit" value="Submit" style="margin-left: 7px" name="but_submit" id="but_submit" />
            </div>
        </div>
    </form>
</div>
</html>
