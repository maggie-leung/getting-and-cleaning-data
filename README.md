# getting-and-cleaning-data
Review criterialess 

The submitted data set is tidy.
The Github repo contains the required scripts.
GitHub contains a code book that modifies and updates the available codebooks with the data to indicate all the variables and summaries calculated, along with units, and any other relevant information.
The README that explains the analysis files is clear and understandable.
The work submitted for this project is the work of the student who submitted it.

Outcomes

Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement.
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names.
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Code: run_analysis.R

1. Download the file if the file doesn't exsit in the directory 
2. Take train and test data and combind with rbind function
3. Extract only mean and standard deviation column 
4. Take activity names and transform the text into more readable for human (lower characters and replace _ with ' ')
5. Assign Y data frame's value with activity names
6. Assign X datadrame's column name as features names, 'Subject' for subject column and 'Activity' for Y data frame
7. Combind Y, subject and activity data frame
8. Clone the complete data frame into a new data frame by group from the Subject and Activities.
9. Calculcate the average of each value
