

activity_lables<-read.table("./UCI HAR Dataset/activity_labels.txt")
activity_lables <- activity_lables[,2]


# merge train&test values x
all.x<-rbind(read.table("./UCI HAR Dataset/train/X_train.txt"), read.table("./UCI HAR Dataset/test/X_test.txt"))

# get cols contains "-std()" or "-mean()" values
features<-read.table("./UCI HAR Dataset/features.txt")
colsMS <- c(grep("-std()",features[,2],fixed=TRUE), grep("-mean()",features[,2],fixed=TRUE))
all.x <- all.x[,colsMS]
colnames(all.x)<-features[,2][colsMS]

# add activity with their names, not IDs
all.y<-rbind(read.table("./UCI HAR Dataset/train/y_train.txt"),read.table("./UCI HAR Dataset/test/y_test.txt"))
all.y<-lapply(all.y, function(x) { activity_lables[x] })
all.activity<-cbind(all.y, all.x)
colnames(all.activity)[1] <- "Activity"

# get subjects
subject_all<-rbind(read.table("./UCI HAR Dataset/train/subject_train.txt"), read.table("./UCI HAR Dataset/test/subject_test.txt"))
all<-cbind(subject_all, all.activity)
colnames(all)[1] <- "Subject"

# get final tidy data
tidy_data <- aggregate( all[,3] ~ Subject+Activity, data = all, FUN= "mean" )
for(i in 4:ncol(all)){
  tidy_data[,i] <- aggregate( all[,i] ~ Subject+Activity, data = all, FUN= "mean" )[,3]
}
colnames(tidy_data)[3:ncol(tidy_data)] <- colnames(all.x)
write.table(tidy_data, file = "tidy_data.txt", row.names = FALSE)