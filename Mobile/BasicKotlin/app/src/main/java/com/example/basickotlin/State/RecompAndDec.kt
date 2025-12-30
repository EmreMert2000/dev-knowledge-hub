package com.example.basickotlin.State

import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.padding
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.OutlinedTextField
import androidx.compose.material3.Text
import androidx.compose.runtime.*
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp

/**
 * Jetpack Compose State Yönetimi Örneği
 */
@Composable
fun StateManagementTutorial() {
    // 1. remember & mutableStateOf:
    // 'remember', bir nesneyi bellekte tutar; böylece recomposition (yeniden çizim)
    // sırasında değer kaybolmaz [00:09:50].
    // 'mutableStateOf', Compose'un değişiklikleri izlemesini sağlayan 'observable' bir yapıdır.
    // Değer değiştiğinde UI otomatik olarak güncellenir [00:10:19].
    var name by remember { mutableStateOf("") }

    // 2. derivedStateOf:
    // Eğer bir durum, başka bir duruma bağlıysa ve her küçük değişiklikte gereksiz
    // hesaplama/recomposition yapılmasını istemiyorsak kullanılır.
    // Örneğin; ismin sadece 3 karakterden uzun olup olmadığını kontrol edelim.
    // Bu, performans optimizasyonu sağlar [00:12:47].
    val isNameValid by remember {
        derivedStateOf { name.length > 3 }
    }

    Column(modifier = Modifier.padding(16.dp)) {

        // Kullanıcının veri girişi yaptığı alan
        OutlinedTextField(
            value = name,
            onValueChange = { name = it }, // Her tuşa basıldığında 'name' güncellenir
            label = { Text("İsminizi girin") },
            isError = !isNameValid && name.isNotEmpty()
        )

        // Duruma göre metin gösterme
        if (name.isNotEmpty()) {
            Text(
                text = "Merhaba, $name!",
                style = MaterialTheme.typography.bodyMedium,
                modifier = Modifier.padding(top = 8.dp)
            )
        }

        // derivedStateOf sonucuna göre bilgi mesajı
        if (name.isNotEmpty() && !isNameValid) {
            Text(
                text = "İsim en az 4 karakter olmalıdır.",
                color = MaterialTheme.typography.bodySmall.color,
                style = MaterialTheme.typography.bodySmall
            )
        }
    }
}