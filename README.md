03-Getting-and-Cleaning-Data peer assessment
============================

The Codebook.md holds the definition about data.

The run_analysis.R does the following steps:

1. Loading
  1. Loading the test data
  2. Loading the train data
  3. Loading the column names
  4. Loading the labels
  5. loading the subject data for the test and train data
  6. loading the activity data for the test and train data

2. Columns pre setup
  1. Creating a vector only for mean and std containing columns
  2. Selecting only the mean and std containing columns
  3. Adding the name of the additional 2 columns

3. Combining data
  1. Appending the subject and activity data to the main datasets
  2. Setting the column names of the datasets
  3. Putting together rows - appending the test and the train data
  4. Relabel the activity names - replace the numbers to labels
  5. Creating the aggregate

4. Save
  1. Writing to file to save the summary

