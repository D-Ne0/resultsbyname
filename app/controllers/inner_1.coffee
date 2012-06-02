Spine = require('spine')
Jee2012 = require('models/jee2012')
#Jee2012s = require('controllers/jee2012s')
#Result_2 = require('controllers/result_2')
#Result_3 = require('controllers/result_3')

class Inner1 extends Spine.Controller    
  constructor: ->
    super
    @html require('views/result')()

module.exports = Inner1
