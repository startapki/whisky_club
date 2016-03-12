#= require jquery
#= require jquery_ujs
#= require turbolinks
#= require bootstrap-sprockets
#= require cable
#= require jquery.raty
#= require alertify
#= require jquery.textarea.autoresize
#= require ionrangeslider

$ ->
  $('.auto-expand').autoresize()
  $('.slider').ionRangeSlider(
    grid: true,
    min: 60,
    max: 100
  )
