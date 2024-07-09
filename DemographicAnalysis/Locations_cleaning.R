
#setwd("C:\Users\jackc\OneDrive\Documents\MSBA\Capstone Project\Capstone\state_files")

files <- dir()
files <- files[str_detect(files,".txt")]

library(tidyverse)
library(deplyr)


for(i in 1:length(files)){
  
  if (i==1){
    d <- read_tsv(files[i],col_names=F) %>% 
      rename(locations=X1) %>% 
      mutate(file = files[i])
    
  } else {
    d <- d %>% 
      bind_rows(
        read_tsv(files[i],col_names=F) %>% 
          rename(locations=X1) %>% 
          mutate(file = files[i]))
    
  }
  
}

d <- d %>% 
  mutate(band = str_extract(file,"[a-z]+_"),
         band = str_remove(band,"_"))

band_locations <- d %>% 
  count(band, locations)

band_locations <- band_locations %>% 
  pivot_wider(id_cols=locations,
              names_from=band,
              values_from=n,
              values_fill = 0)

write_tsv(band_locations,"locations_counts.txt")
