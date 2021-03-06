setwd("c:.put here your path./UCI HAR Dataset/");

library(data.table)

#Loading the test data
X_test <- read.table('test/X_test.txt', strip.white = TRUE,header = FALSE) 
#Loading the train data
X_train <- read.table('train/X_train.txt', strip.white = TRUE,header = FALSE) 
#Loading the column names
colnames  <- read.table('features.txt',stringsAsFactors = FALSE)[,2]
#Loading the labels
act_lbls <- read.table("activity_labels.txt")[,2]
#loading the subject data
#test
subject_test <- read.table('test/subject_test.txt', strip.white = TRUE,header = FALSE) 
#train
subject_train <- read.table('train/subject_train.txt', strip.white = TRUE,header = FALSE) 

#loading the activity data
#test
activity_test <- read.table('test/y_test.txt', strip.white = TRUE,header = FALSE) 
#train
activity_train <- read.table('train/y_train.txt', strip.white = TRUE,header = FALSE) 

#Creating a vector only for mean and std containing columns 
means_stds  <- grepl("mean|std",colnames)
#Selecting only the mean and std containing columns
X_test  <- X_test[,means_stds]
X_train  <- X_train[,means_stds]

#Adding the name of the additional 2 columns
colnames_sort  <- c("activity","subject",colnames[means_stds])

#Appending the subject and activity data to the main datasets
X_test <- cbind(activity_test,subject_test,X_test)
X_train <- cbind(activity_train,subject_train,X_train)

#setting the column names
colnames(X_test) <- colnames_sort
colnames(X_train) <- colnames_sort


#putting together rows
all_data  <- rbind (X_test,X_train)

#renaming the activity names
all_data[,1] = act_lbls[all_data[,1]]

#creating the aggregate
result <- aggregate( formula = .~activity+subject, data = all_data, FUN = mean )

#writing to file the summary
outFile <- file("summary.txt", "w+")
write.table(result, outFile, row.name=FALSE)
close(outFile)

