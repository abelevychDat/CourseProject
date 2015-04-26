
## This script merges the training and the test sets of Samsung data:
## (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
## It extracts only the measurements on the mean and standard deviation for each measurement. 
## It creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# reading train datasets
train_data <- read.table ("./train/X_train.txt",  header = FALSE, na.strings=c("", "NA"), stringsAsFactors = FALSE)
train_subj <- read.table ("./train/subject_train.txt",  header = FALSE, na.strings=c("", "NA"), stringsAsFactors = FALSE)
train_activity <- read.table ("./train/y_train.txt",  header = FALSE, na.strings=c("", "NA"), stringsAsFactors = FALSE)

# reading test datasets
test_data <- read.table ("./test/X_test.txt",  header = FALSE, na.strings=c("", "NA"), stringsAsFactors = FALSE)
test_subj <- read.table ("./test/subject_test.txt",  header = FALSE, na.strings=c("", "NA"), stringsAsFactors = FALSE)
test_activity <- read.table ("./test/y_test.txt",  header = FALSE, na.strings=c("", "NA"), stringsAsFactors = FALSE)

# reading activity and vars descriptions
vars_names <- read.table ("features.txt",  header = FALSE, na.strings=c("", "NA"))
activity <- read.table ("activity_labels.txt",  header = FALSE, na.strings=c("", "NA"),stringsAsFactors = FALSE)

# merge datasets
all_data<-rbind(train_data, test_data)
colnames(all_data)<-vars_names[,2]

# add 30 to test subjectsto keep unique identifier and merge subjects 
test_subj<-test_subj+30;
all_subj<-rbind(train_subj, test_subj)
colnames(all_subj)<-"subject"

# extract mean and STD colomns
mean_ind <- grep("mean", vars_names[,2])
std_ind <- grep("std", vars_names[,2])
mean_cols<-all_data[,mean_ind]
std_cols<-all_data[,std_ind]
tidy_data <-cbind(mean_cols, std_cols)

# merge activty indexes label activity
all_activity <- rbind(train_activity, test_activity)
fact_activity = factor(all_activity[,1])
levels(fact_activity) = c("walking", "walking_up", "walking_down", "sitting", "standing", "laying")

# add subject and activity columns to the tidyset
tidy_data <-cbind(fact_activity, tidy_data)
tidy_data <-cbind(all_subj, tidy_data)

# create table with means for each activity and variable
temp_table <-tidy_data[,-(1:2)]
final_table<-aggregate(temp_table, list(tidy_data$subject,tidy_data$fact_activity), mean)
write.table(final_table,"final_table.txt", sep = "\t", row.names = FALSE)
