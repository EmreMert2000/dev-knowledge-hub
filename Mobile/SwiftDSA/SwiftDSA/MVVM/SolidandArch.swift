//
//  SolidandArch.swift
//  SwiftDSA
//
//  Created by Emre Mert on 13.01.2026.
//

import SwiftUI

// ==========================================
// MARK: - 📁 MODELS (Veri Katmanı)
// ==========================================
// Bu klasördeki dosyalar sadece "verinin ne olduğunu" tanımlar.
// İçinde hiçbir fonksiyonel mantık veya UI kodu bulunmaz.

struct Futbolcu: Identifiable {
    let id = UUID()
    let isim: String
    let mevki: String
    var reyting: Int
    var scoutNotu: String
}

// ==========================================
// MARK: - 📁 VIEWMODELS (Mantık Katmanı)
// ==========================================
// View ile Model arasındaki köprüdür.
// Veriyi işler, API'den çeker ve View'ın "neyi" göstereceğine karar verir.

class ScoutingViewModel: ObservableObject {
    
    // @Published: Bu değişken değiştiğinde, View otomatik olarak kendini yeniler.
    @Published var futbolcular: [Futbolcu] = []
    @Published var aramaMetni: String = ""
    
    // Filtrelenmiş liste (Computed Property)
    // View direkt bu listeyi kullanırsa, arama yapıldığında liste anlık güncellenir.
    var filtrelenmişOyuncular: [Futbolcu] {
        if aramaMetni.isEmpty {
            return futbolcular
        } else {
            return futbolcular.filter { $0.isim.localizedCaseInsensitiveContains(aramaMetni) }
        }
    }
    
    init() {
        // Uygulama başladığında verileri hazırla (Mock Data)
        verileriYukle()
    }
    
    func verileriYukle() {
        // Gerçek projede burada bir API isteği (Futveri API vb.) olur.
        self.futbolcular = [
            Futbolcu(isim: "Arda Güler", mevki: "Oyun Kurucu", reyting: 86, scoutNotu: "Teknik kapasite çok yüksek."),
            Futbolcu(isim: "Kenan Yıldız", mevki: "Forvet", reyting: 82, scoutNotu: "Fiziksel gelişimi iyi."),
            Futbolcu(isim: "Semih Kılıçsoy", mevki: "Santrafor", reyting: 79, scoutNotu: "Bitiriciliği umut verici.")
        ]
    }
    
    func oyuncuSil(at offsets: IndexSet) {
        futbolcular.remove(atOffsets: offsets)
    }
    
    func reytingGuncelle(oyuncu: Futbolcu, yeniReyting: Int) {
        if let index = futbolcular.firstIndex(where: { $0.id == oyuncu.id }) {
            futbolcular[index].reyting = yeniReyting
        }
    }
}

// ==========================================
// MARK: - 📁 VIEWS (Arayüz Katmanı)
// ==========================================
// Burası sadece "görselleştirme" yapar.
// "Veri nasıl silinir?" veya "Arama nasıl yapılır?" ile ilgilenmez, ViewModel'e sorar.



struct FutveriScoutingView: View {
    
    // @StateObject: ViewModel'in yaşam döngüsünü bu View başlatır.
    @StateObject private var viewModel = ScoutingViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                // Arama Çubuğu (ViewModel'deki aramaMetni'ne bağlı)
                TextField("Oyuncu ara...", text: $viewModel.aramaMetni)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                
                List {
                    ForEach(viewModel.filtrelenmişOyuncular) { oyuncu in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(oyuncu.isim).font(.headline)
                                Text(oyuncu.mevki).font(.subheadline).foregroundColor(.secondary)
                            }
                            
                            Spacer()
                            
                            // Reyting göstergesi
                            Text("\(oyuncu.reyting)")
                                .padding(8)
                                .background(oyuncu.reyting > 80 ? Color.green : Color.orange)
                                .foregroundColor(.white)
                                .clipShape(Circle())
                        }
                    }
                    .onDelete(perform: viewModel.oyuncuSil) // Silme mantığı VM'den gelir
                }
            }
            .navigationTitle("Futveri Scout")
            .toolbar {
                EditButton() // Listeyi düzenleme (silme) modu
            }
        }
    }
}

// ==========================================
// MARK: - 📁 PREVIEWS
// ==========================================

struct FutveriScoutingView_Previews: PreviewProvider {
    static var previews: some View {
        FutveriScoutingView()
    }
}
