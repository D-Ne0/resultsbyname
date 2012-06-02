Spine = require('spine')

class Jee2012 extends Spine.Model
  @configure 'Jee2012','reg_no','name','rank','rank_type'
  @extend 'Spine.Model.Local'
  
module.exports = Jee2012
