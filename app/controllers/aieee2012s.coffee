Spine = require('spine')
Main = require('controllers/main')
RollNo = require('models/aieee2012_rollno')
Aieee2012 = require('models/aieee2012')
Aieee2012RCode = require('models/aieee2012_region_code')
Load = require('controllers/loading')
$ = Spine.$

class Aieee2012s extends Spine.Controller
  
  className: 'aieee2012 round'

  elements:
    'input[type=text]':'search'
    'select#city':'city'
    'select#type':'catg'
    'table#result-2':'result'
    'table#result-3':'query'
 
  events:
    'keyup input[name=name]':'getResult'
    'click input[type=text]':'click'
    'click #submit input[type=button]':'getResult_1'
    'click #reset input[type=button]':'resetFields'
    'click u.next-prev':'next_prev'

  constructor: ->
    super
    @q={}
    @routes
      '/aieee2012/name::search/region::city/rank_type::type/page::page':(params) ->
        if params.search.length>=4
          _gaq.push [ "_trackPageview","/#/aieee2012/search" ]
          @load = new Load({el:@result,template:require('views/loading')})
          @load.render()
          @load = new Load({el:@query,template:require('views/loading')})
          @load.render()
          Aieee2012.getResult(params) 

    @log('aieee2012 Instantiated!!!')

    @html require('views/aieee2012')()
    #Spine.Model.host = "http://localhost:3000"
    Spine.Model.host = "http://backens.herokuapp.com"
    Spine.Ajax.disable -> Aieee2012RCode.fetch()
    Aieee2012RCode.bind('refresh',@renderRCodes)

    Aieee2012.bind('refresh', (results) => @renderResult(results))

  renderResult: (results) ->
    @result.html require('views/aieee2012_table_header')()
    @q.count = results.length if results?
    if @q.city isnt "Any"
      @q.cityName = Aieee2012RCode.filter(@q?.city)[0]?.N
    else
      @q.cityName = "Any"
      results[i].city = Aieee2012RCode.filter(parseInt(results[i].R/100000))[0]?.N for result,i in results?
    @result.append require('views/aieee2012_result')(results)
    @query.html require('views/aieee2012_query')(@q)

  renderRCodes: =>
    @city.append require('views/aieee2012_region_codes')(Aieee2012RCode.all())

  getResult:(e) ->
    return if e.keyCode!=13
    @q.search = @search.val()
    @q.catg = @catg.val()
    @q.city = @city.val()
    @q.page = 1
    return alert 'Please enter atleast 4 characters' if @q.search.length<4
    @navigate '','aieee2012','name:'+@q.search,'region:'+@q.city,'rank_type:'+@q.catg,'page:'+@q.page

  getResult_1:() ->
    @q.city = @city.val()
    @q.catg = @catg.val()
    @q.search = @search.val()
    @q.page = 1
    return alert 'Please enter atleast 4 characters' if @q.search.length<4
    @navigate '','aieee2012','name:'+@q.search,'region:'+@q.city,'rank_type:'+@q.catg,'page:'+@q.page

  next_prev:(e) ->
    @q.page = e.target.id
    @navigate '','aieee2012','name:'+@q.search,'region:'+@q.city,'rank_type:'+@q.catg,'page:'+@q.page

  click:()->
    @search.val('') if @search.val() is "Candidate's Name"

  resetFields:() ->
    @search.val('Candidate\'s Name')
    @city.val('Any')
    @catg.val('Any')
    @navigate '','aieee2012'

module.exports = Aieee2012s
