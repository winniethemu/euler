max = 0
array = []

collatz = (n) ->
  if n is 1
    return 0
  if n % 2 is 0
    return 1 + collatz(n / 2)
  else
    return 1 + collatz(3 * n + 1)

for i in [2..1000000]
  chain = collatz(i)
  if chain > max
    max = chain
    array.push(i)

console.log array[array.length - 1]
