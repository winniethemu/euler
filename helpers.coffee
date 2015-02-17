PrimitiveSet = require "./lib/primitive_set"

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
  isPrime: (n) ->
    return true if n is 2 or n is 3
    for i in [2..Math.floor(Math.sqrt(n))]
      return false if n % i is 0
    true
  leastCommonMultiple: (values...) ->
    lcm = 1
    pfs = {} # All factorizations
    factors = []
    for value in values
      pfs[value] = @primeFactorization(value)
      factors = factors.concat(Object.keys(pfs[value]))
    uniqueFactors = new PrimitiveSet(factors)
    for factor in uniqueFactors.values()
      max = 1
      for k, v of pfs
        max = v[factor] if v[factor] and v[factor] > max
      lcm *= Math.pow(factor, max)
    lcm
  primeFactorization: (n) ->
    result = {}
    f = 2
    while f * f <= n
      while n % f is 0
        if result.hasOwnProperty(f)
          result[f] += 1
        else
          result[f] = 1
        n = Math.floor(n / f)
      f += 1
    if n > 1
      if result.hasOwnProperty(n)
        result[n] += 1
      else
        result[n] = 1
    result
  primes: ->
    n = 1
    loop
      n += 1
      yield n if @isPrime(n)
    return

module.exports = helpers
