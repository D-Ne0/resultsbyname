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
    'click input':'click'
    'change select':'getResult_1'
    'click li':'getResult_2'

  constructor: ->
    super
    @html require('views/form')()
    Spine.Model.host = "http://backens.herokuapp.com"
    Spine.Ajax.disable -> RegionCode.fetch()
    RegionCode.bind('refresh',@render)
    #RegionCode.fetch({ajax:false})

  getResult:(e)->
    city = @city.val()
    type = @type.val()
    search = @search.val()
    if e.keyCode==13
      if search.length>=4
        @navigate '','name:'+search,'region:'+city,'rank_type:'+type
      else
        alert 'Please enter atleast 4 characters'

  getResult_1:->
    city = @city.val()
    type = @type.val()
    search = @search.val()
    if search.length>=4
      @navigate '','name:'+search,'region:'+city,'rank_type:'+type
    else
      alert 'Please enter atleast 4 characters'      

  render: =>
    @cities = new RegionCodes el:@city,template:require('views/region_code')
    cities = RegionCode.all()
    #@log(cities[0].name)
    @cities.render(cities)  
    
  getResult_2:(e)->
    fl = $(e.target).text()
    @navigate '',fl

  click:()->
    @search.val('') if @search.val() is "Candidate's Name"

module.exports = Inner
