

#İmportant section lectures.


class Person():
    #prop structures.
    name = "Emre"
    age = 26
    gender="Male"


      #initializer method
    def __init__(self,name,age,gender):
        self.name = name
        self.age = age
        self.gender = gender
       
    
    
    #methods
    def speak(self):
        print("I am speaking")

#EmrePerson = Person("Emre", 26,"Male")
#print(EmrePerson.name)
#print(EmrePerson.age)
#print(EmrePerson.gender)
#EmrePerson.speak()  

myInputPerson=input("Please enter your name: ")
myInputAge=input("Please enter your age: ")
myInputGender=input("Please enter your gender: ")

myInputPerson = Person("My name is "+myInputPerson,"My Age is"+ myInputAge, myInputGender)
myInputPerson.speak()

#Class Lectures complated.


class Dog():
    
    year = 7
    
    def __init__(self,age=5):
        self.age = age
        self.dogHumanAge = age * self.year
        print("dog instance")
        
    def humanAge(self):
        return self.age * Dog.year #Dog.year -> self.year

myDog = Dog(3)
print(myDog.humanAge())


#Examples...


#Polyphor
class Banana():
    
    def __init__(self,name):
        self.name = name
        
    def info(self):
        return f"100 calories {self.name}"
    
class Apple():
    
    def __init__(self,name):
        self.name = name
        
    def info(self):
        return f"150 calories {self.name}" 



#Try handlink error sections

while True:
    try:
        myAge = int(input("enter age: "))
        print(myAge * 2)
        #break
    except:
        print("enter your age!!!")
    else:
        print("else executed")
        break
    finally:
        print("finally")