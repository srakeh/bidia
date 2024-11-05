# Install plotly package if not already installed
# install.packages("plotly")

# Load necessary libraries
library(scatterplot3d)
library(plotly)

# Set seed for reproducibility
set.seed(42)

# 1. Bar Plot (Vertical) with 3 categories
# We'll use 'cyl' (number of cylinders) as the category and sum up 'mpg' (miles per gallon)
bar_data <- aggregate(mtcars$mpg, by = list(Cylinder = mtcars$cyl), FUN = sum)

barplot(bar_data$x, 
        names.arg = bar_data$Cylinder, 
        col = c("red", "blue", "green"),
        main = "Bar Plot of Cylinder vs Total MPG",
        ylab = "Total MPG")

# 2. Histogram
# We'll use the 'mpg' (miles per gallon) for the histogram
hist(mtcars$mpg, 
     col = "skyblue", 
     main = "Histogram of Miles Per Gallon (mpg)",
     xlab = "MPG", 
     freq = TRUE)

# 3. Box Plot
# Comparing the distribution of 'mpg' and 'hp' (horsepower)
boxplot(mtcars$mpg, mtcars$hp, 
        col = c("orange", "lightgreen"), 
        names = c("MPG", "HP"),
        main = "Box Plot of MPG and HP",
        ylab = "Value")

# 4. Surface Plot: z = x^2 + y^2
# We'll use 'mpg' and 'hp' as the x and y values respectively for the surface plot
x_surface <- mtcars$mpg
y_surface <- mtcars$hp

# Create a grid of x and y values (using unique values)
x_grid <- seq(min(x_surface), max(x_surface), length.out = 100)
y_grid <- seq(min(y_surface), max(y_surface), length.out = 100)

# Surface plot using z = x^2 + y^2
z_surface <- outer(x_grid, y_grid, function(x, y) x^2 + y^2)

persp(x_grid, y_grid, z_surface, 
      col = "lightblue", 
      theta = 30, 
      phi = 30, 
      main = "Surface Plot of MPG and HP (z = x^2 + y^2)",
      xlab = "MPG", 
      ylab = "HP", 
      zlab = "Z axis")

# 5. Interactive 3D Scatter Plot
# Use mtcars data to plot mpg, hp, and wt in 3D
fig <- plot_ly(data = mtcars, 
               x = ~mpg, 
               y = ~hp, 
               z = ~wt, 
               type = "scatter3d", 
               mode = "markers",
               marker = list(size = 5, color = mtcars$cyl, colorscale = "Viridis"))

# Add labels and title for the 3D plot
fig <- fig %>% layout(scene = list(
  xaxis = list(title = 'Miles per Gallon (MPG)'),
  yaxis = list(title = 'Horsepower (HP)'),
  zaxis = list(title = 'Weight (WT)')),
  title = "3D Scatter Plot of MPG, HP, and WT")

# Show the interactive plot
fig

