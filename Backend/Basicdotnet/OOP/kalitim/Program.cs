using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace kalitim
{
    internal class Program
    {
        static void Main(string[] args)
        {
            //Console.WriteLine("****öğrenci bilgi alma****");
            //Ogrenci ogr1= new Ogrenci();
            //Console.WriteLine("Ad Soyad Girniz");
            //ogr1.adasoyad=Console.ReadLine();
            //Console.WriteLine("tc giriniz");
            //ogr1.tc=Console.ReadLine();
            //Console.WriteLine("yaş giriniz");
            //ogr1.yas=Convert.ToByte(Console.ReadLine());
            //Console.WriteLine("sınıf no giriniz");
            //ogr1.sinifno=Convert.ToByte(Console.ReadLine());
            //Console.WriteLine("sınıf giriniz");
            //ogr1.sinif=Console.ReadLine();

            //Console.WriteLine("****öğretmen bilgi alma***");
            //Ogretmen ogrt1= new Ogretmen();
            //Console.WriteLine("Ad Soyad Girniz");
            //ogrt1.adasoyad = Console.ReadLine();
            //Console.WriteLine("tc giriniz");
            //ogrt1.tc = Console.ReadLine();
            //Console.WriteLine("yaş giriniz");
            //ogrt1.yas = Convert.ToByte(Console.ReadLine());
            //Console.WriteLine("branş girniz");
            //ogrt1.brans=Console.ReadLine();
            //Console.WriteLine("maaş giriniz");
            //ogrt1.maas = Convert.ToSingle(Console.ReadLine());
            //Ogrenci ogr1 = new Ogrenci();
            //ogr1.verial();
            //Ogretmen ogrt1=new Ogretmen();
            //ogrt1.bilgial();
            Ogrenci ogr1= new Ogrenci();
            Console.WriteLine("**öğrenci verial***");
            ogr1.verial();
            ogr1.bilgi();
            ogr1.ogrenciVeriyaz();
            Ogretmen ogrt1= new Ogretmen();
            Console.WriteLine("****öğretmen verial**");
            ogrt1.verial();
            ogrt1.bilgi();
            ogrt1.ogretmenVeriYaz();
           
            
        }
    }
}
