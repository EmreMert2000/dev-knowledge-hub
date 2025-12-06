using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Classlar
{
    //class Ogrenciler
    //{

    //}
    //class ogretmenler
    //{

    //}

    internal class Program
    {
        static void Main(string[] args)
        {
            Ogrenciler ogr1=new Ogrenciler();//nesne ürettik
            ogr1.ad = "ali";
            ogr1.soyad = "kısa";
            ogr1.yas = 12;
            Ogrenciler ogr2=new Ogrenciler();
            ogr2.ad = "veli";
            ogr2.soyad = "uzun";
            ogr2.yas = 13;
            Console.WriteLine(ogr1.ad + ogr1.soyad + ogr1.yas);
            Console.WriteLine(ogr2.ad + ogr2.soyad + ogr2.yas);

            Console.WriteLine("**** ogretmen nesleri çalışıyor****");
            Ogretmen ogretmen1 = new Ogretmen();
            ogretmen1.bilgiAl();
            Ogretmen ogretmen2= new Ogretmen();
            ogretmen2.bilgiAl();
           
            ogretmen1.bilgiYaz();
            ogretmen2.bilgiYaz();

            Ogretmen.okulAdi();//nesne üretmeden static metoda ulaştık





          




        }
    }

}
