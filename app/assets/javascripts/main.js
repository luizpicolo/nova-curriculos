// Close Alerts
$(document).ready(function() {
	$(".close").click(function(){
	    $(this).parent().fadeOut(500);
	})
	$(".alert").click(function(){
	    $(this).fadeOut(500);
	})
});


$(document).ready(function(){
  active();
  // first_last('elements');
  // even_odd('elements');
  // page_up();
  // page_back();

  $('input, textarea').placeholder();
});

$(function(){
	$('.scroll').jScrollPane();
});