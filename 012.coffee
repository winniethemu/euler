triangleNumbers = ->
  n = 0
  loop
    n += 1
    yield (1 + n) * n / 2
  return

divisorCount = (n) ->
  count = 0
  for i in [1..Math.sqrt(n)]
    if n % i is 0
      if i isnt Math.sqrt(n)
        count += 2
      else
        count += 1
  count

t = triangleNumbers()
loop
  n = t.next().value
  if divisorCount(n) > 500
    console.log n
    break
