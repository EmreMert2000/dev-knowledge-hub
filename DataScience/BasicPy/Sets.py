myList = [10,20,30,10,20,40,10,20,40]

mySet=set(myList)
print(mySet)

mySet.add(50)
print(mySet)

mySet.remove(20)
print(mySet)


mySet2 = {30,40,50,60,70}

print(mySet.union(mySet2))
print(mySet.intersection(mySet2))