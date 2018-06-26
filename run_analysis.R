## Download file 
if(!file.info('UCI HAR Dataset')$isdir) {
    fileurl <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
    dir.create('UCI HAR dataset')
    download.file(fileurl, 'UCI-HAR-Dataset.zip')
    unzip('./UCI-HAR-Dataset.zip')
}

## Take x Dataset
trainx <- read.table('./UCI HAR Dataset/train/X_train.txt')
testx <- read.table('./UCI HAR Dataset/test/X_test.txt')

## Take Y Dataset
trainy <- read.table('./UCI HAR Dataset/train/y_train.txt')
testy <- read.table('./UCI HAR Dataset/test/y_test.txt')

## Take Subject Dataset
trainsubj <- read.table('./UCI HAR Dataset/train/subject_train.txt')
testsubj <- read.table('./UCI HAR Dataset/test/subject_test.txt')

## Bind all dataset
x_df <- rbind(trainx, testx)
y_df <- rbind(trainy, testy)
subj_df <- rbind(trainsubj, testsubj)

## Get Feature name list
features <- read.table('UCI HAR Dataset/features.txt')

##Take only mean and std
mean_std <- grep('\\-(mean|std)\\(\\)', features[, 2])
x_df <- x_df[, mean_std]

## Load Activties Name
activity_name <- read.table('UCI HAR Dataset/activity_labels.txt')
activity_name[, 2] <- tolower(as.character(activity_name[, 2]))
activity_name[, 2] <- gsub('_', ' ', activity_name[, 2])

## Assign Activity to Y data frame
y_df[, 1] = activity_name[y_df[, 1], 2]
## 

## Set Column Name of data frames
colnames(x_df) <- features[mean_std, 2]
colnames(y_df) <- 'Activity'
colnames(subj_df) <- 'Subject'

## Combind all data
complete_df <- cbind(subj_df, x_df, y_df)

## creates a second data set with the average
average_df <- aggregate(x = complete_df, by = list(activity = complete_df$Activity, subj = complete_df$Subject), FUN = mean)
average_df <- average_df[, !(colnames(average_df) %in% c("subj", "activity"))]
write.table(average_df, 'Average_Result.txt', row.name=FALSE)
