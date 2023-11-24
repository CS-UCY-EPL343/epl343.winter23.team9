<?php
 session_start();
function viewDetails(){
 
  if (isset($_POST['Name'])) {
    $Name = $_POST['Name'];
    $Name = str_replace(" AND ", '&', $Name);
  }

  if (isset($_POST['Category'])) {
    $Cat = $_POST['Category'];
  }

$Nicotine = "";
  if($Cat == 'Liquid'){
    $Nicotine = "
    <span class='product-detail-nicotine'>-Select Nicotine Amount-</span>
    <select name='Nicotine' class='product-detail-nicotine1'>
    <option selected=''>0</option>
    <option value='Option 2'>3 +€3.5</option>
    <option value='Option 3'>6 +€7</option>
    <option value='Option 4'>9 +€10.5</option>
  </select>";
  }

    $serverName = $_SESSION["serverName"];
		$connectionOptions = $_SESSION["connectionOptions"];
      $conn = sqlsrv_connect($serverName, $connectionOptions);

      if($conn === false) {
        die(print_r(sqlsrv_errors(), true));
    }

    $tsql = "{call spViewProduct (?)}";
    $params = array($Name); // replace 'Electronics' with the category you want

    $getResults = sqlsrv_query($conn, $tsql, $params);

    while ($row = sqlsrv_fetch_array($getResults, SQLSRV_FETCH_ASSOC)) {
      $data[] = $row;
  }

    $Price = $data[0]['Price'];
    $Description = $data[0]['Description'];
    $image = $data[0]['Image_path'];

    echo "
    <img
      alt='product'
      src='$image'
      class='product-detail-image1'
    />
    
    <span class='product-detail-title'>$Name €$Price</span>
    <span class='product-detail-description'>
            <span>$Description</span>
          </span>
    $Nicotine
    <span class='product-detail-quantity'>Quantity:</span>
    <select class='product-detail-quantity1'>
    <option value='Option 1'>1</option>
    <option value='Option 2'>2</option>
    <option value='Option 3'>3</option>
    </select>
    <button type='button' class='product-detail-button button'>
    Add to Cart
    </button>";

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
      <link href="./product-detail.css" rel="stylesheet" />

      <div class="product-detail-container">
        <div class="product-detail-header">
          <header
            data-thq="thq-navbar"
            class="product-detail-navbar-interactive"
          >
          <a href="index.php">
            <img
              alt="image"
              src="./Images/MyEcigShopLogoNew.png"
              class="product-detail-image"
            />
          </a>
            <nav class="product-detail-links">
              <a href="index.php" class="product-detail-nav1">Home</a>
              <a href="products.php" class="product-detail-nav2">Products</a>
              <span class="product-detail-nav3">Order</span>
              <div class="product-detail-nav4">
                <span class="products-text">Cart</span>
                <br />
              </div>
              <span class="product-detail-nav5"></span>
            </nav>
            <div class="product-detail-container1">
              <div
                data-thq="thq-navbar-nav"
                class="product-detail-desktop-menu"
              ></div>
            </div>
          </header>
        </div>
        <div class='product-detail-container2'>
       <?php viewDetails(); ?>
    </div>
        
       
      </div>
    </div>
    
  </body>
</html>
