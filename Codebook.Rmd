---
title: "Codebook"
author: "Titos Dragonas"
date: "July 22, 2015"
output: html_document
---

#Codebook

##tidy.txt

The script produces a tidy data set in the narrow form with the following columns:

Column|Description
------|-----------
subject|A Factor ranging from 1 to 30 denoting the subject (as in 'which person') of the measurement.
activity|A Factor denoting the activity represented by the measurement. See the *Activities* section in this document.
feature|The name of the feature being measured.  See the *Features* section in this document.
mean|The mean of the feature for this activity and subject.
stdev|The standard deviation of the feature for this activity and subject.

##Activities

The activity names are used verbatim from the original file *activity_labels.txt* since they are descriptive enough.

Id|Activity Name
--|-------------
1|WALKING
2|WALKING_UPSTAIRS
3|WALKING_DOWNSTAIRS
4|SITTING
5|STANDING
6|LAYING

##Features

###Feature selection

The selection of the orignal features to comply with the assignment requirements is a bit difficult since exposure to machine learning, the specific machine learning problem being studied, the physics of the problem, the sensors involved and the **future use** of the tidy dataset is required to make an informed choice.  For example, the question "should feature fBodyAcc-meanFreq()-X be included" only makes sense if we know what the future use of the tidy data set will be.  My guess is that since the inputs are normalized, the recipient of the tidy data set would need the mean frequency of the body component of the accelerometer in X **only** if she intends to recalculate the original frequency; the measure itself is fBodyAcc-X and we are interested in its mean and standard deviation.  Using this rationale I took two initiatives:

* Only select measurement means that have a corresponding standard deviation
* Implement a mechanism to easily include additional features (see the README file)

###Feature naming

Since the script uses the *sqldf* library the feature names have been changed to make them compliant with what the library expects.  If you add features please make sure their name only consists of letters and numbers.  

Most of the original naming convention is used, the first character is *t* or *f* indicating if the measurement is on the time or frequency domains followed by the name of the component being measured.  If the measurement has a spatial component it is appended as *X* *Y* or *Z* at the end of the name followed by *M* for mean or *S* for standard deviation.

###Feature description

Note that the *id* field corresponds to the first column of the feature in the *features.txt* file.

