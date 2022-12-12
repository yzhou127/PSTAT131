## EDA

# mean, standard deviation, median, min and max
head(trainskz)
summary(trainskz)


# ratio of view count and like count
ratio_view_like<- trainskz$view_count/trainskz$like_count
max(ratio_view_like)
min(ratio_view_like)
# ratio of view count and comment count
ratio_view_comment<- trainskz$view_count/trainskz$comment_count
max(ratio_view_comment)
min(ratio_view_comment)


# Create a box plot to see the distribution of the data. 

skz_features <- trainskz %>% 
  select(view_count,like_count,comment_count,year)

stack_skz_features <- stack(skz_features)

ggplot(stack_skz_features, aes(x=ind, y=values,fill=ind)) + 
  geom_boxplot(outlier.size = 1)

# logarithmic transformations
features_2 <- select(skz_features,-year) 
log_features <- log(features_2) %>% 
  stack() %>%
  filter_all(all_vars(!is.infinite(.)))

# visualize data distribution
# histogram
log_features %>% 
  ggplot(aes(x=values)) +
  geom_histogram(bins = 30, colour = "black", fill = "blue") +
  facet_wrap(~ ind)

# density curve
log_features %>% 
  ggplot(aes(x=values)) +
  geom_density(color="red",alpha=0.8)+
  facet_wrap(~ ind)


# create a correlation matrix for these features
cor_features <- cor(skz_features)
corrplot(cor_features)
# create a heat map
pheatmap(cor_features,
         display_numbers = TRUE,
         number_color = "black", 
         fontsize_number = 8)
