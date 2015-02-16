fibonacci = [1, 2]
sum = 2

while true
  lastTerm = fibonacci[fibonacci.length - 1]
  secLastTerm = fibonacci[fibonacci.length - 2]
  nextFibonacci = lastTerm + secLastTerm
  if nextFibonacci > 4000000
    console.log sum
    break
  else
    fibonacci.push(nextFibonacci)
    sum += nextFibonacci if nextFibonacci % 2 is 0
