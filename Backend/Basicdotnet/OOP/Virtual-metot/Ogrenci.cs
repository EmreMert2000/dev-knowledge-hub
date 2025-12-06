using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Virtual_metot
{
    internal class Ogrenci:Kisi
    {
        public string sinifi;
        public byte sinifno;

        public void ogrencibilgi()
        {
            verial();
            Console.WriteLine("sinif no giriniz");
            sinifno=Convert.ToByte(Console.ReadLine());
            Console.WriteLine("Sinif giriniz");
            sinifi=Console.ReadLine();
        }
    }

}
