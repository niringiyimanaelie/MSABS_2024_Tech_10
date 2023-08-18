library(tidyverse)
library(magrittr)
library(ggplot2)
library(lubridate)
library(readr)
library(forecast)

Q5 <- read_csv("Question_5_p2.csv")
# Visualize the data using a bar chart
plot <- ggplot(Q5, aes(x = as.factor(verified_purchase), y = avg_rating, fill = as.factor(verified_purchase))) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Average Rating by Verification Status",
       x = "Verified Purchase",
       y = "Average Rating") +
  scale_fill_manual(values = c("red", "blue"), name = "Purchase Status", labels = c("Not Verified", "Verified")) +
  theme_minimal()

print(plot)



Q6 <- read_csv("Question_6.csv")
# Histogram
histogram_plot <- ggplot(data, aes(x = star_rating)) +
  geom_histogram(binwidth = 1, fill = "steelblue", color = "black", alpha = 0.7) +
  labs(title = "Histogram of Star Ratings",
       x = "Star Rating",
       y = "Frequency") +
  theme_minimal()

print(histogram_plot)

# Density Plot
density_plot <- ggplot(data, aes(x = star_rating)) +
  geom_density(fill = "steelblue", alpha = 0.7) +
  labs(title = "Density Plot of Star Ratings",
       x = "Star Rating",
       y = "Density") +
  theme_minimal()

print(density_plot)


Q9 <- read_csv("Question_9.csv")

# Plot the time series
plot <- ggplot(data = Q9, aes(x = Q9$review_year, y = Q9$review_count)) +
  geom_line(color = "steelblue", size = 1) +
  geom_point(color = "red", size = 3) +
  labs(title = "Time Series of Helpful Reviews",
       x = "Year",
       y = "Number of Helpful Reviews") +
  
  theme_minimal()

print(plot)



Q8 <- read.csv("Question_8.csv")

# Create a date column for plotting
Q8["Date"] <- as.Date(paste(Q8$review_year, Q8$review_month, "01", sep="-"))

# Plot
ggplot(Q8, aes(x=factor(review_month, levels=1:12, labels=c("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")), y=number_of_reviews, group=review_year, color=factor(review_year))) +
  geom_line() +
  labs(title="Monthly Review Counts by Year", x="Month", y="Number of Reviews") +
  theme_minimal() +
  theme(legend.title=element_blank())  # Removes the legend title



ggplot(Q8, aes(x=factor(review_month, levels=1:12, labels=c("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")), y=number_of_reviews)) +
  geom_boxplot() +
  labs(title="Distribution of Monthly Review Counts Across Years", x="Month", y="Number of Reviews") +
  theme_minimal()



# Create a time series object
ts_data <- ts(Q8$number_of_reviews, frequency=12, start=c(min(Q8$review_year), min(Q8$review_month)))

# Decompose the time series
decomposed <- stl(ts_data, s.window="periodic")

# Plot
plot(decomposed)


Q10 <- read.csv("Question_10.csv")
# Plot
ggplot(Q10, aes(x=review_year, y=index_value)) +
  geom_line(group=1) +  # Ensure there's a single line connecting the points
  geom_point() +  # Display individual data points
  labs(title="Adjusted Number of Helpful Reviews Over Time", x="Year", y="Adjusted Index") +
  theme_minimal()


Q11_p1 <- read.csv("Question_11_p1.csv")
# Plot
ggplot(Q11_p1, aes(x=factor(vine, labels=c("Non-Vine", "Vine")), y=proportion_helpful)) +
  geom_bar(stat="identity", fill="steelblue") +
  geom_text(aes(label=sprintf("%.2f", proportion_helpful)), vjust=-0.5) +  # Displaying the proportion on the bars
  labs(title="Proportion of Helpful Reviews: Vine vs. Non-Vine", x="", y="Proportion of Helpful Reviews") +
  theme_minimal()

