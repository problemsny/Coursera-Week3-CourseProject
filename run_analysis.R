# This is for Coursera - Week 3 - Course Project
# Assignment to get and clean data collected on 30 subjects doing 6 different activities
# Of those 30, 70% were selected for training (the "train" files) and 30% as test (the "test" files)
# Refer to the README.txt for further explanation.

# First part - Reading all files into R
     #reading the test data
xtest <- read.table("test/X_test.txt")
ytest <- read.table("test/y_test.txt")
subjecttest <- read.table("test/subject_test.txt")

     #reading the train data
xtrain <- read.table("train/X_train.txt")
ytrain <- read.table("train/y_train.txt")
subjecttrain <- read.table("train/subject_train.txt")

     #reading identifiers for later use
columnnames <- read.table("features.txt") ## This will be used to rename the column names
activities <- read.table("activity_labels.txt") ## This will be used to rename the Activity from numbers

     #bind the datasets together
xdata <- rbind(xtest, xtrain)
ydata <- rbind(ytest, ytrain)
subjectdata <- rbind(subjecttest, subjecttrain)

# Second part - extract only mean and std from datasets
     #look for the words mean() or std() in columnnames
meanstd <- grep("-(mean|std)\\(\\)", columnnames$V2)
     #subset the dataset by mean and std 
xdata <- xdata[,meanstd]

# Third part - Use descriptive names for activities
     #rename the activity number with associated activity description
ydata[,1] <- activities[ydata[,1],2]

# Fourth part - Label the variable names appropriately
     #rename ydata and subjectdata with single test - rename xdata with columnnames
names(subjectdata) <- "subject"
names(ydata) <- "activity"
names(xdata) <- columnnames[meanstd, 2]

# Put them all together nicely :)
finaloutput1 <- cbind(subjectdata, ydata, xdata)