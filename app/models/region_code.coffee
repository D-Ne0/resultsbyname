Spine = require('spine')

class RegionCode extends Spine.Model
  @configure 'RegionCode','name','code'
  
  @extend Spine.Model.Ajax 

  @filter: (query) ->
    #alert query
    @select (item) -> item.code == parseInt(query)

module.exports = RegionCode
