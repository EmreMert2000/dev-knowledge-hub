using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;

namespace Abstract_classlar
{
    internal class Ogretmen : Kisi
    {
        public string brans;

        public override void verial()
        {
            Console.WriteLine("ad giriniZ");
            ad=Console.ReadLine();
            Console.WriteLine("maas giriniz");
            brans = Console.ReadLine();
        }
        public override void veriyaz()
        {
            Console.WriteLine("ad: "+ad);
            Console.WriteLine("branş: "+brans);
        }
        public override int sayiver(int x)
        {
            return x+100;
        }
        //{
        //    throw new NotImplementedException();
        //}
    }
}
