<?php
// Who you want to recieve the emails from the form.
$sendto = 'you@email.com';

// The subject you'll see in your inbox
$subject = 'A message from our website';

// Message for the user when he/she doesn't fill in the form correctly.
$errormessage = 'Looks like you are missing some info. Try again.&nbsp;';

//Message for the user when he/she fills in the form correctly.
$thanks = "Thanks for the email. We'll get back to you as soon as we can.&nbsp;";

// Message for the bot when it fills in in at all.
$honeypot = "You filled in the honeypot! If you're human, try again!&nbsp;";

// Various messages displayed when the fields are empty.
$emptyname =  'Entering your name?&nbsp;';
$emptyemail = 'Entering your email address?&nbsp;';
$emptymessage = 'Entering a message?&nbsp;';

// Various messages displayed when the fields are incorrectly formatted.
$alertname =  'Entering your name using only the standard alphabet?&nbsp;';
$alertemail = 'Entering your email in this format: <i>name@example.com</i>?&nbsp;';
$alertmessage = "Making sure you aren't using any parenthesis or other escaping characters in the message? Most URLS are fine though!&nbsp;";

$alert = '';
$pass = 0;

function clean_var($variable) {
	$variable = strip_tags(stripslashes(trim(rtrim($variable))));
  return $variable;
}

if ( empty($_REQUEST['last']) ) {

  if ( empty($_REQUEST['name']) ) {
	$pass = 1;
	$alert .= "<li>" . $emptyname . "</li>";
	$alert .= "<script>jQuery(\"#name\").addClass(\"error\");</script>";
  } elseif ( preg_match( "/[][{}()*+?.\\^$|]/", $_REQUEST['name'] ) ) {
	$pass = 1;
	$alert .= "<li>" . $alertname . "</li>";
  }
  if ( empty($_REQUEST['email']) ) {
	$pass = 1;
	$alert .= "<li>" . $emptyemail . "</li>";
	$alert .= "<script>jQuery(\"#email\").addClass(\"error\");</script>";
  } elseif ( !preg_match("/^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,3})$/", $_REQUEST['email']) ) {
	$pass = 1;
	$alert .= "<li>" . $alertemail . "</li>";
  }
  if ( empty($_REQUEST['message']) ) {
	$pass = 1;
	$alert .= "<li>" . $emptymessage . "</li>";
	$alert .= "<script>jQuery(\"#message\").addClass(\"error\");</script>";
  } elseif ( preg_match( "/[][{}()*+?\\^$|]/", $_REQUEST['message'] ) ) {
	$pass = 1;
	$alert .= "<li>" . $alertmessage . "</li>";
  }

  if ( $pass==1 ) {

  echo "<script>$(\".message\").toggle();$(\".message\").toggle().hide(\"fast\").show(\"fast\"); </script>";
  echo "<script>$(\".message .alert\").addClass('alert-danger').removeClass('alert-success'); </script>";
  echo $errormessage;
  echo $alert;

  } elseif (isset($_REQUEST['message'])) {

	$message = "From: " . clean_var($_REQUEST['name']) . "\n";
	$message .= "Email: " . clean_var($_REQUEST['email']) . "\n";
	$message .= "Message: \n" . clean_var($_REQUEST['message']);
	$header = 'From:'. clean_var($_REQUEST['email']);

	mail($sendto, $subject, $message, $header);
	echo "<script>$(\".message\").toggle();$(\".message\").toggle().hide(\"fast\").show(\"fast\");$('#contactForm')[0].reset();</script>";
	echo "<script>$(\".message .alert\").addClass('alert-success').removeClass('alert-danger'); </script>";
	echo $thanks;
	echo "<script>jQuery(\"#name\").removeClass(\"error\");jQuery(\"#email\").removeClass(\"error\");jQuery(\"#message\").removeClass(\"error\");</script>";
	echo "<script>$(\".message .alert\").delay(4000).hide(\"fast\");</script>";
	die();

	echo "<br/><br/>" . $message;

	}

} else {
	echo "<script>$(\".message\").toggle();$(\".message\").toggle().hide(\"fast\").show(\"fast\");</script>";
	echo $honeypot;
}
?>