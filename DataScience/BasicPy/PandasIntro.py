import pandas as pd
import numpy as np

# --- 1. Pandas Series ---
# Series, tek boyutlu bir veri yapısıdır (sütun gibi)
labels = ['a', 'b', 'c', 'd']
my_list = [10, 20, 30, 40]
d = {'a': 10, 'b': 20, 'c': 30, 'd': 40}

series1 = pd.Series(data=my_list, index=labels)
print("--- Series 1 ---")
print(series1)

# --- 2. Pandas DataFrames ---
# DataFrame, çok boyutlu (satır ve sütunlu) bir tablo yapısıdır
data = {
    'İsim': ['Ahmet', 'Mehmet', 'Ayşe', 'Fatma', 'Zeynep'],
    'Yaş': [25, 30, 22, 28, 35],
    'Şehir': ['İstanbul', 'Ankara', 'İzmir', 'Bursa', 'Antalya'],
    'Maaş': [50000, 60000, 55000, 48000, 70000]
}

df = pd.DataFrame(data)

print("\n--- DataFrame (İlk 5 Satır) ---")
print(df.head())

# --- 3. Temel Bilgiler ---
print("\n--- DataFrame Bilgileri ---")
df.info()

print("\n--- İstatistiksel Özet ---")
print(df.describe())

# --- 4. Veri Seçme ve Filtreleme ---
print("\n--- Sadece İsim Sütunu ---")
print(df['İsim'])

print("\n--- Yaşı 25'ten Büyük Olanlar ---")
print(df[df['Yaş'] > 25])

# --- 5. Yeni Sütun Ekleme ---
df['Vergi'] = df['Maaş'] * 0.2
print("\n--- Yeni Sütun Eklenmiş Hali ---")
print(df)