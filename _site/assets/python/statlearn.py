import numpy as np
import matplotlib.pyplot as plt

def curve_function(x):
    return x + 5 * (x ** 3)

# Generate 4000 x values sampled uniformly at random in the range [-2, 2]
x_values = np.random.uniform(-2, 2, 4000)

# Add N(0,1) error to each y value
y_values = curve_function(x_values) + np.random.normal(0, 1, 4000)

# Plot the points
plt.scatter(x_values, y_values, alpha=0.5, s=5, label="Noisy Data")
plt.xlabel("x values")
plt.ylabel("y values")
plt.title("Scatter Plot of Sampled Points")
plt.legend()
plt.show()

# Print the first 10 points as a sample
for i in range(10):
    print(f"Point on the curve: (x={x_values[i]:.4f}, y={y_values[i]:.4f})")
