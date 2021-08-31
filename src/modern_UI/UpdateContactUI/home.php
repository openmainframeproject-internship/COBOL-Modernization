<?php

session_start();
// Check user login or not
if(isset($_SESSION['uid'])){
	
	# build the curl request
	$service_url = 'http://ec2-3-65-59-191.eu-central-1.compute.amazonaws.com:9879/cics/readaddr';
	$curl = curl_init($service_url);
	$curl_post_data = json_encode(array(
	 "read" => array(
	  "BRE_INP_INPUT_STRUCTURE" => array(
	   "BRE_I_CD02I_CONTACT" => $_SESSION['uid']
	  )
	 )
	));
	curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
	curl_setopt($curl, CURLOPT_POST, true);
	curl_setopt($curl, CURLOPT_POSTFIELDS, $curl_post_data);

	#execute the request
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
	$userid = $decoded->readResponse->BRE_OUT_OUTPUT_STRUCTURE->BRE_O_CD02O_DATA->BRE_O_CD02O_CONTACT;
	$username = $decoded->readResponse->BRE_OUT_OUTPUT_STRUCTURE->BRE_O_CD02O_DATA->BRE_O_CD02O_CONTACT0;
	$addr1 = $decoded->readResponse->BRE_OUT_OUTPUT_STRUCTURE->BRE_O_CD02O_DATA->BRE_O_CD02O_CONTACT1;
	$addr2 = $decoded->readResponse->BRE_OUT_OUTPUT_STRUCTURE->BRE_O_CD02O_DATA->BRE_O_CD02O_CONTACT2;
	$state = $decoded->readResponse->BRE_OUT_OUTPUT_STRUCTURE->BRE_O_CD02O_DATA->BRE_O_CD02O_CONTACT3;
	$country = $decoded->readResponse->BRE_OUT_OUTPUT_STRUCTURE->BRE_O_CD02O_DATA->BRE_O_CD02O_CONTACT4;
	$pstcode = $decoded->readResponse->BRE_OUT_OUTPUT_STRUCTURE->BRE_O_CD02O_DATA->BRE_O_CD02O_CONTACT5;
	$telno = $decoded->readResponse->BRE_OUT_OUTPUT_STRUCTURE->BRE_O_CD02O_DATA->BRE_O_CD02O_CONTACT6;
	$email = $decoded->readResponse->BRE_OUT_OUTPUT_STRUCTURE->BRE_O_CD02O_DATA->BRE_O_CD02O_CONTACT7;
	$send_mail = $decoded->readResponse->BRE_OUT_OUTPUT_STRUCTURE->BRE_O_CD02O_DATA->BRE_O_CD02O_CONTACT8;
	$send_email = $decoded->readResponse->BRE_OUT_OUTPUT_STRUCTURE->BRE_O_CD02O_DATA->BRE_O_CD02O_CONTACT9;

	# store in session variables
        $_SESSION['addr1'] = $addr1;
        $_SESSION['addr2'] = $addr2;
        $_SESSION['state'] = $state;
        $_SESSION['country'] = $country;
        $_SESSION['pstcode'] = $pstcode;
        $_SESSION['telno'] = $telno;
        $_SESSION['email'] = $email;
        $_SESSION['send_mail'] = $send_mail;
        $_SESSION['send_email'] = $send_email;
} else {
    # not logged in, redirect to index.php
    header('Location: index.php');
}

// logout
if(isset($_POST['but_logout'])){
    session_destroy();
    header('Location: index.php');
}

# user wants to update data, redirect to update.php
if(isset($_POST['but_update'])){
    header('Location: update.php');
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
	    border-radius: 3px;
    	    background-color: #04048c;
	    width: 700px;
	    height: 350px;
	    box-shadow: 0px 2px 2px 0px  gray;
	    margin: 0 auto;
	}

	b {
	    color: white;
	    margin-left: 10px;
	    margin-bottom: 5px;
	}
	</style>
    </head>
    <body>
	<div class="container">
        <div id="div_login">
		<h1>View Contact Information</h1>
		<b> <?php echo 'User ID: ' . $userid; ?> </b><br>
		<b> <?php echo 'User Name: ' . $username; ?> </b><br>
		<b> <?php echo 'Address 1: ' . $addr1; ?> </b><br>
		<b> <?php echo 'Address 2: ' . $addr2; ?> </b><br>
		<b> <?php echo 'State: ' . $state; ?> </b><br>
		<b> <?php echo 'Country: ' . $country; ?> </b><br>
		<b> <?php echo 'Postal Code: ' . $pstcode; ?> </b><br>
		<b> <?php echo 'Telephone No.: ' . $telno; ?> </b><br>
		<b> <?php echo 'Email ID.: ' . $email; ?> </b><br>
		<b> <?php echo 'Send info by mail: ' . $send_mail; ?> </b><br>
		<b> <?php echo 'Send info by email: ' . $send_email; ?> </b><br><br>
		<form method='post' action="">
		    <input type="submit" value="Logout" style="margin-left: 7px" name="but_logout">
		    <input type="submit" value="Update" style="margin-left: 10px" name="but_update">
		</form>
	</div>
	</div>
    </body>
</html>

