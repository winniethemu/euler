class BigNum
  digits = []

  constructor: (@value) ->
    unless @value
      throw new Error("Invalid amount")
    @digits = @value.split("")

  add: (num) ->
    sum = []
    reversedSelf = @digits.slice().reverse()
    reversedNum = num.digits.slice().reverse()

    # Zero padding
    if reversedSelf.length < reversedNum.length
      for i in [1..reversedNum.length - reversedSelf.length]
        reversedSelf.push('0')
    else
      for i in [1..reversedSelf.length - reversedNum.length]
        reversedNum.push('0')

    # Adding up individual digits
    carry = 0
    for i in [0..reversedSelf.length - 1]
      digitSum = parseInt(reversedSelf[i]) + parseInt(reversedNum[i]) + carry
      if digitSum > 9
        carry = 1
      else
        carry = 0
      sum.push(digitSum % 10)
    sum.push(1) if carry
    new BigNum(sum.reverse().join(""))

  times: (num) ->
    prod = {}
    base10Self = @base10() # e.g. 185 = 1x5 + 10x8 + 100x1
    base10Num = num.base10() # e.g. 61 = 1x1 + 10x6

    # Multiply each digit by the others and sum up the results
    for i of base10Self
      for j of base10Num
        exponent = "1" + i.substring(1) + j.substring(1)
        base = parseInt(base10Self[i]) * parseInt(base10Num[j])
        if prod[exponent]
          prod[exponent] += base
        else
          prod[exponent] = base
    # prod = { 1: 5, 10: 38, 100: 49, 1000: 6 }
    sum = new BigNum("0")
    for k of prod
      partial = prod[k] + k.substring(1)
      sum = sum.add(new BigNum(partial))
    # sum = 1x5 + 10x38 + 100x49 + 1000x6
    sum

  base10: ->
    # "202" -> { '1': '2', '10': '0', '100': '2' }
    obj = {}
    for i in [0..@value.length - 1]
      exponent = "1"
      exponent += "0" for [0..@value.length - 1 - i]
      exponent = exponent.substring(0, exponent.length - 1)
      obj[exponent] = @value.charAt(i)
    obj

module.exports = BigNum
