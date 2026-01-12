//
//  main.swift
//  SwiftDSA
//
//  Created by Emre Mert on 12.01.2026.
//


struct EmirElemanı{
    let isim:String
    let değer:Double
}

extension Emirİşlemi{
    func komisyonekle(_kom:Double){
        
    }
    
    func dateAdd(_ date:Date){
        
    }
}
protocol HisseEmir{
    var title:String{get set}
    
    var emirelemanı:EmirElemanı{get set}
    
    var toplamTutar:Double{get set}
    
    var yenifiyat: Double?{get}
    
    var emriPost:() -> Void {get set}
    
    func priceUpdate(_ yeniFiyat:Double)
    
    func adetUpdate(_ adet:Int)
    
    //func dateAdd(_date:DatePicker)
    
    func komisyonekle(_ kom:Double)
    
    
}

class HisseEmirİşlemi: Emirİşlemi{
    var title:String
    {
        return "Kripto Emri Giriniz."
    }
    var emirelemanı:EmirElemanı
    
    var toplamTutar:Double=0
    
    private(set) var yeniFiyat: Double?
    init( emirelemanı: EmirElemanı) {
        self.emirelemanı = emirelemanı
    }
    
    func priceUpdate(_yeniFiyat:Double){
        print("Yeni Fiyat geldi")
        self.yeniFiyat = _yeniFiyat
    }
    
    func adetUpdate(_adet:Int){
        print("Yeni Adet belirlendi")
        toplamTutar += Double(_adet) * (yeniFiyat ?? emirelemanı.self)
    }
    
    
    
    func dateAdd(_date:Date)
    {
        print("Tarih geldi. Emri gönderecek.")
    }
    
    func emriPost()
    {
        print("Emir Gidiyor.")
    }
    
    
    
}

extension Emirİşlemi{
    func komisyonekle(_kom:Double){
        
    }
    
    func dateAdd(_ date:Date){
        
    }
}
class CryptoFunc: Emirİşlemi{
    var Title:String
    {
        return "Kripto Emri Giriniz."
    }
    var emirelemanı:EmirElemanı
    
    var toplamTutar:Double=0
    
    private(set) var yeniFiyat: Double?{get}
    init( emirelemanı: EmirElemanı) {
        self.emirelemanı = emirelemanı
    }
    
    func priceUpdate(_yeniFiyat:Double){
        
    }
    
    func adetUpdate(_adet:Int){
        
    }
    
    func KomisyonAdd(_adet:Int)
    {
        
    }
    
    func dateAdd(_date:Date)
    {
        
    }
    
    func emriPost()
    {
        
    }
    
    
    
}



class Ekran{
    func PageOpen(){
       print(String(describing: self)+"Page is open")
    }
    
    func PageClose(){
        print(String(describing: self)+"Page is open")
    }
}

class Emir:Ekran{
   override func PageOpen() {
        super.PageOpen()
    }
    
    override func PageClose() {
        super.PageClose()
    }
}
