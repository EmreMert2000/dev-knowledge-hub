

# Numy kütüphanesi sizlere matematik bir veri akışı sağlar
#Ayırca büyük veri setlerinde daha hızlı işlem yapmamızı sağlar

import numpy as np


myList=[1,2,3,4,5]
myArray = np.array(myList)
print(myArray)
print(myArray.max())


matrix_list = [[1,0,0],[0,1,0],[0,0,1],[0,0,0]]
matrix_array = np.array(matrix_list)
print(matrix_array.shape)
print(matrix_array[0][0])


# --- EK ÖRNEKLER ---

# 1. Arange: Belirli bir aralıkta dizi oluşturma
range_array = np.arange(0, 10, 2) # 0'dan 10'a kadar 2'şer artan dizi
print(f"Arange Array: {range_array}")

# 2. Zeros ve Ones: Sıfırlardan veya birlerden oluşan dizi
zeros_array = np.zeros((2,2))
ones_array = np.ones((3,3))
print(f"Zeros:\n{zeros_array}")
print(f"Ones:\n{ones_array}")

# 3. Linspace: Belirli bir aralığı eşit parçaya bölme
lin_array = np.linspace(0, 5, 10) # 0 ile 5 arasını 10 eşit parçaya böler
print(f"Linspace: {lin_array}")

# 4. Rastgele Sayılar
rand_array = np.random.rand(2,2) # 0-1 arası rastgele değerler
randint_array = np.random.randint(1, 100, 5) # 1-100 arası 5 tam sayı
print(f"Random Rand:\n{rand_array}")
print(f"Random Int: {randint_array}")

# 5. Reshape ve İstatistiksel Değerler
new_array = np.random.randint(1, 50, 10)
reshaped = new_array.reshape(2, 5) # 10 elemanlı diziyi 2x5 matris yapar
print(f"Reshaped:\n{reshaped}")
print(f"Max: {new_array.max()}, Min: {new_array.min()}")
print(f"Max Index: {new_array.argmax()}, Min Index: {new_array.argmin()}")

