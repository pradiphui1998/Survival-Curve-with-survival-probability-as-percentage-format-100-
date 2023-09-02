# Load the required packages
library(survival)
library(survminer)

# Create two survival curves
fit1 <- survfit(Surv(time, status) ~ sex, data = lung)

# Create the survival plot
p1 <- ggsurvplot(fit1, add.all = TRUE)

# Multiply the y-axis scale by 100 to represent percentages
p1$plot <- p1$plot +
  scale_y_continuous(labels = scales::percent, 
                     breaks = scales::breaks_pretty(n = 10),
                     limits = c(0, 1),  # Set limits to ensure 0-100% range
                     expand = c(0, 0))

# Display the plot
print(p1)
