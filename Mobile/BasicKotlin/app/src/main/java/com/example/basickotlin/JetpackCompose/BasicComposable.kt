package com.example.basickotlin.JetpackCompose

import android.R.attr.padding
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Spacer
import androidx.compose.material3.Button
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Modifier
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp

//Layouts=Column,Row,Box,etc.


@Composable

fun Greeting(name: String, modifier: Modifier = Modifier) {
    var count by remember { mutableStateOf(0) }
    Column{
        Text(count.toString())
        Spacer(modifier)
        Button(onClick = {count++}) {
            Text("Click Me")
        }
    }

}

@Preview(showBackground = true)
@Composable
fun GreetingPreview() {
    Greeting("Android")

}

