## Various Methods for Accessing data from external sources. This set of codes can be used for that purpose

## Method 1 - Downloading data from the Internet using the download command

setwd("D:/R/") ## This is for setting the directory
setInternet2(T) ## This command is required to set the internet2 environment variable in windows for R
fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" ## Defining the url
filename <- "20dataset.zip" ## Defining the filed name

download.file(fileurl,destfile = filename) ## Using the download command

## Method 2 - Read the data and storing it using the read.table command. 


features <- read.table("./UCI HAR Dataset/features.txt") ## This is expecially useful when reading text files
labels <- read.table("./UCI HAR Dataset/activity_labels.txt")

## Method 3 - Writing data into file

#Saving the data into a text file using the write.table command

write.table(All_data_mean,file = "./Clean_data.txt",sep= ";", row.names = F)

