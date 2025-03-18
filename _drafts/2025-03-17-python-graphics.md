---
title: "Python Graphics"
categories:
  - Blog
tags:
  - ISLP
  - Notes
  - ML
use_math: true
---
# **Matplotlib: A Python Library for Data Visualization**

Matplotlib is a widely used Python library for creating static, animated, and interactive visualizations. It provides control over plots and is particularly useful for scientific and engineering applications.

---

## **1. Installation**  
If you don’t have Matplotlib installed, you can install it using:  
```bash
pip install matplotlib
```

---

## **2. Basic Usage**
### **Plot a Simple Line Graph**
```python
import matplotlib.pyplot as plt

x = [1, 2, 3, 4, 5]
y = [10, 12, 15, 18, 20]

plt.plot(x, y, marker='o', linestyle='-')  # Line plot with markers
plt.xlabel("X-axis")
plt.ylabel("Y-axis")
plt.title("Simple Line Graph")
plt.show()  # Display the plot
```

---

## **3. Key Components of Matplotlib**
### **(a) `Figure` and `Axes`**
Matplotlib follows an object-oriented approach where:
- **Figure** (`fig`) is the entire plotting window.
- **Axes** (`ax`) is the specific plot or graph within the figure.

```python
fig, ax = plt.subplots()  # Creates a figure with one subplot
ax.plot([1, 2, 3], [4, 5, 6])
plt.show()
```

### **(b) Multiple Subplots**
You can create multiple subplots within a figure.
```python
fig, axes = plt.subplots(nrows=1, ncols=2)  # Two subplots in one row

axes[0].plot([1, 2, 3], [4, 5, 6])
axes[0].set_title("First Plot")

axes[1].plot([1, 2, 3], [6, 5, 4])
axes[1].set_title("Second Plot")


plt.show()
```

---

## **4. Common Types of Plots**
### **(a) Line Plot**
```python
plt.plot([1, 2, 3, 4], [10, 20, 25, 30], marker='o')
plt.show()
```

### **(b) Scatter Plot**
```python
plt.scatter([1, 2, 3, 4], [10, 20, 25, 30], color='red')
plt.show()
```

### **(c) Bar Chart**
```python
plt.bar(['A', 'B', 'C'], [3, 7, 5], color='blue')
plt.show()
```

### **(d) Histogram**
```python
import numpy as np
data = np.random.randn(1000)
plt.hist(data, bins=30, edgecolor='black')
plt.show()
```

### **(e) Pie Chart**
```python
plt.pie([10, 20, 30], labels=['A', 'B', 'C'], autopct='%1.1f%%')
plt.show()
```

---

## **5. Customizing Plots**
Matplotlib allows extensive customization.

### **(a) Adding Labels, Title, and Grid**
```python
plt.plot([1, 2, 3], [4, 5, 6])
plt.xlabel("X Label")
plt.ylabel("Y Label")
plt.title("Plot Title")
plt.grid(True)
plt.show()
```

### **(b) Changing Line Styles and Colors**
```python
plt.plot([1, 2, 3], [4, 5, 6], linestyle='--', color='red', marker='s')
plt.show()
```

---

## **6. Interactive Mode**
To make Matplotlib interactive, use:
```python
plt.ion()  # Enable interactive mode
```
This is useful in Jupyter Notebooks and interactive environments.

---

## **7. Saving Figures**
```python
plt.savefig("plot.png", dpi=300)  # Saves the plot as an image
```

---

## **8. Contour Plots in Matplotlib**

The `contour()` method in Matplotlib is used to create **contour plots**, which represent **3D data in a 2D format** using contour lines.

---

### **1. Syntax**
```python
plt.contour(X, Y, Z, levels=10, cmap='viridis')
```
- `X, Y`: Coordinate matrices (can be created using `np.meshgrid()`).
- `Z`: Function values at `(X, Y)`, defining the height.
- `levels`: Number of contour lines or specific levels.
- `cmap`: Colormap for visualization.

---

### **2. Example: Basic Contour Plot**
```python
import numpy as np
import matplotlib.pyplot as plt

# Define a function for Z values
def f(x, y):
    return np.sin(x) ** 2 + np.cos(y) ** 2

# Create meshgrid for X, Y
x = np.linspace(-2 * np.pi, 2 * np.pi, 100)
y = np.linspace(-2 * np.pi, 2 * np.pi, 100)
X, Y = np.meshgrid(x, y)
Z = f(X, Y)  # Compute Z values

# Create contour plot
plt.contour(X, Y, Z, levels=20, cmap='viridis')
plt.colorbar(label="Function Value")  # Add color bar
plt.title("Contour Plot of f(x, y)")
plt.xlabel("X-axis")
plt.ylabel("Y-axis")
plt.show()
```

---

### **3. Filled Contour Plot (`contourf()`)**
For **filled regions** instead of just lines:
```python
plt.contourf(X, Y, Z, levels=20, cmap='coolwarm')
plt.colorbar()
plt.show()
```

---

### **4. Adding Contour Labels**
```python
contours = plt.contour(X, Y, Z, levels=10, cmap='plasma')
plt.clabel(contours, inline=True, fontsize=10)  # Add labels to contours
plt.show()
```

---

### **5. When to Use `contour()`?**
- **Visualizing 3D data** in a **2D plane** (e.g., heatmaps, elevation maps).
- **Comparing function values** over a range.
- **Representing gradients** in physical simulations.




## **Conclusion**
Matplotlib is a powerful library for creating a wide range of plots with high customizability. For more advanced visualizations, you may use **Seaborn**, which is built on top of Matplotlib.
