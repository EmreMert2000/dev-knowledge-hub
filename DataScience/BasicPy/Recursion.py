# Öz yineleme (Recursion), bir fonksiyonun kendisini çağırmasıdır.

# 1. Faktöriyel Hesaplama
def faktoriyel(n):
    # Temel durum (Base case)
    if n == 0 or n == 1:
        return 1
    # Yinelemeli durum (Recursive step)
    else:
        return n * faktoriyel(n - 1)

print(f"5 Faktöriyel: {faktoriyel(5)}")

# 2. Fibonacci Serisi
def fibonacci(n):
    if n <= 0:
        return 0
    elif n == 1:
        return 1
    else:
        return fibonacci(n - 1) + fibonacci(n - 2)

print("Fibonacci Serisi (ilk 10 terim):")
for i in range(10):
    print(fibonacci(i), end=" ")
print()

# 3. Liste Toplamı (Recursive)
def liste_toplami(liste):
    if not liste:
        return 0
    else:
        return liste[0] + liste_toplami(liste[1:])

sayilar = [1, 2, 3, 4, 5]
print(f"Liste Toplamı {sayilar}: {liste_toplami(sayilar)}")
