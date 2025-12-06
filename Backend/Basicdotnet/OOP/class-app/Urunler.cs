using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace class_uygulama
{
    internal class Urunler
    {
        public string urunadi;
        public string marka;
        public float fiyat;
        public int adet;

        public void bilgiAl()
        {
            Console.WriteLine("Ürün adı giriniz");
            urunadi = Console.ReadLine();
            Console.WriteLine("Ürün markası giriniz");
            marka = Console.ReadLine();
            Console.WriteLine("ürün fiyatı girniz");
            fiyat=Convert.ToSingle(Console.ReadLine());
            Console.WriteLine("ürün adedi giriniz");
            adet=Convert.ToInt32(Console.ReadLine());
        }
        public float guncelFiyat(float Fiyatparametresi)
        {
            if(Fiyatparametresi>=1000)
            {
                Fiyatparametresi += Fiyatparametresi * 5 / 100;
                return Fiyatparametresi;
            }
            else
            {
                return Fiyatparametresi;
            } 
        }

    }
}
