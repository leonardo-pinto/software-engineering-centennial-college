from numpy import random


## Question 1
## 1.	Create a 2D numpy array of shape (3, 4) with random integer values between 1 and 10.
# arr = random.randint(1, 11, size=(3,4))
# print(arr)

## Question 2
## 2.	Create two 1D numpy arrays of size 5 each with random floating-point values. Perform element-wise addition, subtraction, multiplication, and division on these arrays.

# arr1 = random.rand(5)
# arr2 = random.rand(5)

# arr_add = arr1[:] + arr2[:]
# arr_sub = arr1[:] - arr2[:]
# arr_mult = arr1[:] * arr2[:]
# arr_div = arr1[:] / arr2[:]

# print('Array 1: ', arr1)
# print('Array 2: ', arr2)

# print('Array 1 + Array 2: ', arr_add)
# print('Array 1 - Array 2: ', arr_sub)
# print('Array 1 * Array 2: ', arr_mult)
# print('Array 1 / Array 2: ', arr_div)

## Question 3

# 3.	Create a 2D numpy array arr of shape (4, 5), extract the subarray consisting of the first 2 rows and the last 3 columns.

# arr = random.rand(4,5)
# sub_arr = arr[:2, -3:]

# print(arr)
# print(sub_arr)

## Question 4
## 4.	Create a 1D numpy array with integers from 1 to 5 and another with floating-point numbers from 1.0 to 5.0. Demonstrate how to change the data type of these arrays.

# import numpy as np

# arr_int = np.random.randint(10, size=5)
# arr_float = np.random.rand(5)

## change data type using the astype method
# new_arr_int = arr_float.astype(int)
# new_arr_float = arr_int.astype(float)
# print(arr_int)
# print(arr_float)
# print('New Array Int: ', new_arr_int)
# print('New Array Int: ', new_arr_float)


## Question 5
## Use matplotlib to plot a sine and cosine function over the range [0, 2π]. Include labels, title, and a legend.

# import matplotlib.pyplot as plt
# import numpy as np

# x = np.arange(0, 2*np.pi, 0.1)
# y_sin = np.sin(x)
# y_cos = np.cos(x)

# fig, (ax1, ax2) = plt.subplots(1, 2)
# ax1.plot(x, y_sin)
# ax1.set_title('Sine')
# ax1.set_ylabel('amplitude')
# ax2.plot(x, y_cos)
# ax2.set_title('Cosine')
# ax2.set_ylabel('amplitude')
# fig.suptitle("Sine and Cosine Functions")
# plt.show()


## Question 6

## 6.	Create a 2D numpy array matrix of shape (5, 5), extract all the elements in the anti-diagonal.

# import numpy as np

# arr = np.random.rand(5, 5)
# print(arr)

# anti_diagonal_arr = np.fliplr(arr).diagonal()
# print(anti_diagonal_arr)

## Question 7

## 7.	Create a 2D numpy array of shape (3, 3) and a 1D array of size 3. Use broadcasting to add the 1D array to each row of the 2D array.
# import numpy as np
# arr = np.random.rand(3,3)
# arr1 = np.random.rand(3)

# sum_arr = arr + arr1[:, np.newaxis]
# print(arr)
# print(arr1)

# print(sum_arr)

## Question 8
## Create a 1D numpy array of size 1000, replace all values greater than 5 with 0 and all values less than 2 with 10.

# import numpy as np

# arr = np.random.randint(0, 11, size=(10))
# arr_repl = arr.copy()
# print("Original array: ", arr)
# arr_repl[arr > 5] = 0
# arr_repl[arr < 2] = 10
# print("Final array: ", arr_repl)

## Question 9

## 9.	Create a 1D numpy array with 12 elements. Reshape it into a 3x4 array and then flatten it back to a 1D array.

# import numpy as np

# arr = np.random.rand(12)
# arr1 = arr.reshape(3,4)
# arr2 = arr1.flatten()
# print(arr)
# print(arr1)
# print(arr2)

## Question 10

# 10.	Simulate a 1D random walk of length 100. Starting at 0, each step can be +1 or -1 with equal probability. Plot the resulting walk using matplotlib.

# import matplotlib.pyplot as plt
# import numpy as np

# x=np.arange(0, 100)
# y=np.random.randint(-1, 2, size=100)
# sum_y = np.cumsum(y)
# plt.plot(x, sum_y)
# plt.show()

## Question 11

## 11.	Load an image using scikit-image, convert it to grayscale, and then apply Gaussian blur to the grayscale image. Display the original, grayscale, and blurred images. 

# import matplotlib.pyplot as plt
# from skimage import data
# from skimage import filters
# from skimage.color import rgb2gray

# original = data.astronaut()
# grayscale = rgb2gray(original)
# gaussian_blur = filters.gaussian(grayscale, 4)

# fig, ax = plt.subplots(1, 3, figsize=(8,4))
# # ax = axes.ravel()
# ax[0].imshow(original)
# ax[0].set_title("Original")
# ax[1].imshow(grayscale, cmap=plt.cm.gray)
# ax[1].set_title("Grayscale")
# ax[2].imshow(gaussian_blur,  cmap=plt.cm.gray)
# ax[2].set_title("Gaussian Filter")

# plt.show()

## Question 12

## 12.	Use scikit-image to perform image segmentation on a sample image. Display the original image and the segmented regions

