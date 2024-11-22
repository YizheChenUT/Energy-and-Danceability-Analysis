# Energy and Danceability Analysis of Taylor Swift's '1989' Album

## Overview

In this analysis, we examine the relationship between energy and danceability for the songs on Taylor Swift's '1989' album using data obtained via the *Spotify API*. We extract song-level audio features and explore how these characteristics vary across tracks. A linear regression analysis is conducted to identify trends, showing a slight negative relationship between energy and danceability for these songs. The findings suggest that higher-energy tracks tend to be less danceable within this album.


## File Structure

The repo is structured as:

-   `data` contains the data as obtained from *Spotify API*, cleaned data and simulated data.
-   `other` contains details about LLM chat interactions and sketches.
-   `paper` contains the files used to generate the paper, including the Quarto document and reference bibliography file, as well as the PDF of the paper. 
-   `scripts` contains the R scripts used to download, address, simulate and test data.

## Statement on LLM usage

Aspects of the code were written with the help of ChatGPT. Some parts of paper were written with the help of ChatGPT and the entire chat history is available in `other/llm_usage/usage.txt`.
