#### Preamble ####
# Purpose: Cleans the raw dataset
# Author: Dailin Li
# Data: 1 April 2024
# Contact: dailin.li@mail.utoronto.ca
# License: MIT
# Pre-requisites: Must have raw data downloaded.
# Any other information needed? None.

# Load the necessary library
library(dplyr)
library(tidyverse)
# Read the data from CSV
data <- read.csv("inputs/data/election_df.csv", stringsAsFactors = FALSE)

# Define a function to remove the prefix numbers
clean_variable <- function(x) {
  x <- as.character(x)  # Make sure the column is treated as character
  gsub("^[0-9]+\\.\\s+", "", x)  # Remove the number and period prefix
}

# Apply the function to every column in the data
data_cleaned <- data.frame(lapply(data, clean_variable))

# Now select and rename variables (assuming these are the correct column names)
cleaned_data <- data_cleaned %>%
  select(
    Voted = A01,                        # Did you vote in the 2020 general election?
    Presidential_Vote = A02,            # For whom did you vote for President in 2020?
    Marital_Status = R13,               # What is your marital status?
    Household_Income = R12,             # What is your total household income?
    Education_Level = R11,              # What is your level of education?
    Age = R08,                          # What is your age?
    Sex = R09                           # What is your sex?
  ) %>%
  # Remove rows with 'NA' or empty strings after cleaning
  filter(!if_any(c(Voted, Presidential_Vote, Marital_Status, Household_Income, Education_Level, Age, Sex), ~ .x == "NA"))


# View the first few rows of the cleaned data
head(cleaned_data)
write_csv(cleaned_data, "outputs/data/cleaned_election_data.csv")