##README - Getting and Cleaning Data Course Project

###Project Requirements

####Data
The course project data files are provided in a zip file named **getdata-projectfiles-UCI HAR Dataset.zip**.  

This data file specific to this course project may be obtained at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

The original data file from the study may be obtained from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.

####Script
The script required to execute the commands to perform the required data manipulation is **run_analysis.R**. 

####Software
Data manipulation is performed using the **R software environment** for statistical computing (available at http://www.r-project.org/).  The R **dplyr package**  (http://cran.r-project.org/web/packages/dplyr/index.html) is an added dependency for execution of the script.

The run_analysis.R script was developed on an x86_64 Linux system running R 3.1.3 (2015-03-09), with the dplyr 0.4.1 package installed.  Note that older versions of R and dplyr may not support all functionality used.  It is suggested that you use these versions listed or the latest available.

###Steps to Set up the Project

1. Copy the getdata-projectfiles-UCI HAR Dataset.zip file to your desired working directory and unzip the file.  The data will extract to a subdirectory named UCI HAR Dataset.

2. Copy the script run_analysis.R to your working directory.

3. Install the dplyr package if you have not done so previously.

###What the Script Does
The data provided in the raw dataset must be transformed into a single tidy dataset that is properly labelled and suitable for calculating the average of each variable for each activity and each subject.

Based on the original file layouts as described in the CodeBook.md file, the training and test data can be treated as separate datasets during the initial file import and labelling.  Following these initial steps, the two groups of data may be combined into one for final processing.

The steps required to do so were as follows:

1. Import the original files and apply meaningful column names.  Files to be imported are:

2. Import activity_labels.txt and features.txt.  Both of these files provide labels to support further data processing.

3. Import X_test.txt and X_train.txt.  Set the column names to those values provided in features.txt.

4. Combine the X_test and X_train data into one, and then subset the columns chosen to only those that provide a calculations on the mean or standard deviaton for each measurement.  The specific criteria applied is to limit the columns selected to those that contain "std(" or "mean(".

5. Tidy up the column names to be all lowercase, removing the "()" characters, and changing the hyphens to underscores.

6. Import the y_test.txt and y_train.txt.  Set the column name to "activityid", and combine the resulting data into one.

7. Import the subject_test.txt and subject_train.txt files.  Set the column name to "subject" and combine the resulting data into one.

8. Combine the single column of data provided in the subject data, with the single column of data provided on the activity data, with the 66 columns of means and standard deviations to create a single table.

9. Merge the activity labels from the activity_labels.txt file to match the activity identifiers in the single table above.  This results in one additional column (activity).

10. Remove the activityid column and calculate the averages of the standard deviations and means for each measurement, grouped by subject and activity.

11. Output the data to a file named output.txt

###Executing the Script

The desired output file may be generated sourcing the run_analysis.R script file from within the R console or RStudio, as follows:

**source("run_analysis.R")**

Note that depending on your R configuration, you may need to use the setwd() command to set your working directory to the desired directory prior to sourcing the script.

###Script Output

The run_analysis.R script will generate the desired tidy dataset file, named output.txt, within your working directory.  Detailed descriptions of the input and output data and transformations applied are available in **CodeBook.md**.



