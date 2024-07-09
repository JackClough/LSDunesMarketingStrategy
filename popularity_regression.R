library(tidyverse)
library(broom)

d <- read_csv("songs_transformed.csv") %>% 
  janitor::clean_names() %>% 
  select(-x1,-lyrics,-top_10_words,-genres)

d <- d %>% 
  mutate(top_genre = fct_reorder(top_genre,popularity,mean),
         key = as_factor(key))

skimr::skim(d)

# let's rescale everything numeric to 0-100
rescale <- function(x){
  min.x <- min(x)
  max.x <- max(x)
  
  x <- (x - min.x)/(max.x - min.x) * 100
  
  return(x)
}

d <- d %>% 
  mutate(
    danceability = rescale(danceability),
    loudness = rescale(loudness),
    energy = rescale(energy),
    valence = rescale(valence),
    tempo = rescale(tempo),
    lexical_diversity = rescale(lexical_diversity)
  )

skimr::skim(d)

popularity_lm <- lm(popularity ~ top_genre + 
                      danceability + 
                      energy +
                      valence + 
                      tempo + 
                      duration_minutes + 
                      lexical_diversity + 
                      total_words + 
                      I(duration_minutes^2),
                    data = d)

tidy(popularity_lm)

anova(popularity_lm)

# here's an example of creating a new data.frame and doing some visualizations

nd <- expand_grid(
  top_genre = c("brooklyn indie","modern rock","pop punk","alternative metal","emo"),
  danceability = 50,
  energy = 50,
  valence = 50,
  tempo = 50,
  duration_minutes = 2:10,
  lexical_diversity = 50,
  total_words = 125
)

nd <- nd %>% 
  mutate(est_pop = predict(popularity_lm, newdata = nd))

ggplot(nd,
       aes(x=duration_minutes,y=est_pop,group=top_genre,color=top_genre)) + 
  geom_line() + 
  theme_minimal() + 
  labs(x="Duration",y="Estimated Song Popularity",
       color="Genre")

#------------------------------------------------------------------------- <- read_csv("songs_transformed.csv") %>% 
d_genre <- read_csv("genre_subset.csv") %>% 
  janitor::clean_names() %>% 
  select(-x1,-lyrics,-top_10_words,-genres)

d_genre <- d_genre %>% 
  mutate(top_genre = fct_reorder(top_genre,popularity,mean),
         key = as_factor(key))

skimr::skim(d_genre)

# let's rescale everything numeric to 0-100
rescale <- function(x){
  min.x <- min(x)
  max.x <- max(x)
  
  x <- (x - min.x)/(max.x - min.x) * 100
  
  return(x)
}

d_genre <- d_genre %>% 
  mutate(
    danceability = rescale(danceability),
    loudness = rescale(loudness),
    energy = rescale(energy),
    valence = rescale(valence),
    tempo = rescale(tempo),
    lexical_diversity = rescale(lexical_diversity)
  )

skimr::skim(d_genre)

genre_popularity_lm <- lm(popularity ~ top_genre + 
                      danceability +
                      energy +
                      tempo + 
                      duration_minutes + 
                      lexical_diversity +
                      total_words,
                    data = d_genre)

tidy(genre_popularity_lm)

anova(genre_popularity_lm)

ggplot(aes(x=lexical_diversity,y=popularity),data= d_genre)+
  geom_point()+
  xlim(13,90) +
  geom_smooth(method=lm)


# here's an example of creating a new data.frame and doing some visualizations

nd <- expand_grid(
  top_genre = c("brooklyn indie","modern rock","pop punk","alternative metal","emo"),
  danceability = 50,
  energy = 50,
  valence = 50,
  tempo = 50,
  duration_minutes = 2:10,
  lexical_diversity = 50,
  total_words = 125
)

nd <- nd %>% 
  mutate(est_pop = predict(genre_popularity_lm, newdata = nd))

ggplot(nd,
       aes(x=duration_minutes,y=est_pop,group=top_genre,color=top_genre)) + 
  geom_line() + 
  theme_minimal() + 
  labs(x="Duration",y="Estimated Song Popularity",
       color="Genre")

