//
//  StateOfManagment.swift
//  SwiftDSA
//
//  Created by Emre Mert on 13.01.2026.
//

import SwiftUI

// 1. HARİCİ VERİ MODELİ (ObservableObject)
// Karmaşık verileri veya iş mantığını görünümlerin dışında tutmak için kullanılır.
class UserProfile: ObservableObject {
    // @Published: Bu değişken değiştiğinde, bu objeyi dinleyen tüm View'lar güncellenir.
    @Published var username: String = "Yazılımcı"
    @Published var level: Int = 1
}

struct StateManagementGosterimi: View {
    
    // 2. @State: Sadece bu View'a özel, basit veri türleri (String, Int, Bool vb.) için kullanılır.
    // View bu veriye "sahiptir". Veri değiştiğinde View kendisini tazeler.
    @State private var sayac: Int = 0
    @State private var toggleDurumu: Bool = false
    
    // 3. @StateObject: Bir ObservableObject sınıfından ilk kez nesne oluştururken kullanılır.
    // Görünüm (View) yeniden oluşturulsa bile bu nesne hayatta kalır.
    @StateObject var profil = UserProfile()

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                
                // --- LOKAL STATE KULLANIMI ---
                Section(header: Text("Lokal State (@State)")) {
                    Text("Butona \(sayac) kez tıklandı.")
                    Button("Artır") {
                        sayac += 1
                    }
                    .buttonStyle(.borderedProminent)
                }
                
                Divider()

                // --- OBSERVABLE OBJECT KULLANIMI ---
                Section(header: Text("Harici State (@StateObject)")) {
                    Text("Kullanıcı: \(profil.username)")
                    Text("Seviye: \(profil.level)")
                    
                    Button("Seviye Atla") {
                        profil.level += 1
                    }
                    .buttonStyle(.bordered)
                }

                Divider()

                // --- BINDING KULLANIMI ---
                // Alt görünüme veriyi gönderirken başında '$' işareti kullanılır.
                // Bu, "al bu veriyi kullan ve değiştirirsen benim haberim olsun" demektir.
                AltGörünüm(sayi: $sayac, profil: profil)
                
            }
            .padding()
            .navigationTitle("State Yönetimi")
        }
    }
}

// MARK: - ALT GÖRÜNÜM
struct AltGörünüm: View {
    
    // 4. @Binding: Veriye sahip değildir, sadece başka bir View'daki veriye referans verir.
    // Buradaki değişiklik ana View'daki @State'i de değiştirir.
    @Binding var sayi: Int
    
    // 5. @ObservedObject: Dışarıdan gelen, zaten oluşturulmuş bir nesneyi takip etmek için kullanılır.
    // @StateObject'ten farkı; bu View nesnenin sahibi değildir, sadece onu gözlemler.
    @ObservedObject var profil: UserProfile
    
    var body: some View {
        VStack {
            Text("Alt Görünüm")
                .font(.headline)
                .foregroundColor(.blue)
            
            // Binding üzerinden ana View'daki sayacı sıfırlıyoruz
            Button("Sayacı Sıfırla") {
                sayi = 0
            }
            
            // ObservedObject üzerinden ismi değiştiriyoruz
            TextField("İsim Değiştir", text: $profil.username)
                .textFieldStyle(.roundedBorder)
                .padding()
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(10)
    }
}

// Önizleme için
struct StateManagement_Previews: PreviewProvider {
    static var previews: some View {
        StateManagementGosterimi()
    }
}

