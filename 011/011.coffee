fs = require "fs"

fs.readFile "input.txt", (err, buffer) ->
  if err
    throw err
  bufferString = buffer.toString()
  data = bufferString.split("\n")
  data.pop() # Since there was a "\n" on the last line

  grid = []
  for line in data
    grid.push(line.split(" "))

  max = 1
  i = 0

  # ** = Current position
  #
  # .. .. .. ** x1 x2 x3
  # .. .. d4 y1 d1 .. ..
  # .. d5 .. y2 .. d2 ..
  # d6 .. .. y3 .. .. d3
  while i < 20
    j = 0
    while j < 20
      x1 = grid[i][j + 1]
      x2 = grid[i][j + 2]
      x3 = grid[i][j + 3]
      y1 = grid[i + 1][j] if grid[i + 1]
      y2 = grid[i + 2][j] if grid[i + 2]
      y3 = grid[i + 3][j] if grid[i + 3]
      d1 = grid[i + 1][j + 1] if grid[i + 1]
      d2 = grid[i + 2][j + 2] if grid[i + 2]
      d3 = grid[i + 3][j + 3] if grid[i + 3]
      d4 = grid[i + 1][j - 1] if grid[i + 1]
      d5 = grid[i + 2][j - 2] if grid[i + 2]
      d6 = grid[i + 3][j - 3] if grid[i + 3]
      prodHorizontal = (grid[i][j] * x1 * x2 * x3) or 0
      prodVertical = (grid[i][j] * y1 * y2 * y3) or 0
      prodRightDiagonal = (grid[i][j] * d1 * d2 * d3) or 0
      prodLeftDiagonal = (grid[i][j] * d4 * d5 * d6) or 0
      max = Math.max(prodHorizontal, prodVertical, prodRightDiagonal,
                     prodLeftDiagonal, max)
      j += 1
    i += 1
  console.log max
