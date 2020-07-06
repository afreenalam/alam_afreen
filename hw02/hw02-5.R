# Afreen Alam
# HW02 Part 5: Data frames

### 5.2 Viewing data frames

# Use `data()` to load the `iris` data frame.
data(iris)

# Enter `iris` on a line by itself to display the full data frame.
iris

# Display the first 10 rows of the data frame.
head(iris, n = 10)

# Display the last rows of the data frame, 
tail(iris)

# Display the dimensions using the least amount of code (9 characters).
dim(iris)

# Display the structure of the data frame.
str(iris)

#

### 5.3 Extracting elements from a data frame

# Display the 101st row of the `Petal.Length` column, using column numbers.
iris[101, 3]

# Display the first six rows of all columns (mimic head ())
iris[1:6,]

# Display rows 48-52 of the second column, using the column header name in square brackets.
iris[48:52, "Sepal.Width"]
## Note that under instructions it states second column but comments written under it states fourth column. 

# Display the contents of the `Sepal.Width` column using the `$`
iris$Sepal.Width

# Optional challenge
iris$Species[c(50,51)]

#

### 5.4 Extracting elements with boolean vectors

# Extract rows where sepal length less than or equal to 5.5. Save the result.
short_sepallengthvector <- iris$Sepal.Length <= 5.5
short_sepallength_rows <- iris[short_sepallengthvector,]
## Note that short_sepallengthvector is a logical vector whereas the extracted data is short_sepallength_rows.

# Apply the `min()` and `max()` functions to your result from above.
min(short_sepallength_rows$Sepal.Length)
max(short_sepallength_rows$Sepal.Length)

# Display rows where sepal width is less than 3.2 AND species is setosa.
thin_setosa <- iris$Sepal.Width < 3.2 & iris$Species == "setosa"
iris[thin_setosa,]

# Display rows where sepal width is less than 2.5 OR petal width is greater than 2.0.
thinsepal_thickpetal <- iris$Sepal.Width < 2.5 | iris$Petal.Width > 2
iris[thinsepal_thickpetal,]

#

### 5.5 Use subset to extract data from a data frame

# Display rows for petal length between and including 4.0 and 5.0.
subset(iris, Petal.Length <= 5.0 & Petal.Length >= 4.0)

# Display rows for sepal length < 5.2 and species is versicolor.
subset(iris, Sepal.Length < 5.2 & Species == "versicolor" )

#

### 5.6 Sort

# Order the data frame from shortest to longest sepal length.
increasing_sepal_length <- order(iris$Sepal.Length)
iris[increasing_sepal_length,]

# Display the species and petal width columns in decreasing order of petal width.
decreasing_petal_width <- order(iris$Petal.Width, decreasing = TRUE)
decreasing_iris_data <- iris[decreasing_petal_width,]
decreasing_iris_data[,c("Species", "Petal.Width")]

#