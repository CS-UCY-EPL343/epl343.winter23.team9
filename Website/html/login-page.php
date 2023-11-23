<?php
session_start();
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Collect input data
    $username = $_POST['username'];
    $usernameAdmin = $_POST['usernameAdmin'];
    $passwordAdmin = $_POST['passwordAdmin'];
    $password = $_POST['password'];

    // Database connection
   // Set session variables
   $serverName = $_SESSION["serverName"];
   $connectionOptions = $_SESSION["connectionOptions"];
     $conn = sqlsrv_connect($serverName, $connectionOptions);

     if($conn === false) {
       die(print_r(sqlsrv_errors(), true));
   }

    // Prepare SQL statement
    $admin=0;
    if(!empty($username) && !empty($password) ){
      $tsql = "{call spLOGIN (?, ?)}";
      $params = array($username, $password); 
    } else if(!empty($usernameAdmin) && !empty($passwordAdmin) ){
      $tsql = "{call spADMINLOGIN (?, ?)}";
      $admin=1;
      $params = array($usernameAdmin, $passwordAdmin); 
    } else{
      echo "Please enter a username and password.";
    }

    // Execute the query
    $stmt = sqlsrv_query($conn, $tsql, $params);
    if ($stmt === false) {
      echo "Error logging in.";
      print_r(sqlsrv_errors(), true);
    } else {
      if($admin){
        echo "Admin Login successful.";
      }else{
        echo "Login successful.";
      }
        

        /* Free query  resources. */
    sqlsrv_free_stmt($stmt);
    }
    // Close the connection
    sqlsrv_close($conn);
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
  <title>LoginPage - my-ecigshop</title>
  <meta property="og:title" content="LoginPage - my-ecigshop" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <meta charset="utf-8" />
  <meta property="twitter:card" content="summary_large_image" />

  <style data-tag="reset-style-sheet">
    html {
      line-height: 1.15;
    }

    body {
      margin: 0;
    }

    * {
      box-sizing: border-box;
      border-width: 0;
      border-style: solid;
    }
    p,li,ul,pre,div,h1,h2,h3,h4,h5,h6,figure,blockquote,

    figcaption {
      margin: 0;
      padding: 0;
    }

    button,input,optgroup,select,

    textarea {
      font-family: inherit;
      font-size: 100%;
      line-height: 1.15;
      margin: 0;
    }

    button,
    select {
      text-transform: none;
    }

    button,
    [type="button"],
    [type="reset"],
    [type="submit"] {
      -webkit-appearance: button;
    }

    button::-moz-focus-inner,
    [type="button"]::-moz-focus-inner,
    [type="reset"]::-moz-focus-inner,
    [type="submit"]::-moz-focus-inner {
      border-style: none;
      padding: 0;
    }

    button:-moz-focus,
    [type="button"]:-moz-focus,
    [type="reset"]:-moz-focus,
    [type="submit"]:-moz-focus {
      outline: 1px dotted ButtonText;
    }

    a {
      color: inherit;
      text-decoration: inherit;
    }

    input {
      padding: 2px 4px;
    }

    img {
      display: block;
    }

    html {
      scroll-behavior: smooth
    }
  </style>
  <style data-tag="default-style-sheet">
    html {
      font-family: Inter;
      font-size: 16px;
    }

    body {
      font-weight: 400;
      font-style: normal;
      text-decoration: none;
      text-transform: none;
      letter-spacing: normal;
      line-height: 1.15;
      color: var(--dl-color-gray-black);
      background-color: var(--dl-color-gray-white);

    }
  </style>
  <link rel="stylesheet"
    href="https://fonts.googleapis.com/css2?family=Nunito:ital,wght@0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&amp;display=swap"
    data-tag="font" />
  <link rel="stylesheet"
    href="https://fonts.googleapis.com/css2?family=Raleway:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&amp;display=swap"
    data-tag="font" />
  <link rel="stylesheet"
    href="https://fonts.googleapis.com/css2?family=Lato:ital,wght@0,100;0,300;0,400;0,700;0,900;1,100;1,300;1,400;1,700;1,900&amp;display=swap"
    data-tag="font" />
  <link rel="stylesheet"
    href="https://fonts.googleapis.com/css2?family=Inter:wght@100;200;300;400;500;600;700;800;900&amp;display=swap"
    data-tag="font" />
  <style>
    @keyframes fade-in-left {
      0% {
        opacity: 0;
        transform: translateX(-20px);
      }

      100% {
        opacity: 1;
        transform: translateX(0);
      }
    }
  </style>
</head>

