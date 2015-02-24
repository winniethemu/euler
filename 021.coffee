Helpers = require "./helpers"

amicables = {}

isAmicable = (n) ->
  return true if amicables[n]
  thisDivisors = Helpers.properDivisors(n)
  thisSum = thisDivisors.reduce (s, d) ->
    s + d
  otherDivisors = Helpers.properDivisors(thisSum)
  otherSum = otherDivisors.reduce (s, d) ->
    s + d
  if (n is otherSum) and (n isnt thisSum)
    amicables[n] = true
    amicables[thisSum] = true
    return true
  false

sum = 0
for i in [1..9999]
  sum += i if isAmicable(i)

console.log sum
