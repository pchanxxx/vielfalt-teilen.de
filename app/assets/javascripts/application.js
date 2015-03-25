//= require jquery
//= require jquery_ujs
//= require prefixfree.min
//= require howler.min
//= require categories

$(document).ready(function() {
  if(!Modernizr.svg) {
    $('img[src*="svg"]').attr('src', function() {
        return $(this).attr('src').replace('.svg', '.png');
    });
  }

  $('.seizebig').on('click', function(e) {
    e.preventDefault();
    e.stopPropagation();

    if ($('body').hasClass('itsbig')) {
      $(this).html('<i class="icon-zoom-in"></i>Mach es groß');
      $('body').removeClass('itsbig');
    } else {
      $(this).html('<i class="icon-zoom-out"></i>Mach es klein');
      $('body').addClass('itsbig');
    }
  });
});