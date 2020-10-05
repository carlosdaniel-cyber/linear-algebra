# Gaussian Elimination

scaleRow = function(A, Row, m) {
  A[Row,] =A[Row,] * m
  return(A)
}

swapRow = function(A, Row1, Row2) {
  Row.temp = A[Row1,]
  A[Row1,] = A[Row2,]
  A[Row2,] = Row.temp
  return(A)
}

replaceRow = function(A, Row1, Row2, m) {
  A[Row2,] = A[Row2] + A[Row1,] * m
  return(A)
}

reductedMatrix = function(A) {
  count.Row = nrow(A)
  count.column = ncol(A)
  pivot = 1
  
  for (Row.current in 1:count.Row) {
    if (pivot <= count.column) {
      i = Row.current
      
      while (A[i, pivot] == 0 && i < count.Row) {
        i = i + 1
        if (i > count.Row) {
          i = Row.current
          pivot = pivot + 1
          if (pivot > count.column)
            return(A)
        }
      }
      
      if (i != Row.current)
          A = swapRow(A, i, Row.current)
      
      element.pivot = A[Row.current, pivot]
      A = scaleRow(A, Row.current, 1/element.pivot)
      
      for (j in 1:count.Row) {
        if (j != Row.current) {
          m = A[j, pivot] / A[Row.current, pivot]
          A = replaceRow(A, Row.current, j, -m)
        }
      }
      
      pivot = pivot + 1
    }
  }
  return(A)
}

solveMatrix = function(A, b) {
  Abarra = cbind(A, b)
  Abarra = reductedMatrix(Abarra)
  xsol = Abarra[, ncol(Abarra)]
  return(xsol)
}