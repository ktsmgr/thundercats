// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

function initialize() {
  var myLatlng = new google.maps.LatLng(33.746152, -84.372961);
	var map_canvas = document.getElementById('map_canvas');
  var map_options = {
    center: myLatlng,
    zoom: 13,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  }
  var map = new google.maps.Map(map_canvas, map_options)

  var marker = new google.maps.Marker({
      position: myLatlng,
      map: map,
      title: 'Hello World!'
  });

}

google.maps.event.addDomListener(window, 'load', initialize);


$(document).ready(function () {
// When everything is loaded (all html files are loaded), run this code
	$(document).on('click', '#toggle_cart_button', function () {
	// If toggle_cart_button is clicked, perform this function

	//$('#toggle_cart_button').click(function () {

		var display = $('#cart_detail_panel').css('display');
		if (display == "none") {
			$('#cart_detail_panel').slideDown();
		} else {
			$('#cart_detail_panel').slideUp();
		}
	});

	//This is to add the click event

	//$('.quantity').val('Enter number');

	$('.add-to-cart-button').click(function () {

		// The code below gets invoked when the add-to-cart button gets clicked
		// For the class, when the action takes place, this function is invoked

		//var quantity_text_box = $(this).siblings('.quantity');
		//var value = quantity_text_box.val();
		//These 2 lines (above) are the same as the line below:
		var value = $(this).siblings('.quantity').val();
		// var = Event handler for the click button
		// siblings = Elements that are in the same level on the html page. For this element, the input line is a sibling to button. It's plural because you can have many siblings. But you have to call it by name (class or id name - use . or #). 
		// If parent was used, div above the Quantity would be identified. Only one parent, so this is singular. Example below:
		//$(this).parent().css('background-color', 'green');

		// We can GET values from a text box (like above). We can also assign values using the example below:
		//quantity_text_box.val(1000);


		var value_int = parseInt(value);
		// This converts the string into an integer

		// Homework start
		var product_id = $(this).data('product-id');
		var product_name = $(this).data('product-name');
		var unit_price = $(this).data('unit-price');
		// Homework alternate solution from Sarah: $(this).siblings('.product_id').val();
		// Homework end

		if (value_int > 0) {

			// Make an AJAX call
			$.post('/store/add_cart', {
				quantity : value_int,
				product_id : product_id,
				product_name : product_name,
				price : unit_price
			});

			// This makes a POST request
			// add_cart is a new action. Add code to store controller and routes.
			// {} means hash
			// We're passing quantity info over to the server. 


			//alert('Thank you!');

		} else {
			alert(value + ' is not a number. Please type in a number')
		}
	
	});

	/*
	$('.add-to-cart-button').mouseover(function () {

		alert('You are over me!');	

	});
	*/

});