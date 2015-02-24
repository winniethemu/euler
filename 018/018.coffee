fs = require "fs"

fs.readFile "input.txt", (err, buffer) ->
  if err
    throw err
  bufferString = buffer.toString()
  data = bufferString.split("\n")
  data.pop()
  data = data.map (line) ->
    line.split(" ")

  # DFS for finding maximum path sum
  max = 0
  findPath = (i, j, sum) ->
    if i is data.length - 1
      max = Math.max(max, sum)
      return
    findPath(i + 1, j, sum + parseInt(data[i + 1][j]))
    findPath(i + 1, j + 1, sum + parseInt(data[i + 1][j + 1]))
  findPath(0, 0, 75)

  console.log max
