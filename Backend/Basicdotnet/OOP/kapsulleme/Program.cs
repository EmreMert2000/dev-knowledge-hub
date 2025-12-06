using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace kapsulleme
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Ogrenciler ogr1= new Ogrenciler();
            Console.WriteLine("ad giriniz");
            ogr1.ad=Console.ReadLine();
            Console.WriteLine("not giriniz");
            ogr1.Not=Convert.ToSingle(Console.ReadLine());
            Console.WriteLine("yaş giriniz");
            ogr1.Yas=Convert.ToByte(Console.ReadLine());

            Console.Clear();
            Console.WriteLine("ad: "+ ogr1.ad);
            Console.WriteLine("not: "+ ogr1.Not);
            Console.WriteLine("yaş: "+ ogr1.Yas);
            Console.ReadLine();
        }
    }
}
