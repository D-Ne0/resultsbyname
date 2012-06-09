Spine = require('spine')

class Jee2012 extends Spine.Model
  @configure 'Jee2012','_id','reg_no','name','rank','rank_type'

  @extend Spine.Model.Ajax.Methods

  @getResult: (params) ->
    #@deleteAll()
    $.ajax
      url:'http://backens.herokuapp.com/jee2012s'
      data:params
      type:'get'
      success:(results) =>
        @updateInterface(results)

  @sort:(sortBy) ->
    results = @all()
    if sortBy is "name"
      results.sort((a,b)->
        #alert a.name+" "+b.name
        return -1 if(a.name<b.name)
        return 1 if(a.name>b.name)
        return 0 )
    else if sortBy is "reg_no"
      results.sort((a,b)-> return a.reg_no - b.reg_no )
    else
      results.sort((a,b)-> return a.rank - b.rank ) 
    #@updateInterface(results)

  @updateInterface: (results) ->
    @deleteAll()
    @trigger('refresh') if results.length is 0
    for result in results
      j = Jee2012.create(result)
      j.save()
    @trigger('refresh',results)
     
  #@url: 'http://localhost:3000/jee2012s'

module.exports = Jee2012
