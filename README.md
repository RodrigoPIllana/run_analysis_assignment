# run_analysis_assignment
This is the assignment for Getting and Cleaning Data Course.
This file downloads the required data. It is important to note that writing the desired working directory is suggested in line
2. After loading the different data files into R, with observations from both training and testing, the data files are merged
into one unique data set, which is then given the appropiate names of attributes. Afterwards, the dataset is filtered so as to keep only 
mean and standard deviation columns. The names are then modified in order to facilitate comprehension. Finally, another dataset is created,
containing just one row for each subject and activity (obtained through averaging). This is the final clean dataset. 
