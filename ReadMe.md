## The script works by joining dataframes.
# First all the train dataset are merged into one dataframe
# Then all the test dataset are merged into one dataframe
# Then test and train datasets are merged into one dataframe.
# The column names are read from the features file and assigned to above dataframe column names.
# Then activity names and their description is joined to the dataframe to create a readable description.
# Then r=the dataframe is grouped by subject and activity and averages are summarized for the grouped data. This is achived by piping operator
# The created dataframe is saved into a separate dataframe and text file which is the final tidy output.
# The codebook is attached as word document descripbing all the variables.