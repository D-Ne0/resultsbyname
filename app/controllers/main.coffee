Spine = require('spine')
Jee2012s = require('controllers/jee2012s')
Aieee2012s = require('controllers/aieee2012s')
Home = require('controllers/home')

class Main extends Spine.Stack
  
  className: 'main stack'

  controllers:
    jee2012s: Jee2012s
    aieee2012s: Aieee2012s
    home:Home

  routes:
    
    '#!/home':()->
      @home.active()
      Main.trackPage('#/home')

    '!/home':()->
      @home.active()
      Main.trackPage('#/home')

    '#!/jee2012': ()->
      @jee2012s.active()
      Main.trackPage('#/jee2012')

    '!/jee2012':()->
      @jee2012s.active()
      Main.trackPage('#/jee2012')

    '#!/aieee2012': ()->
      @aieee2012s.active()
      Main.trackPage('#/aieee2012')

    '!/aieee2012':()->
      @aieee2012s.active()
      Main.trackPage('#/aieee2012')
  
  default: 'home'

  @trackPage:(url)->
    _gaq.push [ "_trackPageview","/#{url}" ]

module.exports = Main