#-------------------------------------------------------------------
d_top10 <- read_csv("top_10.csv") %>% 
  janitor::clean_names() %>% 
  select(-x1,-lyrics,-top_10_words,-genres)

d_top10 <- d_top10 %>% 
  mutate(top_genre = fct_reorder(top_genre,popularity,mean),
         key = as_factor(key))

skimr::skim(d_top10)

# let's rescale everything numeric to 0-100
rescale <- function(x){
  min.x <- min(x)
  max.x <- max(x)
  
  x <- (x - min.x)/(max.x - min.x) * 100
  
  return(x)
}

d_top10 <- d_top10 %>% 
  mutate(
    danceability = rescale(danceability),
    loudness = rescale(loudness),
    energy = rescale(energy),
    valence = rescale(valence),
    tempo = rescale(tempo),
    lexical_diversity = rescale(lexical_diversity)
  )

skimr::skim(d_top10)

top10_popularity_lm <- lm(popularity ~ top_genre + 
                      danceability + 
                      energy +
                      valence + 
                      tempo + 
                      duration_minutes + 
                      lexical_diversity + 
                      total_words + 
                      I(duration_minutes^2),
                    data = d_top10)

tidy(top10_popularity_lm)

anova(top10_popularity_lm)

# here's an example of creating a new data.frame and doing some visualizations

nd <- expand_grid(
  top_genre = c("brooklyn indie","modern rock","pop punk","alternative metal","emo"),
  danceability = 50,
  energy = 50,
  valence = 50,
  tempo = 50,
  duration_minutes = 2:10,
  lexical_diversity = 50,
  total_words = 125
)

nd <- nd %>% 
  mutate(est_pop = predict(popularity_lm, newdata = nd))

ggplot(nd,
       aes(x=duration_minutes,y=est_pop,group=top_genre,color=top_genre)) + 
  geom_line() + 
  theme_minimal() + 
  labs(x="Duration",y="Estimated Song Popularity",
       color="Genre")
#---------------------------------------------------------------------
d_top_30 <- read_csv("top_30_genre.csv") %>% 
  janitor::clean_names() %>% 
  select(-x1,-lyrics,-top_10_words,-genres)

d_top_30 <- d_top_30 %>% 
  mutate(top_genre = fct_reorder(top_genre,popularity,mean),
         key = as_factor(key))

skimr::skim(d_top_30)

# let's rescale everything numeric to 0-100
rescale <- function(x){
  min.x <- min(x)
  max.x <- max(x)
  
  x <- (x - min.x)/(max.x - min.x) * 100
  
  return(x)
}

d_top_30 <- d_top_30 %>% 
  mutate(
    danceability = rescale(danceability),
    loudness = rescale(loudness),
    energy = rescale(energy),
    valence = rescale(valence),
    tempo = rescale(tempo),
    lexical_diversity = rescale(lexical_diversity)
  )

skimr::skim(d_top_30)

top_30_popularity_lm <- lm(popularity ~ top_genre + 
                            danceability + 
                            energy +
                            valence + 
                            tempo + 
                            duration_minutes + 
                            lexical_diversity + 
                            total_words + 
                            I(duration_minutes^2),
                          data = d_top_30)

tidy(top_30_popularity_lm)

anova(top_30_popularity_lm)

# here's an example of creating a new data.frame and doing some visualizations

nd <- expand_grid(
  top_genre = c("brooklyn indie","modern rock","pop punk","alternative metal","emo"),
  danceability = 50,
  energy = 50,
  valence = 50,
  tempo = 50,
  duration_minutes = 2:10,
  lexical_diversity = 50,
  total_words = 125
)

nd <- nd %>% 
  mutate(est_pop = predict(popularity_lm, newdata = nd))

ggplot(nd,
       aes(x=duration_minutes,y=est_pop,group=top_genre,color=top_genre)) + 
  geom_line() + 
  theme_minimal() + 
  labs(x="Duration",y="Estimated Song Popularity",
       color="Genre")

