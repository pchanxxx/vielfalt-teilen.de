#= require jquery
#= require jquery_ujs
#= require jquery.autoellipsis
#= require bootstrap
#= require prefixfree.min

class BubbleLayouter
  minBubbleSize: 150
  maxBubbleSize: 220
  currentPage: 1

  layoutBubble: (bbl) ->
    bubbleSize = Math.floor(Math.random() * (@maxBubbleSize - @minBubbleSize) + @minBubbleSize)
    verticalShift = Math.floor(Math.random() * ($(bbl).height() - bubbleSize + 100)) - 50
    horizontalShift = Math.floor(Math.random() * ($(bbl).width() - bubbleSize))

    name = $(bbl).data('name')
    picture = $(bbl).data('picture')
    message = $('<p>').text($(bbl).data('message'))

    $(bbl).empty()

    $(bbl).css('width', "#{bubbleSize}px").css('height', "#{bubbleSize}px")
    $(bbl).css('top', "#{verticalShift}px")
    $(bbl).css('left', "#{horizontalShift}px")

    b = $('<div>').addClass('bbl')
    $(bbl).append($('<div>').addClass('bbl-wrap').append(b))

    $(bbl).addClass("bbl-bg-#{picture}")
    bubbleBack = $('<div>').addClass('bbl-front').addClass("bbl-img-#{picture}")
    bubbleFront = $('<div>').addClass('bbl-back').append($('<h3>').text(name)).append(message)

    $(b).append(bubbleBack).append(bubbleFront)

    $(bbl).on 'click', =>
      @loadBigBubble(bbl)

    $('.bbl-back').ellipsis()

  layoutBubbles: (bbls, page) ->
    bubblePage = $('.bbl-grid')
    for b in bbls
      bubble = $('<div>').addClass('bbl-item').data('picture', b['picture']).data('name', b['name']).data('message', b['message'])
      bubblePage.append($('<li>').append(bubble))
      @layoutBubble(bubble)

  loadBigBubble: (b) ->
    bigBubble = $('<div>').addClass('bubble_big')
    bigBubbleDiv = $('<div>').addClass('bubble_big_text')
    bigBubble.append(bigBubbleDiv)
    if Modernizr.svg
      bigBubbleDiv.append($('<img>').attr('src', "/assets/#{$(b).data('picture')}.svg"))
    else
      bigBubbleDiv.append($('<img>').attr('src', "/assets/#{$(b).data('picture')}.png"))
    bigBubbleDiv.append($('<h3>').text($(b).data('name')))
    bigBubbleDiv.append($('<p>').text($(b).data('message')))
    $('body').append(bigBubble)
    $('.bubble_bg').fadeIn()
    $(bigBubble).fadeIn()

$(document).ready ->
  unless Modernizr.svg
    $('img[src*="svg"]').attr 'src', ->
        $(this).attr('src').replace '.svg', '.png'

  # Layout bubbles
  window.bl = new BubbleLayouter()

  $('.bubble_bg').on 'click', ->
    $(this).fadeOut()
    $('.bubble_big').fadeOut ->
      $('.bubble_big').remove()

  $(window).scroll ->
    url = $('.zeichensetzen .pagination').attr('href')
    if url && $(window).scrollTop() > $(document).height() - $(window).height() - 50
      $('.zeichensetzen .pagination').attr('href', '').text("Lade...")
      $.getJSON url, (data) ->
        bl.layoutBubbles data.bubbles
        if data.next_page
          $('.zeichensetzen .pagination').attr('href', "/zeichensetzen?page=#{data.next_page}")
        $('.zeichensetzen .pagination').text('')

  $('.zeichencontainer .setzedeinzeichen').on 'click', (e) ->
    e.preventDefault()
    e.stopPropagation()

    $('.zeichen_bg').fadeIn()
    $('.neues_zeichen').fadeIn()

  $('.neues_zeichen #zeichen_text').on 'keyup', (e) ->
    max = 140
    len = $(this).val().length;
    $('span#charCount').text(len)
    if (len > max)
      $(this).text($(this).text().substring(0, 140))

  $('form').submit (e) ->
    e.preventDefault()
    e.stopPropagation()

    $.post('/zeichensetzen.json', $(this).serialize()).done (data) =>
      if data.error
        $(this).find('.error').text('Bitte fülle alle Felder aus und versuche es erneut.')
      else
        resetFormAndHide()

  $('.zeichen_bg').on 'click', ->
    resetFormAndHide()

  resetFormAndHide = () ->
    $('.zeichen_bg').fadeOut()
    $('.neues_zeichen').fadeOut ->
      $('form').find('input[type=text]').val('')
      $('form').find('textarea').val('')
      $().find('textarea').val('')
      $('label img').css('opacity', 0.5)
      $('label:first img').css('opacity', 1.0)
      $('input[type=radio]:first').attr('checked', 'checked')


  $('label').on 'click', (e) ->
    $('label img').css('opacity', 0.5)
    $(this).find('img').css('opacity', 1.0)

  $('label img').css('opacity', 0.5)
  $('label:first img').css('opacity', 1.0)
  $('input[type=radio]:first').attr('checked', 'checked')

  $(window).resize ->
    $('.bbl-item').each ->
      bl.layoutBubble(this)

  $('.bbl-item').each ->
    bl.layoutBubble(this)