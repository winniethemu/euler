maxlen = 0
result = 0

for d in [2..999]
  cycle = {}
  n = 1
  while (10 * n) % d isnt 0
    remainder = (10 * n) % d
    if cycle[remainder]
      len = Object.keys(cycle).length
      result = d if len > maxlen
      maxlen = Math.max(len, maxlen)
      break
    cycle[remainder] = true
    n = remainder

console.log result
