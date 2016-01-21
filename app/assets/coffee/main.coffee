window.addEventListener 'DOMContentLoaded', ->
  callback = ->
    document.body.classList.add 'loaded'
  setTimeout callback, 125
