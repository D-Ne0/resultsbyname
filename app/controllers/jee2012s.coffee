Spine = require('spine')
Jee2012 = require('models/jee2012')
RegionCode = require('models/region_code')
Inner = require('controllers/inner')
Inner_1 = require('controllers/inner_1')
Load = require('controllers/loading')
Result_2 = require('controllers/result_2')
Result_3 = require('controllers/result_3')

class Jee2012s extends Spine.Controller
  className: 'jee2012 round'
  
  elements:
    '#result-2':'result'
    '#result-3':'result_1'
    'input':'search'
    'select#city':'city'
    'select#type':'type'

  constructor: ->
    super

    @routes
      '/jee2012/name::search/region::city/rank_type::type':(params) -> 
        if params.search.length>=4
          _gaq.push [ "_trackPageview","/#/jee2012/search" ]
          @load = new Load({el:@result,template:require('views/loading')})
          @load.render() 
          @load = new Load({el:@result_1,template:require('views/loading')})
          @load.render() 
          Jee2012.getResult(params)

    div = $('<div>').attr('id','inner-head')
    div_1 = $('<div>').attr('id','inner-head-1')
    @inner = new Inner(el:div)
    @inner_1 = new Inner_1(el:div_1)
    @append @inner,@inner_1
    
    @result_2 = new Result_2 el:@result,template:require('views/result_2')
    @result_3 = new Result_3 el:@result_1,template:require('views/result_3')
    Jee2012.bind('refresh', (results) => @render(results))

  render:(results) =>
    q = {}
    q.search = @search.val()
    if @city.val() isnt "Any"
      q.city = RegionCode.filter(@city.val())[0].name
    else
      q.city = "Any"
    q.type = @type.val()
    q.count = Jee2012.count()
    #results = Jee2012.all()
    @result_2.render(results)
    @result_3.render(q)
 
module.exports = Jee2012s
