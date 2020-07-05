# Afreen Alam
# HW02 Part 3: Matrices

### Section 3.1- What’s a matrix?

# Construct a matrix with 4 rows containing the numbers 11 to 30, filled row-wise.
first_matrix <- matrix(11:30, byrow = TRUE ,nrow = 4)
# Construct a matrix with 5 columns containing the numbers 11 to 30, filled column-wise. 
second_matrix <- matrix(ncol = 5, 11:30)
#

### Section 3.2- Construct a matrix

# Create a vector with the weight data from the data set
chick_weights <- chickwts$weight[c(1:20, 23:32)]
# Create a column-wise matrix called 'three_diets' with three columns and 10 rows from the 'chick_weights' vector.
three_diets <- matrix(data = chick_weights, nrow = 10)
# Display the results stored in the three_diets matrix.
three_diets
#

### Section 3.3- Name the columns and rows

# Use 'colnames()' to name the columns `horsebean`, `linseed`, and `soybean`.
colnames(three_diets) <- c( "horsebean", "linseed", "soybean")
# Use `rownames()` to name the rows with the pattern `Replicate #` Use the `paste()` function for efficiency.
rownames(three_diets) <- paste("Replicate", 1:10)
#

### Section 3.4- Calculations on matrices

# Store the the average chick weight for each diet type in `mean_weights`
mean_weights <- colMeans(three_diets)
# Print the values in mean_weights
mean_weights
# Calculate the mean weight of all 30 chicks in the matrix (2 ways)
mean(three_diets)
mean(mean_weights)
# Mean comes out to be 212.8667

### Section 3.5- Add a column with another diet type

# Use `chickwts$weight[60:69]` to access the first 10 chicks raised on casein diet.
casein <- chickwts$weight[60:69]
# Use `cbind()` to add this new column of data to your `weights` matrix. Save as `four_diets`
four_diets <- cbind(three_diets, casein)
# Calculate the mean weights of chicks for each diet type.
colMeans(four_diets)
#

### Section 3.6- Selecting matrix elements

# Select the entire linseed column by column number.
four_diets[,2]
# Select the entire soybean column by name.
four_diets[,"soybean"]
# Select the entire ninth row by row number.
four_diets[9,]
# Select the entire third row by row name.
four_diets["Replicate 3",]
# Select the fifth replicate from the horsebean column with any method.
four_diets[5,1]
#

### Section 3.7- A little arithmetic with matrices

# Convert grams to ounces
four_diets * 0.035
# Apply the log() function.
log(four_diets)
# Apply the dim() function.
dim(four_diets)
# Apply the length() function.
length(four_diets)
#