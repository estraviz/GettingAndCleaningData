##########################################################################
## Getting & Cleaning Data Course project                                #
## Name: Javier Estraviz                                                 #
## Date: January, 2015                                                   #
##########################################################################

## Human Activity Recognition Using Smartphones Data Set 
## Data collected from the accelerometers from the Samsung Galaxy S smartphone
## Full description available here: http://bit.ly/1mEvWTG 

##########################################################################

# To be applied to all read.table() commands
options(stringsAsFactors = FALSE)

# Libraries used
library("dplyr")

# Set up the working directory to the location of the current file
this.dir <- dirname(parent.frame(2)$ofile)
setwd(this.dir)

##########################################################################
## Step 0: Download and unzip the file that will be used in the project  #
##########################################################################

# Create directory where the data of the project will be allocated
if(!file.exists("./data")) {
  dir.create("data")
}

# Download the zip file with the dataset for the project. Unzip this file
setwd("./data")

# Get URL with the file inside 80 columns as R Style Guide recommends (e.g. 
# Google's: https://google-styleguide.googlecode.com/svn/trunk/Rguide.xml)
fileURL <- paste("https://d396qusza40orc.cloudfront.net/", 
                 "getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", sep="")
download.file(fileURL, destfile = "projectdataset.zip", method = "curl") 
unzip("projectdataset.zip")

##########################################################################
## Step 1: Merges the training and the test sets to create one data set. #
##########################################################################

# Read files that contain activities and features
setwd(this.dir)
setwd("./data/UCI HAR Dataset")
activities <- read.table("activity_labels.txt", header = FALSE, 
                         col.names = c("activity.id", "activity"))
features <- read.table("features.txt", col.names = c("feature.id", "feature"))

# -------
# Trains:
# -------
# Read files that contain training sets
setwd(this.dir)
setwd("./data/UCI HAR Dataset/train")
train.subject <- read.table("subject_train.txt", header = FALSE,
                            col.names = "subject.id")
train.x <- read.table("X_train.txt", header=FALSE, col.names = features$feature)
train.y <- read.table("y_train.txt", header=FALSE, col.names = "activity.id")

# Paste together all training sets in the following order (as asked in step 5):
# column1: activity, column2: subject, rest of columns: features
train.merged <- cbind(train.y, train.subject, train.x)

# ------
# Tests:
# ------
# Read files that contain test sets
setwd(this.dir)
setwd("./data/UCI HAR Dataset/test")
test.subject <- read.table("subject_test.txt", header = FALSE,
                           col.names = "subject.id")
test.x <- read.table("X_test.txt", header = FALSE, col.names = features$feature)
test.y <- read.table("y_test.txt", header = FALSE, col.names = "activity.id")

# Paste together all test sets in the following order (as asked in step 5):
# column1: activity, column2: subject, rest of columns: features
test.merged <- cbind(test.y, test.subject, test.x)

# ------------
# Merged info:
# ------------
# Paste together both training and test sets
merged.data <- rbind(train.merged, test.merged)

##########################################################################
## Step 2: Extracts only the measurements on the mean and standard       #
##         deviation for each measurement.                               #
##########################################################################

# "mean()" and "std()" appear now, after naming columns, as: "mean..", "std.."
means <- select(merged.data, contains("mean..", ignore.case = FALSE)) 
stddevs <- select(merged.data, contains("std..", ignore.case = FALSE)) 

# The order in columns of the new dataset is: 
# subject.id, activity.id, all columns with means, all columns with std devs
reduced.data <- cbind(select(merged.data, 1:2), means, stddevs)

##########################################################################
## Step 3: Uses descriptive activity names to name the activities in the #
##         data set.                                                     #
##########################################################################

# Replace column "activity.id" with its corresponding description
reduced.data$activity.id <- activities$activity[match(reduced.data$activity.id,
                                                      activities$activity.id)]

# Change the name of that column into just "activity" (obviously, this could be
# done simply with just: colnames(reduced.data)[1] <- "activity"
colnames(reduced.data)[1] <- colnames(activities)[2]

##########################################################################
## Step 4: Appropriately labels the data set with descriptive variable   #
##         names.                                                        #
##########################################################################

# Almost completed in previous steps. Just a final adaptation here
colnames(reduced.data) <- gsub("..", "", colnames(reduced.data), fixed = TRUE)

##########################################################################
## Step 5: From the data set in step 4, creates a second, independent    #
##         tidy data set with the average of each variable for each      # 
##         activity and each subject.                                    #
##########################################################################

# Calculate averages and obtain the final tidy dataset
tidy.data <- reduced.data %>% group_by(activity, subject.id) %>% 
             summarise_each(funs(mean))

# Write obtained dataset into hard disk, same location that current R file
setwd(this.dir)
write.table(tidy.data, file = "./tidydata.txt", row.names = FALSE)
