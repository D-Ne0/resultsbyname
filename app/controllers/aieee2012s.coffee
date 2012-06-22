Spine = require('spine')
RollNo = require('models/aieee2012_rollno')
$ = Spine.$

class Aieee2012s extends Spine.Controller
  
  className: 'aieee2012'

  elements:
    'input[name=roll_no]':'rollNo'
 
  events:
    'click input[name=send_roll_no]':'sendRollNo'
    'click a':'goToResults'

  constructor: ->
    super
    @log('aieee2012 Instantiated!!!')
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

  goToResults: ->
    @html require('views/aieee2012')()

module.exports = Aieee2012s
