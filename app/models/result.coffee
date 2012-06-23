Spine = require('spine')

class Result extends Spine.Model
  @configure 'Result'
  
  @doAjax: (params,mod) ->
    $.ajax
      url:mod.url
      data:params
      dataType:'json'
      type:'get'
      success:(results) =>
        @updateInterface(results,mod)

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

  @updateInterface: (results,mod) ->
    mod.deleteAll()
    mod.trigger('refresh') if results.length is 0
    for result in results
      j = mod.create(result)
      j.save()
    mod.trigger('refresh',results)

module.exports = Result
