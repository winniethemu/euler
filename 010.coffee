Helpers = require "./helpers"

sum = 0
primes = Helpers.primes()

loop
  prime = primes.next().value
  if prime < 2000000
    sum += prime
  else
    break

console.log sum