id|name|description
-|-|-
*Time features*||
1 | tBodyAccXM | Body component of the accelerometer value, X coordinate, mean
2 | tBodyAccYM | Body component of the accelerometer value, Y coordinate, mean
3 | tBodyAccZM | Body component of the accelerometer value, Z coordinate, mean
4 | tBodyAccXS | Body component of the accelerometer value, X coordinate, standard deviation
5 | tBodyAccYS | Body component of the accelerometer value, Y coordinate, standard deviation
6 | tBodyAccZS | Body component of the accelerometer value, Z coordinate, standard deviation
41 | tGravityAccXM | Gravity component of the accelerometer value, X coordinate, mean
42 | tGravityAccYM | Gravity component of the accelerometer value, Y coordinate, mean
43 | tGravityAccZM | Gravity component of the accelerometer value, Z coordinate, mean
44 | tGravityAccXS | Gravity component of the accelerometer value, X coordinate, standard deviation
45 | tGravityAccYS | Gravity component of the accelerometer value, Y coordinate, standard deviation
46 | tGravityAccZS | Gravity component of the accelerometer value, Z coordinate, standard deviation
81 | tBodyAccJerkXM | Change of acceleration over time, body component, X coordinate, mean
82 | tBodyAccJerkYM | Change of acceleration over time, body component, Y coordinate, mean
83 | tBodyAccJerkZM | Change of acceleration over time, body component, Z coordinate, mean
84 | tBodyAccJerkXS | Change of acceleration over time, body component, X coordinate, standard deviation
85 | tBodyAccJerkYS | Change of acceleration over time, body component, Y coordinate, standard deviation
86 | tBodyAccJerkZS | Change of acceleration over time, body component, Z coordinate, standard deviation
121 | tBodyGyroXM | Body component of the gyroscope value, X coordinate, mean
122 | tBodyGyroYM | Body component of the gyroscope value, Y coordinate, mean
123 | tBodyGyroZM | Body component of the gyroscope value, Z coordinate, mean
124 | tBodyGyroXS | Body component of the gyroscope value, X coordinate, standard deviation
125 | tBodyGyroYS | Body component of the gyroscope value, Y coordinate, standard deviation
126 | tBodyGyroZS | Body component of the gyroscope value, Z coordinate, standard deviation
161 | tBodyGyroJerkXM | Change of angular velocity over time, body component, X coordinate, mean
162 | tBodyGyroJerkYM | Change of angular velocity over time, body component, Y coordinate, mean
163 | tBodyGyroJerkZM | Change of angular velocity over time, body component, Z coordinate, mean
164 | tBodyGyroJerkXS | Change of angular velocity over time, body component, X coordinate, standard deviation
165 | tBodyGyroJerkYS | Change of angular velocity over time, body component, Y coordinate, standard deviation
166 | tBodyGyroJerkZS | Change of angular velocity over time, body component, Z coordinate, standard deviation
201 | tBodyAccMagM | Magnitude of the linear acceleration, body component, mean
202 | tBodyAccMagS | Magnitude of the linear acceleration, body component, standard deviation
214 | tGravityAccMagM | Magnitude of the linear acceleration, gravity component, mean
215 | tGravityAccMagS | Magnitude of the linear acceleration, gravity component, standard deviation
227 | tBodyAccJerkMagM | Magnitude of the change of acceleration over time, body component, mean
228 | tBodyAccJerkMagS | Magnitude of the change of acceleration over time, body component, standard deviation
240 | tBodyGyroMagM | Magnitude of angular velocity, body component, mean
241 | tBodyGyroMagS | Magnitude of angular velocity, body component, standard deviation
253 | tBodyGyroJerkMagM | Change of angular velocity over time, body component, mean
254 | tBodyGyroJerkMagS | Change of angular velocity over time, body component, standard deviation
*Frequency features*||
266 | fBodyAccXM | Body component of the accelerometer value, X coordinate, mean frequency
267 | fBodyAccYM | Body component of the accelerometer value, Y coordinate, mean frequency
268 | fBodyAccZM | Body component of the accelerometer value, Z coordinate, mean frequency
269 | fBodyAccXS | Body component of the accelerometer value, X coordinate, frequency standard deviation
270 | fBodyAccYS | Body component of the accelerometer value, Y coordinate, frequency standard deviation
271 | fBodyAccZS | Body component of the accelerometer value, Z coordinate, frequency standard deviation
345 | fBodyAccJerkXM | Change of acceleration over time, body component, X coordinate, mean frequency
346 | fBodyAccJerkYM | Change of acceleration over time, body component, Y coordinate, mean frequency
347 | fBodyAccJerkZM | Change of acceleration over time, body component, Z coordinate, mean frequency
348 | fBodyAccJerkXS | Change of acceleration over time, body component, X coordinate, frequency standard deviation
349 | fBodyAccJerkYS | Change of acceleration over time, body component, Y coordinate, frequency standard deviation
350 | fBodyAccJerkZS | Change of acceleration over time, body component, Z coordinate, frequency standard deviation
424 | fBodyGyroXM | Body component of the gyroscope value, X coordinate, mean frequency
425 | fBodyGyroYM | Body component of the gyroscope value, Y coordinate, mean frequency
426 | fBodyGyroZM | Body component of the gyroscope value, Z coordinate, mean frequency
427 | fBodyGyroXS | Body component of the gyroscope value, X coordinate, frequency standard deviation
428 | fBodyGyroYS | Body component of the gyroscope value, X coordinate, frequency standard deviation
429 | fBodyGyroZS | Body component of the gyroscope value, X coordinate, frequency standard deviation
503 | fBodyAccMagM | Magnitude of the linear acceleration, body component, mean frequency
504 | fBodyAccMagS | Magnitude of the linear acceleration, body component, frequency standard deviation
516 | fBodyBodyAccJerkMagM | Magnitude of the change of acceleration over time, body component, mean frequency
517 | fBodyBodyAccJerkMagS | Magnitude of the change of acceleration over time, body component, frequency standard deviation
529 | fBodyBodyGyroMagM | Magnitude of angular velocity, body component, mean frequency
530 | fBodyBodyGyroMagS | Magnitude of angular velocity, body component, frequency standard deviation
542 | fBodyBodyGyroJerkMagM | Change of angular velocity over time, body component, mean frequency
543 | fBodyBodyGyroJerkMagS | Change of angular velocity over time, body component, frequency standard deviation

For information on how each feature is created please refer to the original *features_info.txt* file.
