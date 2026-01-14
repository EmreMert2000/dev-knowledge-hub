
name="Emre"


def hello_name(name):
    print("hello")
    print(name)

hello_name(name)

num1=input("Enter a number: ")
num2=input("Enter a number: ")

def sum_num(num1,num2):
    return int(num1)+int(num2)

print(sum_num(num1,num2))

num3=input("Enter a number: ")

def divideNumber(num3):
    return int(num3)/2

print(divideNumber(int(num3)))

#Maping Functions


myList = [3,5,7,10,20,30]

print(list(map(divideNumber,myList)))
#1.5,2.5,3.5,5.0,10.0,15.0

#Filter

def controlString(string):
    return "Emre" in string

myStringList = ["Emre", "Emre Mert","Mert","FutVeri"]

print(list(filter(controlString,myStringList)))#Emre,Emre Mert

#Lambda

numList = [10,20,30,40,50]
print(list(map(lambda num:num/4,numList)))
#2.5,5.0,7.5,10.0,12.5

#Scope

x = 20

number45=input("Gir.")

def multiply(number45):
    x = 5
    return num * x

#LEGB -> L->Local, E-> Enclosing, G->Global, B->Built-In

#Global
myString = "Emre"

def myFunction():
    #Enclosing
    myString = "Emre 2"
    print(myString)
    
    def myFunction2():
        #Local
        myString = "Emre 3"
        print(myString)
    
    myFunction2()

myFunction()

