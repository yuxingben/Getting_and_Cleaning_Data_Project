
# Step 1. Merges the training and the test sets to create one data set.

# load data from files
# read features & activity labels
Features <- read.table("features.txt")
ActivityType <- read.table("activity_labels.txt")  

# split names of ActivityType 
colnames(ActivityType) <- c("ActivityId","ActivityType"); 

# load Train data
TrainX <- read.table("train/X_train.txt")
TrainY <- read.table("train/y_train.txt")
TrainSubject <- read.table("train/subject_train.txt")

# Assigin column names to the Train data 
colnames(TrainSubject) <- "SubjectId"; 
colnames(TrainX) <- Features[,2];  
colnames(TrainY) <- "ActivityId"; 

# Create Training data set by combining the above data with column names
TrainData <- cbind(TrainY, TrainSubject, TrainX)

# Load Test data
TestX <- read.table("test/X_test.txt")
TestY <- read.table("test/y_test.txt")
TestSubject <- read.table("test/subject_test.txt")

# Assigin column names to the Test data 
colnames(TestSubject) <- "SubjectId"; 
colnames(TestX) <- Features[,2];  
colnames(TestY) <- "ActivityId"; 

# Create Test data set by combining the above data with column names
TestData <- cbind(TestY, TestSubject, TestX)

# Merge Train data and Test data
AllData = rbind(TrainData,TestData)

###############################################################################################
# Step 2.Extracts only the measurements on the mean and standard deviation for each measurement. 

# create a character vector with column names
ColNames = names(AllData)

# Extract column data by logical vector ExtractCol
ExtractCol <- grep("ActivityId|SubjectId|.*mean.*|.*std.*", ColNames)
ExtractData <- AllData[,ExtractCol]

################################################################################################
#Step 3.Uses descriptive activity names to name the activities in the data set
ExtractData = merge(ActivityType,ExtractData,by='ActivityId',all.x=TRUE);

###########################################################################################
#Step 4.Appropriately labels the data set with descriptive variable names. 
# Cleaning up the column names
ColNames = names(ExtractData)
for (i in 1:length(ColNames))  
{ 
   ColNames[i] = gsub("\\()","",ColNames[i]) 
   ColNames[i] = gsub("-std$","StdDev",ColNames[i]) 
   ColNames[i] = gsub("-mean","Mean",ColNames[i]) 
   ColNames[i] = gsub("^(t)","Time",ColNames[i]) 
   ColNames[i] = gsub("^(f)","Freq",ColNames[i]) 
   ColNames[i] = gsub("([Gg]ravity)","Gravity",ColNames[i]) 
   ColNames[i] = gsub("([Bb]ody[Bb]ody|[Bb]ody)","Body",ColNames[i]) 
   ColNames[i] = gsub("[Gg]yro","Gyro",ColNames[i]) 
   ColNames[i] = gsub("AccMag","AccMagnitude",ColNames[i]) 
   ColNames[i] = gsub("([Bb]odyaccjerkmag)","BodyAccJerkMagnitude",ColNames[i]) 
   ColNames[i] = gsub("JerkMag","JerkMagnitude",ColNames[i]) 
   ColNames[i] = gsub("GyroMag","GyroMagnitude",ColNames[i]) 
} 
# Replace the column names of ExtractData 
colnames(ExtractData) <- ColNames

#################################################################################################
# Step 5.From the data set in step 4, creates a second, independent tidy data set with the average
# of each variable for each activity and each subject.
# Create a new table, finalDataNoActivityType without the activityType column 
DataNoActivityType  <- ExtractData[,names(ExtractData) != 'ActivityType'];  
 
# Calculate the mean of each variable for each activity and each subject 
tidyData <- aggregate(DataNoActivityType[,names(DataNoActivityType) != c('ActivityId','SubjectId')],by=list(ActivityId=DataNoActivityType$ActivityId,SubjectId = DataNoActivityType$SubjectId),mean);  
 
# Merge the tidyData with ActivityType to include descriptive acitvity names 
tidyData <- merge(tidyData,ActivityType,by='ActivityId',all.x=TRUE);  
 
# Export the tidyData set  
write.table(tidyData, './tidyData.txt',row.names=TRUE,sep='\t'); 



