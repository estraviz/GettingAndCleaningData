CODEBOOK
========

Explanation of the origin of the data
-------------------------------------

The data used in this project have been obtained in the experiments detailed in the following publication:

**Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz.** *["Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine."](http://link.springer.com/chapter/10.1007%2F978-3-642-35395-6_30)* International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012


Files used
----------

The files used in this project are the following:

* (1) features.txt: List of all features that have been measured.
* (2) activity_labels.txt': Links the class labels with their activity name.

* (3) train/y_train.txt: Training labels.
* (4) train/subject_train.txt': Each row identifies the subject who performed the training activity. 
* (5) train/X_train.txt: Training set. Results of the variables measured.

* (6) test/y_test.txt: Test labels.
* (7) test/subject_test.txt: Each row identifies the subject who performed the test activity. 
* (8) test/X_test.txt: Test set. Results of the variables measured.


Process in detail
-----------------

#### Step 0: Reading of the information

The script **run_analysis.R** first downloads a zip file into the data folder (creates it if not present), extracts it and reads the information.

#### Step 1: Merging of the information

We are asked to merge the training and the test sets to create one data set. First we deal with files (3), (4) and (5) (see Files section). Same thing with files (6), (7) and (8). We assign the names to the columns of the measured quantities.

#### Step 2: Extracting of some information

Next, we proceed to extract only the measurements on the [mean](https://en.wikipedia.org/wiki/Arithmetic_mean) and [standard deviation](https://en.wikipedia.org/wiki/Standard_deviation) for each measurement. 

#### Step 3: Describe the activities

Descriptive activity names have been used to name the activities in the data set. We replace ids of activity with their corresponding name.

#### Step 4: Variable names

Appropriately label the data set with descriptive variable names. 

#### Step 5: Record tidy data set 

From the data set in step 4, we create a second, independent tidy data set for which we group by activity and subject and calculate the average of each variable. This dataset is recorded in a file. It is composed by 180 observations and 68 variables.


Variable names in the final product
-----------------------------------

Below are listed the names of the variables obtained in our final tidy dataset. The first two columns are the description of the activity and the subject that performed it. The rest are the measured quantities.

* activity
* subject.id
* tBodyAcc.mean.X
* tBodyAcc.mean.Y
* tBodyAcc.mean.Z
* tGravityAcc.mean.X
* tGravityAcc.mean.Y
* tGravityAcc.mean.Z
* tBodyAccJerk.mean.X
* tBodyAccJerk.mean.Y
* tBodyAccJerk.mean.Z
* tBodyGyro.mean.X
* tBodyGyro.mean.Y
* tBodyGyro.mean.Z
* tBodyGyroJerk.mean.X
* tBodyGyroJerk.mean.Y
* tBodyGyroJerk.mean.Z
* tBodyAccMag.mean
* tGravityAccMag.mean
* tBodyAccJerkMag.mean
* tBodyGyroMag.mean
* tBodyGyroJerkMag.mean
* fBodyAcc.mean.X
* fBodyAcc.mean.Y
* fBodyAcc.mean.Z
* fBodyAccJerk.mean.X
* fBodyAccJerk.mean.Y
* fBodyAccJerk.mean.Z
* fBodyGyro.mean.X
* fBodyGyro.mean.Y
* fBodyGyro.mean.Z
* fBodyAccMag.mean
* fBodyBodyAccJerkMag.mean
* fBodyBodyGyroMag.mean
* fBodyBodyGyroJerkMag.mean
* tBodyAcc.std.X
* tBodyAcc.std.Y
* tBodyAcc.std.Z
* tGravityAcc.std.X
* tGravityAcc.std.Y
* tGravityAcc.std.Z
* tBodyAccJerk.std.X
* tBodyAccJerk.std.Y
* tBodyAccJerk.std.Z
* tBodyGyro.std.X
* tBodyGyro.std.Y
* tBodyGyro.std.Z
* tBodyGyroJerk.std.X
* tBodyGyroJerk.std.Y
* tBodyGyroJerk.std.Z
* tBodyAccMag.std
* tGravityAccMag.std
* tBodyAccJerkMag.std
* tBodyGyroMag.std
* tBodyGyroJerkMag.std
* fBodyAcc.std.X
* fBodyAcc.std.Y
* fBodyAcc.std.Z
* fBodyAccJerk.std.X
* fBodyAccJerk.std.Y
* fBodyAccJerk.std.Z
* fBodyGyro.std.X
* fBodyGyro.std.Y
* fBodyGyro.std.Z
* fBodyAccMag.std
* fBodyBodyAccJerkMag.std
* fBodyBodyGyroMag.std
* fBodyBodyGyroJerkMag.std
