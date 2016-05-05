## Step 1: Merge the data
TrainX ,  TrianY,  TestX,  TestY,  TrainSubject  and  TestSubject contain the data from the downloaded files.
features contains the column names of the TrainX and TestX
ActivityType contains the column names for the Activity label and Activity names.

* Create a test set by Combining TrainX, TrainY and TrainSubject, and name it TrainData;
* Create a test set by Combining TestX, TestY and TestSubject, and name it TestData.

Merge TrainData and TestDada into AllData, whose columns are named accordingly based on variables features and ActivityType.
## Step 2: Extracts only the measurements on the mean and standard deviation for each measurement. 

* create a character vector with column names ColNames.
* Extract column data by logical vector ExtractCol.
* Save the data to ExtractData.

##Step 3.Uses descriptive activity names to name the activities in the data set ExtractData.

## In Step 4, we clean up the column names of the extracted data. Changes are:

old features | cleaned up features
------------ | -------------
() | ""
 -std | StdDev
-mean | Mean
the beginning letter "t" | Time
the beginning letter "f" | Freq
gravity | Gravity;
bodybody or body | Body;
gyro | Gyro
AccMag | AccMagnitude
[Bb]odyaccjerkmag | BodyAccJerkMagnitude
JerkMag | JerkMagnitude
GyroMag | GyroMagnitude

##Step 5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
* Create a new table DataNoActivityType without the activityType column 
* Calculate the mean of each variable for each activity and each subject, and name the new table tidyData.
* Export the tidyData set to tidyData.txt.

