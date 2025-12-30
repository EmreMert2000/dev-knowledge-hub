package com.example.basickotlin.JetpackCompose

// UI'ın o anki durumunu temsil eden veri sınıfı
data class UIState(
    val isLoading: Boolean = false,
    val data: String = "",
    val error: String? = null
)

fun main() {
    // Başlangıç durumu
    var sayfaDurumu = UIState(isLoading = true)
    println("Durum: $sayfaDurumu")

    // Veri başarıyla geldiğinde durumu güncelle (copy kullanarak)
    sayfaDurumu = sayfaDurumu.copy(
        isLoading = false,
        data = "Merhaba Dünya!"
    )

    println("Yeni Durum: $sayfaDurumu")
}