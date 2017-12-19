$(function() {

  // update selected link in main navigation bar
  var page = window.location.pathname.split('/');

  page = page[page.length-1];

  $('#main-nav').find('a[href="'+page+'"]').addClass('selected');

  
  // update documentation menu in documentation page

  if (page === "documentation.html") {
    var active = $('.content .main-txt').attr('id');
    $('#docs-nav').find('a[href="'+active+'.html"]').addClass('selected');
  }

  
  // update documentation link in main navigation bar
  // when submenu is open
  $('#main-nav .submenu').hover(function() {
    $(this).closest('.menu-item').find('a').toggleClass('selected');
  }); 


  // add scrolling effects to styleguide:
  // * to-top button
  $("#to-top").click(function() {

    $('html, body').animate({
        scrollTop: $('header').offset().top
    }, 1000);
  });

  //  * styleguide menu
  $("#styleguide-menu a").click(function() {
    $('html, body').animate({
        scrollTop: $($(this).attr('href')).offset().top
    }, 1000);
  });

});