<body>
  <link rel="stylesheet" href="./style.css" />
  <div>
    <link href="./login-page.css" rel="stylesheet" />

    <div class="login-page-container">
      <a href="index.php" class="login-page-navlink">
        <img alt="image" src="./images/MyEcigShopLogoNew.png" class="login-page-ecig-picture" />
      </a>
      <header class="login-page-backround">
      <form action="login-page.php" method="post"> 
        <input type="text" name="username" placeholder="username" class="login-page-username-member input" />
        <input type="text" name="usernameAdmin" placeholder="username" class="login-page-username-admin input" />
        <input type="text" name="passwordAdmin" placeholder="password" class="login-page-password-admin input" />
        <input type="text" name="password" placeholder="password" class="login-page-password-member input" />
        
        <button type="submit" class="login-page-member-login button">
        <span class="login-page-text02">
            <span class="login-page-text03">Login</span>
        </span>
    </button>

    <button type="submit" class="login-page-admin-login button">
        <span class="login-page-text05">
            <span class="login-page-text06">Login</span>
        </span>
    </button>

        </form>
        <span class="login-page-welcome-text">
          <span class="login-page-text">Welcome to Your Account</span>
          <br class="login-page-text01" />
        </span>
        <span class="login-page-login-header">member login</span>
        <span class="login-page-admin-header">
          <span class="login-page-text08">Admin Login</span>
          <br />
        </span>
        <a href="https://example.com" target="_blank" rel="noreferrer noopener" class="login-page-sign-up-button">
          Not a Member? Sign up now!
        </a>
        <img alt="image" src="./images/vape-img1.png" class="login-page-vape-image" />
      </header>
      <div class="login-page-footer">
        <footer class="login-page-footer1">
          <div class="login-page-container1">
            <span class="login-page-logo">ECS</span>
            <nav class="login-page-nav">
              <a href="index.php" class="login-page-nav1">Home</a>
              <a href="products.php" class="login-page-nav2">Products</a>
              <a class="login-page-nav3">
                <span>Cart</span>
                <br />
              </a>
              <a href="ContactUs.php" class="login-page-nav5">Contact</a>
            </nav>
          </div>
          <div class="login-page-separator"></div>
          <div class="login-page-container2">
            <span class="login-page-text12">
              © 2023 my-ecigshop, All Rights Reserved.
            </span>
            <div class="login-page-icon-group">
              <a href="https://twitter.com" target="_blank" rel="noreferrer noopener" class="login-page-link">
                <svg viewBox="0 0 950.8571428571428 1024" class="login-page-icon">
                  <path
                    d="M925.714 233.143c-25.143 36.571-56.571 69.143-92.571 95.429 0.571 8 0.571 16 0.571 24 0 244-185.714 525.143-525.143 525.143-104.571 0-201.714-30.286-283.429-82.857 14.857 1.714 29.143 2.286 44.571 2.286 86.286 0 165.714-29.143 229.143-78.857-81.143-1.714-149.143-54.857-172.571-128 11.429 1.714 22.857 2.857 34.857 2.857 16.571 0 33.143-2.286 48.571-6.286-84.571-17.143-148-91.429-148-181.143v-2.286c24.571 13.714 53.143 22.286 83.429 23.429-49.714-33.143-82.286-89.714-82.286-153.714 0-34.286 9.143-65.714 25.143-93.143 90.857 112 227.429 185.143 380.571 193.143-2.857-13.714-4.571-28-4.571-42.286 0-101.714 82.286-184.571 184.571-184.571 53.143 0 101.143 22.286 134.857 58.286 41.714-8 81.714-23.429 117.143-44.571-13.714 42.857-42.857 78.857-81.143 101.714 37.143-4 73.143-14.286 106.286-28.571z">
                  </path>
                </svg>
              </a>
              <a href="https://instagram.com" target="_blank" rel="noreferrer noopener" class="login-page-link1">
                <svg viewBox="0 0 877.7142857142857 1024" class="login-page-icon2">
                  <path
                    d="M585.143 512c0-80.571-65.714-146.286-146.286-146.286s-146.286 65.714-146.286 146.286 65.714 146.286 146.286 146.286 146.286-65.714 146.286-146.286zM664 512c0 124.571-100.571 225.143-225.143 225.143s-225.143-100.571-225.143-225.143 100.571-225.143 225.143-225.143 225.143 100.571 225.143 225.143zM725.714 277.714c0 29.143-23.429 52.571-52.571 52.571s-52.571-23.429-52.571-52.571 23.429-52.571 52.571-52.571 52.571 23.429 52.571 52.571zM438.857 152c-64 0-201.143-5.143-258.857 17.714-20 8-34.857 17.714-50.286 33.143s-25.143 30.286-33.143 50.286c-22.857 57.714-17.714 194.857-17.714 258.857s-5.143 201.143 17.714 258.857c8 20 17.714 34.857 33.143 50.286s30.286 25.143 50.286 33.143c57.714 22.857 194.857 17.714 258.857 17.714s201.143 5.143 258.857-17.714c20-8 34.857-17.714 50.286-33.143s25.143-30.286 33.143-50.286c22.857-57.714 17.714-194.857 17.714-258.857s5.143-201.143-17.714-258.857c-8-20-17.714-34.857-33.143-50.286s-30.286-25.143-50.286-33.143c-57.714-22.857-194.857-17.714-258.857-17.714zM877.714 512c0 60.571 0.571 120.571-2.857 181.143-3.429 70.286-19.429 132.571-70.857 184s-113.714 67.429-184 70.857c-60.571 3.429-120.571 2.857-181.143 2.857s-120.571 0.571-181.143-2.857c-70.286-3.429-132.571-19.429-184-70.857s-67.429-113.714-70.857-184c-3.429-60.571-2.857-120.571-2.857-181.143s-0.571-120.571 2.857-181.143c3.429-70.286 19.429-132.571 70.857-184s113.714-67.429 184-70.857c60.571-3.429 120.571-2.857 181.143-2.857s120.571-0.571 181.143 2.857c70.286 3.429 132.571 19.429 184 70.857s67.429 113.714 70.857 184c3.429 60.571 2.857 120.571 2.857 181.143z">
                  </path>
                </svg>
              </a>
              <a href="https://facebook.com" target="_blank" rel="noreferrer noopener" class="login-page-link2">
                <svg viewBox="0 0 602.2582857142856 1024" class="login-page-icon4">
                  <path
                    d="M548 6.857v150.857h-89.714c-70.286 0-83.429 33.714-83.429 82.286v108h167.429l-22.286 169.143h-145.143v433.714h-174.857v-433.714h-145.714v-169.143h145.714v-124.571c0-144.571 88.571-223.429 217.714-223.429 61.714 0 114.857 4.571 130.286 6.857z">
                  </path>
                </svg>
              </a>
            </div>
          </div>
        </footer>
      </div>
    </div>
  </div>
</body>

</html>