---
title: "Python Data Handling"
categories:
  - Blog
tags:
  - ISLP
  - Notes
  - ML
use_math: true
---
A **DataFrame** is a two-dimensional, labeled data structure commonly used in data analysis and machine learning. It is similar to a table in a database, an Excel spreadsheet, or a dictionary of lists/arrays.

## **Key Features of a DataFrame**
- **Rows and Columns**: Organized in a tabular format with labeled rows and columns.
- **Heterogeneous Data**: Can store different data types (integers, floats, strings, etc.).
- **Indexing**: Supports labeled indexing for easy access to data.
- **Operations**: Supports filtering, aggregation, joining, and other transformations.

## **Example in Pandas**
```python
import pandas as pd

# Creating a DataFrame from a dictionary
data = {
    "Name": ["Alice", "Bob", "Charlie"],
    "Age": [25, 30, 35],
    "Salary": [50000, 60000, 70000]
}

df = pd.DataFrame(data)

print(df)
```

### **Output**
```
    Name  Age  Salary
0  Alice   25  50000
1    Bob   30  60000
2 Charlie  35  70000
```

## **Common DataFrame Operations**
### **1. Access Columns**
```python
df["Age"]  # Selects the "Age" column
```

### **2. Access Rows**
```python
df.loc[1]  # Selects the second row (index 1)
```

### **3. Filtering**
```python
df[df["Age"] > 28]  # Selects rows where Age > 28
```

## **Why Use DataFrames?**
- **Easy to manipulate and analyze data**.
- **Integration with other libraries like NumPy and Matplotlib**.
- **Optimized for performance and scalability**.
