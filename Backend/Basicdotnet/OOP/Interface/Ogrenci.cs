using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Interface_yapilar
{
    internal class Ogrenci : IKisi, IDersler
    {
        public void matematik()
        {
            Console.WriteLine("matematik dersi");
        }

        public void turkce()
        {
            throw new NotImplementedException();
        }

        public void verial()
        {
            throw new NotImplementedException();
        }

        public void veriyaz()
        {
            throw new NotImplementedException();
        }
    }
}
