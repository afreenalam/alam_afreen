average <- function(args) {
  total <- sum(args)
  avg <- total/length(args)
  return(avg)
}

average(c(5, 11, 19))
average(iris$Sepal.Length)
mean(iris$Sepal.Length)

average(c(5, 11, NA, 19))

average <- function(values, na.rm = FALSE)  {
  ifelse(na.rm,
         values <- na.omit(values),
         values)
  total <- sum(values)
  avg <- total/length(values)
  return(avg)
}
