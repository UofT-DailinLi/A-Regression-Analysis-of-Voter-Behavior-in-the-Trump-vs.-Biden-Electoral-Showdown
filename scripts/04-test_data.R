#### Preamble ####
# Purpose: Test simulated data.
# Author: Ben li
# Data: 4 April 2024
# Contact: dailin.li@mail.utoronto.ca
# License: MIT
# Pre-requisites: Create simulated data.
# Any other information needed? None.

#### Workspace setup ####
library(tidyverse)
data <- read.csv("inputs/data/simulated_election.csv", stringsAsFactors = FALSE)
#### Test data ####
# test 1
data$Voting_Status |>
  class() == "character"

# test 2
data$Education_Level |>
  class() == "character"

# test 3
data$Income_Range |>
  class() == "character"

# test 4
data$Age_Group|>
  class() == "character"

