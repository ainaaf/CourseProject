---
title: "ReadMe"
author: "Ainaaf"
date: "5 May 2016"
output: html_document
---

## Objective 
The ** Human Activity Recognition ** database was built from the recordings of 
30 subjects performing 6 different activities of daily living (ADL) while carrying a 
waist-mounted smartphone with embedded inertial sensors.

The data is made of over 20 different data files distributed into 4 diferent 
directories. The objective of this script is to take those files of raw data and 
summarise them into one tabular data set (a data frame called "HumanActivity")
that contains simple labels and is ready for analysis. 

Furthermore, it creates one other data frame "df" with the averages for each of 
the variables in "HumanActivity" for each subject performing each activity. 
This second dataframe is then stored onto a text file called "TidyData.txt".

The full description of the experiment and the measurements can be found here:
<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>

## Contents of this repo
* **run_analysis.R** : this script will download the raw data and process it to 
create a tidy data set that it will save as "TidyData.txt"
* **README.md:** this document
* **CodeBook.txt:** contains information about the variables contained in 
"TidyData.txt"
* **TidyData.txt:** the data frame created by "run_analysis.R"


## How to run the script

I recommend setting the working directory in the script (uncomment second line 
of the script). The script uses two packages that should be installed before 
running the script: **plyr** and **utils**. Besides that the script should just 
work normally. 




