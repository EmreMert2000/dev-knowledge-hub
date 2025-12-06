using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace kalitim
{
    internal class Ogrenci:Kisi//Kisi Base Class yani miras bırakan class
    {
        public string sinif;
        public byte sinifno;

        public void bilgi()
        {
            Console.WriteLine("sınıf no giriniz");
            sinifno = Convert.ToByte(Console.ReadLine());
            Console.WriteLine("sınıf giriniz");
            sinif = Console.ReadLine();
        }
        //public void verial()
        //{
        //    Console.WriteLine("****öğrenci bilgi alma****");
        //    Console.WriteLine("Ad Soyad Girniz");
        //    adasoyad = Console.ReadLine();
        //    Console.WriteLine("tc giriniz");
        //    tc = Console.ReadLine();
        //    Console.WriteLine("yaş giriniz");
        //    yas = Convert.ToByte(Console.ReadLine());
        //    Console.WriteLine("sınıf no giriniz");
        //    sinifno = Convert.ToByte(Console.ReadLine());
        //    Console.WriteLine("sınıf giriniz");
        //    sinif = Console.ReadLine();
        //}
        public void ogrenciVeriyaz()
        {
            Console.WriteLine("***Öğrenci Bilgileri***");
            veriyaz();
            Console.WriteLine("sinif: "+sinif);
            Console.WriteLine("sınıf no: "+sinifno);

        }
    }
}
