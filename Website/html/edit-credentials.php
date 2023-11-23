<?php
session_start();

if(!isset($_POST['formVal'])){
  $serverName = $_SESSION["serverName"];
  $connectionOptions = $_SESSION["connectionOptions"];
  $conn = sqlsrv_connect($serverName, $connectionOptions);

  if ($conn === false) {
    die(print_r(sqlsrv_errors(), true));
  }
  $username=$_POST['username'];

  $tsqlget = "{call spGetCustomer (?)}";
  $paramsget = array($username); // replace 'Electronics' with the category you want
  $getResults = sqlsrv_query($conn, $tsqlget, $paramsget);
  $row = sqlsrv_fetch_array($getResults, SQLSRV_FETCH_ASSOC);

    $email=$row['Email'];
    $phone=$row['Phone_Number'];
    $firstname=$row['First_Name'];
    $lastname=$row['Last_Name'];
    $username=$row['UserName'];
    $oldusername=$username;
    $password=$row['Passwd'];
    $birthdate=$row['Birth_Date'];
    $loyalty=$row['Loyalty_Points'];

    $birthdate = $birthdate->format('Y-m-d');
   

      /* Free query  resources. */
  sqlsrv_free_stmt($getResults);

  /* Free connection resources. */
  sqlsrv_close($conn);
}
  

  if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['formVal'])) {
    $serverName = $_SESSION["serverName"];
    $connectionOptions = $_SESSION["connectionOptions"];
    $conn = sqlsrv_connect($serverName, $connectionOptions);
  
    if ($conn === false) {
      die(print_r(sqlsrv_errors(), true));
    }
    
    $tsqledit = "{call spEditAccount (?, ?, ? ,? ,?, ?, ?, ?)}";
    
   $paramsedit = array($_POST['email'], $_POST['phone'], $_POST['firstname'], $_POST['lastname'], $_POST['oldusername'], $_POST['username'], $_POST['password'], $_POST['birthdate']); 
   print_r($paramsedit);
   
   $stmt = sqlsrv_query($conn, $tsqledit, $paramsedit);

   if ($stmt === false) {
    echo "Error Updating.";
    print_r(sqlsrv_errors(), true);
  } else {
      echo "Credential Update successful.";
  }
   /* Free connection resources. */
   sqlsrv_close($conn);
   $user = $_POST['username'];
   echo "<form id='myForm' method='post' action='edit-credentials.php'>
    <input type='hidden' name='username' value='{$user}'>
</form>
<script type='text/javascript'>
    document.getElementById('myForm').submit();
</script>";
  
  }

?>


