---
title: "Codebook"
author: "Ainaaf"
date: "11 May 2016"
output: html_document
---

##Feature Selection 


The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tgyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tbodyaccxyz and tgravityacc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain jerk signals (tbodyaccjerkxyz and tbodygyrojerkxyz). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccmag, tgravityaccmag, tbodyaccjerkmag, tbodygyromag, tbodygyrojerkmag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fbodyaccxyz, fbodyaccjerkxyz, fbodygyroxyz, fbodyaccjerkmag, fbodygyromag, fbodygyrojerkmag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'xyz' is used to denote 3-axial signals in the X, Y and Z directions. 


* tbodyaccxyz  
* tgravityaccxyz
* tbodyaccjerkxyz
* tbodygyroxyz
* tbodygyrojerkxyz
* tbodyaccmag
* tgravityaccmag
* tbodyaccjerkmag
* tbodygyromag
* tbodygyrojerkmag
* fbodyaccxyz
* fbodyaccjerkxyz
* fbodygyroxyz
* fbodyaccmag
* fbodyaccjerkmag
* fbodygyromag
* fbodygyrojerkmag

The set of variables that were estimated from these signals are: 

mean: mean value
std: Standard deviation

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle variable:

gravitymean
tbodyaccmean
tbodyaccjerkmean
tbodygyromean
tbodygyrojerkmean

### Note on the units
The initial raw measurements were taken in radians/second, but the values found 
here have been treated and normalised so as to fit in the [-1,1] range. 