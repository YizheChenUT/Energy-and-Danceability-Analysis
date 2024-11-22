#### Preamble ####
# Purpose: Cleans the audio features data extracted from Spotify API.
# Author: Yizhe Chen
# Date: 21 Nov 2024
# Contact: yz.chen@mail.utoronto.ca
# License: MIT
# Pre-requisites: Must have downloaded the raw data.
# Any other information needed? No

#### Workspace setup ####
library(tidyverse)
library(janitor)

#### Clean data ####
# Load the raw data
raw_data <- read_csv("data/raw_data.csv")

# Clean the data
cleaned_data <- 
  raw_data |>
  janitor::clean_names() |> # Standardize column names
  # Select relevant columns (adjust based on your dataset)
  select(energy, danceability, tempo, valence, loudness) |>
  # Handle potential incorrect or missing values
  filter(!is.na(energy) & !is.na(danceability)) |> 
  mutate(
    tempo = if_else(tempo < 0 | tempo > 250, NA_real_, tempo), # Correct unreasonable tempo values
    loudness = if_else(loudness > 0, loudness - 60, loudness)  # Adjust loudness if necessary
  ) |>
  tidyr::drop_na() # Drop rows with NA values
  

#### Save data ####
write.csv(cleaned_data, "data/audio_features.csv")

print("Data cleaned and saved as a Parquet file successfully.")
