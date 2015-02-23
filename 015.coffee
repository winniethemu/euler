lattice = []

# Initialize
lattice.push(
  [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
)
for i in [1..20]
  lattice.push(
    [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
  )

for i in [1..20]
  for j in [1..20]
    lattice[i][j] = lattice[i-1][j] + lattice[i][j-1]

console.log lattice[20][20]
