using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace YapiciMetot
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Ogrenci ogrenci = new Ogrenci("serap",43);
            Console.WriteLine(ogrenci.ad+" "+ogrenci.yas+" "+ogrenci.kayitlimi);
            Console.WriteLine(ogrenci.soyad+" "+ogrenci.not+" "+ogrenci.cevap);
           
            Ogrenci ogr = new Ogrenci();
            Console.WriteLine(ogr.ad + " " + ogr.yas + " " + ogr.kayitlimi);
            int x = 10;
            int y = 10;
            int z = 40;
            Console.WriteLine(x+y);
            Console.WriteLine(y+z);
            Console.WriteLine(z*x);

           // DateTime dt =new  DateTime(2025,1,15);
        }
    }
}
