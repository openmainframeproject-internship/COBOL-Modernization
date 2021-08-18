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
?>
<!doctype html>
<html>
    <head></head>
    <body>
        <h1>Update the Contact Info</h1>
	<b> <?php echo 'User ID: ' . $_SESSION['uid']; ?> </b><br>
	<b> <?php echo 'User Name: ' . $_SESSION['uname']; ?> </b><br><br>
        <form method='post' action="">
            <input type="submit" value="Logout" name="but_logout">
        </form>
    </body>
</html>

