answer = 0

for i in [1..99]
  for j in [(i + 1)..100]
    answer += 2 * i * j

console.log answer
