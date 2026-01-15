import pandas as pd
import numpy as np

# Veri seti oluşturma
data = {
    'Departman': ['Yazılım', 'Satış', 'Yazılım', 'IK', 'Satış', 'Yazılım'],
    'Çalışan': ['Can', 'Deniz', 'Ege', 'Nil', 'Sarp', 'Oya'],
    'Maaş': [55000, 48000, 62000, 45000, 52000, 58000],
    'Tecrübe': [3, 5, 8, 2, 4, 6]
}

df = pd.DataFrame(data)

print("--- Orijinal DataFrame ---")
print(df)

# 1. Seçim ve Filtreleme (loc ve iloc)
# loc: İsimle seçim, iloc: İndeksle seçim
print("\n--- İlk Satır (loc) ---")
print(df.loc[0])

print("\n--- İlk 3 Satır ve Maaş/Tecrübe (iloc) ---")
print(df.iloc[:3, 2:])

# Koşullu Seçim: Maaşı 50000'den büyük ve Yazılım departmanında olanlar
print("\n--- Yazılımcılar (Maaş > 50000) ---")
print(df[(df['Departman'] == 'Yazılım') & (df['Maaş'] > 50000)])

# 2. Gruplandırma (GroupBy)
# Departman bazında ortalama maaş
print("\n--- Departman Bazlı Ortalama Maaş ---")
print(df.groupby('Departman')['Maaş'].mean())

# 3. Sıralama (Sorting)
print("\n--- Tecrübeye Göre Azalan Sıralama ---")
print(df.sort_values(by='Tecrübe', ascending=False))

# 4. Sütun İşlemleri
df['Yıllık_Maliyet'] = df['Maaş'] * 12
print("\n--- Yıllık Maliyet Sütunu Eklendi ---")
print(df)

# Sütun İsimlerini Değiştirme
df.rename(columns={'Çalışan': 'İsim'}, inplace=True)
print("\n--- Sütun İsmi Değiştirildi ---")
print(df.head(2))

# 5. Eksik Verilerle Çalışma (Örnekleme)
# 'Yıllık_Maliyet' sütunu da olduğu için 5 değer eklemeliyiz
df.loc[6] = ['Pazarlama', 'Ali', np.nan, 1, np.nan] # Sonuncu nan Yıllık_Maliyet için
print("\n--- Eksik Verili DataFrame ---")
print(df)

# Eksik verileri doldurma
df['Maaş'] = df['Maaş'].fillna(df['Maaş'].mean())
print("\n--- Maaşı Ortalama ile Doldurulan Hali ---")
print(df)
