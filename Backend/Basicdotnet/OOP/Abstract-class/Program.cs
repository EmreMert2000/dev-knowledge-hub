using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Abstract_classlar
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Ogretmen ogrt=new Ogretmen();
            ogrt.verial();
            ogrt.veriyaz();
            Console.WriteLine(ogrt.sayiver(255));
            Console.ReadLine();
            ogrt.temizle();
        }
    }
}
