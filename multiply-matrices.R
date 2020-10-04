# multiply two matrices

A = matrix(1:36, 4, 9)
B = matrix(4:39, 9)
C = matrix( , dim(A)[1], dim(B)[2])

for (i in 1:dim(A)[1]) {
  for (j in 1:dim(B)[2]) {
    C[i, j] = sum(A[i,] * B[,j])
  }
}

print(C)