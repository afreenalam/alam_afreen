# Afreen Alam
# HW08- PART 2: Write Two Functions



### Standard error function

# Write a function called std_err that calculates standard error of the mean
# Standard error = standard deviation / sqrt(sample size)

std_err <- function(values, na.rm = FALSE) {
# Function has 2 arguments, one to accept numeric values and other that can remove NA
    ifelse(na.rm, # Test
         values <- na.omit(values), # If TRUE
         values) # If FALSE
  s <- sd(values) # Calculates standard deviation
  n <- length(values) # Finds sample size
  std_err <- s / sqrt(n) # According to formula above
  return(std_err) # Returns result
}

### Scaled mass index function

# Write a function called scaled_mass

# It calculates the scaled mass index (SMI)

# The index scales the mass of the bird to the
# length of the tarsus (part of the leg) so that
# birds of different sizes can be compared fairly

# The equation to calculate SMI for each individual bird (i) is,
# SMIi=mi×(lo/li)^b

# Lo is the mean tarsus length of all birds in the sample
# Mi and Li are the mass and tarsus length of each individual
# b is the slope estimate of the regression line on
# the log-transformed mass and log-transformed tarsus length


# The function has three arguments
scaled_mass <- function(mass = 0,
                        # Accepts numeric values for mass of birds, default = 0
                        tarsus = 0,
                        # Values for length of tarsus, default = 0
                        slope = 0) {
                        # Default = 0
# According to formula above
  lo <- mean(tarsus)
  mi <- mass
  li <- tarsus
  b <- slope
  scaled_mass <- mi * (lo / li)^b
  return(scaled_mass) # Gives result
}

##### END
