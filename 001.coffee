sum = 8

for i in [6..999]
  sum += i if i % 3 is 0 or i % 5 is 0

console.log sum
