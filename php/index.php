<?php

include("settings.php");

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

        <!-- Slider files -->
        <link rel="stylesheet" type="text/css" href="css/slide.css">

        <!-- Slider files -->
        <link rel="stylesheet" type="text/css" href="css/jcarousel.responsive.css">

        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="js/jquery.jcarousel.min.js"></script>

        <script type="text/javascript" src="js/jcarousel.responsive.js"></script>

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

             <!--Top Area Start -->

            <div class="top-area">

                <div class="container">

                    <a href="index.php" class="inner-logo"><img src="img/logo-main.png" alt=""></a>

                    <h1>Responsive Order Form</h1>

                    <h5>Awesome order form for Corporates, Freelancers, Web Developers..</h5>

                </div>

            </div>

          <!--   Top Area End -->

        </div>

    </header>

    <!-- =================================================

    Header Area End -->

    

    

    <!-- Order Form Area Start 

    ====================================================== -->

    <?php
    //get category list
    $categories=$obj->getCategoryList();
    ?>

   <form action="place-order.php" method="post" id="order_frm">

    <section class="order-form">

        <div class="container text-center">

            <h2>Start Your Order</h2>

            <p class="medium-txt">You can use below form to get an estimate of your project.</p>

            <!-- Order Buttons Start -->

         <div class="order-btns clearfix">

              <div class="col-md-4">
                         <a class="order-opt-link active" id="stepOne">

                         <span class="icon">
                       
                         
                                              
                         </span>

                         <span id="order-con-id">Step 1 <br> Registration </span>
                         
                        </a>

                </div>

                <?php
                //Listing all categories
                if(!empty($categories))

                {

                    foreach($categories as $category)

                    {

                    ?>

                     <div class="col-md-4">
                     <a  class="order-opt-link" name="otherStep" id="<?php echo $category['idCategory']?>">

                     <span class="icon">
                   
                     
                     <?php
                     if($category['is_image']==1){
                     ?>
                     
                      <?php
                     $catImage=$siteLink.'/public/uploads/category/'.$category['catImage'];
                     if($category['catImage']!=""){
                     //if(file_exists($catImage)){?>
                     <img src="<?php echo $siteLink;?>/timthumb.php?src=<?php echo $siteLink;?>/public/uploads/category/<?php echo $category['catImage']?>&w=50&amp;h=50&amp;zc=1">
                     <?php //} 
                     }?> 
                         
                     <?php }  
                     if($category['is_image']==2){?>
                     <i class="<?php echo $category['catImage'];?>"></i>
                     <?php } ?>
                     
                     </span>

                     <span id="order-con-id"><?php echo $category['catName']?></span>
                     
                    </a>

                </div>

                    <?php   

                    }

                }

                ?>       

            </div>

            <!-- Order Buttons End -->

            

            <!-- Order Form Categories Start -->

            <div class="order-catogories clearfix">

            

                <!-- Order section Start -->

                <div class="col-md-8 clearfix">

                    <div class="row">

                 <?php
                //get product list
                $products=$obj->getproductList();
                ?>

                        <!-- Package1 Start -->

                        <?php
                        //List all products and show only first category's product on first load
                        if(!empty($products))

                        {

                            foreach($categories as $category)

                            {

                                $groupproducts=$obj->getproductByCategory($category['idCategory']);

                                if(!empty($groupproducts))

                                {
                                    //show 4 products in a row
                                    if(count($groupproducts)>2)
                                    {
                                    ?>
                                    <div id="cms-main-category" class="col-md-12 cms-category">
                                    <div class="row">
                                    <?php
                                        $i=0;
                                        foreach($groupproducts as $product)
                                        {
                                    ?>
                                    
                                     <div class="col-md-3 pdcts" id="<?php echo $product['idproduct'];?>" data-catid="<?php echo $product['idCategory'];?>">
                                    <div class="cms-cont pdcteach <?php if($i==0){?>active<?php } ?>"  data-cost1="<?php echo $product['productPrice'];?>" id="normal-pk<?php echo $product['idproduct'];?>" data-productname="<?php echo $product['productName'];?>">
                                     <?php
                     if($product['is_image']==1){
                     ?>
                     
                      <?php
                     $productImage=$siteLink.'/public/uploads/products/'.$product['productImage'];
                     if($product['productImage']!=""){?>
                      <img src="timthumb.php?src=public/uploads/products/<?php echo $product['productImage']?>&w=80&amp;h=80&amp;zc=1">
                     <?php
                     }?> 
                         
                     <?php }  
                     if($product['is_image']==2){?>
                     <i class="<?php echo $product['productImage'];?>"></i>
                     <?php } ?>
                                        
                                        <h5><?php echo $product['productName'];?></h5>
                                        <?php if($show_price==1){?>
                                        <p id="price-pk<?php echo $product['idproduct'];?>" data-price="<?php echo $product['productPrice'];?>"><span><?php echo $currency?></span><?php echo number_format($product['productPrice'],2);?></p>
                                        <?php } ?>
                                     
                                    </div>
                                </div>
                                <?php

                                        $i++;
                                        }
                                        ?>
                                    </div>
                                    </div>
                                    <?php
                                    }
                                    else//show 2 products in a row
                                    {
                                        $i=0;
                                        foreach($groupproducts as $product)
                                        {

                                    ?>

                                    <div class="col-md-6 pdcts" id="<?php echo $product['idproduct'];?>" data-catid="<?php echo $product['idCategory'];?>">
    
                                    <div class="html5-web" id="pdct-outer">

                                    <div class="normal-pk pdcteach <?php if($i==0){?>active<?php } ?>" id="normal-pk<?php echo $product['idproduct'];?>" data-cost1="<?php echo $product['productPrice'];?>" data-productname="<?php echo $product['productName'];?>">
                                     <?php
                     if($product['is_image']==1){
                     ?>
                     
                      <?php
                     $productImage=$siteLink.'/public/uploads/products/'.$product['productImage'];
                     if($product['productImage']!=""){?>
                    <img src="<?php echo $siteLink;?>/timthumb.php?src=<?php echo $siteLink;?>/public/uploads/products/<?php echo $product['productImage']?>&w=50&amp;h=50&amp;zc=1">
                     <?php
                     }?> 
                         
                     <?php }  
                     if($product['is_image']==2){?>
                     <i class="<?php echo $product['productImage'];?>"></i>
                     <?php } ?>
                                    <h3><?php echo $product['productName'];?></h3>
                                    
                                     <?php if($show_price==1){?>
                                    <div class="price" id="price-pk<?php echo $product['idproduct'];?>" data-price="<?php echo $product['productPrice'];?>"><span><?php echo $currency?></span><?php echo number_format($product['productPrice'],2);?></div>                                
                                     <?php } ?>

                                    <p><?php echo $product['productDesc'];?></p>

                                    </div>

                                    </div>

                                    </div>

                                <?php

                                    $i++;
                                    }
                                }

                                }

                            }

                        }

                        

                        ?>
                        
                        <input type="hidden" name="product" id="product" value="">
                        <input type="hidden" name="show_price" id="show_price" value="<?php echo $show_price;?>">
                        
                      

                        <!-- CMS Services End -->

                         
                        <div class="col-md-12">
                        <?php
                                //List all options and show only first product's options
                                $productoptions=$obj->getProductOptions();
                                
                            ?>
                            <!-- Additional Options Start -->
                             <?php

                                if(!empty($productoptions))
          
                                {
                                  $count = 0;
                                    ?>
                            <div class="addi-opts" id="add_options">

                                <ul class="list-opt clearfix"><li><span>Advanced Options</span></li></ul>

                               

                              

                                    <ul class="list-opt clearfix">

                                    <?php
                                    $phoneArray = [];
                            
                 
                                    foreach($productoptions as $option)

                                    {
                                       
                                        if( !in_array($option['idProduct'], $phoneArray )  ){
                                               array_push($phoneArray, $option['idProduct']);
                                               $flag = true; 
                                        } else {
                                            $flag = false;
                                        }
                                        if($flag ) {


                                    $count++;
                                    $optiondetails=$obj->getProductOptionsById($option['idOption']);

                                        ?>
                                  
                                        <li class="opns" data-pdctid="<?php echo $option['idProduct']?>">

                                       <img src="public/uploads/products/<?php echo $optiondetails['productImage'] ?>" width="200px" />
                                       <input onchange="showDescription(this, '<?php echo $optiondetails['description'] ?>' )" name="options"  type="checkbox" id="dyn_menus_<?php echo $option['idOption'];?>" data-pdct="<?php echo $option['idProduct']?>" value="<?php echo $optiondetails['optionname'];?>  
                                       <span>[<?php echo $currency.$optiondetails['optionPrice'];?>]</span>"
                                              name="html_options[]" class="check-opt" data="<?php echo $optiondetails['optionname'];?>" data-cost2="<?php echo number_format($optiondetails['optionPrice'],2);?>" />
                                          <?php echo $optiondetails['optionname'];?> 
                                       <?php if($show_price==1){?>
                                       <span>[<?php echo $currency.$optiondetails['optionPrice'];?>]</span>
                                       
                                        <?php }   ?>
                                    </li> 

                                        <?php

                                    }
}
                                    ?>
<button onClick= "makeEmpty()" type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Change Phone</button>
                                   </ul>

                                   

                                

                            </div>
                                <?php

                                }

                                ?>
                            <!-- Additional Options End -->

                           <div class="addi-opts" id="description" style="display: none;">

                            
                            </div> 

