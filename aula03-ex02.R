# program to solve a equation system
library('matlib')
library('limSolve')

row1 = c(-3, 2, 0)
row2 = c(0, 3, 5)
row3 = c(6, 0, 2)

A = rbind(row1, row2, row3)
b = c(4, 0, 2)

showEqn(A, b)
Solve(A, b)
plotEqn3d(A, b)