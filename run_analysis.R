library(dplyr)

# Import activity labels and set column names
activity_labels <- read.table(file = "UCI HAR Dataset/activity_labels.txt", header = FALSE)
colnames(activity_labels) <- c("activityid", "activity")

# Import features
features <- read.table(file = "UCI HAR Dataset/features.txt", header = FALSE)

# Import test features variables and set column names to features
X_test <- read.table(file = "UCI HAR Dataset/test/X_test.txt", header = FALSE, sep = "")
colnames(X_test) <- features[,2]

# Import training features variables and set column names to features
X_train <- read.table(file = "UCI HAR Dataset/train/X_train.txt", header = FALSE, sep = "")
colnames(X_train) <- features[,2]

# Combine the test and training features variables to one
X_data <- rbind(X_test, X_train)

# Select only those columns that are a calculated std or mean
std_mean_data <- X_data[,grep("std\\(|mean\\(", names(X_data))]

# Clean up column names - change to lower case, remove (), and change "-" to "_"
temp_col_names <- colnames(std_mean_data)
temp_col_names <- tolower(temp_col_names)
temp_col_names <- sub("[(][)]","", temp_col_names)
temp_col_names <- gsub("-", "_", temp_col_names)
colnames(std_mean_data) <- temp_col_names

# Import activity identifiers for test and training output, and set column names
y_test <- read.table(file = "UCI HAR Dataset/test/y_test.txt", header = FALSE, sep = "")
colnames(y_test) <- "activityid"
y_train <- read.table(file = "UCI HAR Dataset/train/y_train.txt", header = FALSE, sep = "")
colnames(y_train) <- "activityid"
# Combine into one
y_data <- rbind(y_test, y_train)

# Import subjects(volunteer) identifiers for test and training output, set column names
subject_test <- read.table(file = "UCI HAR Dataset/test/subject_test.txt", header = FALSE)
colnames(subject_test) <- "subject"
subject_train <- read.table(file = "UCI HAR Dataset/train/subject_train.txt", header = FALSE)
colnames(subject_train) <- "subject"
# Combine into one
subject_data <- rbind(subject_test, subject_train)

# Bind the combined columns to align subject identifiers, activity identifiers and output variables
working_data <- cbind(subject_data, y_data, std_mean_data)

# Merge in activity labels based on relationship to activity identifiers
working_data <- merge(working_data, activity_labels)

# Calculate mean for each variable for subject and activity, removing activity identifer from data
output <- working_data %>%
    select (subject, activity, 3:68 ) %>%
    group_by(subject, activity) %>%
    summarise_each(funs(mean))

# Output resulting data to file named "output.txt"
write.table(output, "output.txt", row.names=FALSE)
