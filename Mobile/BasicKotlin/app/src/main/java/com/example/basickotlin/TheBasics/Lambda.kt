package com.example.basickotlin.TheBasics

import android.R

fun main(){
    //Lambda kullanımı

    val greet:(String)-> String={
        name:String->"Hello $name"
    }
    println(greet("Emre"))


    }
//Basic bir şekilde kullanımı.

//High order kullanım

