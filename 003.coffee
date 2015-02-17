Helpers = require "./helpers"

pf = Helpers.primeFactorization(600851475143)
factors = Object.keys(pf)
answer = factors[factors.length - 1]
console.log answer

module.exports = answer
