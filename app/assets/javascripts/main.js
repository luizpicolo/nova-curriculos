// Function for load more
$(document).ready(function () {
    size_li = $('.vacancies-list li').size();
    var value = $('.vacancies-list').data('value');
    var x = parseInt(value);
    $('.vacancies-list li:lt('+x+')').show();
    $('#loadMore').click(function (e) {
        e.preventDefault();
        x= (x+5 <= size_li) ? x+5 : size_li;
        $('.vacancies-list li:lt('+x+')').show();
    });
    $('#showLess').click(function (e) {
        e.preventDefault();
        x=(x-5<0) ? 3 : x-5;
        $('.vacancies-list li').not(':lt('+x+')').hide();
    });
});

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

  //$('input, textarea').placeholder();

  $('.date').mask('00/00/0000');
  $('.tel').mask('(00) 0000-0000');
  $('.money').mask('#.##0,00', {reverse: true, maxlength: false});
  $('.cep').mask('00000-000');
	$('.number').mask('#', {maxlength: false});

  $('.scroll').jScrollPane();
});
