rm(list = ls())
# read .csv file
yelp_users <- read.csv("/Users/wangjingxu/Study/2016_Spring/CS513/project_new/yelp_dataset_challenge_academic_dataset/csv/yelp_users_column_narrow_norm.csv")

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

library(class)
# knn
?knn()

# [4]:"TotalVotes", [5]:"TotalFriends", [6]:"Year", [7]:"Month", [8]:"review_count", [9]:"fans", [10]:"average_stars"


################### Case 2:###################
# [4]:"TotalVotes",[7]:"Month",  [10]:"average_stars"
source <- c(4,7,10)
###### k=1
knn_predict_1 <- knn(users_training_dataset[,source],users_testing_dataset[,source],users_training_dataset[,3],k=1)
#View(knn_predict_1)

#Measure the performance of knn
accu_1 <- sum(knn_predict_1 == users_testing_dataset[,3])/length(users_testing_dataset[,3])

###### k=2
knn_predict_2 <- knn(users_training_dataset[,source],users_testing_dataset[,source],users_training_dataset[,3],k=2)
#View(knn_predict_2)

#Measure the performance of knn
accu_2 <- sum(knn_predict_2 == users_testing_dataset[,3])/length(users_testing_dataset[,3])

###### k=3
knn_predict_3 <- knn(users_training_dataset[,source],users_testing_dataset[,source],users_training_dataset[,3],k=3)
#View(knn_predict_2)

#Measure the performance of knn
accu_3 <- sum(knn_predict_3 == users_testing_dataset[,3])/length(users_testing_dataset[,3])

###### k=4
knn_predict_4 <- knn(users_training_dataset[,source],users_testing_dataset[,source],users_training_dataset[,3],k=4)
#View(knn_predict_2)

#Measure the performance of knn
accu_4 <- sum(knn_predict_4 == users_testing_dataset[,3])/length(users_testing_dataset[,3])

###### k=10
knn_predict_5 <- knn(users_training_dataset[,source],users_testing_dataset[,source],users_training_dataset[,3],k=10)
#View(knn_predict_2)

#Measure the performance of knn
accu_5 <- sum(knn_predict_5 == users_testing_dataset[,3])/length(users_testing_dataset[,3])

###### k=15
knn_predict_6 <- knn(users_training_dataset[,source],users_testing_dataset[,source],users_training_dataset[,3],k=15)
#View(knn_predict_2)

#Measure the performance of knn
accu_6 <- sum(knn_predict_6 == users_testing_dataset[,3])/length(users_testing_dataset[,3])

###### k=30
knn_predict_7 <- knn(users_training_dataset[,source],users_testing_dataset[,source],users_training_dataset[,3],k=30)
#View(knn_predict_2)

#Measure the performance of knn
accu_7 <- sum(knn_predict_7 == users_testing_dataset[,3])/length(users_testing_dataset[,3])

accu_1
accu_2
accu_3
accu_4
accu_5
accu_6
accu_7
# classification tree
##############################################