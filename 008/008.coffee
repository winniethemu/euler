fs = require "fs"

data = fs.readFileSync("input.txt").toString()
max = 0

for i in [0..data.length - 13]
  digits = data.substring(i, i + 13).split("")
  prod = digits.reduce (d, prod) -> parseInt(d) * prod
  max = prod if prod > max

console.log max
