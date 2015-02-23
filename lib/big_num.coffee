class BigNum
  digits = []

  constructor: (@value) ->
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
    new BigNum(sum.reverse().join(""))

module.exports = BigNum
