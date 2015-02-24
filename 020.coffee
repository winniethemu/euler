BigNum = require "./lib/big_num"

one = new BigNum("1")
factorial = (n) ->
  [1..n].reduce (prod, i) ->
    num = new BigNum(i.toString())
    prod.times(num)
  , one

digits = factorial(100).value.split("")

sum = digits.reduce (s, i) ->
  s + parseInt(i)
, 0

console.log sum
