Helpers = require "./helpers"

p = Helpers.permutations("0123456789")

count = 0
loop
  value = p.next().value
  count += 1
  if count is 1000000
    console.log value
    return
