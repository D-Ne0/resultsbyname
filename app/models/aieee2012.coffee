Spine = require('spine')
Result = require('models/result')

class Aieee2012 extends Spine.Model
  @configure 'Aieee2012','_id','R','N','FN','SA1','SC1','AI1','AIC1','P1','P2','SA1','SC2','AI2','AIC2','S','C'

  @extend Spine.Model.Ajax.Methods

  @url: 'http://backens.herokuapp.com/aieee2012s'
  #@url: 'http://localhost:3000/aieee2012s'

  @getResult:(params)->
    Result.doAjax(params,@)
  
module.exports = Aieee2012
