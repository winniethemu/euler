Helpers = require "./helpers"
BigNum = require "./lib/big_num"

zero = new BigNum("0")
one = new BigNum("1")
fibonacci = Helpers.genFibonacci(zero, one)

count = 1 # Our Fibonacci sequence starts at the second 1
loop
  value = fibonacci.next().value
  count += 1
  if value.length is 1000
    console.log count
    return
