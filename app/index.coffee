require('lib/setup')

Stack = require('spine/lib/manager').Stack
Spine = require('spine')
Jee2012s = require('controllers/jee2012s')
Jee2012 = require('models/jee2012')
Home = require('controllers/home')
ResultsByName = require('controllers/results_by_name')

class App extends Spine.Controller
 
  constructor: ->
    super
    @log('App Instantiated')
    @resultsByName = new ResultsByName
    @append @resultsByName.active()
    Spine.Model.host = "http://backens.herokuapp.com"
    Spine.Route.setup()

module.exports = App
    
