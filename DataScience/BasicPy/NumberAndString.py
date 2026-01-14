# Generate a simple index file

#import numpy as np
#import pandas as pd
import string
from string import Template

# Örnek liste döngüsü
list_data = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
for item in list_data:
    print(item)

print("-" * 20)
name = "Emre Mert"
print(f"Original: {name}")
print(f"Capitalized: {name.capitalize()}")

print("-" * 20)
print("--- String Library Constants ---")
# ascii_letters (harfler), digits (rakamlar) ve punctuation (noktalama işaretleri)
print(f"Letters: {string.ascii_letters}")
print(f"Digits: {string.digits}")
print(f"Punctuation: {string.punctuation}")

print("-" * 20)
print("--- Template Strings ---")
# Template kullanarak değişken yerleştirme (genellikle dışarıdan gelen veriler için daha güvenlidir)
t = Template("Merhaba $user, bugün hava $weather.")
result = t.substitute(user="Emre", weather="güneşli")
print(result)

print("-" * 20)
print("--- Capwords ---")
# string.capwords her kelimenin ilk harfini büyütür (capitalize sadece ilk harfi büyütür)
title = "python veri bilimi öğreniyorum"
print(f"Original: {title}")
print(f"Capwords: {string.capwords(title)}")

print("-" * 20)
print("--- Advanced Formatting ---")
# String formatlama ile hizalama ve karakter doldurma
print("|{:<10}|{:^10}|{:>10}|".format("Sola", "Orta", "Sağa"))
print("|{:.>10}|{:*^10}|{:-<10}|".format("Nokta", "Yıldız", "Tire"))

print(name.capitalize())