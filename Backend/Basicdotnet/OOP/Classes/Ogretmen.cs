using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Classlar
{
 internal class Ogretmen //oğretmen nesnesinin modeli
        //static bir classtan nesne üretmeden clasa direk erişim sağlar.
    {
        public string adsoyad;
        public byte yas;
        public float maas;
        public string brans;

        static public string okuladi;

        static public void okulAdi()
        {
            okuladi = "mehmet rıfat yalman";
            Console.WriteLine(okuladi);
        }
     public void bilgiAl()
        {
            Console.WriteLine("ad soyad giriniz");
            adsoyad=Console.ReadLine();
            Console.WriteLine("yaşınızı giriniz");
            yas=Convert.ToByte(Console.ReadLine());
            Console.WriteLine("maaş giriniz");
            maas=Convert.ToSingle(Console.ReadLine());
            Console.WriteLine("branş giriniz");
            brans=Console.ReadLine();
        }
        public void bilgiYaz()
        {
            Console.WriteLine("***** kayıt edilen bilgiler****");
            Console.WriteLine(adsoyad);
            Console.WriteLine(yas);
            Console.WriteLine(maas);
            Console.WriteLine(brans);
        }
    }
}
