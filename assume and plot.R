# Load necessary library
install.packages("ggplot2")
library(ggplot2)

# Set seed for reproducibility
set.seed(0)

# Generate data
num_friends <- 20
friend_ids <- 1:num_friends  # Friend IDs
true_heights <- rnorm(num_friends, 175, 10) # Random true heights

# Generating measurement data
edward_measurements <- true_heights + rnorm(num_friends, 0, 1)
hugo_measurements <- true_heights + rnorm(num_friends, 0, 1.5)
lucy_measurements <- true_heights + rnorm(num_friends, 0, 2)

# Create data frame
data <- data.frame(
  id = rep(friend_ids, 4),
  height = c(true_heights, edward_measurements, hugo_measurements, lucy_measurements),
  measurer = factor(rep(c('True', 'Edward', 'Hugo', 'Lucy'), each = num_friends))
)

# Plot scatter plot
ggplot(data, aes(x = id, y = height, color = measurer)) +
  geom_point() +
  theme_minimal() +
  labs(title = "Height Measurements by Edward, Hugo, Lucy vs. True Heights",
       x = "Friend ID",
       y = "Height (cm)")
