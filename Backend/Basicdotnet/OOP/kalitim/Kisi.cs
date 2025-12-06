using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace kalitim
{
    internal class Kisi
    {
        public string adasoyad;
        public string tc;
        public byte yas;

        public void verial()
        {
            Console.WriteLine("Ad Soyad Girniz");
            adasoyad = Console.ReadLine();
            Console.WriteLine("tc giriniz");
            tc = Console.ReadLine();
            Console.WriteLine("yaş giriniz");
            yas = Convert.ToByte(Console.ReadLine());
        }
        public void veriyaz()
        {
            Console.WriteLine("Adı: "+adasoyad);
            Console.WriteLine("Tc: "+tc);
            Console.WriteLine("Yas: "+yas);

        }
    }
}
