using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace metod4_overloading
{
    internal class Program
    {
        public static void toplama(int x, int y)
        {
            Console.WriteLine("int 2 parametreli Sonuc: "+(x+y));
        }
        public static void toplama(int x,int y,int z)
        {
            Console.WriteLine("int 3 parametreli Sonuc: " + (x + y+z));
        }
        public static void toplama(float x,int y,double z)
        {
            Console.WriteLine("float int double Sonuc: " + (x + y + z));
        }
        public static void toplama(int x)
        {
            Console.WriteLine("tek parametreli sonuc: "+(x+100));
        }
        static void Main(string[] args)
        {
            //metod overloading: metodun aşırı yüklenmesi
            //isimleri aynı fakat paremetreleri farklı metodlar oluşturmak anlamına gelir
            toplama(50);
            toplama(20, 60);
            toplama(10, 20, 30);
            toplama(5.9f, 10, 50.18d);
        }
    }
}
