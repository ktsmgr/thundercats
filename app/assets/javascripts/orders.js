// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function () {
	$('.order-history-table .orders').click(function () {

		var order_id = $(this).data('id');
		$('#order-details' + order_id).toggle();
		//5000 = 5sec
	});
});