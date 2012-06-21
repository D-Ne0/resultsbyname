Spine = require('spine')

class Aieee2012Rollno extends Spine.Model
  @configure 'Aieee2012Rollno'

  @extend Spine.Model.Ajax.Methods

  #@url: 'http://localhost:3000/roll_nos'
  @url: 'http://backens.herokuapp.com/roll_nos'

  @sendRollNo:(f,l) ->
    data = "f=#{f}&l=#{l}"
    $.ajax
      url:@url
      type:'GET'
      data:data
      success:(result) =>
       @trigger 'saved',result 
  
module.exports = Aieee2012Rollno
