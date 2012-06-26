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
    '/home':'home'
    '/jee2012': 'jee2012s'
    '/aieee2012': 'aieee2012s'

  default: 'home'
    
module.exports = Main
