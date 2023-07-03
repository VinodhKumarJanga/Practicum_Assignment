# Load necessary packages
install.packages("dplyr")
install.packages("readxl")
install.packages("ggplot2")
library(dplyr)
library(readxl)
library(ggplot2)

# Read data from Excel sheets
presidential_ds1 <- read_excel("/Users/vinodhjanga/Downloads/presidential_polls_2020.xlsx", sheet = 1)
presidential_ds2 <- read_excel("/Users/vinodhjanga/Downloads/presidential_polls_2020.xlsx", sheet = 2)

# Convert columns to the desired data types
presidential_ds1$weight <- as.character(presidential_ds1$weight)
presidential_ds2$startdate <- as.character(presidential_ds2$startdate) 
presidential_ds1$influence <- as.numeric(presidential_ds1$influence)
presidential_ds2$influence <- as.numeric(presidential_ds2$influence)
presidential_ds2$pct <- as.numeric(presidential_ds2$pct)


# Combine the data
ds_presidential <- bind_rows(presidential_ds1, presidential_ds2)

# Rename columns
ds_presidential_rename <- ds_presidential %>%
  rename(start_date = startdate, end_date = enddate)

# Remove duplicates
ds_presidential1 <- unique(ds_presidential_rename)

# Replace missing values with mean
ds_presidential2 <- ds_presidential1 %>%
  mutate_if(is.numeric, ~ifelse(is.na(.), mean(., na.rm = TRUE), .))

# Handling missing values
ds_presidential3 <- na.omit(ds_presidential2)

# Remove outliers based on the "samplesize" column
ds_presidential_outliers <- ds_presidential3 %>%
  filter(samplesize < 25000)

# Box plot
boxplot_plot <- ggplot(ds_presidential_outliers, aes(x = 1, y = samplesize)) +
  geom_boxplot(color = "skyblue") +
  ggtitle("Outliers in Sample Size")

# Histogram
histogram_plot <- ggplot(ds_presidential_outliers, aes(x = samplesize)) +
  geom_histogram(bins = 30, fill = "skyblue", color = "black") +
  labs(title = "Distribution of Sample Size",
       x = "Sample Size",
       y = "Count")

# Write cleaned dataset to a CSV file
write.csv(ds_presidential_outliers, "cleaned_presidential_dataset.csv", row.names = FALSE)
