Set = require "./lib/set"

helpers =
  fibonacci: (n) ->
    # Return the first N Fibonacci numbers starting with 1 and 2
    fibonacci = [1, 2]
    if n < 1
      throw "Error: Invalid index number."
    else if n is 1
      return [1]
    else
      while n - 2 > 0
        lastTerm = fibonacci[fibonacci.length - 1]
        secondLastTerm = fibonacci[fibonacci.length - 2]
        fibonacci.push(lastTerm + secondLastTerm)
        n -= 1
      return fibonacci
  primeFactorization: (n) ->
    # Return the prime factors of n as an array
    factors = []
    f = 2
    while f * f <= n
      while n % f is 0
        factors.push(f)
        n = Math.floor(n / f)
      f += 1
    if n > 1
      factors.push(n)
    factors
  uniquePrimeFactorization: (n) ->
    upf = new Set(@primeFactorization(n))
    upf.values()

module.exports = helpers
