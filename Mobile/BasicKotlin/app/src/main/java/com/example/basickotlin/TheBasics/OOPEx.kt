package com.example.basickotlin.TheBasics

//Encapsulation: Kapsülleme Public,Private,Internal,Protected
//Accceses Modifier ile kullanılan kapsülleme kuralıdır.

class Bank(private var Balance:Int
        ,public var _Owner:String){
    val owner:String
    get() = _Owner

    fun getBalance():Int{
        return Balance
    }

    fun deposit(amount:Int){
        if(Balance<=0){
            Balance=amount
        }
        else{
            Balance+=amount
        }
    }
    fun withdraw(amount: Int){
        if(Balance>=amount){
            Balance-=amount
        }
        else{
            println("Yetersiz Bakiye")
        }
    }




}
//Inheritence:Kalıtım

open class user(var name:String,var age:Int)
{
    open fun Permissions():String{
        return "Read Only"
    }
}

class Admin(name: String,age: Int):user(name,age)
{
    override fun Permissions(): String {
        return "Full"
    }
    fun adduser(){
        println("User Added")
    }
    fun deleteuser(){
        println("User Deleted")
    }
}

//Polymorphism:Her class davranışını kendi belirler


open class Animal(){
    open fun spoke(){
        println("Animal spoke")

    }

}
class Dog():Animal(){
    override fun spoke() {
        println("Dog spoke")
    }
}
class Cat():Animal(){
    override fun spoke() {
        println("Cat spoke")
    }
}
//Abstraction:Gerekli arayüzü sunmak

interface Drivable{
    fun drive()
}
class Bus:Drivable{
    override fun drive() {
        println("Bus is driving")
    }
}
class Car:Drivable{
    override fun drive() {
        println("Car is driving")
    }
}






fun main()
{
    val bank=Bank(100,"Emre")
    val printbank=bank.deposit(100)
    println(printbank)

    val admin=Admin("Emre",25)
    println(admin.Permissions())
    admin.adduser()

    val dog=Dog()
    val cat=Cat()
    dog.spoke()
    cat.spoke()

    val Bus=Bus()
    val Car=Car()
    Bus.drive()
    Car.drive()


}

