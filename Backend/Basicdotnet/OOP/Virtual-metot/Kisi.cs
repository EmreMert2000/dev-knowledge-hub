using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Virtual_metot
{
    internal class Kisi
    {
        public string ad;
        public byte yas;

        public virtual void verial()
        {
            Console.WriteLine("**** veri alma ekranı****");
            Console.WriteLine("ad giriniz");
            ad= Console.ReadLine();
            Console.WriteLine("yaş giriniz");
            yas=Convert.ToByte(Console.ReadLine());
        }
        public virtual void veriyaz()
        {
            Console.WriteLine("***verial yazma ekranı****");
            Console.WriteLine("ad: "+ad);
            Console.WriteLine("yas: "+yas);
        }
    }
}
