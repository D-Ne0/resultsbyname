Spine = require('spine')

class Aieee2012RegionCode extends Spine.Model
  @configure 'Aieee2012RegionCode','N','C'
  
  @extend Spine.Model.Ajax 

  @filter: (query) ->
    @select (item) -> item.C == parseInt(query)
  
module.exports = Aieee2012RegionCode
