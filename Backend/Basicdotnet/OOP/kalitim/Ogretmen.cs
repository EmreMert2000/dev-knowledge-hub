using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace kalitim
{
    internal class Ogretmen:Kisi
    {
        public string brans;
        public float maas;

        public void bilgi()
        {
            Console.WriteLine("branş girniz");
            brans = Console.ReadLine();
            Console.WriteLine("maaş giriniz");
            maas = Convert.ToSingle(Console.ReadLine());
        }
        //public void bilgial()
        //{
        //    Console.WriteLine("****öğretmen bilgi alma***");
        //    Console.WriteLine("Ad Soyad Girniz");
        //    adasoyad = Console.ReadLine();
        //    Console.WriteLine("tc giriniz");
        //    tc = Console.ReadLine();
        //    Console.WriteLine("yaş giriniz");
        //    yas = Convert.ToByte(Console.ReadLine());
        //    Console.WriteLine("branş girniz");
        //    brans = Console.ReadLine();
        //    Console.WriteLine("maaş giriniz");
        //    maas = Convert.ToSingle(Console.ReadLine());
        //}
        public void ogretmenVeriYaz()
        {
            Console.WriteLine("***Öğrtmen Bilgileri***");
            veriyaz();
            Console.WriteLine("Maaş: "+maas);
            Console.WriteLine("branş: "+brans);
        }
    }
}
