Spine = require('spine')

class Loading extends Spine.Controller
  constructor: ->
    super
  
  template:-> arguments[0]

  render: ->
    @html @template()
  
module.exports = Loading
