import matplotlib.pyplot as plt
import numpy as np

# Veri Hazırlama
x = np.linspace(0, 10, 100)
y = np.sin(x)

# 1. Çizgi Grafiği (Line Plot)
plt.figure(figsize=(10, 6))
plt.plot(x, y, label='Sinüs Dalgası', color='blue', linestyle='--')
plt.plot(x, np.cos(x), label='Kosinüs Dalgası', color='red')

# Başlık ve Etiketler
plt.title('Sinüs ve Kosinüs Grafiği')
plt.xlabel('X Ekseni (Zaman)')
plt.ylabel('Y Ekseni (Değer)')
plt.legend()
plt.grid(True)

print("Matplotlib grafiği hazırlandı. (Not: GUI ekranı olmayan ortamlarda 'plt.show()' yerine dosya kaydı tercih edilir)")

# 2. Saçılım Grafiği (Scatter Plot)
random_x = np.random.rand(50)
random_y = np.random.rand(50)

plt.figure()
plt.scatter(random_x, random_y, color='purple', alpha=0.5)
plt.title('Rastgele Saçılım Grafiği')

# 3. Bar Grafiği (Bar Chart)
kategoriler = ['A', 'B', 'C', 'D']
degerler = [25, 40, 15, 30]

plt.figure()
plt.bar(kategoriler, degerler, color='green')
plt.title('Kategori Bazlı Değerler')

# Grafikleri göstermek için (Localde çalışırken ekran açar)
# plt.show() 

# Grafiği kaydetmek için
# plt.savefig('my_plot.png')
