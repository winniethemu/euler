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

module.exports = helpers
