#### Preamble ####
# Purpose: Download and save Data from Spotify
# Author: Yizhe Chen
# Date: 10 OCT 2024
# Contact: yz.chen@mail.utoronto.ca
# License: MIT
# Pre-requisites: N/A
# Any other information needed? No


# Load spotifyr package
library(spotifyr)

# Set API
Sys.setenv(SPOTIFY_CLIENT_ID = '') # Client ID and secret are removed
Sys.setenv(SPOTIFY_CLIENT_SECRET = '') # Client ID and secret are removed

# Get a Spotify access token
access_token <- get_spotify_access_token()

# Search Taylor Swift
artist <- search_spotify('Taylor Swift', type = 'artist')

# Get Taylor Swift ID
artist_id <- artist$id[1]

# Get album information
albums <- get_artist_albums(artist_id)

# Get all the song information from the fourth album
album_id <- albums$id[4]
tracks <- get_album_tracks(album_id)

# Get audio features 
track_ids <- tracks$id
audio_features <- get_track_audio_features(track_ids)

# Save as CSV 
write.csv(audio_features, "data/raw_data.csv", row.names = FALSE)