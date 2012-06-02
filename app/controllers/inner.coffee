Spine = require('spine')
RegionCode = require('models/region_code')
RegionCodes = require('controllers/region_codes')

class Inner extends Spine.Controller
  elements:
    'input':'search'
    'select#city':'city'
    'select#type':'type'
    'li':'fL'
  
  events:
    'keyup input':'getResult'
    'change select':'getResult_1'
    'click li':'getResult_2'

  constructor: ->
    super
    @html require('views/form')()
    Spine.Model.host = "http://localhost:3000"
    Spine.Ajax.disable -> RegionCode.fetch()
    RegionCode.bind('refresh',@render)
    #RegionCode.fetch({ajax:false})

  getResult:(e)->
    city = @city.val()
    type = @type.val()
    search = @search.val()
    if search.length>=4 and e.keyCode==13
      @navigate '','name:'+search,'region:'+city,'rank_type:'+type

  getResult_1:->
    city = @city.val()
    type = @type.val()
    search = @search.val()
    if search.length>=4
      @navigate '','name:'+search,'region:'+city,'rank_type:'+type
  
  render: =>
    @cities = new RegionCodes el:@city,template:require('views/region_code')
    cities = RegionCode.all()
    #@log(cities[0].name)
    @cities.render(cities)  
    
  getResult_2:(e)->
    fl = $(e.target).text()
    @navigate '',fl

module.exports = Inner
