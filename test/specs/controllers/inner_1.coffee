require = window.require

describe 'Inner1', ->
  Inner1 = require('controllers/inner1')
  
  it 'can noop', ->
    