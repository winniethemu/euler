max = 0

isPalindrome = (s) ->
  s is s.split("").reverse().join("")

for a in [999..100]
  for b in [999..100]
    prod = a * b
    if isPalindrome(prod.toString()) and prod > max
      max = prod

console.log max
