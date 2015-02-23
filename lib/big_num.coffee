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
    false

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
