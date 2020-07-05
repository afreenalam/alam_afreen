# Afreen Alam
# HW02 Part 1: Intro to Basics

# calculates 30 + 12
30 + 12
# The answer should be 42

### Section 1.2- Arithmetic with R

# Division
121/1.1
# Exponentiation
2^5
# Modulo
28 %% 6
# Answers should be 110, 32 and 4 respectively

# Exponentiation without parentheses
49^1/2
# Exponentiation with parentheses
49^(1/2)
# Answers should be 24.5 and 7 respectively

### Section 1.3- Variable assignment

# Assign the value 42 to x
x <- 42
# Print out the value of the variable x
x
# Answer should be 42

# Assign the value 24 to the variable d_merriami
d_merriami <- 24
# Assign the value 9 to variable d_ordii
d_ordii <- 9
# Check the results
d_merriami
d_ordii
# Results should be 24 under d_merriami and 9 under d_ordii

### Section 1.4- Working with variables

# Correcting the mistake
d_merriami + 5
d_merriami
# The value of variable is unchanged
# Correcting the mistake- reassign value to variable
d_merriami <- d_merriami + 5
d_merriami
# Value should be 29

# Add together the number of individuals of each species.
# Store the result in 'total_k_rats'.
total_k_rats <- d_merriami + d_ordii
# Assign 1000 to a variable called 'area_sampled'
area_sampled <- 1000
# Divide 'total_k_rats' by 'area_sampled' to calculate 'density'.
density <- total_k_rats / area_sampled
# Show the value stored in density
density
# Answer should be 0.038 kangaroo rats per square meter

### Section 1.5- Basic data types in R

# Assign 42 to numeric_var
numeric_var <- 42 
# Assign "Dipodomys merriami" to species_name
species_name <- "Dipodomys merriami"
# Assign TRUE to is_mammal
is_mammal <- TRUE

### Section 1.6- What is data type?

# Check class of numeric_var
class(numeric_var)
# Check class of species_name
class(species_name)
# Check class of is_mammal
class(is_mammal)
# Answer should be "numeric", "character" and "logical" respectively