
##Raw data
Data was collected from the accelerometers from the Samsung Galaxy S smartphone in an experiment performed by UCI university.
The files included in the zip file that are used in this script are:
 ./UCI HAR Dataset/test/X_test.txt Test data Training data with the features measured in experiment

 ./UCI HAR Dataset/train/X_train.txt Training data with the features measured in experiment

 ./UCI HAR Dataset/features.txt List of the features 

 ./UCI HAR Dataset/test/y_test.txt List of the activities performed in the experiment for the test dataset

 ./UCI HAR Dataset/train/y_train.txt List of the activities performed in the experiment for the train dataset

 ./UCI HAR Dataset/activity_labels.txt List with the labels of each activity performed (STANDING, WALKING, ETC)

 ./UCI HAR Dataset/test/subject_test.txt List of the subjects that performed each activity for the test dataset

 ./UCI HAR Dataset/train/subject_train.txt List of the subjects that performed each activity for the train dataset



##The data set was constructed as follows: 
Merge the training and the test sets to create one data set.
Extract only the measurements on the mean and standard deviation for each measurement. 
Use descriptive activity names to name the activities in the data set
Labels the data set with descriptive variable names. 
Create an independent tidy data set with the average of each variable for each activity and each subject.


##Codebook:
*subjectId: Identifier of the subject. 

*ActivityName: Name of the activity performed:    

 1 WALKING

 2 WALKING_UPSTAIRS

 3 WALKING_DOWNSTAIRS
 4 SITTING

 5 STANDING
 
 6 LAYING

*The following variables represent the mean of each of them when grouping by Activity Name and Subject Identifier in the training and test datasets.

tBodyAcc_mean_X tBodyAcc_mean_Y tBodyAcc_mean_Z 

tBodyAcc_std_X tBodyAcc_std_Y tBodyAcc_std_Z 

tGravityAcc_mean_X tGravityAcc_mean_Y tGravityAcc_mean_Z 

tGravityAcc_std_X tGravityAcc_std_Y tGravityAcc_std_Z 

tBodyAccJerk_mean_X tBodyAccJerk_mean_Y tBodyAccJerk_mean_Z 

tBodyAccJerk_std_X tBodyAccJerk_std_Y tBodyAccJerk_std_Z 

tBodyGyro_mean_X tBodyGyro_mean_Y tBodyGyro_mean_Z 

tBodyGyro_std_X tBodyGyro_std_Y tBodyGyro_std_Z 

tBodyGyroJerk_mean_X tBodyGyroJerk_mean_Y tBodyGyroJerk_mean_Z 

tBodyGyroJerk_std_X tBodyGyroJerk_std_Y tBodyGyroJerk_std_Z 

tBodyAccMag_mean tBodyAccMag_std 

tGravityAccMag_mean tGravityAccMag_std 

tBodyAccJerkMag_mean tBodyAccJerkMag_std 

tBodyGyroMag_mean tBodyGyroMag_std 

tBodyGyroJerkMag_mean tBodyGyroJerkMag_std 

fBodyAcc_mean_X fBodyAcc_mean_Y fBodyAcc_mean_Z 

fBodyAcc_std_X fBodyAcc_std_Y fBodyAcc_std_Z 

fBodyAccJerk_mean_X fBodyAccJerk_mean_Y fBodyAccJerk_mean_Z 

fBodyAccJerk_std_X fBodyAccJerk_std_Y fBodyAccJerk_std_Z 

fBodyGyro_mean_X fBodyGyro_mean_Y fBodyGyro_mean_Z 

fBodyGyro_std_X fBodyGyro_std_Y fBodyGyro_std_Z 

fBodyAccMag_mean fBodyAccMag_std 

fBodyBodyAccJerkMag_mean fBodyBodyAccJerkMag_std 

fBodyBodyGyroMag_mean fBodyBodyGyroMag_std 

fBodyBodyGyroJerkMag_mean fBodyBodyGyroJerkMag_std


For units and meaning of this variables please refer to the Readme file that comes with the files.

For details of the transformation performed, please refer to the R script provided along with this codebook.
















