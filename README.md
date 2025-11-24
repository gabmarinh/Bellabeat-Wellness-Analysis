# 🏃‍♀️ Case Study: Bellabeat Wellness Analysis
### Unlocking Growth Opportunities in the Smart Device Market

**Author:** Gabriel Marín Huerta
**Role:** Junior Data Analyst
**Date:** November 2025
**Tools:** R (RStudio), ggplot2
**Focus:** Consumer Trends & Digital Marketing Strategy

---

## 📑 Executive Summary
[cite_start]Bellabeat, a high-tech manufacturer of health-focused products for women, aims to become a larger player in the global smart device market[cite: 236]. By analyzing smart device usage data from non-Bellabeat products (Fitbit), I identified key opportunities in **sleep tracking consistency** and **sedentary behavior management**. My recommendation is to reposition the **Bellabeat Leaf** and **App** not just as trackers, but as holistic 24/7 wellness coaches that prioritize comfort and actionable alerts.

---

## 1. ❓ Ask Phase
### Business Task
[cite_start]Urška Sršen, Bellabeat’s co-founder, has requested an analysis of smart device usage data to gain insight into how consumers use non-Bellabeat smart devices[cite: 274]. [cite_start]The goal is to apply these insights to one Bellabeat product to influence the marketing strategy[cite: 275].

### Key Questions
1.  [cite_start]What are some trends in smart device usage? [cite: 277]
2.  [cite_start]How could these trends apply to Bellabeat customers? [cite: 278]
3.  [cite_start]How could these trends help influence Bellabeat marketing strategy? [cite: 279]

### Stakeholders
* [cite_start]**Urška Sršen:** Bellabeat’s cofounder and Chief Creative Officer[cite: 244].
* [cite_start]**Marketing Analytics Team:** Responsible for collecting and analyzing data to guide strategy[cite: 246].

---

## 2. 💻 Prepare Phase
### Data Source
[cite_start]I utilized the **FitBit Fitness Tracker Data** (CC0: Public Domain, available via Kaggle)[cite: 300]. [cite_start]This dataset contains personal fitness tracker data from **thirty (30) eligible Fitbit users** who consented to submit their personal tracker data[cite: 300, 301].

### Data Organization & Integrity (ROCCC Analysis)
* **Reliable:** Low. [cite_start]The sample size (30 users) is small and may not fully represent the global female population Bellabeat targets[cite: 300].
* **Original:** No. Collected by a third party (Amazon Mechanical Turk).
* **Comprehensive:** Medium. [cite_start]Includes daily activity, steps, heart rate, and sleep monitoring, but lacks demographic info[cite: 301, 302].
* [cite_start]**Current:** No. Data is from 2016. Habits may have evolved[cite: 300].
* **Cited:** Yes.

*Strategy:* Despite limitations, this data provides a directional baseline for general usage habits (steps vs. sleep) which is sufficient for this initial exploratory analysis.

---

## 3. 🛠 Process Phase
[cite_start]I selected **R** for this analysis due to its strong visualization libraries (`ggplot2`) and ability to handle multiple dataframes efficiently[cite: 344].

### Code Snippet: Setting up and Merging
I focused on three key dataframes: `dailyActivity`, `sleepDay`, and `weightLog`.

```r
library(tidyverse)
library(lubridate)

# Import datasets
daily_activity <- read_csv("dailyActivity_merged.csv")
sleep_day <- read_csv("sleepDay_merged.csv")
```

Data Cleaning Steps
1. Date Formatting: Fitbit data often has inconsistent timestamp formats. I standardized them to Date type.
2. Renaming: Renamed columns to ensure consistency before merging.
3. Merging: Combined activity and sleep data into a single dataframe for cross-analysis.
```r
# Cleaning Date Formats 
daily_activity$ActivityDate <- as.Date(daily_activity$ActivityDate, format="%m/%d/%Y")
sleep_day$SleepDay <- as.Date(sleep_day$SleepDay, format="%m/%d/%Y")

# Merging Data
combined_data <- merge(daily_activity, sleep_day, by.x=c("Id", "ActivityDate"), by.y=c("Id", "SleepDay"))
```
## 4. 📊 Analyze Phase
I analyzed the merged data to discover how users actually interact with their trackers.

Key Findings
- The "Sedentary" Problem: The average user is sedentary for 991 minutes (approx. 16.5 hours) per day. Even people with trackers spend most of their day inactive.
- Inconsistent Sleep Tracking: While 30 users tracked steps, only 24 users tracked sleep. This suggests discomfort or battery anxiety at night.
- Steps vs. Calories: There is a strong positive correlation between steps taken and calories burned, but "Very Active Minutes" are generally low across the board.

Summary Statiscs

```r
# Summary Statistics
summary(combined_data$TotalSteps)
summary(combined_data$TotalMinutesAsleep)
summary(combined_data$SedentaryMinutes)
```

## 5. 📉 Share Phase (Visualizations)
Note: The visualizations below were generated using ggplot2 in R.

Visualization 1: Scatterplot (Total Steps vs. Calories)
Shows a clear linear progression. However, outliers exist where users burn calories without high steps (likely yoga or weightlifting), which Fitbit doesn't capture well.

Visualization 2: Daily Usage Patterns
The data shows inconsistent tracking, especially regarding sleep duration versus time in bed.

R Code for Visualization
```r
ggplot(data=combined_data, aes(x=TotalSteps, y=Calories)) + 
  geom_point() + 
  geom_smooth() + 
  labs(title="Total Steps vs. Calories")
```

## 6. 🚀 Act Phase (Recommendations)
Based on the analysis, I recommend focusing marketing efforts on the Bellabeat App and Leaf Tracker.

Strategy 1: "The Comfort Campaign" (Targeting Sleep)
   - Insight: Users often stop tracking sleep (drop from 30 to 24 users). Existing trackers are likely uncomfortable at night.
   - Action: Market the Bellabeat Leaf specifically as the "Sleep-Friendly Tracker".
   - Marketing Slogan: "Tracks your dreams without disrupting them." Highlight its clip/necklace versatility vs. bulky wristbands.

Strategy 2: "Anti-Sedentary" Alerts
   - Insight: Users spend 16+ hours sedentary.
   - Action: Update the Bellabeat App to include "Wellness Breaks". Instead of just "Move!" alerts, offer short, women-focused content (e.g., "5-minute desk stretch" or "2-minute breathing exercise").

Why: Converts passive data (sedentary minutes) into active engagement.

Strategy 3: Holistic Health (Beyond Steps)
   - Insight: Steps don't capture the full picture (yoga, stress, cycle).
   - Action: Emphasize Bellabeat’s unique value proposition: correlating cycle tracking with activity levels.
   - Feature: "Energy Sync." The app should predict days of lower energy based on the menstrual cycle and suggest lighter activities (yoga) instead of 10k steps.
