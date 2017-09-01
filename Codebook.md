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

* Set the directory location where the files downloaded from [the archive](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) are stored.  
* Read and load the test dataset files.
    * x_test.txt (2947 lines) for observations in a matrix format.
    * y_test.txt (2947 lines) for Activity labels (1 through 6) associated with the observations matrix. This gets added as a variable to the test data table in the later part of the script.
    * subject_test.txt (2947 lines) for Subject IDs (1 through 30) associated with the observations matrix. This also gets added as a variable to the test data table in the later part of the script.
* Read and load the x_train.txt, y_train.txt, subject_train.txt file for the train dataset.
    * The same descriptions as in the test dataset apply except for the number of lines in each file.  It is 7352 in the train files.
* Merge the train and the test datasets. 
* Read, load and clean up the features/variables file.  As duplicate variable names are found, they need to be changed to ensure all variable names are distinctive. 
* Replace the column names of the combined dataset with the cleaned-up features list. 
* Extract only the mean and standard deviation columns (per the project instructions), and add Activity labels and Subject IDs as additional columns.  
* Tidy the combined dataset using the gather and separate functions of the tidyr package.
* Make the Activity label column values descriptive.  The label translation table is as follows:
   
    | Activity Label| Description |
    | ------------- |:-------------:|
    | 1    |WALKING |
    | 2      |WALKING_UPSTAIRS    |
    | 3 | WALKING_DOWNSTAIRS    |
    | 4    | SITTING |
    | 5      | STANDING      |
    | 6 | LAYING    |

* Create an independent dataset for the average of each activity measurement for each subject.

### Variable Names

The run_analysis.R script generates two data tables.

1. Data Table: dtHARnet
    
    | Variable Names  | Description |
    | ----------------|:---------------------------------------------------------------------------:|
    | activityLabel   | Activity type a subject performed. The possible values are listed in the R Script section of this document  |
    | subjID          | Anonymous ID (1 through 30) assigned to the volunteers who participated in the experiments |
    | measurementType | Measurement type. Reference features_info.txt and readme.txt delivered with the dataset     |
    | statType        | Either mean or standard deviation   |
    | axis            | Signal direction (X or Y or Z) if applicable    |
    | measurement     | Measurement of activities of daily living while carrying a waist-mounted smartphone  |
    | domainType      | Time or Frequency domain     |
    | sensor Type     | Accelerometer (Acc) or Gyroscope (Gyro)    |
   
    
2. Data Table: dtActMean

| Variable Names  | Description  |
|---|---|
| subjID  | Anonymous ID (1 through 30) assigned to the volunteers who participated in the experiments    |
| activityLabel  | Activity type a subject performed. The possible values are listed in the R Script section of this document  |
| avg | Average of each activity measurement for a given subject  |
          
     
