#### Preamble ####
# Purpose: Models of the data to generate inferential statistics.
# Author: Ben li
# Data: 15 April 2024
# Contact: dailin.li@mail.utoronto.ca
# License: MIT
# Pre-requisites: get election_df.csv data.
# Any other information needed? None.
# Load necessary libraries
# Install caret package
install.packages("caret")

# Install e1071 package
install.packages("e1071")

library(tidyverse)  # For data manipulation
library(caret)      # For data preprocessing and modeling
library(e1071)      # For using the naive Bayes classifier

# Load data
data <- read.csv("outputs/data/cleaned_election_data.csv", stringsAsFactors = FALSE)

# Convert 'Presidential_Vote' to a binary outcome for Biden (1) vs Not Biden (0)
data$Biden_Vote <- as.integer(data$Presidential_Vote == "Joe Biden")

# Factorize categorical variables
data$Marital_Status <- as.factor(data$Marital_Status)
data$Household_Income <- as.factor(data$Household_Income)
data$Education_Level <- as.factor(data$Education_Level)
data$Age <- as.factor(data$Age)
data$Sex <- as.factor(data$Sex)

# Split data into training and test sets
set.seed(42)
trainIndex <- createDataPartition(data$Biden_Vote, p = 0.7, list = FALSE, times = 1)
train <- data[trainIndex, ]
test <- data[-trainIndex, ]

# Train a logistic regression model
model <- glm(Biden_Vote ~ Marital_Status + Household_Income + Education_Level + Age + Sex, data = train, family = "binomial")

# Predict on the test set
predictions <- predict(model, test, type = "response")
predictions_class <- ifelse(predictions > 0.5, 1, 0)

# Evaluate the model
confusionMatrix <- table(Predicted = predictions_class, Actual = test$Biden_Vote)
accuracy <- sum(diag(confusionMatrix)) / sum(confusionMatrix)
precision <- confusionMatrix[2, 2] / sum(confusionMatrix[2, ])
recall <- confusionMatrix[2, 2] / sum(confusionMatrix[, 2])
f1_score <- 2 * precision * recall / (precision + recall)

# Print results
print(paste("Accuracy:", accuracy))
print(paste("Precision:", precision))
print(paste("Recall:", recall))
print(paste("F1 Score:", f1_score))
print(confusionMatrix)

#### Save model ####
saveRDS(
  model,
  file = "outputs/models/election_model.rds"
)