package com.example.basickotlin.TheBasics

import androidx.room.util.copy

data class User(
    val name: String,
    val age:Int
)


fun main(){
    val user=User("Emre",25)
    val user1=User.copy(age=26)
    println(user)
}