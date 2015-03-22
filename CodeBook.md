##CodeBook - Getting and Cleaning Data Course Project

###Project Summary

The course project is based on the Human Activity Recognition Using Smartphones Dataset, which was generated as a result of experiments performed by the Smartlab - Non Linear Complex Systems Laboratory.

The experiments were carried out with 30 volunteers, each of whom performed six activities while wearing a smartphone on their waist.  By utilizing the smartphone's embedded accelerometer and gyroscope, 3-axial linear acceleration and angular velocity was recorded for the each participant while performing the associated activities.  

The resulting dataset contained output data for the 30 participants as they performed the six targeted activities, for which over 500 variables were recorded for each.  The data was further partitioned into two sets, where 70% of the participants were selected for generating the training data, and 30% the test data.

This purpose of this project is to create a tidy dataset that combines the training and test data into a single file and calculates the average of each variable for each activity and each subject.

###Raw Data Input

The raw data is provided in a zip file named **getdata-projectfiles-UCI HAR Dataset.zip**.  When extracted, it creates a subdirectory named UCI HAR Dataset.

The UCI HAR Dataset directory contains the following files:

* activity_labels.txt
* features.txt
* features_info.txt - Information regarding features variables
* README.txt - Readme file for dataset
* test/subject_test.txt
* test/X_test.txt
* test/y_test.txt
* train/subject_train.txt
* train/X_train.txt
* train/y_train.txt

For the purpose of this project, the files contained in the directories test/Inertial Signals/ and 
train/Inertial Signals/ may be ignored.

The data in each file may be described as follows:

**activity_labels.txt**

- Description: List of activity identifiers and associated labels.
- Contains 6 rows of text in 2 unlabelled columns, space delimited.
- Column 1: Activity Identifier (integer, range of 1 - 6)
- Column 2: Name of Activity (text)

**features.txt**

- Description: List of 561 feature variable names
- Contains 561 rows of text in 2 unlabelled columns, space delimited.
- Column 1: Feature Identifier (integer, range of 1 - 561)
- Column 2: Name of Feature (text).  Content contains characters such as "(", ")" and "-".

**test/subject_test.txt**

- Description: Subject (volunteer) identifiers associated with test output variables
- Contains 2947 rows of text in 1 unlabelled column
- Column 1: Subject identifier (integer)

**test/X_test.txt**

- Description: Test dataset output variables
- Contains 2947 rows of text in 561 columns, space delimited
- Column 1 - 561: Feature variable that is associated with feature value in associated row number in features.txt file (number)

**test/y_test.txt**

- Description: Activity identifiers associated with test output variables
- Contains 2947 rows of text in one column
- Column 1: Activity Identifier (integer)

**train/subject_train.txt**

- Description: Subject (volunteer) identifiers associated with training output variables
- Contains 7352 rows of text in one unlabelled column
- Column 1: Subject identifier (integer)

**train/X_train.txt**

- Description: Training dataset output variables
- Contains 7352 rows of text in 561 columns, space delimited
- Column 1 - 561: Feature variable that is associated with feature value in associated row number in features.txt file (number)

**train/y_train.txt**

- Description: Activity identifiers associated with training output variables
- Contains 7352 rows of text in one column
- Column 1: Activity Identifier (integer)

###Raw Data File Relationships

The three test data files (subject_test.txt, X_test.txt and y_test.txt) may be treated as one group of files, and the three training data files (subject_train.txt, X_train.txt and y_train.txt) may be treated as a second group of files for the purpose of initial associations.

The respective subject_, X_ and y_ files may only be associated with each other by aligning the files side-by-side to provide a combined view that provides the subject (volunteer) identifier, activity identifier, and associated output variables in a single record (line of text).  There are no unique identifiers within each line in each file that provide the ability to match the associated sets, so assembly of the data primarily consists of aligning the vertical slices of subject_, X_ and y_ (files) to provide a single associated view.

###Feature Output Variables of Raw Data Set

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

- tBodyAcc-XYZ
- tGravityAcc-XYZ
- tBodyAccJerk-XYZ
- tBodyGyro-XYZ
- tBodyGyroJerk-XYZ
- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag
- fBodyAcc-XYZ
- fBodyAccJerk-XYZ
- fBodyGyro-XYZ
- fBodyAccMag
- fBodyAccJerkMag
- fBodyGyroMag
- fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

