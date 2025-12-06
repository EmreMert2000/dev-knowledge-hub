using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Virtual_metot
{
    internal class Ogretmen:Kisi
    {
        public string brans;
        public float maas;

        public override void verial()
        {
            base.verial();
            Console.WriteLine("branş giriniz");
            brans= Console.ReadLine();
            Console.WriteLine("maaş giriniz");
            maas=Convert.ToSingle(Console.ReadLine());
        }
        public override void veriyaz()
        {
            base.veriyaz();
            Console.WriteLine("branş: "+brans);
            Console.WriteLine("maas: "+maas);
        }

    }
    
}
