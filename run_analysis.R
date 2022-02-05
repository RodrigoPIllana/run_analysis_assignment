# Downloading files
#setwd("your working directory")

if (dir.exists("UCI HAR Dataset")==FALSE){
        download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
                      destfile = "data.zip", method = "curl")
        unzip("data.zip")
}
#setwd("your working directory/UCI HAR Dataset")

# Load the data into R
testdat <- read.table("test/X_test.txt")
testlabs <- read.table("test/y_test.txt")
testlabs<-as.vector(testlabs[,1])
testdat$labels <- testlabs
testsubj<-as.vector(read.table("test/subject_test.txt")[,1])
testdat$subjects <- testsubj
rm(testlabs,testsubj)


traindat <- read.table("train/X_train.txt")
trainlabs <- read.table("train/y_train.txt")
trainlabs<-as.vector(trainlabs[,1])
traindat$labels <- trainlabs
trainsubj<-as.vector(read.table("train/subject_train.txt")[,1])
traindat$subjects <- trainsubj
rm(trainlabs,trainsubj)

# Merge the data

data<-full_join(testdat,traindat)
# equivalent: data <- rbind(testdat,traindat)

# Obtain the column names

feats <- read.table("features.txt")
feats <- as.character(feats[,2])
feats[c(562,563)] <- c("labels","subjects")
colnames(data) <- feats
rm(feats, testdat, traindat)

# Select mean and sd measures

library(dplyr)
library(stringr)
a<-c(grep("mean()",names(data)), grep("std",names(data)),dim(data)[2]-1,dim(data)[2])
a<-sort(a)
data <- data[,a]
a<-grep("Freq",names(data))
data <- data[,-a]
rm(a)

# Use descriptive activity names

activities <- tolower(as.character(read.table("activity_labels.txt")[,2]))
data[,"labels"]<-as.factor(data[,"labels"])
levels(data[,"labels"])<-activities
rm(activities)

# Label data set with descriptive variable names
names(data)<-gsub("std\\()", "Standard Deviation",names(data))
names(data)<-gsub("mean\\()", "Average",names(data))
names(data)<-gsub("BodyAcc", " Body Acceleration ",names(data))
names(data)<-gsub("GravityAcc", " Gravity Acceleration ",names(data))
names(data)<-gsub("BodyGyro", " Gyroscope ",names(data))
names(data)<-gsub("^t", "Time -",names(data))
names(data)<-gsub("^f", "Freq -",names(data))
names(data)<-gsub("Jerk", " Jerk signals ",names(data))
names(data)<-gsub("Mag", " Magnitude ",names(data))
names(data)<-gsub("-"," ",names(data))

# Second data with averages

library(tidyverse)
library(dplyr)
#detach("package:plyr", unload = TRUE)
final_data<-group_by(data,labels,subjects)
final_data<-summarise(final_data,across(everything(),mean))
# dat<-summarise_each(data2,mean)





