Spine = require('spine')
Jee2012 = require('models/jee2012')

class Result2 extends Spine.Controller
  events:
    'click th':'click'

  constructor: ->
    super
	
  template: -> arguments[0]
 
  render:(results)->
    @log(results)
    @results = results if results
    @html require('views/table_header')
    @append @template(@results)

  click:(e) ->
    sortBy = $(e.target).attr('id')
    Jee2012.sort(sortBy)

module.exports = Result2
