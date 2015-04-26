library(data.table)

testX <- read.table("./UCI HAR Dataset/test/X_test.txt",header=FALSE)
testY <- read.table("./UCI HAR Dataset/test/y_test.txt",header=FALSE)
testSub <- read.table("./UCI HAR Dataset/test/subject_test.txt",header=FALSE)
trainX <- read.table("./UCI HAR Dataset/train/X_train.txt",header=FALSE)
trainY <- read.table("./UCI HAR Dataset/train/y_train.txt",header=FALSE)
trainSub <- read.table("./UCI HAR Dataset/train/subject_train.txt",header=FALSE)

# 3) Uses descriptive activity names to name the activities in the data set
activities <- read.table("./UCI HAR Dataset/activity_labels.txt",header=FALSE,colClasses="character")
testY$V1 <- factor(testY$V1,levels=activities$V1,labels=activities$V2)
trainY$V1 <- factor(trainY$V1,levels=activities$V1,labels=activities$V2)

# 4) Appropriately labels the data set with descriptive variable names. 
features <- read.table("./UCI HAR Dataset/features.txt",header=FALSE,colClasses="character")
colnames(test)<-features$V2
colnames(train)<-features$V2
colnames(testY)<-c("Activity")
colnames(testSub)<-c("Activity")
colnames(trainY)<-c("Subject")
colnames(trainSub)<-c("Subject")

# 1) Merges the training and the test sets to create one data set.
testX<-cbind(testX,testY)
testX<-cbind(testX,testSub)
trainX<-cbind(trainX,trainY)
trainX<-cbind(trainX,trainSub)
bigData<-rbind(testX,trainX)

# 2) Extracts only the measurements on the mean and standard deviation for each measurement. 
bigData_mean<-sapply(bigData,mean,na.rm=TRUE)
bigData_sd<-sapply(bigData,sd,na.rm=TRUE)

# 5) Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
DT <- data.table(bigData)
tidy<-DT[,lapply(.SD,mean),by="Activity,Subject"]
write.table(tidy, file="tidyData.txt", row.name=FALSE, sep = "\t")
