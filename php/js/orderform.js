//  ====================================================================



//	Theme Name: OrderNow - Responsive Order Form

//	Description: This js file for price calculation

//	Version: 1.0

//	Author: Responsive Expert

//	Author URI: http://www.responsiveexpert.com

//	Tags:

//	

//	---------------------------

//	TEMPLATE SCRIPTS

//	---------------------------

//	

//	TABLE OF CONTENTS

//	---------------------------

//	01. price calculation



//  ====================================================================





(function() {

	"use strict";

	/*! Script for form price calculation */

	var order_total = 0;//total price

    /* default values goes here*/

	var order_type_cost = 0;//single product price

	var order_type_title = '';//single product title

	var order_additional_options = 0;//additional option's price

	var conversion_inner_page = 0;

	var conversion_inner_page_cost = 0;//extra conversion price

	var conversion_cost = 49;

	var extra_options = '';//not used

	var option_value= '';//not used

	/* default coupon code */

	var coupon_code ='HTML5';//not used

	var discount = 0;//dicount coupon added or not

	var coupon_value = '';//not used

	var discount_amt = 0;//discount value

	var discounted_price = 0;//price after discount

	var list_options = '';//not used

    /*default discount percentage goes here*/	

    var discount_percentage = 20;//not used

    var discvalue=0;//discount value
	
	var disctyp=0;//discount type % or cash
	
	var product_quantity=1;//product quantity
	
	var currency= $('#currency').val();
	
	var show_price= $('#show_price').val();
	
	$(document).ready(function(e)

	{
		//First category id
		var cat1=$(".order-opt-link").attr('id');
		$("#"+cat1).addClass("active");
		
		//hide all products,categories and show first category and its products
		$('.pdcts').hide();
		$('.catdesc').hide();
		$('.proddesc').hide();
		$('#catdesc'+cat1).show();
		
		$('[data-catid='+cat1+']').show();

		//id of first selected product
		var pdct=$('[data-catid='+cat1+']').attr('id');
		$('#proddesc'+pdct).show();
		//hide all product options and show options of first product
		$('.opns').hide();
		$('#order_btn_2').hide();
		if($('[data-pdct='+pdct+']').length==0){$("#add_options").hide();}
		if($('[data-catid='+cat1+']').length==0){$("#order_summary_box").hide();$('#order_btn_2').show();}
		
		$('[data-pdctid='+pdct+']').show();
		
		//save product id in a hidden textbox
        $('#product').val(pdct);

		/*	default title goes here*/	
		$('input[name=customer_choice]:text').val($('[data-catid='+cat1+']').attr('data-productname'));

		/*	default sub title goes here*/
		$('input[name=customer_sub_choice]:text').val("");
		
		/* update the cart */
		cart_update();

	});
	function reset_data()
	{
		order_total=0;discount=0;order_type_cost =0;product_quantity=1;
		
		$('.check-opt').prop('checked', false); // Uncheck all options
		$("#pack-add").html('<li id="nothing">No Option Selected</li>');
		
		$(".pdcteach").removeClass("active");//hide selection of product		
		$('#dis_price').html("");
		$('#coupon_text').val("");
		$('#product_quantity').val(1);
		 $("#no_prod").val(0);	
		$("#add_options").show();
		$('#order_btn_2').hide();
		$("#order_summary_box").show();
		/*	default title goes here*/	
		$('input[name=customer_choice]:text').val("");

		/*	default sub title goes here*/
		$('input[name=customer_sub_choice]:text').val("");				 
	}

	function cart_update()
	{
		 order_additional_options=0;
		 
		 /*	default title goes here*/	
		$('input[name=customer_choice]:text').val($('.pdcteach.active').attr('data-productname'));
		 
		 order_type_cost=$(".pdcteach.active").attr('data-cost1');//product price
		 
		 $('input[name=type_cost]:text').val(order_type_cost);	
		 $("input:checkbox[class=check-opt]:checked").each(function() {
		
		/*	default sub title goes here*/
		$('input[name=customer_sub_choice]:text').val($(this).attr('data'));

      	 order_additional_options=order_additional_options+Number($(this).attr('data-cost2'));//product option price
 		 });
		discount_amt=0;
		product_quantity=$("#product_quantity").val();
		/* calculate the total */
	    order_total=Number(order_type_cost*product_quantity)+order_additional_options;	

		if(discount==1)
		{

			if(disctyp=='P')
			{
				discount_amt = (order_total*discvalue/100).toFixed(2);
			}
			if(disctyp=='C')
			{
				discount_amt =discvalue;
			}
			
			
			
			if(disctyp=='P')
			{
					$('#dis_price').html('<span>'+currency+'</span>'+order_total+' - '+discvalue+'% discount ('+currency+''+discount_amt +') = '+currency+''+(order_total-discount_amt).toFixed(2));
			}
			if(disctyp=='C')
			{
					$('#dis_price').html('<span>'+currency+'</span>'+order_total+' - '+'discount ('+currency+''+discvalue +') = '+currency+''+(order_total-discount_amt).toFixed(2));
			}
			discounted_price = order_total-discount_amt;
			$('input[name=actual_amt]:text').val(order_total);
			$('input[name=reduction]:text').val(discount_amt);
			order_total=discounted_price;
		}

		/* Assign the total amount to a text field for form submission */

		$('input[name=order_total_amt]:text').val(order_total.toFixed(2));

		/* calculate the discount */

		$('#order_total').html('<span>'+currency+'</span>'+(order_total.toFixed(2)));

		return false;

	}

	function default_value_setting()

	{

		order_additional_options =0;

		conversion_inner_page =0;

		conversion_inner_page_cost=0;

		/*set the discount price div as null*/	

		$('#dis_price').html('');

		/*set the discount price null*/	

		discount=0;

		$('input[name=type_cost]:text').val(order_type_cost);

		$('input[name=coupon_text]:text').val('');		

		$('input[name=conversion_inner_pages]:text').val(0);

		$('input[name=etaDropDown]:text').val('3 Day');

		$(".pack-add").html('<li id="nothing">No Option Selected</li>');

	}

	
	//category click
	$(".order-opt-link").on("click",function(){
		reset_data();
		$(".order-opt-link").removeClass("active");
		$(this).addClass("active");
		
		var cat=$(this).attr('id');

		$('.pdcts').hide();//hide all products
		$('.catdesc').hide();//hide all descriptions
		$('#catdesc'+cat).show();//show selected category's description
		
		$('[data-catid='+cat+']').show();//show selected category's products

		var prdct=$('[data-catid='+cat+']').attr('id');//get id of first product
		
		$('.proddesc').hide();
		
		$('#proddesc'+prdct).show();
		
		$('#product').val(prdct);//set selected product id in ahidden field

		$("#normal-pk"+prdct).addClass("active");//make it active(blue)
		
		if($('[data-pdct='+prdct+']').length==0){$("#add_options").hide();}
		
		if($('[data-catid='+cat+']').length==0){$("#order_summary_box").hide();$('#order_btn_2').show();}

		$('.opns').hide();//hide all product options

		$('[data-pdctid='+prdct+']').show();//show first product's options
		
		/* update the cart */
		cart_update();

	});
	//Product click
    $(".pdcts").on("click",function(){
		reset_data();
		
		var prdct=$(this).attr('id');//get the id of selected product
		
		$('.proddesc').hide();
		
		$('#proddesc'+prdct).show();
		
		$("#normal-pk"+prdct).addClass("active");//make selected product active(blue)
		
		if($('[data-pdct='+prdct+']').length==0){$("#add_options").hide();}
											 
		$('.opns').hide();//hide all product options
			
		$('[data-pdctid='+prdct+']').show();//show selected product's options
		        
		 $('#product').val(prdct);//save selected produc's id on a hidden field 
		 
		/* update the cart */
		cart_update();

	});
	

	// code for discount coupon

    $("#discnt_btn_id").on("click",function()
	{	
	$('#dis_price').html('<img src="img/load.gif">');
	$.ajax({
	type:"post",
	url:"checkcoupon.php",
	data:"coupon="+ $("#coupon_text").val()+"&product="+$("#product").val(),
	success : function(data){
		if(data!=0)
		{
			var res = data.split("|");
			discvalue=res[0];
			disctyp=res[1];
			discount=1;
			cart_update();
		}
		else
		{
			$('#dis_price').html('Coupon code is not valid');
		}
	},
	error:function()
	{
	alert("error");	
	}
});
	});

	// end discount coupon code

	// add and remove check box items on summary

	$(document).delegate('.check-opt', 'click', function()
	{

		var liid ='';

		var newval='';

		var latvalue='';

		if($(this).is(':checked'))

		{

			//split value using currency , in case of other currency put that here

			newval = $(this).attr('value').split(currency);

			latvalue = newval[1].split(']');

			order_additional_options+= Number(latvalue[0]);

			liid = $(this).attr('id');

			$("#nothing").remove();
			
			if(show_price==1)
			{
				$(".pack-add").append('<li id="res'+liid+'">'+($(this).attr('value'))+'</li>');
			}
			if(show_price==0)
			{
				$(".pack-add").append('<li id="res'+liid+'">'+($(this).attr('data'))+'</li>');
			}
			// $('#order_frm').append('<input type="hidden" name="item_name_" id="item_name_'+count+'" value="'+$(this).attr('data')+'"><input type="hidden"  name="amount_" id="amount_'+count+'" value="'+$(this).attr('data-cost2')+'">');

		}

		else

		{   // minus unchecked value 

			newval = $(this).attr('value').split(currency);

			latvalue = newval[1].split(']');

			order_additional_options-= Number(latvalue[0]);

			liid = $(this).attr('id');		

		    $("#res"+liid+"").remove();

		}

		cart_update();
	});

	//change quantity
	$('input[name=product_quantity]:text').keyup(function(e)
	{
		if(isNaN($(this).val()) || $(this).val()==0)
		{

			$(this).val(1);
			cart_update();
		}
		else
		{
			cart_update();
		}
	});
    //inner page conversion *
	$('input[name=conversion_inner_pages]:text').keyup(function(e)
	{
		if(isNaN($(this).val()))
		{

			$(this).val(0);
		}
		else
		{
			// calculate ETA based on inner page

			conversion_inner_page = $(this).val();

			conversion_inner_page = Number(conversion_inner_page);

			conversion_inner_page_cost = conversion_inner_page*conversion_cost;

			var con_dropdown_cnt =  $('input[name=etaDropDown]:text');

			$('input[name=innerpage_cost]:text').val(conversion_inner_page_cost);			

			if(conversion_inner_page==0 )

				 con_dropdown_cnt.val('3 Day');

			else if(conversion_inner_page==1 || conversion_inner_page==2 )

				 con_dropdown_cnt.val('4 Day');

			else if(conversion_inner_page==3 || conversion_inner_page==4 )

				con_dropdown_cnt.val('5 Day');

			else if(conversion_inner_page==5 || conversion_inner_page==6 )

				con_dropdown_cnt.val('6 Day');

			else if(conversion_inner_page==7 || conversion_inner_page==8 )

				con_dropdown_cnt.val('7 Day');

			else if(conversion_inner_page==9 || conversion_inner_page==10 )

				con_dropdown_cnt.val('8 Day');

			else

				con_dropdown_cnt.val('Let me estimate');

			cart_update();
		}
	});	

	// on click order button submit the form

	$('#order_btn_id').on("click",function(e)

	{

	 e.preventDefault();

	 $('#order_frm').submit();

	});

	// on click order button of basic form then submit the order form 

	$('#order_btn_id2').on("click",function(e) {

	 e.preventDefault();
	 
	 $("#no_prod").val(1);

	 // change the action of the basic form to thankyou.php

 	 $('#order_frm').get(0).setAttribute('action', 'thankyou.php'); //change the action on submit

     $('#order_frm').submit();

	});

	$('input:text, textarea').keyup(function(e) {

			$('#error_order').css('display','none');

		});	

	$('#order_frm').submit(function(e)

	{

		if($('input[name=customer_name]:text').val()=='')

		{

			$('#error_order').css('display','block').html('Please enter your name');

			$('input[name=customer_name]:text').focus();

			return false;

		}

		else if($('input[name=customer_email]:text').val()=='')

		{

			$('#error_order').css('display','block').html('Please enter your email');

			$('input[name=customer_email]:text').focus();

			return false;

		}

		else if(!validate_email($('input[name=customer_email]:text').val()))

		{

			$('#error_order').css('display','block').html('Please enter your valid email');

			$('input[name=customer_email]:text').focus();

			return false;

		}	

		else if($('textarea[name=customer_message]').val()=='')

		{

			$('#error_order').css('display','block').html('Please enter your project description');

			$('textarea[name=customer_message]').focus();

			return false;

		}

		else

		{

			return true;

		}

	});

	function validate_email(email) 

	{

	   var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;

	   return reg.test(email);

	}



})(jQuery);