package com.example.basickotlin.TheBasics

fun main(){

    val topic="Emre"

    val topicwith="#$topic"


    val group="Nizam Yapı Malzemeleri"

    println(group.addextension())

    val number1=5
    val number2=6
    println(number1.add(number2))

}

fun String.addextension():String{
    return "#$this"
}

fun Int.add(number:Int):Int{
    return this+number
}