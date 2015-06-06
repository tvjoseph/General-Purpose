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

data <- read.csv("outcome-of-care-measures.csv",colClasses = "character")## This is for reading csv files

## Method 3 - Writing data into file

#Saving the data into a text file using the write.table command

write.table(All_data_mean,file = "./Clean_data.txt",sep= ";", row.names = F)

## Method 4 - A special methods for accessing some specific folder and files in it

## Defining the function
pollutantmean <- function(directory,pollutant,id){
  ## Initialising the place holders
  y <- NULL
  Z <- NULL
  means <- NULL
  results <- NULL
  ## Defining the file name of the CSV file based on the counter
  for(i in 1:length(id)){
    if(id[i] < 10 ) {x <- paste0("00")}
    
    else if (id[i] < 100) {x <- paste0("0")}
    
    else {x<-paste0()}
    
    
    ## Defining the column for the pollutant    
    if(pollutant == "sulfate") {p <- 2} else {p <- 3}
    
    ## Creating the vector for storing the file path
    y<- paste0("D:/R/",directory,"/",x,id[i],".csv",sep = "")
    
    ## Creating the dataframe for reading the CSV file and storing the data,from the above vector
    z <- read.csv(y, header = T, sep = ",")
    
    ## Calculating the mean of the defined pollutant
    means <- mean(z[,p], na.rm = T)
    
    ## Storing the mean in another vector
    results[i] <- means
    
  }
  
  ## Displaying the mean of the results vector
  mean(results,na.rm=T)
  
  
  
  
  
}
