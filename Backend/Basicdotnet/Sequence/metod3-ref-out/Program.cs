using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;

namespace metod3_ref_out
{
    internal class Program
    {
        public static void Toplama(int x)
        {
            x += 100;
            Console.WriteLine("metodun hesapladığı sonuc: "+x);
        }
        public static void Toplama2(ref int x)
        {
            x += 100;
            Console.WriteLine("metodun hesapladığı sonuc: " + x);
        }
        static void Main(string[] args)
        {
            int sayi=40;
            Console.WriteLine("metod çalışmadan önce sayı değişkenin değeri: "+sayi);
            Toplama(sayi);
            Console.WriteLine("metod çalıştıktan sonra sayı değişkenindeğeri:"+sayi);
            Console.WriteLine("*********");
            Console.WriteLine("ref metod çalışmadan önce sayı değişkenin değeri: " + sayi);
            Toplama2(ref sayi);
            Console.WriteLine("ref metod çalıştıktan sonra sayı değişkenindeğeri:" + sayi);

        }
    }
}
