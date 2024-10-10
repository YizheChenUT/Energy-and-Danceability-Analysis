# Energy and Danceability Analysis of Taylor Swift's '1989' Album

## Overview

In this analysis, we examine the relationship between energy and danceability for the songs on Taylor Swift's '1989' album using data obtained via the *Spotify API*. We extract song-level audio features and explore how these characteristics vary across tracks. A linear regression analysis is conducted to identify trends, showing a slight negative relationship between energy and danceability for these songs. The findings suggest that higher-energy tracks tend to be less danceable within this album.


## File Structure

The repo is structured as:

-   `data` contains the data as obtained from *Spotify API*.
-   `paper` contains the files used to generate the paper, including the Quarto document and reference bibliography file, as well as the PDF of the paper. 
-   `scripts` contains the R scripts used to download and address data.


## How to Run
1. Run `scripts/r_code.R` to download and address data
2. Run `paper/paper.qmd` to generate the PDF of the paper