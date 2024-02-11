import numpy as np
import matplotlib as mp

arr1 = np.arange(100)
print(arr1)
arr2 = np.arange(1,100,3)
print(arr2)
arr3=np.linspace(0,1,101)
print(arr3)
arr4 = np.ones((3,3))
print(arr4)
np.shape(arr4)

arr5 = np.zeros((3,6))
print(arr5)

arr6 = np.eye(4) ## identity
print(arr6)


arr7 = np.diag([1,2,3,4])
print(arr7)