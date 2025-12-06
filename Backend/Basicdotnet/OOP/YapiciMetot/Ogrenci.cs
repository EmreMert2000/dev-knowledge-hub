using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace YapiciMetot
{
    internal class Ogrenci
    {
        public Ogrenci()
        {
            Console.WriteLine("yapıcı metod çalıştı");
            ad = "ali";
            yas = 12;
            kayitlimi = true;
        }
        public Ogrenci(string gelenad,int gelenyas)
        {
            ad = gelenad;
            yas = gelenyas;
        }
        public string ad;
        public int yas;
        public bool kayitlimi;
        public int not;
        public string soyad;
        public bool cevap;

        ~Ogrenci()
        {
            Console.WriteLine("yıkıcı metpd çalıştı");
            cevap= true;
            Console.WriteLine(cevap);
        }
    }
}
