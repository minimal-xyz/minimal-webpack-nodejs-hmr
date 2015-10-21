
lib = require './lib'

console.log lib.data
lib.printSelf()

counter = 0
setInterval ->
  counter += 1
  console.log counter
, 2000

if module.hot
  module.hot.accept './lib', ->
    lib = require './lib'

    console.log lib.data
    lib.printSelf()
