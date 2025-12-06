using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace class_uygulama
{
    internal class Program
    {
        static void Main(string[] args)
        {
            //ürünler clasında ürün adı,fiyatı,markası,mikatarı fieldlar olucak
            //return metod olacak fiyatı 1000 liradan büyük olan ürünlere %5 fiyat farkı eklenecek
            //fieldlara veri girişi sağlayan metod
            
            Urunler urun1= new Urunler();
            urun1.bilgiAl();
            // urun1.guncelFiyat(urun1.fiyat);
            Console.WriteLine("urun adı: "+urun1.urunadi);
            Console.WriteLine("marka: "+urun1.marka);
            Console.WriteLine("adet: "+urun1.adet);
            Console.WriteLine("ürün fiyatı: "+urun1.guncelFiyat(urun1.fiyat));


        }
    }
}