<!-- Modal -->
<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Phone Options</h4>
      </div>
      <div class="modal-body">
        <div class="jcarousel-wrapper">
                <div class="jcarousel">
                    <ul>
                               <?php
                                   
                                    foreach($productoptions as $option)

                                    {
                                    $count++;
                                    $optiondetails=$obj->getProductOptionsById($option['idOption']);

                                        ?>
                        <li onClick= "writeDescription(<?php echo $option['idOption'];?>)"  class="opns" data-pdctid="<?php echo $option['idProduct']?>" >
                        <input type="hidden" id="des_<?php echo $option['idOption'];?>" value="<?php echo $optiondetails['description'] ?>" />
                        <img src="public/uploads/products/<?php echo $optiondetails['productImage'] ?>"/>
                                <?php if($show_price==1){?>
                                       <span>[<?php echo $currency.$optiondetails['optionPrice'];?>]</span>
                                       
                                        <?php } ?>   </li> 

                                        <?php

                                    }

                                    ?>
         
                    </ul>
                </div>

                <a href="#" class="jcarousel-control-prev">&lsaquo;</a>
                <a href="#" class="jcarousel-control-next">&rsaquo;</a>


            </div>
            <div id="phoneDescription"  class="modal-body"> </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal" >Close</button>
      </div>
    </div>

  </div>
