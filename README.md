---
title: "README"
author: "Titos Dragonas"
date: "July 22, 2015"
output: html_document
---

#How to run the **run_analysis.R** script

##Requirements
1. The Samsung Data [zip file](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
1. The *run_analysis.R* script
1. The *cols.txt* column definition file
1. The *sqldf* package installed in your R environment.  Install with `install.packages("sqldf")`.

##Instructions
1. Unzip the Samsung Data zip file.
2. Copy *run_analysis.R* and *cols.txt* to the root folder of the unzipped file **or** set the *dataDir* variable to the directory where the zipfile was unzipped by using `dataDir="<location of the samsung data>"`
2. Set your working directory to where *run_analyisis.R* is by issuing the `setwd(<location>)` command.
3. Run *run_analysis.R* by issuing the `source("run_analysis.R")` command.
4. Once the script ends (it may take a while), the tidy data frame is held in the *result* object. use `write.table(result,file="tidy.txt",row.name=FALSE)` to save the dataframe to *tidy.txt*

**important**: please make sure the cols.txt file is in the same directory as the run_analysis.R script.

##Example
Assume you have unzipped the dataset file to ~/getdata/dataset and that both run_analysis.R and cols.txt are placed in ~/getdata/script

```
> dataDir="~/getdata/dataset"

> setwd("~/getdata/script")

> source("run_analysis.R")

> str(result)

'data.frame':	11880 obs. of  5 variables:
 $ subject : Factor w/ 30 levels "1","2","3","4",..: 1 1 1 1 1 1 2 2 2 2 ...
 $ activity: Factor w/ 6 levels "WALKING","WALKING_UPSTAIRS",..: 6 4 5 1 3 2 6 4 5 1 ...
 $ feature : Factor w/ 66 levels "fBodyAccJerkXM",..: 37 37 37 37 37 37 37 37 37 37 ...
 $ mean    : num  0.222 0.261 0.279 0.277 0.289 ...
 $ stdev   : num  0.16893 0.06333 0.00799 0.04639 0.08416 ...
```

##Adding/removing measurements
You can add or remove measurements from the tidy dataset by editing the cols.txt file.

To remove a measurement just remove the corresponding line in the file. 

To add a measurement find the measurement's id in the *features.txt* file, generate a name for it as specified in the codebook's section *"Feature naming"* and add a line in *cols.txt* with the corresponding id and name within quotes.