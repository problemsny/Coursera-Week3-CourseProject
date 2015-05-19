# Introduction

The script run_analysis.R is to get, collect and tidy the data collected over 30 subjects using 6 activity tests.
This is done according to the first 4 of the 5 steps outlines in Coursera Getting and Cleaning Data - Course Project

The data files are split with 'train' representing those subjects that were trained and 'test' on those subjects who were tested.

* First step is to read the data and merge them by using the rbind() function. Reading the X, Y and subject files on either train or test shows that they have the same length so after rbind we have xdata, ydata and subjectdata all with the same length.
* Then, we need to extract only those columns with the mean and standard deviation measures from the xdata dataset. 
* We then move on to rename the activities as the ydata contains only numbers from 1-6. We do this with the features.txt files that lists each activity associated with the number.
* We rename the column names of xdata so that it looks more clearer. We also rename the column names of subjectdata and ydata with "subject" and "activity".
* We then create 'finaloutput' by using cbind() to combine them nicely using first subjectdata to indentify the subject, then ydata to identify the activity and finally xdata.
* At last we create a tidy data set where we calculate all mean and std by subject and activity. We write.table to tidydata1.txt.

# Variables

* all 'test' variables (xtest, ytest, subjecttest) are from the 'test' files. all 'train' vairables (xtrain, ytrain, subjecttrain) are from the 'train' files.
* xdata represent the xtest and xtrain and they contain the outcomes.
* ydata represent the ytest and ytrain and they contain the activity.
* subjectdata represent the subjecttest and subjecttrain and they contain the identifier for the subject.
* columnnames specifies all the different tests and is used to correctly name the variables for the xdata dataset. It is also used to extract (grep) a numeric vector where the words "mean()" or "std()" are mentioned and is then used to subset xdata to include only those columns.
* finaloutput uses cbind() to put all 3 datasets together so that we can identify the subject, activity and results properly.
