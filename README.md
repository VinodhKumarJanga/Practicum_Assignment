# Practicum_Assignment

1. Package Installation:
   - The code starts by installing the necessary packages: "dplyr," "readxl," and "ggplot2."

2. Package Loading:
   - The installed packages are loaded into the R session using the `library()` function.

3. Reading Data from Excel Sheets:
   - The code reads data from two sheets of an Excel file named "presidential_polls_2020.xlsx" and assigns them to the variables `presidential_ds1` and `presidential_ds2`.

4. Converting Data Types:
   - Certain columns in the datasets are converted to the desired data types using the `as.character()` and `as.numeric()` functions.

5. Combining Data:
   - The two datasets (`presidential_ds1` and `presidential_ds2`) are combined using the `bind_rows()` function and stored in the variable `ds_presidential`.

6. Renaming Columns:
   - Specific columns in the `ds_presidential` dataset are renamed using the `rename()` function.

7. Removing Duplicates:
   - Duplicate rows in the `ds_presidential` dataset are removed using the `unique()` function and stored in the variable `ds_presidential1`.

8. Handling Missing Values:
   - Missing values in the `ds_presidential1` dataset are replaced with the mean value of each respective column using the `mutate_if()` function.

9. Removing Missing Values:
   - Rows with missing values in the `ds_presidential2` dataset are removed using the `na.omit()` function and stored in the variable `ds_presidential3`.

10. Removing Outliers:
    - Rows in the `ds_presidential3` dataset where the `samplesize` column is less than 25000 are filtered out, creating a new dataset named `ds_presidential_outliers`.

11. Creating a Box Plot:
    - The code generates a box plot using the `ggplot2` package to visualize the distribution of sample sizes in the `ds_presidential_outliers` dataset.

12. Creating a Histogram:
    - A histogram is created using the `ggplot2` package to visualize the distribution of sample sizes in the `ds_presidential_outliers` dataset.

13. Writing Cleaned Dataset to CSV:
    - The `ds_presidential_outliers` dataset is saved as a CSV file named "cleaned_presidential_dataset.csv" using the `write.csv()` function.
