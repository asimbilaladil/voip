<?php 
include('settings.php');
if(empty($_POST))
{
	header('Location: index.php');
}
?>
<!DOCTYPE html>
<html lang="en-US">
<head>
    <meta charset="utf-8">
    <title>Order Now - Responsive Order Form</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="keywords" content="">
    
    <!--[if lt IE 9]>
    <script src="https://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
    
    <link rel="shortcut icon" href="img/favicon.ico">
    
    <!-- Core CSS -->
    <link type="text/css" rel="stylesheet" href="css/bootstrap.css"><!-- Bootstrap -->
    <link type="text/css" rel="stylesheet" href="font-awesome/css/font-awesome.min.css"><!-- font-awesome -->
    <link type="text/css" rel="stylesheet" href="css/style.css"><!-- Theme Core CSS -->
    
    <!-- Google Fonts here -->
    <link href='https://fonts.googleapis.com/css?family=Arvo:400,400italic,700,700italic' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800' rel='stylesheet' type='text/css'>
</head>

<body>

    <!-- Preloader Area Start 
    ====================================================== -->
    <div id="mask">
        <div id="loader">      
        </div>
    </div>
    <!-- =================================================
    Preloader Area End -->
    
    <!-- Header Area Start 
    ====================================================== -->
    <header class="main-header clearfix" id="top">
    	<div class="banner-area inner-banner-area">
            <!-- Top Area Start -->
            <div class="top-area">
                <div class="container">
                	<a href="index.php" class="inner-logo"><img src="img/logo-main.png" alt=""></a>
                    <h1>Responsive Order Form</h1>
                    <h5>Awesome order form for Corporates, Freelancers, Web Developers..</h5>
                </div>
            </div>
            <!-- Top Area End -->
        </div>
    </header>
    <!-- =================================================
    Header Area End -->    
	<?php
	$msg_suc = '';
	$items="";$ins="";
	$orderArr=array();
	if(isset($_POST))
	{
		$ins=$obj->submitOrder($_POST);
		
		if($ins=='err')
		{
		 header('Location: index.php');	
		}
		
	}
	else
	{
		header('Location: index.php');
	}	
	
	?>
<!-- Success message section start -->
    <section class="order-form">
    	<div class="container text-center">
			<?php if($ins==1) {?>
			<h2>Your order placed successfully!</h2>
            <p>Our team will analyze your order and send you order confirmation mail asap.<br/> Thank you.</p>
            <?php } ?>    
		 </div>   
</section>
<!-- Success message section end -->
<!-- Footer Area Start 
    ====================================================== -->
    <footer class="footer-area text-center">
        <a href="index.html"><img src="img/f-logo.png" alt=""></a>
        <p>&copy;2015 <a href="http://www.responsiveexpert.com/" target="_blank">Responsive Experts</a> All right reserved.</p>
    </footer>
    <!-- =================================================
    Footer Area End -->
    
    <!-- JavaScript Files -->
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1/jquery.js"></script><!-- jquery -->
    <script type="text/javascript" src="js/bootstrap.js"></script><!-- Bootstrap js -->
    <script type="text/javascript" src="js/core.js"></script><!-- Core js -->
    <script>
	setTimeout(function()
	{
    window.location.href = "index.php";
},10000)
	</script>
</body>
</html>
