# CookBook

# Input Data

The script assumes the UCI dataset is extracted directly into `./` folder.

# Output Data

The resulting `./tidy_data.txt` dataset includes mean and standard deviation variables for the following original variables,

tBodyAcc, tGravityAcc, tBodyAccJerk, tBodyGyro, tBodyGyroJerk, tBodyAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag, fBodyAcc, fBodyAccJerk, fBodyGyro, fBodyAccMag, fBodyBodyAccJerkMag, fBodyBodyGyroMag, fBodyBodyGyroJerkMag by three directions: X, Y , Z.

The above variables where choosen have their original names.

# Raw data pricessing

The `run_analysis.R` script does the following:

* Load files from UCI dataset (`UCI HAR Dataset` folder)
* Merges the `test` and `train` files into a single data table
* Creates subset, which contains only mean and std variables
* Computes the means of this secondary dataset, group by subject and activity.
* Saves this final dataset to `./tidy_data.txt`