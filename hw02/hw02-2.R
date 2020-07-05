# Afreen Alam
# HW02 Part 2: Vectors

### Section 2.2- Vector types

alphabet <- c("A", "B", "C", "D", "E", "F")
integers <- c(1, 2, 3, 4, 5, 6)
#Logical vector
logical_vector <- c(FALSE, FALSE, TRUE)
#

### Section 2.3- Biological vectors

# Cultures without pplo contaminant
cultures_without_pplo <- c(4.6, 4.8, 5.1, 5.5, 5.8)
# Cultures with pplo contaminant
cultures_with_pplo <- c(4.6, 4.7, 4.8, 4.9, 4.8)
#

### Section 2.4- Name your vectors

# Create a 'days_sampled' vector.
days_sampled <- c("Day 0", "Day 2", "Day 4", "Day 6","Day 8")
# Name two data vectors with the 'days_sampled' vector.
names(cultures_without_pplo) <- days_sampled
names(cultures_with_pplo) <- days_sampled
# Check that the two data vectors were properly named
cultures_without_pplo
cultures_with_pplo
#

### Section 2.5- Calculations with vectors

# Find the maximum value in cultures_without_pplo and cultures_without_pplo
max(cultures_without_pplo)
max(cultures_with_pplo)
# Answer comes out to be 5.8 and 4.9 respectively.
# Note that the above functions could be directly substituted in place of the corresponding values but functions are run and values are found since instructions explicitly state to 'find the value'.
# Store in max_without_pplo and max_with_pplo, respectively.
max_without_pplo <- 5.8
max_with_pplo <- 4.9
# Find the minimum value in cultures_without_pplo and cultures_without_pplo
min(cultures_without_pplo)
min(cultures_with_pplo)
# Answer comes out to be 4.6 and 4.6 respectively
# Note that the above functions could be directly substituted in place of the corresponding values but functions are run and values are found since instructions explicitly state to 'find the value'.
# Store in min_without_pplo and min_with_pplo, respectively.
min_without_pplo <- 4.6
min_with_pplo <- 4.6
# Use 10^ to calculate the actual number of cells for each culture.
10^(cultures_without_pplo)
10^(cultures_with_pplo)
# Store in cell_counts_without_pplo and cell_counts_with_pplo
cell_counts_without_pplo <- 10^(cultures_without_pplo)
cell_counts_with_pplo <- 10^(cultures_with_pplo)
# Calculate the average number of cells counts for each vector.
mean(cell_counts_without_pplo)
mean(cell_counts_with_pplo)
# Results are 235196.8 and 59110.75 respectively.

### Section 2.6- Extract individual elements from a vector

# Select the third element from cultures_without_pplo by position number
cultures_without_pplo[3]
# Select the odd numbered elements of cell_counts_with_pplo using a vector of position numbers.
position_vector <- c(1, 3, 5)
cell_counts_with_pplo[position_vector]
# Select the elements for 'Day 2' and 'Day 4' by name from cultures_with_pplo
cultures_with_pplo[c("Day 2", "Day 4")]
#

### Section 2.7- Extraction by logical comparison

# Use cell_counts_without_pplo to create a logical vector for cell counts greater than 100,000 (do not use the comma in your code; use 100000).
logical_vector <- cell_counts_without_pplo > 100000
# Use that vector to show the days and log values from 'cultures_without_pplo'
cultures_without_pplo[logical_vector]
# Use cell_counts_with_pplo and '&' to create a logical vector for cells counts greater than 50,000 and less than 75,000.
rangelogical_vector <- cell_counts_with_pplo > 50000 & cell_counts_with_pplo < 75000
#Use that logical vector to show the days and log values from cultures_with_pplo.
cultures_with_pplo[rangelogical_vector]
#