- mean(): Mean value
- std(): Standard deviation
- mad(): Median absolute deviation 
- max(): Largest value in array
- min(): Smallest value in array
- sma(): Signal magnitude area
- energy(): Energy measure. Sum of the squares divided by the number of values. 
- iqr(): Interquartile range 
- entropy(): Signal entropy
- arCoeff(): Autorregresion coefficients with Burg order equal to 4
- correlation(): correlation coefficient between two signals
- maxInds(): index of the frequency component with largest magnitude
- meanFreq(): Weighted average of the frequency components to obtain a mean frequency
- skewness(): skewness of the frequency domain signal 
- kurtosis(): kurtosis of the frequency domain signal 
- bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
- angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

- gravityMean
- tBodyAccMean
- tBodyAccJerkMean
- tBodyGyroMean
- tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'

###Data Transformation into Tidy Data

The data provided in the raw dataset must be transformed into a single tidy dataset that is properly labelled and suitable for calculating the average of each variable for each activity and each subject.

Based on the original file layouts, the training and test data can be treated as separate datasets during the initial file import and labelling.  Following these initial steps, the two groups of data may be combined into one for final processing.

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

###Data Transformation Discussion

The requirements for this project are somewhat open to interpretation as to how they might actually be met.  The resulting data output is a "wide" form containing the average for each mean and std calculation of the variables in a separate column.  The column selection criteria was to include all variables that include "std(" or "mean(" in the feature name.  If "mean" appeared alone, as in meanFreq(), it was not included as the actual variable represented a weighted average. Column names were cleaned up to remove characters such as "()" and "-" which are not valid names within R (see http://cran.r-project.org/doc/FAQ/R-FAQ.html#What-are-valid-names_003f).  The "-" character was replaced with and underscore "_" to provide for more readability.


###Data Output
- subject- Subject (volunteer/participant) identifier [integer]
- activity - Activity that subject performed.  Possible values are WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING. [text]
- tbodyacc_mean_x - Calculated average of tbodyacc_mean_x for given subject and activity [numeric]
- tbodyacc_mean_y - Calculated average of tbodyacc_mean_y for given subject and activity [numeric]
- tbodyacc_mean_z - Calculated average of tbodyacc_mean_z for given subject and activity [numeric]
- tbodyacc_std_x - Calculated average of tbodyacc_std_x for given subject and activity [numeric]
- tbodyacc_std_y - Calculated average of tbodyacc_std_y for given subject and activity [numeric]
- tbodyacc_std_z - Calculated average of tbodyacc_std_z for given subject and activity [numeric]
- tgravityacc_mean_x - Calculated average of tgravityacc_mean_x for given subject and activity [numeric]
- tgravityacc_mean_y - Calculated average of tgravityacc_mean_y for given subject and activity [numeric]
- tgravityacc_mean_z - Calculated average of tgravityacc_mean_z for given subject and activity [numeric]
- tgravityacc_std_x - Calculated average of tgravityacc_std_x for given subject and activity [numeric]
- tgravityacc_std_y - Calculated average of tgravityacc_std_y for given subject and activity [numeric]
- tgravityacc_std_z - Calculated average of tgravityacc_std_z for given subject and activity [numeric]
- tbodyaccjerk_mean_x - Calculated average of tbodyaccjerk_mean_x for given subject and activity [numeric]
- tbodyaccjerk_mean_y - Calculated average of tbodyaccjerk_mean_y for given subject and activity [numeric]
- tbodyaccjerk_mean_z - Calculated average of tbodyaccjerk_mean_z for given subject and activity [numeric]
- tbodyaccjerk_std_x - Calculated average of tbodyaccjerk_std_x for given subject and activity [numeric]
- tbodyaccjerk_std_y - Calculated average of tbodyaccjerk_std_y for given subject and activity [numeric]
- tbodyaccjerk_std_z - Calculated average of tbodyaccjerk_std_z for given subject and activity [numeric]
- tbodygyro_mean_x - Calculated average of tbodygyro_mean_x for given subject and activity [numeric]
- tbodygyro_mean_y - Calculated average of tbodygyro_mean_y for given subject and activity [numeric]
- tbodygyro_mean_z - Calculated average of tbodygyro_mean_z for given subject and activity [numeric]
- tbodygyro_std_x - Calculated average of tbodygyro_std_x for given subject and activity [numeric]
- tbodygyro_std_y - Calculated average of tbodygyro_std_y for given subject and activity [numeric]
- tbodygyro_std_z - Calculated average of tbodygyro_std_z for given subject and activity [numeric]
- tbodygyrojerk_mean_x - Calculated average of tbodygyrojerk_mean_x for given subject and activity [numeric]
- tbodygyrojerk_mean_y - Calculated average of tbodygyrojerk_mean_y for given subject and activity [numeric]
- tbodygyrojerk_mean_z - Calculated average of tbodygyrojerk_mean_z for given subject and activity [numeric]
- tbodygyrojerk_std_x - Calculated average of tbodygyrojerk_std_x for given subject and activity [numeric]
- tbodygyrojerk_std_y - Calculated average of tbodygyrojerk_std_y for given subject and activity [numeric]
- tbodygyrojerk_std_z - Calculated average of tbodygyrojerk_std_z for given subject and activity [numeric]
- tbodyaccmag_mean - Calculated average of tbodyaccmag_mean for given subject and activity [numeric]
- tbodyaccmag_std - Calculated average of tbodyaccmag_std for given subject and activity [numeric]
- tgravityaccmag_mean - Calculated average of tgravityaccmag_mean for given subject and activity [numeric]
- tgravityaccmag_std - Calculated average of tgravityaccmag_std for given subject and activity [numeric]
- tbodyaccjerkmag_mean - Calculated average of tbodyaccjerkmag_mean for given subject and activity [numeric]
- tbodyaccjerkmag_std - Calculated average of tbodyaccjerkmag_std for given subject and activity [numeric]
- tbodygyromag_mean - Calculated average of tbodygyromag_mean for given subject and activity [numeric]
- tbodygyromag_std - Calculated average of tbodygyromag_std for given subject and activity [numeric]
- tbodygyrojerkmag_mean - Calculated average of tbodygyrojerkmag_mean for given subject and activity [numeric]
- tbodygyrojerkmag_std - Calculated average of tbodygyrojerkmag_std for given subject and activity [numeric]
- fbodyacc_mean_x - Calculated average of fbodyacc_mean_x for given subject and activity [numeric]
- fbodyacc_mean_y - Calculated average of fbodyacc_mean_y for given subject and activity [numeric]
- fbodyacc_mean_z - Calculated average of fbodyacc_mean_z for given subject and activity [numeric]
- fbodyacc_std_x - Calculated average of fbodyacc_std_x for given subject and activity [numeric]
- fbodyacc_std_y - Calculated average of fbodyacc_std_y for given subject and activity [numeric]
- fbodyacc_std_z - Calculated average of fbodyacc_std_z for given subject and activity [numeric]
- fbodyaccjerk_mean_x - Calculated average of fbodyaccjerk_mean_x for given subject and activity [numeric]
- fbodyaccjerk_mean_y - Calculated average of fbodyaccjerk_mean_y for given subject and activity [numeric]
- fbodyaccjerk_mean_z - Calculated average of fbodyaccjerk_mean_z for given subject and activity [numeric]
- fbodyaccjerk_std_x - Calculated average of fbodyaccjerk_std_x for given subject and activity [numeric]
- fbodyaccjerk_std_y - Calculated average of fbodyaccjerk_std_y for given subject and activity [numeric]
- fbodyaccjerk_std_z - Calculated average of fbodyaccjerk_std_z for given subject and activity [numeric]
- fbodygyro_mean_x - Calculated average of fbodygyro_mean_x for given subject and activity [numeric]
- fbodygyro_mean_y - Calculated average of fbodygyro_mean_y for given subject and activity [numeric]
- fbodygyro_mean_z - Calculated average of fbodygyro_mean_z for given subject and activity [numeric]
- fbodygyro_std_x - Calculated average of fbodygyro_std_x for given subject and activity [numeric]
- fbodygyro_std_y - Calculated average of fbodygyro_std_y for given subject and activity [numeric]
- fbodygyro_std_z - Calculated average of fbodygyro_std_z for given subject and activity [numeric]
- fbodyaccmag_mean - Calculated average of fbodyaccmag_mean for given subject and activity [numeric]
- fbodyaccmag_std - Calculated average of fbodyaccmag_std for given subject and activity [numeric]
- fbodybodyaccjerkmag_mean - Calculated average of fbodybodyaccjerkmag_mean for given subject and activity [numeric]
- fbodybodyaccjerkmag_std - Calculated average of fbodybodyaccjerkmag_std for given subject and activity [numeric]
- fbodybodygyromag_mean - Calculated average of fbodybodygyromag_mean for given subject and activity [numeric]
- fbodybodygyromag_std - Calculated average of fbodybodygyromag_std for given subject and activity [numeric]
- fbodybodygyrojerkmag_mean - Calculated average of fbodybodygyrojerkmag_mean for given subject and activity [numeric]
- fbodybodygyrojerkmag_std - Calculated average of fbodybodygyrojerkmag_std for given subject and activity [numeric]
