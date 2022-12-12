# normalization of dataset

# define function
min_max_norm <- function(x) {
  (x - min(x)) / (max(x) - min(x))
}

#apply Min-Max normalization to skz features
skz_norm <- lapply(skz_features[1:3], min_max_norm) 
skz_norm.df<- data.frame(skz_norm)
summary(skz_norm.df)
skz_norm.df %>% head()
