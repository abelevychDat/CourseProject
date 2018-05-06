# CourseProject
This script read, filter, and aggregate Samsung data (can be found at (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).
## Experiment and data desciption
The experiments have been carried out with a group of 30 volunteers. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 
## Script 'Run_Analysis.R'
This script reads train and test datasets, extracts mean and standard deviation data and merges them into one table ('tidy_data'). It also creates a second, independent tidy data set ('meandatatable') with the average of each variable for each activity and each subject.
