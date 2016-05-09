# Uncomment the following line to set the working directory to whetever you want it to be
setwd("~/Desktop/Aina/GettingData/CourseProject" )

# clear the Global environment (optional, comment if you like)
rm(list = ls())

# Download file if it hasn't already been done
if(!"dataset.zip" %in% list.files()){
        download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", 
                      "dataset.zip", method = "curl")
}

# Unzip file if it hasn't already been done and rename directory
if(!"dataset" %in% list.files()){
        library(utils)
        unzip("dataset.zip")
        file.rename("UCI HAR Dataset","dataset")
}

## Read all of the files into data frames

#files in main directory
ActivityLabels <- read.table("dataset/activity_labels.txt")
features <- read.table("dataset/features.txt")

# files in Test directory 
SubjectTest <- read.table("dataset/test/subject_test.txt")
XTest <- read.table("dataset/test/X_test.txt")
yTest <- read.table("dataset/test/y_test.txt")

# files in Train directory 
SubjectTrain <- read.table("dataset/train/subject_train.txt")
XTrain <- read.table("dataset/train/X_train.txt")
yTrain <- read.table("dataset/train/y_train.txt")

# Tidy up names of measured variables 
features[,2] <- gsub("\\(\\)", "", features[,2])
features[,2] <- gsub("-", "", features[,2])
features[,2] <- gsub("\\,", "", features[,2])
features[,2] <- tolower(features[,2])

# Assign them to column names in XTrain and XTest
names(XTest)<-features[,2]
names(XTrain)<-features[,2]

# Keep only those features that are a mean or a standard deviation
mstd <- grep("mean|std",features[,2])
XTest <- XTest[,mstd]
XTrain <- XTrain[,mstd]
TidyFeatures <- features[mstd,2]

# Tidy up activity labels 

ActivityLabels[,2] <- gsub("_","",ActivityLabels[,2])
ActivityLabels[,2] <- tolower(ActivityLabels[,2])

# Add 3 colums to XTest: subject, activity, group 
XTest <- cbind(SubjectTest,yTest, rep("test",nrow(XTest)), XTest)
names(XTest)[1:3] <- c("subject","activity", "group")
for(i in 1:6){
        XTest[,2] <- gsub(ActivityLabels[i,1],ActivityLabels[i,2],XTest[,2])
}

# Add 3 colums to XTrain: subject, activity, group 
XTrain <- cbind(SubjectTrain, yTrain, rep("train",nrow(XTrain)), XTrain)
names(XTrain)[1:3] <- c("subject","activity", "group")
for(i in 1:6){
        XTrain[,2] <- gsub(ActivityLabels[i,1],ActivityLabels[i,2],XTrain[,2])
}

# Merge Test and Train into one Dataframe
HumanActivity <- rbind(XTest,XTrain)

# Make sure the first 3 colums are considered factors
HumanActivity[,1] <- as.factor(HumanActivity[,1])
HumanActivity[,2] <- as.factor(HumanActivity[,2])
HumanActivity[,3] <- as.factor(HumanActivity[,3])

## create the new tidy dataframe with the averages for each variable, 
## for each subject and each activity

# create empty matrix from HumanActivity so all variables are there with names
df <- HumanActivity[0,]

# fill up subjects and activity
df[1:180,1] <- rep(1:30,6)
library(plyr)
df  <- arrange(df,subject)
df[,2] <- rep(ActivityLabels[,2],30)

# calculate variable averages and fill the data frame line by line
for(i in 1:nrow(df)){
        s <- df$subject[i]
        a <- df$activity[i]
        df[i,3] <- HumanActivity[HumanActivity$subject == s & HumanActivity$activity == a,3][1]
        df[i,4:89]  <- colMeans(HumanActivity[HumanActivity$subject == s & HumanActivity$activity == a,4:89])
}

# save dataframe df into "TidyData.txt"

write.table(df,"TidyData.txt",col.names = FALSE)
write.table(TidyFeatures,"TidyVariables.txt",col.names = FALSE)
