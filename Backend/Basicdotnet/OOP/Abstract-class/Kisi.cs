using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Abstract_classlar
{
   abstract internal class Kisi
    {
        public abstract void verial();//subclass override etmek zorunda
        public abstract void veriyaz();
        public abstract int sayiver(int x);

        public string ad;
        public string yas;

        public void temizle()
        {
            Console.Clear();
        }


    }
}
