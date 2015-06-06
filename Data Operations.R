## Operations Code. This R script is for carrying out variuos operations in R

## Method-1 : Using a For loop and If loop

for (i in 1:7352) {
  if(y_train$V1[i] == 1) {y_train$V1[i] <- paste("WALKING")}
  else if(y_train$V1[i] == 2) {y_train$V1[i] <- paste("WALKING_UPSTAIRS")}
  else if(y_train$V1[i] == 3) {y_train$V1[i] <- paste("WALKING_DOWNSTAIRS")}
  else if(y_train$V1[i] == 4) {y_train$V1[i] <- paste("SITTING")}
  else if(y_train$V1[i] == 5) {y_train$V1[i] <- paste("STANDING")}
  else  {y_train$V1[i] <- paste("LAYING")}
}

## Method-2 : Giving names to column using 'names'

y <- names(X_train)
for (i in 1:561) { y[i] <- paste(features[i,2])}
names(X_train) <- c(y)

names(subject_train) <- c("subject")
names(y_train) <- c("Activity")

## Method -3 : Combining rows / columns

new_x_train <- cbind(y_train,subject_train,X_train) ## This is column bind. The two variables in the 
## parenthesis are those variables which are being combined

new_combined <- rbind(new_x_train,new_x_test) ## This is row bind. For using the row bind, the column 
#names of both the variables which are joined should be the same.

## Method - 4 : Using paste function

for (i in 1:2947) {
  if(y_test$V1[i] == 1) {y_test$V1[i] <- paste("WALKING")}
  else if(y_test$V1[i] == 2) {y_test$V1[i] <- paste("WALKING_UPSTAIRS")}
  else if(y_test$V1[i] == 3) {y_test$V1[i] <- paste("WALKING_DOWNSTAIRS")}
  else if(y_test$V1[i] == 4) {y_test$V1[i] <- paste("SITTING")}
  else if(y_test$V1[i] == 5) {y_test$V1[i] <- paste("STANDING")}
  else  {y_test$V1[i] <- paste("LAYING")}
}

## Method - 5 : Using the aggregate function to summarise

All_data_mean <- aggregate(newcombinedata[,!names(newcombinedata) %in% c("Activity", "subject")],by=list(Activity=newcombinedata$Activity,subject=newcombinedata$subject),FUN=mean)

## Method - 6 : Using Functions to operate on data
rankhospital <- function(state,outcomes,num){
  data <- read.csv("outcome-of-care-measures.csv",colClasses = "character")
  seldata <- data[ , c(2,7,11,17,23)]
  names(seldata) <- c("Hosp","st","HA","HF","Pn")
  funstate <- unique(seldata$st)
  y <- length(funstate)
  
  for(i in 1:y){
    if(funstate[i] != state){z <- ("False")}
    else   {T <- ("True")}
  }
  
  if (T == "True"){}
  else   {stop("Invalid state")}
  
  if(outcomes == "heart attack") { z <- "HA"}
  else if (outcomes == "heart failure"){z <- "HF"}
  else if (outcomes == "pneumonia"){z <- "Pn"}
  else  {stop("Invalid Outcome")}
  
  month <- subset(seldata,seldata$st == state)
  month[,z] <- as.numeric(month[,z])
  sorted <- month[order(month[,z],month[,"Hosp"]),]
  newsorted <- complete.cases(sorted)
  sorted <- sorted[newsorted,]
  
  E <- length(sorted[,z])
  if(num == "worst"){r <- E[1]}
  else if(num == "best"){r <- 1}
  else   {r <- num}
  result <- sorted[r,1]
  result
  
  
  
}

## Method 7 : Miscellaneous actions

funstate <- unique(seldata$st) ## finding the unique values
y <- length(funstate) ## Finding the length of the variables

#####

if (T == "True"){} ## If the if condition satisfies it returns an empty variable
else   {stop("Invalid state")} ## Using the stop command and storing a charachter

if(outcomes == "heart attack") { z <- "HA"}
else if (outcomes == "heart failure"){z <- "HF"}
else if (outcomes == "pneumonia"){z <- "Pn"}
else  {stop("Invalid Outcome")}

####

month <- subset(seldata,seldata$st == state) ## Creating a subset using the subset function

sorted <- month[order(month[,z],month[,"Hosp"]),] ## Using the order function to sort data

month <- split(seldata,seldata$state) ## Splitting a variable with split data : ref - rankall.R

###

newsorted <- complete.cases(sorted) ## complete.cases to get all the data points without NA or empty

k <- data.frame(hospital = 0,state = 0) ## Defining a new data frame

month[,z] <- as.numeric(month[,z]) ## Converting into a numeric variable using the as.numeric function

###
NEI <- transform(NEI,year = factor(year)) ## Doing transformation

### - Using the 'with'function

with(subset(NEI,fips=="24510"),boxplot(log(Emissions)~year,main = "Emission data for Baltimore",xlab = "Year",ylab = "log(PM 2.5)"))
dev.copy(png,file = "Assgn2-Plot2.png")
dev.off()

### - Using merge and grep functions

mergedata <- merge(NEI,SCC,by.x = "SCC",by.y = "SCC",all=T) ## Merge function
Coalset <- mergedata[grep("Coal",mergedata$SCC.Level.Three),] ## Grep function