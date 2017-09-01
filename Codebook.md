### Data Collection Description

All files are downloaded from [the data file archive](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). Unzipping the archive creates a directory called "UCI HAR Dataset" to which all data files get dumped. 
For the context of the data, refer to [the UCI site](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). 
Per the project instructions, only the mean and standard deviation features get extracted. The variables (features) whose names bear either "mean()" or "std()" satistfy this condition.  The list of such variables are as follows:
    (Reference feature_info.txt which is available in the "UCI HAR Dataset" directory for details.)  
    
[1] "tBodyAcc-mean()-X"           "tBodyAcc-mean()-Y"           "tBodyAcc-mean()-Z"           "tBodyAcc-std()-X"           
[5] "tBodyAcc-std()-Y"            "tBodyAcc-std()-Z"            "tGravityAcc-mean()-X"        "tGravityAcc-mean()-Y"       
[9] "tGravityAcc-mean()-Z"        "tGravityAcc-std()-X"         "tGravityAcc-std()-Y"         "tGravityAcc-std()-Z"        
[13] "tBodyAccJerk-mean()-X"       "tBodyAccJerk-mean()-Y"       "tBodyAccJerk-mean()-Z"       "tBodyAccJerk-std()-X"       
[17] "tBodyAccJerk-std()-Y"        "tBodyAccJerk-std()-Z"        "tBodyGyro-mean()-X"          "tBodyGyro-mean()-Y"         
[21] "tBodyGyro-mean()-Z"          "tBodyGyro-std()-X"           "tBodyGyro-std()-Y"           "tBodyGyro-std()-Z"          
[25] "tBodyGyroJerk-mean()-X"      "tBodyGyroJerk-mean()-Y"      "tBodyGyroJerk-mean()-Z"      "tBodyGyroJerk-std()-X"      
[29] "tBodyGyroJerk-std()-Y"       "tBodyGyroJerk-std()-Z"       "tBodyAccMag-mean()"          "tBodyAccMag-std()"          
[33] "tGravityAccMag-mean()"       "tGravityAccMag-std()"        "tBodyAccJerkMag-mean()"      "tBodyAccJerkMag-std()"      
[37] "tBodyGyroMag-mean()"         "tBodyGyroMag-std()"          "tBodyGyroJerkMag-mean()"     "tBodyGyroJerkMag-std()"     
[41] "fBodyAcc-mean()-X"           "fBodyAcc-mean()-Y"           "fBodyAcc-mean()-Z"           "fBodyAcc-std()-X"           
[45] "fBodyAcc-std()-Y"            "fBodyAcc-std()-Z"            "fBodyAccJerk-mean()-X"       "fBodyAccJerk-mean()-Y"      
[49] "fBodyAccJerk-mean()-Z"       "fBodyAccJerk-std()-X"        "fBodyAccJerk-std()-Y"        "fBodyAccJerk-std()-Z"       
[53] "fBodyGyro-mean()-X"          "fBodyGyro-mean()-Y"          "fBodyGyro-mean()-Z"          "fBodyGyro-std()-X"          
[57] "fBodyGyro-std()-Y"           "fBodyGyro-std()-Z"           "fBodyAccMag-mean()"          "fBodyAccMag-std()"          
[61] "fBodyBodyAccJerkMag-mean()"  "fBodyBodyAccJerkMag-std()"   "fBodyBodyGyroMag-mean()"     "fBodyBodyGyroMag-std()"     
[65] "fBodyBodyGyroJerkMag-mean()" "fBodyBodyGyroJerkMag-std()" 

The test and train data sets get combined per the project instructions. The gather() and separate() functions from the tidyr package get utilized to ensure the final dataset is compliant with the following rules of a tidy dataset:
- Each column is a variable.
- Each row is an observation.

### R script: run_analysis.R
- Reading the test dataset files.
--x_test.txt for observations in a matrix format.
--y_test.txt for activity labels (1 through 6) associated with the observations matrix. This gets added as a variable to the test data table.
--subject_test.txt for subject IDs (1 through 30) associated with the observations matrix. This also gets added as a variable to the test data table.
- Reading the x_train.txt, x_test.txt, subject_train.txt file for the train dataset.
