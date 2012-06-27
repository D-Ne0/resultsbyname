Spine = require('spine')
#List = require('spine/lib/list')
$ = Spine.$

class Sidebar extends Spine.Controller
  
  className: 'sidebar'

  events:
    'click .item':'click'

  constructor: ->
    super
    @html require('views/sidebar')()
    @bind('change',@change)
    
  click: (e) ->
    item = $(e.target)
    @trigger('change',item)

  change: (item) ->
    return unless item
    @current = item
    @el.children().removeClass('active')
    @current.parent().addClass('active')
    @db = @current.parent().attr('id')
    @navigate '#',@db

module.exports = Sidebar