<!DOCTYPE html>
<html lang="en">
  <head>
    <title>my-ecigshop</title>
    <meta
      property="og:title"
      content="my-ecigshop"
    />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta charset="utf-8" />
    <meta property="twitter:card" content="summary_large_image" />

    <style data-tag="reset-style-sheet">
      html {  line-height: 1.15;}body {  margin: 0;}* {  box-sizing: border-box;  border-width: 0;  border-style: solid;}p,li,ul,pre,div,h1,h2,h3,h4,h5,h6,figure,blockquote,figcaption {  margin: 0;  padding: 0;}button {  background-color: transparent;}button,input,optgroup,select,textarea {  font-family: inherit;  font-size: 100%;  line-height: 1.15;  margin: 0;}button,select {  text-transform: none;}button,[type="button"],[type="reset"],[type="submit"] {  -webkit-appearance: button;}button::-moz-focus-inner,[type="button"]::-moz-focus-inner,[type="reset"]::-moz-focus-inner,[type="submit"]::-moz-focus-inner {  border-style: none;  padding: 0;}button:-moz-focus,[type="button"]:-moz-focus,[type="reset"]:-moz-focus,[type="submit"]:-moz-focus {  outline: 1px dotted ButtonText;}a {  color: inherit;  text-decoration: inherit;}input {  padding: 2px 4px;}img {  display: block;}html { scroll-behavior: smooth  }
    </style>
    <style data-tag="default-style-sheet">
      html {
        font-family: Inter;
        font-size: 16px;
      }

      body {
        font-weight: 400;
        font-style:normal;
        text-decoration: none;
        text-transform: none;
        letter-spacing: normal;
        line-height: 1.15;
        color: var(--dl-color-gray-black);
        background-color: var(--dl-color-gray-white);

      }
    </style>
    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css2?family=Nunito:ital,wght@0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&amp;display=swap"
      data-tag="font"
    />
    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css2?family=Raleway:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&amp;display=swap"
      data-tag="font"
    />
    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css2?family=Lato:ital,wght@0,100;0,300;0,400;0,700;0,900;1,100;1,300;1,400;1,700;1,900&amp;display=swap"
      data-tag="font"
    />
    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css2?family=Inter:wght@100;200;300;400;500;600;700;800;900&amp;display=swap"
      data-tag="font"
    />
  </head>
  <body>
    <link rel="stylesheet" href="./style.css" />
    <div>
      <link href="./edit-credentials.css" rel="stylesheet" />

      <div class="edit-credentials-container">
        <div class="edit-credentials-header">
          <header
            data-thq="thq-navbar"
            class="edit-credentials-navbar-interactive"
          >
            <a href="index.php" class="edit-credentials-navlink">
              <img
                alt="image"
                src="./Images/MyEcigShopLogoNew.png"
                class="edit-credentials-image"
              />
            </a>
            <nav class="edit-credentials-links">
              <a href="index.php" class="edit-credentials-nav1">Home</a>
              <a href="products.php" class="edit-credentials-nav2">Products</a>
              <span class="edit-credentials-nav3">Order</span>
              <span class="edit-credentials-nav4">Cart</span>
            </nav>
            <div class="edit-credentials-container1">
              <div
                data-thq="thq-navbar-nav"
                class="edit-credentials-desktop-menu"
              ></div>
            </div>
            
            </div>
            <div
              data-thq="thq-mobile-menu"
              class="edit-credentials-mobile-menu"
            >
              <div class="edit-credentials-nav">
                <nav class="edit-credentials-links1">
                  <a href="index.php" class="edit-credentials-nav11">Home</a>
                  <a href="products.php" class="edit-credentials-nav21">Products</a>
                  <span class="edit-credentials-nav31">Order</span>
                  <span class="edit-credentials-nav41">Account</span>
                  <span class="edit-credentials-nav51">Contact</span>
                </nav>
              </div>
            </div>
          </header>
        </div>
        <div class="edit-credentials-container2">
          <span class="edit-credentials-text">-EDIT CREDENTIALS-</span>
          <form
            id="useredit"
            name="useredit"
            method="POST"
            enctype="multipart/form-data"
            autocomplete="on"
            class="admin-form-form"
          >
          <input type="hidden" name="formVal" value="true">
          <?php 
          echo "
          <input type='hidden' name='oldusername' value='$oldusername'>
          <input
              type='text'
              name='username'
              value='$username'
              placeholder='Username'
              id='username'
              class='edit-credentials-username input'
          />
          <input
            type='text'
            name='password'
            value='$password'
            placeholder='Password'
            id='password'
            class='edit-credentials-password input'
          />
          <input
            type='tel'
            name='phone'
            value='$phone'
            placeholder='Phone'
            id='phone'
            class='edit-credentials-phone input'
          />
          <input
            type='text'
            name='email'
            value='$email'
            placeholder='E-mail'
            id='email'
            class='edit-credentials-email input'
          />
          <input
            type='text'
            name='firstname'
            value='$firstname'
            placeholder='First Name'
            id='firstname'
            class='edit-credentials-first-name input'
          />
          <input
            type='text'
            name='lastname'
            value='$lastname'
            placeholder='Last Name'
            id='lastname'
            class='edit-credentials-last-name input'
          />
          <input
            type='date'
            name='birthdate'
            value='$birthdate'
            placeholder='Age'
            id='age'
            class='edit-credentials-age input'
          />
    ";
          ?>
    </form>
          <button type="submit" form="useredit" class="edit-credentials-submit-button button">
            <span class="edit-credentials-text1">SUBMIT</span>
          </button>
        </div>
      </div>
    </div>
  </body>
</html>
