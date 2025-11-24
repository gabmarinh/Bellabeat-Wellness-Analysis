# Bellabeat Wellness Analysis Script
# Author: Gabriel Marín Huerta
# Date: November 2025

# 1. LOAD LIBRARIES
library(tidyverse)
library(lubridate)
library(ggplot2)

# 2. IMPORT DATA
# daily_activity <- read_csv("dailyActivity_merged.csv")
# sleep_day <- read_csv("sleepDay_merged.csv")

# 3. DATA CLEANING & MERGING
# Fix date formats
# daily_activity$ActivityDate <- as.Date(daily_activity$ActivityDate, format="%m/%d/%Y")
# sleep_day$SleepDay <- as.Date(sleep_day$SleepDay, format="%m/%d/%Y")

# Merge datasets
# combined_data <- merge(daily_activity, sleep_day, by.x=c("Id", "ActivityDate"), by.y=c("Id", "SleepDay"))

# 4. ANALYSIS
# Check Summary Statistics to find sedentary behavior
# summary(combined_data$TotalSteps)
# summary(combined_data$SedentaryMinutes)
# summary(combined_data$TotalMinutesAsleep)

# Insight: Average sedentary time is approx 991 minutes (16.5 hours).

# 5. VISUALIZATION
# Scatterplot: Steps vs Calories
# ggplot(data=combined_data, aes(x=TotalSteps, y=Calories)) + 
#   geom_point() + 
#   geom_smooth() + 
#   labs(title="Correlation: Total Steps vs. Calories Burned",
#        subtitle = "Positive correlation indicates tracking motivates movement")