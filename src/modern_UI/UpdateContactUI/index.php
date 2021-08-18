<?php
session_start();
if(isset($_POST['but_submit'])){

    $uid = $_POST['txt_uid'];
    $password = $_POST['txt_pwd'];

	$service_url = 'http://ec2-3-65-59-191.eu-central-1.compute.amazonaws.com:9876/cics/userValidation';
	$curl = curl_init($service_url);
	$curl_post_data = json_encode(array(
	 "UV" => array(
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

	$flag = $decoded->UVResponse->BRE_OUT_OUTPUT_STRUCTURE->BRE_O_WS_INPUT_FLAG;

    if ($flag == 0){

	$userid = $decoded->UVResponse->BRE_OUT_OUTPUT_STRUCTURE->BRE_O_BANK_USERID;
	$username = $decoded->UVResponse->BRE_OUT_OUTPUT_STRUCTURE->BRE_O_BANK_USERID_NA;
        $_SESSION['uid'] = $userid;
	$_SESSION['uname'] = $username;
        header('Location: home.php');
    }else{	
	$errmsg = $decoded->UVResponse->BRE_OUT_OUTPUT_STRUCTURE->BRE_O_WS_ERROR_MSG;
        echo '<script>alert("' . $errmsg . '")</script>';
    }
}
?>

<!doctype html>
<html>
<style>
/* Container */

body{
background-color: #04048c;
opacity: 1;
background-image:  linear-gradient(#0862be 0.8px, transparent 0.8px), linear-gradient(to right, #0862be 0.8px, #04048c 0.8px);
background-size: 16px 16px;
}
.container{
    width:60%;
    margin:0 auto;
}

/* Login */
#div_login{
    border: 1px solid gray;
    border-radius: 3px;
    width: 700px;
    height: 270px;
    box-shadow: 0px 2px 2px 0px  gray;
    margin: 0 auto;
}

#div_login h1{
    margin-top: 0px;
    font-weight: normal;
    padding: 10px;
    background-color: cornflowerblue;
    color: white;
    font-family: sans-serif;
}

#div_login div{
    clear: both;
    margin-top: 10px;
    padding: 5px;
}

#div_login .textbox{
    width: 96%;
    padding: 7px;
}

#div_login input[type=submit]{
    padding: 7px;
    width: 100px;
    background-color: lightseagreen;
    border: 0px;
    color: white;
}
</style>
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


