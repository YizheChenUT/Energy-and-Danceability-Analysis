#### Preamble ####
# Purpose: Tests for the audio features dataset
# Author: Yizhe Chen
# Date: 21 Nov 2024
# Contact: yz.chen@mail.utoronto.ca
# License: MIT
# Pre-requisites: The `tidyverse` and `testthat` packages must be installed and loaded
# Any other information needed? No

#### Workspace setup ####
library(tidyverse)
library(testthat)

# Load the dataset
data <- read_csv("data/audio_features.csv")


#### Test data ####

# Test that the dataset has rows (non-empty dataset)
test_that("dataset is not empty", {
  expect_gt(nrow(data), 0)  # Expect at least one row
})

# Test that the dataset has columns (non-empty structure)
test_that("dataset has columns", {
  expect_gt(ncol(data), 0)  # Expect at least one column
})

# Test that required columns are present
required_columns <- c("energy", "danceability", "tempo", "valence", "loudness")
test_that("dataset contains required columns", {
  expect_true(all(required_columns %in% colnames(data)))
})

# Test that numeric columns have numeric data
numeric_columns <- c("energy", "danceability", "tempo", "valence", "loudness")
test_that("numeric columns contain numeric values", {
  expect_true(all(sapply(data[numeric_columns], is.numeric)))
})

# Test that there are no missing values in the dataset
test_that("no missing values in dataset", {
  expect_true(all(!is.na(data)))
})

# Test that 'energy' is between 0 and 1
test_that("'energy' column values are between 0 and 1", {
  expect_true(all(data$energy >= 0 & data$energy <= 1))
})

# Test that 'danceability' is between 0 and 1
test_that("'danceability' column values are between 0 and 1", {
  expect_true(all(data$danceability >= 0 & data$danceability <= 1))
})

# Test that 'tempo' has reasonable values (e.g., 0-300 BPM)
test_that("'tempo' column values are within a reasonable range", {
  expect_true(all(data$tempo >= 0 & data$tempo <= 300))
})

# Test that 'valence' is between 0 and 1
test_that("'valence' column values are between 0 and 1", {
  expect_true(all(data$valence >= 0 & data$valence <= 1))
})

# Test that 'loudness' is within a reasonable range (e.g., -60 to 0 dB)
test_that("'loudness' column values are within a reasonable range", {
  expect_true(all(data$loudness >= -60 & data$loudness <= 0))
})