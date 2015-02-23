# 1-12: one two three four five six seven eight nine ten eleven twelve
# 13-19: thirteen fourteen fifteen sixteen seventeen eighteen nineteen
# 10x: twenty thirty forty fifty sixty seventy eighty ninety
# 100: one hundred
# 100+: one hundred and
# 1000: one thousand

dict =
  base: ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
  teens: ["ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"]
  tens: ["twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"]

total = 0

oneToNinetyNine = (prefix) ->
  count = 0
  count += dict.base.join("").length # 1 - 9
  count += dict.teens.join("").length # 10 - 19
  if prefix
    count += "#{prefix}and".length * dict.base.length
    count += "#{prefix}and".length * dict.teens.length
  # 20+, 30+, ..., 90+
  for word in dict.tens
    count += word.length
    count += "#{prefix}and".length if prefix
    for digit in dict.base
      count += "#{word}#{digit}".length
      count += "#{prefix}and".length if prefix
  count

# < 100
total += oneToNinetyNine()

# 100 - 999
for digit in dict.base
  total += "#{digit}hundred".length
  total += oneToNinetyNine("#{digit}hundred")

# 1000
total += "OneThousand".length

console.log total
