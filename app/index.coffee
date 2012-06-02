require('lib/setup')

Spine = require('spine')
Jee2012s = require('controllers/jee2012s')
Jee2012 = require('models/jee2012')

class App extends Spine.Controller
 
  constructor: ->
    super
    @log('Instantiated!!!')
    div =  $('<div>').attr('id','after-head')
    @jee2012s = new Jee2012s(el:div)
    @append @jee2012s.active()

    Spine.Model.host = "http://localhost:3000"
    Spine.Route.setup()
    Jee2012.bind 'ajaxError',(rec,xhr,settings,error) => @log(error+' cc')
    Jee2012.bind 'ajaxSuccess',(status,xhr) =>#kdkd
  
module.exports = App
    
