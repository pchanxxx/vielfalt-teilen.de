# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  $('a.play_audio').on 'click', (e) ->
    e.preventDefault()
    e.stopPropagation()

    if $(this).data('playback')
      $(this).data('playback').stop()
      $(this).data('playback', null)
      $(this).text('Vorlesen')
      return

    url = $(this).data('audio-url')

    console.log "Playing #{url}"

    sound = new Howl
      urls: [url]

    $(this).data('playback', sound)
    $(this).text('Aufhören')
    sound.play()