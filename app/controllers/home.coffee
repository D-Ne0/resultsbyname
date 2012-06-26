Spine = require('spine')
RollNo = require('models/aieee2012_rollno')

class Home extends Spine.Controller

  className:'home'

  elements:
    'input[name=roll_no]':'rollNo'
    'input[name=name]':'search'
 
  events:
    'click input[name=send_roll_no]':'sendRollNo'
  
  constructor: ->
    super
    @log('Home Instantiated!!!')
    @html require('views/coming_soon')()
    RollNo.bind 'saved',(result) => 
      if result is "true"
        $('div#not_saved').text('')
        $('div#saved').text('Thank you for giving us roll number.')
      else
        $('div#saved').text('')
        $('div#not_saved').text("Try another roll number.") 
  
  sendRollNo: ->
    rollNo = @rollNo.val()
    return alert 'Invalid Roll No' if rollNo.length!=8
    f = parseInt(rollNo/100000)
    l = rollNo%100000
    $('div#not_saved').text('')
    $('div#saved').text('saving...')
    RollNo.sendRollNo(f,l)

module.exports = Home
