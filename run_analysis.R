# You should create one R script called run_analysis.R that does the following. 

#Library
library(dplyr)
library(plyr)

#Folder of files
setwd("~/Desktop/Coursera/Getting and Cleaning Data Course Project/UCI HAR Dataset/")

#-----------------------------------------------------------------------------#

# 1. Merges the training and the test sets to create one data set.

  #Open files
X_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")
subject_train <- read.table("train/subject_train.txt")

X_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
subject_test <- read.table("test/subject_test.txt")

  # Merge X data set
x_data <- rbind(X_train, X_test)

  # Merge y data set
y_data <- rbind(y_train, y_test)

  # Merge subject data set
subject_data <- rbind(subject_train, subject_test)

#-----------------------------------------------------------------------------#

# 2. Extracts only the measurements on the mean and 
#standard deviation for each measurement.

features <- read.table("features.txt")

  # get only columns with mean() or std() in their names
meanstd <- grep("-(mean|std)\\(\\)", features[, 2])

  # subset the desired columns
x_data <- x_data[, meanstd]

  # correct the column names
names(x_data) <- features[meanstd, 2]

#-----------------------------------------------------------------------------#

# 3. Uses descriptive activity names to name the activities in the data set

  # open label
activities <- read.table("activity_labels.txt")

  # update with label
y_data[, 1] <- activities[y_data[, 1], 2]

  # change column name
names(y_data) <- "activity"

#-----------------------------------------------------------------------------#

# 4. Appropriately labels the data set with descriptive variable names. 

  # change column name
names(subject_data) <- "subject"

  # cbind all
Final <- cbind(x_data, y_data, subject_data)

#-----------------------------------------------------------------------------#

# 5. From the data set in step 4, creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject.

  # average of activity & subject
output <- ddply(Final, c("subject","activity"), numcolwise(mean))

write.table(output, "output.txt", row.name=FALSE)


