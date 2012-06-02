Spine = require('spine')

class Result3 extends Spine.Controller
  constructor: ->
    super
  
  template: -> arguments[0]
 
  render:(q) ->
    @html @template(q)
 
module.exports = Result3
