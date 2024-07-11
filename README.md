The following repository contains the code used to answer research questions towards a data driven marketing strategy for Fantasy Records's newly signed band, LSDunes.
The project is broken down into two major sections: Using data from Spotify and geniuslyrics.com to identify key features of a song toward fan engagement, and using data from
Twitter to identify a potential fanbase and describe its demographics such as gender and age. 

Both sections started from scratch. They utilize web scraping methods and Pandas to create and analyze datasets from the respected API's. The Spotify dataset was created by
finding the "suggested artists" for My Chemical Romance, Coheed and Cambria, Circa Survive, and Thursday (each band the members of LSDunes come from), then adding another layer
and finding the suggested artists to each of those bands that were found. The top ten songs from each of those bands was pulled and added to the dataset. Spotify's API offers
statistics such as "danceability", "valence", and "popularity" for songs. Each statistic was pulled and added as a feature in the dataset. Then the geniuslyrics API was used to
find, pull, and attach the lyrics to each song to the dataset. In the code you'll see in the lyrical analysis script a dive into the lyrics and creating statistics such as
"lexical diversity" which were used to determine the impact a song's lyrical components have towards how popular it gets.

The Twitter demographics section uses the Twitter API to find the potential fanbase for the band. It was reasonable to assume that fans of the bands that the members came from
would be considered part of the targeted audience and would likely be interested in the new band. Thus, the script starts by finding the screen names of every Twitter follower
of each band. The result was over 1.4 million screen names. Then, the account descriptions were extracted and stored to search for key words to indicate demographic information
for the followers. For example, looking for key words like "him" or "her" to indicate if the follower is male or female, and looking for city or state names that indicate where
the followers live. These results were visualized using MatPlotLib and sent to Tableau to create a heat map of where the band's interest is highest.

This project was done under the supervision of Margi Cheske, CEO of Fantasy Records. It was my final project in my Masters of Science in Business Analytics program at 
The University of Montana in the Spring of 2022. Thank you for your interest!

-Jack
