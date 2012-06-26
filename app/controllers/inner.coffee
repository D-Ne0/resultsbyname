Spine = require('spine')
RegionCode = require('models/region_code')
RegionCodes = require('controllers/region_codes')

class Inner extends Spine.Controller
  elements:
    'input[type=text]':'search'
    'select#city':'city'
    'select#type':'type'
  
  events:
    'keyup input':'getResult'
    'click input[type=text]':'click'
    'click #submit input[type=button]':'getResult_1'
    'click #reset input[type=button]':'resetFields'

  constructor: ->
    super
    @html require('views/form')()
    Spine.Model.host = "http://backens.herokuapp.com"
    Spine.Ajax.disable -> RegionCode.fetch()
    RegionCode.bind('refresh',@render)

  getResult:(e)->
    city = @city.val()
    type = @type.val()
    search = @search.val()
    if e.keyCode==13
      if search.length>=4
        @navigate '','jee2012','name:'+search,'region:'+city,'rank_type:'+type
      else
        alert 'Please enter atleast 4 characters'

  getResult_1:->
    city = @city.val()
    type = @type.val()
    search = @search.val()
    if search.length>=4
      @navigate '','jee2012','name:'+search,'region:'+city,'rank_type:'+type
    else
      alert 'Please enter atleast 4 characters'      

  render: =>
    @cities = new RegionCodes el:@city,template:require('views/region_code')
    cities = RegionCode.all()
    #@log(cities[0].name)
    @cities.render(cities)

  click:()->
    @search.val('') if @search.val() is "Candidate's Name"

  resetFields:()->
    @search.val('Candidate\'s Name')
    @city.val('Any')
    @type.val('Any')
    @navigate '','jee2012'

module.exports = Inner
