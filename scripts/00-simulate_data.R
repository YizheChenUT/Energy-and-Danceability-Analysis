#### Preamble ####
# Purpose: Simulates a dataset of audio features with random data
# Author: Yizhe Chen
# Date: 21 Nov 2024
# Contact: Yizhe Chen
# License: MIT
# Pre-requisites: The `tidyverse` package must be installed
# Any other information needed? No


#### Workspace setup ####
library(tidyverse)
set.seed(1234)


#### Simulate data ####
# Define categories and ranges for simulation
genres <- c("Pop", "Rock", "Hip-Hop", "Jazz", "Classical", "Electronic", "Country", "Other")
n_tracks <- 200  # Number of tracks to simulate

# Generate simulated data
simulated_data <- tibble(
  track_name = paste("Track", 1:n_tracks),  # Generate track names
  energy = runif(n_tracks, 0, 1),  # Random energy levels (0 to 1)
  danceability = runif(n_tracks, 0, 1),  # Random danceability levels (0 to 1)
  tempo = runif(n_tracks, 60, 200),  # Random tempo values (BPM)
  valence = runif(n_tracks, 0, 1),  # Random valence values (0 to 1)
  loudness = runif(n_tracks, -60, 0),  # Random loudness values (-60 to 0 dB)
  genre = sample(
    genres,
    size = n_tracks,
    replace = TRUE,
    prob = c(0.3, 0.2, 0.15, 0.1, 0.1, 0.05, 0.05, 0.05)  # Genre distribution
  ),
  popularity = sample(1:100, size = n_tracks, replace = TRUE),  # Random popularity (1 to 100)
  is_hit = if_else(popularity > 80, "Yes", "No")  # Binary "hit" column
)


#### Save data ####
write_csv(simulated_data, "data/simulated_audio_features.csv")
