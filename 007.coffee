Helpers = require "./helpers"

primes = Helpers.primes()
primes.next() for i in [1..10000]
answer = primes.next().value # The 10001st prime
console.log answer

module.exports = answer
