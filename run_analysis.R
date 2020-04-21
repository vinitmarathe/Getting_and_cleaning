# You should create one R script called run_analysis.R that does the following.
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names.
# 5. From the data set in step 4, creates a second, independent tidy data set with the average 
#    of each variable for each activity and each subject.
setwd("ABC/")

# this reads the train dataset and merges into one dataframe
df1<-read.table("./UCI HAR Dataset/train/subject_train.txt")
names(df1)<-c("SubjectNumber")
df2<-read.table("./UCI HAR Dataset/train/y_train.txt")
names(df2)<-c("ActivityType")
df3<-read.table("./UCI HAR Dataset/train/X_train.txt")
df4<-cbind(df1,df2,df3)

# this reads the test dataset and merges into one dataframe
df5<-read.table("./UCI HAR Dataset/test/subject_test.txt")
names(df5)<-c("SubjectNumber")
df6<-read.table("./UCI HAR Dataset/test/y_test.txt")
names(df6)<-c("ActivityType")
df7<-read.table("./UCI HAR Dataset/test/X_test.txt")
df8<-cbind(df5,df6,df7)

# this merges train and test dataframe into one dataframe
df9<-rbind(df4,df8)

#This reads features and removes ( ) from it  and gives column names to dataframe that has test and train data
df_features<-read.table("./UCI HAR Dataset/features.txt")
df_features$V2<-gsub("\\()","",as.character(df_features$V2))
names(df9)[3:length(names(df9))]<-df_features$V2

#This cross references the features in order to give labels
df10<-read.table("./UCI HAR Dataset/activity_labels.txt")
names(df10)<-c("ActivityNumber","ActivityTp")
df11<-merge(x=df10,y=df9,by.y="ActivityType",by.x="ActivityNumber")

#This creates a final data that takes average of each quantity for each activity for each subject
df12<- df11 %>% group_by(SubjectNumber,ActivityTp) %>% summarise_all(mean)

write.table(df12,file="final_merged_tidydata.txt",row.names = FALSE)