# from skimage import data, img_as_float
# from skimage.color import rgb2gray
# from skimage.segmentation import chan_vese
# import matplotlib.pyplot as plt

# camera = img_as_float(data.camera())
# segmented_camera = chan_vese(camera, mu=0.25, lambda1=1, lambda2=1, tol=1e-3,
#                max_num_iter=200, dt=0.5, init_level_set="checkerboard",
#                extended_output=True)

# fig, ax = plt.subplots(1, 2, figsize=(8, 8))
# ax[0].imshow(camera, cmap="gray")
# ax[0].set_axis_off()
# ax[0].set_title("Original Image", fontsize=12)

# ax[1].imshow(segmented_camera[0], cmap="gray")
# ax[1].set_axis_off()
# title = f'Chan-Vese segmentation - {len(segmented_camera[2])} iterations'
# ax[1].set_title(title, fontsize=12)

# plt.show()

## Question 13
## 13.	Use the famous Iris dataset from scikit-learn's datasets module. Split the dataset into training and testing sets, train a Support Vector Machine (SVM) classifier, and evaluate its accuracy. 

# from sklearn import datasets
# from sklearn.model_selection import train_test_split
# from sklearn.svm import SVC
# from sklearn.metrics import accuracy_score

# iris=datasets.load_iris()
# X = iris.data
# y = iris.target

# X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.25, random_state=42)
# svm_classifier = SVC()
# svm_classifier.fit(X_train, y_train)
# y_prediction = svm_classifier.predict(X_test)

# svm_accuracy = accuracy_score(y_test, y_prediction)
# print("Accurary: ", svm_accuracy)

## Question 14
## 14.	Load the provided CSV file into a Pandas DataFrame, filter the data based on a specific condition, and then save the filtered data to an Excel file.


## Filtering data with Rating between 4.2 and 4.4
# import pandas as pd

# df = pd.read_csv('goodreads_top100.csv')
# df['Rating'] = pd.to_numeric(df['Rating'], errors='coerce')
# filtered_df = df[df['Rating'].between(4.2, 4.4)]
# filtered_df.to_excel('filtered_books.xlsx', sheet_name="books", index=False)

## Question 15

## 15.	Group the goodreads dataset by a genres and rating column, and calculate the mean and standard deviation for each group.

# import pandas as pd
# from ast import literal_eval

# data = pd.read_csv('goodreads_top100.csv')
# data['Rating'] = pd.to_numeric(data['Rating'], errors='coerce')
# data['Genres'] = data['Genres'].apply(literal_eval)
# data_exploded = data.explode('Genres')
# grouped_data = data_exploded.groupby('Genres')
# grouped_result = grouped_data.agg({'Rating': ['mean', 'std']}).reset_index()
# print(grouped_result)

## Question 16

## 16.	Create a Pandas DataFrame with missing values, then fill the missing values using forward fill and backward fill methods.

# import pandas as pd

# df = pd.DataFrame({
#     "A": [1, 2, None, 3, 4, None],
#     "B": [10, None, 30, 40, None, 60],
#     "C": [None, 100, None, None, 1, 87]
# })
# print(df)
# print('*** Forward Fill ***')
# print(df.ffill(axis = 0))
# print('*** Back Fill ***')
# print(df.bfill(axis = 0))

## Question 17
## 17.	Create two Pandas DataFrames, merge them based on a common column, and display the merged result

# import pandas as pd

# df1 = pd.DataFrame({
#     "name": ["John", "Jane", "Alfred"],
#     "age": [35, 25, 23],
# })

# df2 = pd.DataFrame({
#     "name": ["John", "Jane", "Alfred"],
#     "address": ["16 Rainbow Road", "10 Maple Street", "98 Acacia Avenue"],
# })

# merged = pd.merge(df1, df2, on='name')
# print(merged)

## Question 18
## 18.	Create a Pandas DataFrame with time series data, resample it to monthly frequency, and calculate the mean for each month.

# import pandas as pd

# idx = pd.date_range("2024-01-01", periods=200, freq='d')
# ts = pd.Series(range(len(idx)), index=idx)

# ts_resample = ts.resample("ME").mean()
# print(ts_resample)

## Question 19
## 19.	Calculates the mean number of pages for each combination of Author and Format from the goodreads dataset using pivot table

import pandas as pd
data = pd.read_csv('goodreads_top100.csv')

pivot_table = data.pivot_table(values="Num Pages", index=["Author", "Format"], aggfunc='mean')

print(pivot_table)

## Question 20
## 20.	Perform an analysis to understand the distribution of genres and identify the most common genre in the dataset using matplotlib. Identify the most common genre based on the maximum count.

# import pandas as pd
# from ast import literal_eval
# import matplotlib.pyplot as plt

# data = pd.read_csv('goodreads_top100.csv')
# data['Genres'] = data['Genres'].apply(literal_eval)
# data_exploded = data.explode('Genres')
# grouped_data = data_exploded.groupby('Genres').size()
# sorted_top_genres = grouped_data.sort_values(ascending=False).head(15)
# print(sorted_top_genres)
# sorted_top_genres.iloc[::-1].plot(kind='bar', figsize=(15,6))
# plt.title('Top 15 Book Genres')
# plt.xlabel('Genre')
# plt.xticks(rotation=45, ha='right')
# plt.ylabel('Count')
# plt.show()