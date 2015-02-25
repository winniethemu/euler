Helpers = require "./helpers"

abundantNumbers = {}

n = 12
while n <= 28123
  divisorSum = Helpers.properDivisors(n).reduce (s, d) ->
    s + d
  abundantNumbers[n] = true if divisorSum > n
  n += 1

sum = 0
abundants = Object.keys(abundantNumbers)
for i in [1..28123]
  flag = true
  for j in abundants
    break if i <= j
    if abundantNumbers[i-j]
      flag = false
      break
  sum += i if flag

console.log sum
