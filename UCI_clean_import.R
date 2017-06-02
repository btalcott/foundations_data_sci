######
#
# Exercise (dataWrangling_02)
#
# Using R, you’ll be handling missing values in this data set, and creating a new data set. Specifically, these are the tasks you need to do:
#
# Auth: Burt Talcott, 2017-06-02
#  Ver: 001
#
######

#
# Used notepad++ to remove spaces from beginning of lines and multiple spaces to single spaces in X_test.txt.
# Converted remaining spaces to commas and saved file as X_test_clean.txt.
#

# Load required libraries
library(tidyr)
library(plyr)
library(dplyr)


# Clean working dataframe for full script run
if (exists("X_test") && is.data.frame(X_test)) { rm(X_test)}
if (exists("features") && is.data.frame(features)) { rm(features)}
if (exists("featureNames") && is.data.frame(featureNames)) { rm(featureNames)}


X_test <- read.csv(file=rm_white("~/foundations_data_sci/dataWrangling_03/UCI HAR Dataset/test/X_test_clean.txt"), header=FALSE, sep = ",")

features <- read.csv(file=rm_white("~/foundations_data_sci/dataWrangling_03/UCI HAR Dataset/features.txt"), header=FALSE, sep = " ")
featureNames <- features[2]

# rotate dataframe features <- as.data.frame(t(features))

colnames(X_test) <- featureNames[,1]

