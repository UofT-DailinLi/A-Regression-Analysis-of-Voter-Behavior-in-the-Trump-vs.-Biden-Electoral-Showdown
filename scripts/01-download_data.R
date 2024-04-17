#### Preamble ####
# Purpose: Downloads and saves the data from Wordbank (an open database of children's vocabulary development)
# Author: Ben Li
# Data: 1 April 2024
# Contact: dailin.li@mail.utoronto.ca
# License: MIT



#### Workspace setup ####
library(tidyverse)


#### Download data ####
# read in the datasets

# full child by word (in American Sign Language) raw data
election <- 
  read_csv(
    file = "https://www.icpsr.umich.edu/web/ICPSR/studies/38313/summary#")


#### Save data ####
write_csv(election, "inputs/data/election_df.csv") 
