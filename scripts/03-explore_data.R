#### Preamble ####
# Purpose: Explore and understand the dataset by creating data visualizations.
# Author: Ben Li
# Data: 1 April 2024
# Contact: dailin.li@mail.utoronto.ca
# License: MIT
# Pre-requisites: Need to know where to get cleaned_election_data
# Any other information needed? None.

# Load necessary libraries
library(ggplot2)
library(dplyr)
library(tidyverse)
# Load the data
data <- read.csv('outputs/data/cleaned_election_data.csv')

# Remove the 'Presidential_Vote' column
data <- select(data, -Presidential_Vote)

ggplot(data, aes(x = Marital_Status)) + 
  geom_bar(fill = 'steelblue') +
  labs(title = "Distribution of Marital Status", x = "Marital Status", y = "Count") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 65, hjust = 1))

# Create bar plot for 'Voted'
ggplot(data, aes(x = Voted)) +
  geom_bar(fill = 'steelblue') +
  labs(title = 'Distribution of Voting Status', x = 'Voted', y = 'Count') +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Create bar plot for 'Household_Income'
ggplot(data, aes(x = Household_Income)) +
  geom_bar(fill = 'steelblue') +
  labs(title = 'Distribution of Household Income', x = 'Household Income', y = 'Count') +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Create bar plot for 'Education_Level'
ggplot(data, aes(x = Education_Level)) +
  geom_bar(fill = 'steelblue') +
  labs(title = 'Distribution of Education Level', x = 'Education Level', y = 'Count') +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Create bar plot for 'Age' (assuming 'Age' is a categorical variable in your dataset)
ggplot(data, aes(x = Age)) +
  geom_bar(fill = 'steelblue') +
  labs(title = 'Distribution of Age', x = 'Age', y = 'Count') +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Create bar plot for 'Sex'
ggplot(data, aes(x = Sex)) +
  geom_bar(fill = 'steelblue') +
  labs(title = 'Distribution of Sex', x = 'Sex', y = 'Count') +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))



