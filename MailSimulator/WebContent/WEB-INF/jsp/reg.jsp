<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">

input[type=text],input[type=password], select {
  width: 50%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}

input[type=submit] {
  width: 50%;
  background-color: #4CAF50;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

input[type=submit]:hover {
  background-color: #45a049;
}

div {
  
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
}
</style>

<script type="text/javascript">
//for form validation
var unsupportedBrowsers = false;
if ((navigator.userAgent.indexOf('Safari') != -1 && navigator.userAgent.indexOf('Chrome') == -1) || (navigator.userAgent.match(/MSIE\s(?!10)/))) {
  unsupportedBrowsers = true;
}

// Tests with Modernizr if supports HTML5 placeholder="" attribute. If old browser, load necessary JS files and run them
if (!Modernizr.input.placeholder) {
  Modernizr.load({
    load: [
      'http://lab.alexcican.com/minimal_signup_form/placeholder.min.js',
    ],
    complete: function(){
      $('input').placeholder();
    }
  })
}

// ugly browser sniffer for form validation
if (unsupportedBrowsers) {
  Modernizr.load({
    load: [
      'http://lab.alexcican.com/minimal_signup_form/jquery.validate.min.js'
    ],
    complete: function(){
      // parse through each required input
      $('form').find('input[required]').each(function () {
        // add a class to each required field with "required" & the input type
        // using the normal "getAttribute" method because jQuery's attr always returns "text"
        $(this).attr('class', 'required ' + this.getAttribute('type')).removeAttr('required');
      });

      // call jQuery validate plugin on each form
      $('form').each(function () {
        $(this).validate();
      });
    }
  })
}



// check password strength on key up
$('#password').keyup(function() {
  var pass = $(this).val();
  var cacheResult = checkPassStrength(pass);
})

// on blur makes passwordMeter border same colour as not focused
$('#password').blur(function() {
  $('#passwordMeter').addClass('blur');
})

// on focus removes class that makes passwordMeter border same colour as not focused
$('#password').focus(function() {
  if ($('#passwordMeter').hasClass('blur'))
    $('#passwordMeter').removeClass('blur');
})



// rates user's password
function scorePassword(pass) {
  var i = pass.length,
      score = 0;
  if (i >= 7) {
    score += /[a-z]/.test(pass) ? 3 : 0;
    score += /[A-Z]/.test(pass) ? 4 : 0;
    score += /\d/.test(pass) ? 1 : 0;
    score += /[^\w\d\s]/.test(pass) ? 1 : 0;
  }
  if (i >= 22 && score >= 9)
    score += 1;

  return score;
}

// adds classes depending on score
function checkPassStrength(pass) {
  var score = scorePassword(pass);
  console.log(score);
  if (score < 1)
    $('#password, #passwordMeter').removeClass().addClass('weak');
  if (score >= 7)
    $('#password, #passwordMeter').removeClass().addClass('good');
  if (score >= 8)
    $('#password, #passwordMeter').removeClass().addClass('better');
  if (score >= 9)
    $('#password, #passwordMeter').removeClass().addClass('strong');
  if (score >= 10)
    $('#password, #passwordMeter').removeClass().addClass('military');
}</script>
</head>
<body>
<!--<h2 align="center">
<form action="RegistrationData" method="post">
  <h1>Sign up</h1><br/>

  <span class="input"></span>
<input type="text" name="UserName" placeholder="Full name" title="Format: Xx[space]Xx (e.g. Yogesh Pandey)" autofocus autocomplete="off" required pattern="^\w+\s\w+$" /><br>
  <span class="input"></span>
<input type="email" name="Email" placeholder="Email address" required /><br>
  <span id="passwordMeter"></span>
<input type="password" name="Password" id="password" placeholder="Password" title="Password min 8 characters. At least one UPPERCASE and one lowercase letter" required pattern="(?=^.{8,}$)(?=.*[a-z])(?=.*[A-Z])(?!.*\s).*$"/> <br>
<br>
  <button type="submit" value="Sign Up" title="Submit form" class="icon-arrow-right"><span>Sign up</span></button>
</form>
</h2>  -->
<h3 align="left">Sign Up</h3>

<div>
  <form action="RegistrationData" method="post" >
    <span class="input"></span>
    <label for="fname">Enter UserName<br></label>
    <input type="text" id="fname" name="UserName" placeholder="Your name.." title="Format: Xx[space]Xx (e.g. Yogesh Pandey)"  autofocus autocomplete="off" required pattern="^\w+\s\w+$" /><br>

    <label for="lname">Enter Email<br></label>
      <span class="input"></span>
    <input type="password" id="password"  name="Email" placeholder="Enter email.." title="Password min 8 characters. At least one UPPERCASE and one lowercase letter" required pattern="(?=^.{8,}$)(?=.*[a-z])(?=.*[A-Z])(?!.*\s).*$"/><br>
    
    <label for="lname">Enter Password<br></label>
    <span id="passwordMeter"></span>
    <input type="password" id="password" name="Email" placeholder="Your password..">
    <input type="submit" value="Submit">
    
  </form>
</div>
	
</body>
</html>
