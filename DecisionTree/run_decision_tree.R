rm(list = ls())

# This part code is used to randomly get 10% sample data from original dataset as our discussion dataset.
# So every time you run this code, you may have diffenrent result.
yelp_users <- read.csv("/Users/Serena/Documents/DataMining/final/yelp_users_column_narrow.csv")

users_dataset <- yelp_users

# at first, we randomly choose 1/10 data entries from yelp_users dataset as our users dataset
users_dataset_idx <- sample(nrow(yelp_users),as.integer(.10*nrow(yelp_users)))    #random! 
# on user dataset, first 4/5 as training data, last 1/5 as testing data
data_range <- as.integer(.80*length(users_dataset_idx))
# get training and testing dataset
users_dataset <- yelp_users[users_dataset_idx,]

# Run Decision Tree Classification
# Classification Tree with rpart
library(rpart)
library(rpart.plot)
library(rattle)
library(RColorBrewer)

attach(users_dataset)
# grow tree 
fit <- rpart(EliteOrNot ~ 
               TotalVotes + TotalFriends + average_stars + review_count + fans,
             method = "class", 
             data = users_dataset)

fancyRpartPlot(fit)
detach(users_dataset)
