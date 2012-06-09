Spine = require('spine')

class Home extends Spine.Controller

  tag:'div'
  el:'<div>sdjjd</div>'

  constructor: ->
    super
    @log('Home Instantiated!!!')
 
module.exports = Home
