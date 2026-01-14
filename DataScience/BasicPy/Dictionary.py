fruit_list = ["banana","apple"]
calorie_list = [100,150]

fitness_dictionary = {"banana":100,"apple":150}

fitness_dictionary["apple"]
#150


fitness_dictionary.keys()
#dict_keys(['banana', 'apple'])

fitness_dictionary.values()
#dict_values([100, 150])

fitness_dictionary["banana"]=200

print(fitness_dictionary) # {'banana': 200, 'apple': 150}


last_dictionary = {"k1":10,"k2":[10,20,30,40,50],"k3":"string","k4":{"a":100,"b":200}}
last_dictionary["k2"][2] # 30