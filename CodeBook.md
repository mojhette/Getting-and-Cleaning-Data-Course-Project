 -- Code Book --

 -- Introduction --
 
Creation of a R script called run_analysis.R :

Open all necessary library and change work directory

1. Merges the training and the test sets to create one data set.
    Open files (X_train, y_train, subject_train, X_test, y_test, subject_test)
    Merge each X, Y and subset data set with rbind
    
2. Extracts only the measurements on the mean and standard deviation for each measurement

    Open files features
    get only columns with mean() or std() in their names with grep
    subset the desired columns
    correct the column names of x_data
    
3. Uses descriptive activity names to name the activities in the data set

    Open files activities
    change column name of y_data

4. Appropriately labels the data set with descriptive variable names.

    Change column name of subject
    Merge x_data, y_data and subject_data with c_bind
    
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject

    create a Outpout variable
    export tidy data in txt file
    
    
 -- Variables --

1 - Raw data & label data

  X_train, y_train, subject_train, X_test, y_test, subject_test, features, activities
  
2 - Rbind variable (merge of each X, Y and subject)

  x_data, y_data, subject_data
  
3 - Merge dataset of x_data, y_data, subject_data

  Final
  
4 - Export data in txt file

  Output.txt



