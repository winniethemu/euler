BigNum = require "./lib/big_num"

prod = new BigNum("1")
two = new BigNum("2")
sum = 0

prod = prod.times(two) for [1..1000]

for i in [0..prod.value.length - 1]
  sum += parseInt(prod.value.charAt(i))

console.log sum
