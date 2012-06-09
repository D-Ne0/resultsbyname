Spine = require('spine')

class Aieee2012s extends Spine.Controller
  
  className: 'aieee2012'

  constructor: ->
    super
    @log('aieee2012 Instantiated!!!')
    @html require('views/coming_soon')()
    
module.exports = Aieee2012s
