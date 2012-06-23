Spine = require('spine')
Result = require('models/result')

class Jee2012 extends Spine.Model
  @configure 'Jee2012','_id','reg_no','name','rank','rank_type'

  @extend Spine.Model.Ajax.Methods
    
  @url: 'http://backens.herokuapp.com/jee2012s'
  #@url: 'http://localhost:3000/jee2012s'

  @getResult:(params) ->
    Result.doAjax(params,@)

module.exports = Jee2012
