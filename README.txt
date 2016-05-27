Attention!!!

Edit the path within the program before you run it!
---------------------------------------------------------------------------------------
Overview:
---------------------------------------------------------------------------------------
1. The dataset we use is based on “yelp_academic_dataset_user.json”
2. The six attributes we will discuss in our project: 
     elite, yelping_since, votes.count, review count, average stars, fans numbers
3. After narrow down the column, this program randomly choose 10% sample data entries from original dataset. This is our discussion dataset (about 55233 entries).
4. (Optional) For some kind of classification (such as kNN) need to run normalized data to improve accuracy. So we have normalized dataset and regular dataset.
---------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------
For full step use this program:
---------------------------------------------------------------------------------------

Step1. Use “JSONTOCSV.java” to transfer original son format data into csv. R can directly read json file, but when you try to edit it, you may meet troubles. So I recommend you to use .csv file.
	a. you can choose your own attributes in this step.
	b. you can do small calculation at this step, but don’t normalized you data in this step for general using.

Step2. If you get a huge dataset, use “get_random_sample.R” to get a small sample set. This may save your run time.
	default: extract 10% data entries from input datastream.

Step3. run classifications.

This program support decision tree and kNN classification.
	“run_decision_tree.R”
	a. decision tree:
		input data should be un-normalized data
		must randomly get sample dataset

	“Final_Project_knn_1.R”
	b. kNN:
		input data should be normalized.
		add K value to improve accuracy. (if several K-s have similar accuracy, choose the smallest one as your model)
---------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------
Casual use:
---------------------------------------------------------------------------------------
If you just want to see the result of this program first, follow these steps:

Step1: Edit path within read.csv(“”) to map your computer’s .csv file paths. This will use the prepared dataset in “/csv/xxxxxx.csv”.
	a.”/DecisionTree/run_decision_tree.R”
	b.”/K-nearest neighbors/Final_Project_knn_1.R”
Step2: Run it
---------------------------------------------------------------------------------------
If you have any question, contact xliu54@stevens.edu

