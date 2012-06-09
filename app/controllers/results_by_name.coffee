Spine = require('spine')
Main = require('controllers/main')
Sidebar = require('controllers/sidebar')

class ResultsByName extends Spine.Controller
  
  className: 'results'

  constructor: ->
    super
    @main = new Main
    @sidebar = new Sidebar

    divide = $('<div>').addClass('vdivide')

    @append @sidebar,divide,@main
    
module.exports = ResultsByName
