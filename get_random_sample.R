# This code is used to get 10% sample data from original dataset as our discussion dataset.

rm(list = ls())
yelp_users <- read.csv("/Users/Serena/Documents/DataMining/final/yelp_users_column_narrow_norm.csv")

# at first, we randomly choose 1/10 data entries from yelp_users dataset as our users dataset
users_dataset_idx <- sample(nrow(yelp_users),as.integer(.10*nrow(yelp_users)))    #random! 

# on user dataset, first 4/5 as training data, last 1/5 as testing data
data_range <- as.integer(.80*length(users_dataset_idx))
users_training_idx <- users_dataset_idx[1:data_range]
users_testing_idx <- users_dataset_idx[(data_range + 1):length(users_dataset_idx)]

# get training and testing dataset
users_dataset <- yelp_users[users_dataset_idx,]
users_training_dataset <- yelp_users[users_training_idx,]
users_testing_dataset <- yelp_users[users_testing_idx,]

# output to .csv file
write.csv(users_dataset, file = "/Users/Serena/Documents/DataMining/final/csv/norm/users_dataset.csv",row.names = FALSE)
write.csv(users_training_dataset, file = "/Users/Serena/Documents/DataMining/final/csv/norm/users_training_dataset.csv",row.names = FALSE)
write.csv(users_testing_dataset, file = "/Users/Serena/Documents/DataMining/final/csv/norm/users_testing_dataset.csv",row.names = FALSE)
