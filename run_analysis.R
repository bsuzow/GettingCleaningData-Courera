# 8/31/17
# BYS
# Coursera Getting and Cleaning Data Course Project

library(data.table)
library(dplyr)
library(tidyr)

#-------------
# Loading test dataset
#-------------

# The directory named, "UCI HAR Dataset" gets created when unzipping the file archive.  Set the working
# directory to this directory.


# load the test data set  (x_test.txt)
rawtestX<- as.data.table(read.table("test/x_test.txt"))

# load the test activity labels list (y_test.txt)
rawtestY<- as.data.table(read.table("test/y_test.txt"))

# load the subject list for the test data set (subject_test.txt)
subjtest<- as.data.table(read.table("test/subject_test.txt"))

#-------------
# Loading train dataset
#-------------

# load the train data set  (x_train.txt)
rawtrainX<- as.data.table(read.table("train/x_train.txt"))

# load the train activity labels list (y_train.txt)
rawtrainY<- as.data.table(read.table("train/y_train.txt"))

# load the subject list for the train data set (subject_train.txt)
subjtrain<- read.table("train/subject_train.txt")

#------------------------------------------------------------------------------------------
# Merging the training and the test data sets & add the subject ID and activity label columns
#------------------------------------------------------------------------------------------

obsall  <- rbind(rawtestX,rawtrainX) 
subjall <- rbind(subjtest,subjtrain)
actall  <- rbind(rawtestY,rawtrainY)

#----------------------------------------------
# Loading the features/columns list (features.txt)
#----------------------------------------------

features<- as.data.table(read.table("features.txt"))
colnamevec<- as.character(features$V2)  # convert V2's class from factor to char

# The features list has duplicate entries.  They cause an error when the select() function is called to extract the columns
# for mean and std. The following code removes the duplicates by renaming the columns causing the issue.

set1<-gsub("\\(\\)-","1-",colnamevec[303:316]); colnamevec[303:316] <- set1
set2<-gsub("\\(\\)-","2-",colnamevec[317:330]); colnamevec[317:330] <- set2
set3<-gsub("\\(\\)-","3-",colnamevec[331:344]); colnamevec[331:344] <- set3

set1<-gsub("\\(\\)-","1-",colnamevec[382:395]); colnamevec[382:395] <- set1
set2<-gsub("\\(\\)-","2-",colnamevec[396:409]); colnamevec[396:409] <- set2
set3<-gsub("\\(\\)-","3-",colnamevec[410:423]); colnamevec[410:423] <- set3

set1<-gsub("\\(\\)-","1-",colnamevec[461:474]); colnamevec[461:474] <- set1
set2<-gsub("\\(\\)-","2-",colnamevec[475:488]); colnamevec[475:488] <- set2
set3<-gsub("\\(\\)-","3-",colnamevec[489:502]); colnamevec[489:502] <- set3

#---------------------------------------------------------------------------------------
# replace the column names of the observation dataset with the cleaned up features list.
#---------------------------------------------------------------------------------------

colnames(obsall) <- colnamevec

#---------------------------------------------------------------------------------------------
# extract only the mean and std columns and add subject IDs and activity labels to the dataset.
#---------------------------------------------------------------------------------------------

obsall <- obsall %>% select(grep("mean\\(|std\\(",names(obsall)))

# add "activity labels" & "subject id" to the data set as a new column named "activityLabel", "subjID" respectively
dttemp <- obsall %>% select(grep("mean|std",names(obsall)))
dtHAR <- dttemp  %>%  mutate(activityLabel=actall$V1) %>% mutate(subjID=subjall$V1) %>% select(activityLabel,subjID,everything())

#--------------------
#tidying the data set
#--------------------

dtHAR <- dtHAR %>% gather(key,measurement,-activityLabel, -subjID) %>% separate(key,into=c("measurementType","statType","axis"),sep=c("-"),extra="drop")
dtHAR <- dtHAR %>% mutate(domainType=substr(measurementType,1,1))
dtHAR <- dtHAR %>% mutate(sensorType=ifelse(grepl("Acc",measurementType),"Acc","Gyro"))
dtHARnet <- dtHAR %>% mutate(statType=gsub("\\(\\)","",statType))  # remove () from the statType values


#--------------------------------------------
# Making the activityLabel column descriptive
#--------------------------------------------

dtActLabels <- as.data.table(read.table("activity_labels.txt"))
facAct <- as.factor(dtActLabels$V2)

dtHARnet <- dtHARnet %>% mutate(activityLabel=facAct[activityLabel])
dtHARnet <- as.data.table(dtHARnet)

#--------------------------------------------------------------------------------------------
# Create an independent dataset for the average of each activity measurement for each subject.
#--------------------------------------------------------------------------------------------

dtActMean <- dtHARnet[statType=="mean",mean(measurement),by=.(subjID,activityLabel)]
colnames(dtActMean)[3] <- "avg"

write.table(dtActMean, file="dtActMean.txt",row.names=FALSE)

#---------------
# end of script
#---------------

