// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function () {

		// When everything is loaded (all html files are loaded), run this code

	//$('.quantity').val('Enter number');

	$('.add-to-cart-button').click(function () {

		// This code get invoked
		// For the class, when the action takes place, this function is invoked

		var value = $(this).siblings('.quantity').val();

		// var = Event handler for the click button
		// siblings = Elements that are in the same level on the html page. For this element, the input line is a sibling to button. It's plural because you can have many siblings. But you have to call it by name (class or id name - use . or #). 
		// If parent was used, div above the Quantity would be identified. Only one parent, so this is singular. Example below:
		//$(this).parent().css('background-color', 'green');

		// We can GET values from a text box (like above). We can also assign values using the example below:
		//quantity_text_box.val(1000);


		var value_int = parseInt(value);
		// This converts the string into an integer

		// Homework: var product_id = //do something here

		if (value_int > 0) {

			// Make an AJAX call
			$.post('/store/add_cart', {
				quantity : value_int //,
				// Homework: product_id : product_id
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