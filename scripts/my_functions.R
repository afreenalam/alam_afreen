# Afreen Alam
# HW08- PART 2: Write Two Functions



### Standard error function

# Write a function called std_err that calculates standard error of the mean. 

# Standard error = standard deviation / sqrt(sample size)

std_err <- function(values, na.rm = FALSE) { 
  # has 2 arguments, one to accept numeric values and other tells whether to remove NA
    ifelse(na.rm, # test
         values <- na.omit(values), # if TRUE
         values) # if FALSE
  s <- sd(values) # calculates standard deviation 
  n <- length(values) # finds sample size
  std_err <- s / sqrt(n) # according to formula above
  return(std_err) # returns result
}

### Scaled mass index function

# Write a function called scaled_mass
# It calculates the scaled mass index (SMI)
# The index scales the mass of the bird to the length 
# of the tarsus (part of the leg) so that birds of different sizes can be compared fairly

# The equation to calculate SMI for each individual bird (i) is,
# SMIi=Mi×(Lo/Li)^b

# Lo is the mean tarsus length of all birds in the sample
# Mi and Li are the mass and tarsus length of each individual
# b is the slope estimate of the regression line on the log-transformed mass and log-transformed tarsus length


# The function has three arguments
scaled_mass <- function(mass = 0, # accepts numeric values for mass of birds, default = 0
                        tarsus = 0, # accepts numeric values for length of tarsus, default = 0
                        slope = 0) { # Default = 0  
# According to formula above
  Lo <- mean(tarsus)
  Mi <- mass
  Li <- tarsus
  b <- slope
  scaled_mass <- Mi * (Lo / Li)^b
  return(scaled_mass) # Gives result
}

##### END
