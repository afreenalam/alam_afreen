# Afreen Alam
# HW02 Part 4: Factors

### 4.1 What is a factor?

# Make a character vector called `bee_visitors_vector`
bee_visitors_vector <- c("kirbiellus", "kirbiellus",  "flavifrons",  "kirbiellus", "bifarius", "flavifrons", "kirbiellus")

# Make a `bee_visitors_factor` factor from `bee_visitors_vector`. 
bee_visitors_factor <- factor(bee_visitors_vector)

# Print out bee_visitors_factor
bee_visitors_factor

#

### 4.2 Factor types

# Create `proboscis_vector` with seven elements
proboscis_vector <- c("Long", "Long",  "Intermediate",  "Long", "Short", "Intermediate", "Long")

# Create an ordered `proboscis_factor` ordered from long to short.
proboscis_factor <- factor(proboscis_vector, ordered = TRUE, levels = c("Long", "Intermediate", "Short"))

# Display the contents of `proboscis_factor
proboscis_factor

#

### 4.3 Summarizing a factor

# Summarize bee_visitors_factor
summary(bee_visitors_factor)

# Summarize proboscis_factor
summary(proboscis_factor)

#

### 4.4 Extracting from and comparing factors

# Extract from `bee_visitors_factor` the elements that are *not* kirbiellus
bee_not_kirbiellus <- bee_visitors_factor != "kirbiellus"
bee_visitors_factor[bee_not_kirbiellus]

# Extract from `bee_visitors_factor` the second, and fourth through sixth elements. Use the colon for the range.
bee_visitors_factor[c(2,4:6)]

# Test whether the first element of `proboscis_factor` is longer than the last element of `proboscis_factor`
proboscis_factor[1] < proboscis_factor[7]

# CHALLENGE
proboscis_factor[1] < proboscis_factor[length(proboscis_factor)]

#