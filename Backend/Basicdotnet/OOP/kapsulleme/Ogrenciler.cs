using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace kapsulleme
{
    internal class Ogrenciler
    {
        public string ad;
        private float not; //private oalan field kısıtlı olarak kullanıma açılacksa kapsülleme yapılır.
        byte yas; //bir field için erişim düzeyi varsayılan olarak private dır.
        public string sinif;

        public float Not //property
        {
            get { return not; }
            set
            {
                if(value<=100 && value>=0)
                {
                    not = value;
                }
            }
        }
     //  public byte Yas { get; set; }//property
      public byte Yas
        {
            get { return yas; }
            set
            {
                if (value < 20)
                {
                    yas = value;
                }
               
            }
        }



    }
}
