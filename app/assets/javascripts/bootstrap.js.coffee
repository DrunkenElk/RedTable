jQuery ->
  $("a[rel=popover]").popover()
  $(".tooltip").tooltip()
  $("a[rel=tooltip]").tooltip()
  $('.dropdown-toggle').dropdown()
  $('.accordion-toggle').click ->
    $($(this).attr('href')).collapse('toggle')
    false
  $('.accordion-root').click ->
    for accordion in $('.accordion-body')
      $(accordion).collapse('toggle')
