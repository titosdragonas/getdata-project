#if dataDir is not specified set it to the current working directory
if(!exists("dataDir")){
  dataDir=getwd()
}

#read the column names and indexes
dat.cols<-read.table(file="cols.txt",header = TRUE)

#read test data
in.features<-read.table(file=file.path(dataDir,"test","X_test.txt"),header = FALSE)
in.subjects<-read.table(file=file.path(dataDir,"test","subject_test.txt"), header=FALSE)
in.activities<-read.table(file=file.path(dataDir,"test","y_test.txt"), header=FALSE)

#combine
dat<-cbind(in.subjects, in.activities, subset(in.features, select = dat.cols$id))

#read train data
in.features<-read.table(file=file.path(dataDir,"train","X_train.txt"),header = FALSE)
in.subjects<-read.table(file=file.path(dataDir,"train","subject_train.txt"), header=FALSE)
in.activities<-read.table(file=file.path(dataDir,"train","y_train.txt"), header=FALSE)

#combine with the previous dataframe
dat<-rbind(dat, cbind(in.subjects, in.activities, subset(in.features, select=dat.cols$id)))

#add the column names
names(dat)<-c("subject","activity",as.character(dat.cols$name))

#add the descriptive activity labels
activityLabels<-read.table(file=file.path(dataDir, "activity_labels.txt"), header = FALSE, col.names=c("id", "name"))
dat$activity<-factor(dat$activity, levels=activityLabels$id, labels=activityLabels$name)

#free some RAM
rm(in.features)
rm(in.subjects)
rm(in.activities)
rm(activityLabels)

#create the tidy data set by forming an sql statement over each feature since we are producing a narrow dataset. 

result=data.frame()
sqls<-paste("SELECT subject, activity, '", dat.cols$name, "' as feature, avg(", dat.cols$name, ") as mean, stdev(", dat.cols$name, ") as stdev FROM dat GROUP BY subject, activity, feature", sep = "")

library(sqldf)
for(sql in sqls){
  result<-rbind(result, sqldf(sql))
}
detach("package:sqldf", unload=TRUE)

#convert subject and feature to factors to leave a nice R dataframe
result$subject<-factor(result$subject)
result$feature<-factor(result$feature)

#free the rest of the RAM
rm(sql)
rm(sqls)
rm(dat.cols)
#rm(dat)