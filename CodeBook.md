This is the CodeBook for the Getting and Cleaning Data Course Assignment.
This is the process followed to clean the data:
The data is obtained from six files: X_test.txt, y_test.txt, subject_test.txt, X_train.txt, y_train.txt and subject_train.txt.
The column names are obtained from features.txt, added to two other column names: subjects and activities.
Measurement on other variables different than mean and standard deviations are dropped.
Using the file activity_labels.txt, descriptive names are given to the activities.
Then, more appropiate labels are given to the variable names, facilitating comprehension of the dataset.
Finally, a new dataset is created in order to achieve just one row per subject and activity, taking an average of the different values.

The final dataset is composed of 180 observations and 68 variables.

Regarding to the variables, and due to my lack of expertise on this subject,the rest of this codebook is a mere adaptation of the original
codebook from:
"Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz.
Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine.
International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012"
The adaptation aims to account for the changes in the variable names.


The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals Time Body Acceleration-XYZ and Time Gyroscope-XYZ.
These time domain signals were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass
Butterworth filter with a corner frequency of 20 Hz to remove noise.
Similarly, the acceleration signal was then separated into body and gravity acceleration signals (Time Body Acceleration-XYZ and Time Gravity Acceleration-XYZ) 
using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (Time Body Acceleration  Jerk signals-XYZ 
and Time Gyroscope  Jerk signals-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (Time Body Acceleration  Magnitude, 
Time Gravity Acceleration  Magnitude, Time Body Acceleration  Jerk signals  Magnitude, Time   Gyroscope  Magnitude, Time Gyroscope  Jerk signals  Magnitude). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing Freq Body Acceleration-XYZ, 
Freq Body Acceleration  Jerk signals-XYZ, Freq Gyroscope-XYZ, Freq Body Body Acceleration Jerk signals,
Freq  Body Gyroscope  Magnitude, Freq  Body Gyroscope  Jerk signals  Magnitude. 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
