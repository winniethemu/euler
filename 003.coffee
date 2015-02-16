Helpers = require "./helpers"

upf = Helpers.uniquePrimeFactorization(600851475143)
console.log upf[upf.length - 1]

module.exports = upf
