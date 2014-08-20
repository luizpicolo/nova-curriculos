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
  // active();
  // first_last('elements');
  // even_odd('elements');
  // page_up();
  // page_back();

  $('input, textarea').placeholder();

  $('.date').mask('00/00/0000');
  $('.tel').mask('(00) 0000-0000');
  $('.money').mask('#.##0,00', {reverse: true, maxlength: false});
  $('.cep').mask('00000-000');
	$('.number').mask('#', {maxlength: false});

  $('.scroll').jScrollPane();
});
