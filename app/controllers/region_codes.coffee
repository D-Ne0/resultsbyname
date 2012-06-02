Spine = require('spine')

class RegionCodes extends Spine.Controller
  constructor: ->
    super
  
  template: -> arguments[0]  

  render: (cities)->
    #@log cities[0].code
    for city,i in cities
      @append @template(cities[i])

module.exports = RegionCodes