</div>
                            <!-- Form Start -->



                            <div class="submit-opts-form clearfix"  id="userForm" >
                            <div id="errorDiv">
                            </div>
                             <div class="controls" id="error_order" style="color:red;"></div>
                             <label style="padding: 5px 15px; margin: 0 0 15px 0; text-align: right; font-family: 'Open Sans', sans-serif; font-size: 14px; height: 35px; width: 32%; float: left;">Select State:</label>
                                    <select   name="customer_state" class="second-field">
                                    <option value="tx"> TX</option>
                                    </select>
                                 <div class="clearfix">
                                 </div>
                                 <br><br>

                                <div class="clearfix">
                                
                                    <input type="text" name="currency" id="currency" style="display:none;" value="<?php echo $currency?>"/>

                                    <input type="text" name="customer_choice" style="display: none;"/>

                                    <input type="text" name="customer_sub_choice" style="display: none;"/>

                                    <input type="text" name="type_cost" style="display: none;"/>

                                    <input type="text" name="actual_amt" style="display:none;"/>
                                    
                                    <input type="text" name="reduction" style="display:none;" value="0"/>                                                                                                                                           

                                    <input type="text" name="order_total_amt" style="display: none;"/>  

                                    <input type="text" name="innerpage_cost" style="display: none;"/>   


                                    <input type="text" placeholder="Your first Name *" id="firstname" value="0"  name="firstname" class="first-field">

                                    <input type="text" placeholder="Your Last Name*" id="lastname" name="lastname" value="0" class="second-field">

                                    <input type="text" placeholder="Your Email" id="email" name="email" value="0" class="third-field">
                                    <input type="text" placeholder="Your Mobile Phone" id="phone" name="phone" value="0" class="first-field">
                                  <input type="text" placeholder="Your Company" id="company" name="company" value="0" class="second-field">
                                 
                                    <input type="number" placeholder="No Of Employee" id="employee" name="employee"  class="third-field" value="0" >
                                  <input type="hidden" id="no_prod" name="no_prod" value="0">
                                </div>  

                                <!-- Order Concept Area Start -->                           

                                

                                <!-- Order Concept Area End -->           

                           </div>

                            <!-- Form End -->

                        </div>
                        
                    </div>

                </div>

                <!-- Order Section End -->

            

                <!-- Order Summary Start -->

                <div class="col-md-4 clearfix" id="order_summary_box">

                    <div class="summary-box">
                        
                         <?php if($show_price==1){?>
                        <div class="heading-total">Order Summary : <span class="color-txt" id="order_total"><span><?php echo $currency?></span>0</span></div>
                          <?php }?>

                        <!-- Package Features Start -->

                        <div class="summary-basic-pack" id="summary-pack">

 <?php

                if(!empty($categories))

                {

                    foreach($categories as $category)

                    {

                    ?>
                    <div id="catdesc<?php echo $category['idCategory']?>" class="catdesc">
                    <?php echo $category['catDescription']?>
                    </div>
                    <?php   

                    }

                }

                ?>       

                          
                        </div>
                        
                        
                       

                <?php
                
                if(!empty($products))
                ?>
                 <div class="summary-basic-pack" id="product-summary-pack">
                <?php
                {

                    foreach($products as $product)

                    {

                    ?>
                    <div id="proddesc<?php echo $product['idproduct']?>" class="proddesc">
                    <?php echo $product['productDesc']?>
                    </div>
                    <?php   

                    }
                ?>
                 </div>
                <?php
                }

                ?>       

                          
                       

                        <!-- Package Features End -->

                        <!-- Innerpage count section Start -->

                        <div class="pages-area-cal">

                            <ul class="page-ul">

                                <li>Quantity</li>

                                <li><input type="text" class="pages-txtbx" name="product_quantity" id="product_quantity" placeholder="1" value="1"></li>

                            </ul>

                        </div>

                        <!-- Innerpage count section End -->

                        <!-- Extra option selected section Start -->

                        <div class="summary-basic-pack">

                            <h5>Phone Options</h5>

                            <ul class="pack-add" id="pack-add">

                            <li id="nothing">No Option Selected</li>

                            </ul>

                        </div>

                        <!-- Extra option selected section End -->

                        <!-- Discount coupon section Start -->
                         <?php if($show_price==1){?>

                        <div class="coupon-box">

                            <h5><span><i class="fa fa-gift"></i></span> Have a Discount Coupon ?</h5>

                            <input type="text" name="coupon_text" id="coupon_text" class="coupon-txtbx" placeholder="Enter Code">

                            <a href="javascript:void(0);" id="discnt_btn_id">Apply !</a>

                            <p id="dis_price"></p>

                        </div>
                        <?php } ?>
                        <!-- Discount coupon section End -->

                        <!-- Main order button area Start -->

                        <div class="orderbtn-area">

                            <?php echo $bottom_content;?>

                            <div class="order-btn-cont"><a href="#" class="button" id="order_btn_id">Order Now !</a></div>

                        </div>

                        <!-- Main order button area end -->

                    </div>

                </div>

                <!-- Order Summary End -->

            

            </div>

            <!-- Order Form Categories End -->

        </div>

    </section>

    </form>

    <!-- =================================================

    Order Content Area End -->

    



    <!-- Footer Area Start 

    ====================================================== -->

    <footer class="footer-area text-center">

        <a href="index.html"><img src="img/f-logo.png" alt=""></a>

        <p>&copy;2015 <a href="http://www.responsiveexpert.com/" target="_blank">Responsive Experts</a> All right reserved.</p>

    </footer>

    <!-- =================================================

    Footer Area End -->

    

    <!-- JavaScript Files -->

    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1/jquery.js"></script><!--   jquery -->

    <script type="text/javascript" src="js/bootstrap.js"></script><!-- Bootstrap js -->

    <script type="text/javascript" src="js/core.js"></script><!-- Core js -->

    <script type="text/javascript" src="js/orderform.js"></script><!-- Form js -->

    <script type="text/javascript">
        
      
   $("input:checkbox").change(function(){
   var group = ":checkbox[name='"+ $(this).attr("name") + "']";
     if($(this).is(':checked')){
       $(group).not($(this)).attr("checked",false);
     }
   });      
      
      
    var showDescription = function showDescription(cb, description) {
      if(cb.checked == true) {
        $('#description').html(description);
      } else {
        
        
      }
    }
    var writeDescription = function ( id ) {

        var domID = 'des_'+id;
        var description  = document.getElementById(domID).value;
        $('#phoneDescription').html(description);

    }
    var makeEmpty = function () {
         $('#phoneDescription').html("");
    }
    </script>

</body>

</html>

