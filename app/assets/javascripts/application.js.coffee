#= require jquery
#= require jquery.turbolinks
#= require jquery_ujs
#= require turbolinks
#= require bootstrap-sprockets
#= require cable
#= require jquery.raty
#= require alertify
#= require jquery.textarea.autoresize
#= require ionrangeslider
#= require nprogress
#= require nprogress-turbolinks

ready = ->
  $('.auto-expand').autoresize()
  $('.slider').ionRangeSlider(
    grid: true,
    min: 60,
    max: 100
  )

$ ->
  ready()
