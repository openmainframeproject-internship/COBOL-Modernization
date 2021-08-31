<?php

# Start the session
session_start();

# If form is submitted, collect uid and password, build the curl request, execute it, decode the response
# If flag is positive, store data in session variables and move to home.php, else show error
if(isset($_POST['but_submit'])){

    $uid = $_POST['txt_uid'];
    $password = $_POST['txt_pwd'];

	$service_url = 'http://ec2-3-65-59-191.eu-central-1.compute.amazonaws.com:9876/cics/signon';
	$curl = curl_init($service_url);
	$curl_post_data = json_encode(array(
	 "signon" => array(
	  "BRE_INP_INPUT_STRUCTURE" => array(
	   "BRE_I_BANK_SIGNON_ID" => $uid,
	   "BRE_I_BANK_PSWD" => $password
	  )
	 )
	));
	curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
	curl_setopt($curl, CURLOPT_POST, true);
	curl_setopt($curl, CURLOPT_POSTFIELDS, $curl_post_data);
	$curl_response = curl_exec($curl);
	if ($curl_response === false) {
	    $info = curl_getinfo($curl);
	    curl_close($curl);
	    die('error occured during curl exec. Additioanl info: ' . var_export($info));
	}
	curl_close($curl);
	$decoded = json_decode($curl_response);
	if (isset($decoded->response->status) && $decoded->response->status == 'ERROR') {
	    die('error occured: ' . $decoded->response->errormessage);
	}
	$flag = $decoded->signonResponse->BRE_OUT_OUTPUT_STRUCTURE->BRE_O_WS_INPUT_FLAG;
    if ($flag == 0){

	$userid = $decoded->signonResponse->BRE_OUT_OUTPUT_STRUCTURE->BRE_O_BANK_USERID;
	$username = $decoded->signonResponse->BRE_OUT_OUTPUT_STRUCTURE->BRE_O_BANK_USERID_NA;
        $_SESSION['uid'] = $userid;
	$_SESSION['uname'] = $username;
	echo "<script>
		alert(' Welcome $username! ');
		window.location.href='home.php'; </script>";
    }else{	
	$errmsg = $decoded->UVResponse->BRE_OUT_OUTPUT_STRUCTURE->BRE_O_WS_ERROR_MSG;
        echo '<script>alert("' . $errmsg . '")</script>';
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
    height: 270px;
    box-shadow: 0px 2px 2px 0px  gray;
    margin: 0 auto;
}

#div_login .textbox{
    width: 96%;
    padding: 7px;
}
</style>
</head>
<div class="container">
    <form method="post" action="">
        <div id="div_login">
            <h1>Update Contact Information Service</h1>
            <div>
                <input type="text" class="textbox" id="txt_uid" name="txt_uid" placeholder="User ID" />
            </div>
            <div>
                <input type="password" class="textbox" id="txt_uid" name="txt_pwd" placeholder="Password"/>
            </div>
            <div>
                <input type="submit" value="Submit" name="but_submit" id="but_submit" />
            </div>
        </div>
    </form>
</div>
</html>
