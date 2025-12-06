using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace metod6_uygulama
{
    internal class Program
    {
      static  byte secim;
      static  int fiyat;
        public static int indirim(byte secim,int fiyat)
        {
            if(secim==1)
            {
                return fiyat-((fiyat*20)/100);
            }
            else
            {
                return fiyat - ((fiyat * 5) / 100);
            }
        }
        //public static void fatura(int indirimlifiyat)
        //{
        //    int kdvlifiyat = indirimlifiyat + (indirimlifiyat * 18 / 100);
        //    Console.WriteLine("Ödenecek tutar: "+kdvlifiyat);
        //}

        public static void fatura()
        {
            int indirimlitutar = indirim(secim, fiyat);
            int sonuc = indirimlitutar + (indirimlitutar * 18 / 100);
            Console.WriteLine("Ödenecek tutar: " + sonuc);
        }
        static void Main(string[] args)
        {
            //Uygulama Ana ekranından seçimle kullanıcıya 
            //1- Mobilya
            //2-Beyaz eşya
            //seçim yaptırıldaktan sonra ürün fiyatı istensin
            //Mobilya seçiminde %20 beyaz eşyada %5 indirim hesplayan metod olsun
            //indirimli tutarla kdv hesplayan fiş metodu olsun
            //kullanıcının ödeyeceği fiyat çıktı olarak sunulsun
            Console.WriteLine("1- Mobilya\n2- Beyaz eşya");
            //byte secim=Convert.ToByte(Console.ReadLine());
            secim = Convert.ToByte(Console.ReadLine());
            Console.WriteLine("Ürün fiyatını giriniz");
            //int fiyat=Convert.ToInt32(Console.ReadLine());
            fiyat = Convert.ToInt32(Console.ReadLine());
            //int indirimli = indirim(secim, fiyat);
            // fatura(indirimli);
            // fatura(indirim(secim, fiyat));
            fatura();

        }
    }
}
