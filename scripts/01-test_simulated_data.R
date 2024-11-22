#### Preamble ####
# Purpose:Tests the structure and validity of the simulated audio features dataset
# Author: Yizhe Chen
# Date: 21 Nov 2024
# Contact: yz.chen@mail.utoronto.ca
# License: MIT
# Pre-requisites:
# - The `tidyverse` package must be installed and loaded
# - 00-simulate_data.R must have been run
# Any other information needed? No


#### Workspace setup ####
library(tidyverse)
library(testthat)

# Load the simulated dataset
simulated_data <- read_csv("data/simulated_audio_features.csv")

#### Test data ####
test_that("The dataset is successfully loaded", {
  expect_true(exists("simulated_data"))
})

test_that("The dataset has rows and columns", {
  expect_gt(nrow(simulated_data), 0)  # Check if the dataset has rows
  expect_gt(ncol(simulated_data), 0)  # Check if the dataset has columns
})

test_that("The dataset contains required columns", {
  required_columns <- c("track_name", "energy", "danceability", "tempo", "valence", "loudness", "genre", "popularity", "is_hit")
  expect_true(all(required_columns %in% colnames(simulated_data)))
})

test_that("Track names are unique", {
  expect_equal(length(unique(simulated_data$track_name)), nrow(simulated_data))
})

test_that("Energy values are between 0 and 1", {
  expect_true(all(simulated_data$energy >= 0 & simulated_data$energy <= 1))
})

test_that("Danceability values are between 0 and 1", {
  expect_true(all(simulated_data$danceability >= 0 & simulated_data$danceability <= 1))
})

test_that("Tempo values are within a reasonable range", {
  expect_true(all(simulated_data$tempo >= 60 & simulated_data$tempo <= 200))
})

test_that("Valence values are between 0 and 1", {
  expect_true(all(simulated_data$valence >= 0 & simulated_data$valence <= 1))
})

test_that("Loudness values are within a reasonable range", {
  expect_true(all(simulated_data$loudness >= -60 & simulated_data$loudness <= 0))
})

test_that("Genre column contains valid genres", {
  valid_genres <- c("Pop", "Rock", "Hip-Hop", "Jazz", "Classical", "Electronic", "Country", "Other")
  expect_true(all(simulated_data$genre %in% valid_genres))
})

test_that("Popularity scores are between 1 and 100", {
  expect_true(all(simulated_data$popularity >= 1 & simulated_data$popularity <= 100))
})

test_that("The 'is_hit' column contains only 'Yes' or 'No'", {
  expect_true(all(simulated_data$is_hit %in% c("Yes", "No")))
})

test_that("No missing values in the dataset", {
  expect_true(all(!is.na(simulated_data)))
})

test_that("No empty strings in track_name, genre, or is_hit columns", {
  expect_false(any(simulated_data$track_name == "" | simulated_data$genre == "" | simulated_data$is_hit == ""))
})