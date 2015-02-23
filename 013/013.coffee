fs = require "fs"
BigNum = require "../lib/big_num"

fs.readFile "input.txt", (err, buffer) ->
  if err
    throw err
  bufferString = buffer.toString()
  data = bufferString.split("\n")

  sum = new BigNum("0")
  for num in data
    bignum = new BigNum(num)
    sum = sum.add(bignum)
  console.log sum.value.substring(0, 10)
