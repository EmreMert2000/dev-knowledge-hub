package com.example.basickotlin.TheBasics

fun generateString(){
    val name="Emre"
    lateinit var description:String

    var age=25

    println(name+""+age)

    description="Açıklama"

    var name2=24

}

fun PrimiviteTypes(){
    val name:String="Emre"
    val age:Int=25
    val IsTrue: Boolean=true


    //Type çevirme

    val tostringname=name.toString()
}

fun IfStructure(){
    val number=80

    var grade:String
    if (number==80){
        grade="Geçti"
    }
    else{
        grade="Kaldı"

    }
}
fun collections(){
    var list= listOf<String>("Emre","Ahmet","Mehmet")

    val numbers= listOf<Int>(1,2,3,4,5)

    var netnumber=numbers.filter { it<5 }

    println(netnumber)


    var filteroflist=list.filter { it.contains("e") }


    println(filteroflist)
 }

fun loops(){
    val items:List<String> = listOf("x","insta","tiktok")

    for(item in items){
        println(item)

    }


    }