#### Preamble ####
# Purpose: Simulates the desired data.
# Author: Ben Li
# Data: 1 April 2024
# Contact: Dailin.li@mail.utoronto.ca
# License: MIT




# Load the necessary library
library(dplyr)

# Set seed for reproducibility
set.seed(230604)

# Number of samples
n_samples <- 1000

# Simulate categorical variables
voting_status <- sample(c("0. Did not vote", "1. Voted"), n_samples, replace = TRUE, prob = c(0.1, 0.9))
candidate_choice <- sample(c("1. Joe Biden", "2. Donald Trump", "3. Jo Jorgensen", "9. NA"), n_samples, replace = TRUE, prob = c(0.5, 0.45, 0.03, 0.02))
party_strength <- sample(c("7. Strong Republican", "6. Not very strong Republican", "4. Independent", "3. Independent-Democrat", "9. NA"), n_samples, replace = TRUE, prob = c(0.2, 0.2, 0.3, 0.2, 0.1))
income_range <- sample(c("7. $125,000 or more", "6. $100,000 to $124,999", "5. $75,000 to $99,999", "4. $50,000 to $74,999", "3. $35,000 to $49,999", "2. $20,000 to $34,999", "1. Less than $20,000"), n_samples, replace = TRUE, prob = c(0.15, 0.15, 0.15, 0.15, 0.15, 0.15, 0.1))
education_level <- sample(c("4. Bachelor's degree", "3. Some post-high school", "2. High school graduate", "1. Less than high school", "9. NA"), n_samples, replace = TRUE, prob = c(0.3, 0.25, 0.25, 0.15, 0.05))
age_group <- sample(c("4. 51 through 75", "3. 50", "2. 25 through 49", "1. 0 through 24"), n_samples, replace = TRUE, prob = c(0.25, 0.25, 0.25, 0.25))

# Combine into a data frame
simulated_data <- data.frame(
  Voting_Status = voting_status,
  Candidate_Choice = candidate_choice,
  Party_Strength = party_strength,
  Income_Range = income_range,
  Education_Level = education_level,
  Age_Group = age_group
)

# Print the first few rows of the simulated dataset
head(simulated_data)

# Assuming 'data' is your dataset
write.csv(simulated_data, "inputs/data/simulated_election.csv", row.names = FALSE)

