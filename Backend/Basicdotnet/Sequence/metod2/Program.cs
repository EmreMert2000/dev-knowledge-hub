using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace metod2
{
    internal class Program
    {

        public static double Toplama(double x, double y)
        {
            return x + y;
        }
        public static double Cikarma(double x, double y)
        {
            double sonuc = x - y;
            return sonuc;
        }
        public static void Carpma(double x, double y) 
        {
            Console.WriteLine(x*y);
        }
        public static void Bolme(double x, double y)
        {
            Console.WriteLine(x / y);
        }

        static void Main(string[] args)
        {         
            Console.WriteLine("Birinci sayıyı giriniz");
            double sayi1=Convert.ToDouble(Console.ReadLine());
            Console.WriteLine("İkinci sayıyı giriniz");
            double sayi2 = Convert.ToDouble(Console.ReadLine());

            Console.WriteLine("yapmak istediğiniz işlemi seçiniz\nToplama için 1\nÇıkarma için 2\nÇArpma için 3\nBölme için 4");
            byte secim = Convert.ToByte(Console.ReadLine());

            if (secim == 1)
            {
                Console.WriteLine(Toplama(sayi1,sayi2));
            }
            else if (secim == 2)
            {
                double sonuc = Cikarma(sayi1, sayi2);
                Console.WriteLine(sonuc);
            }
            else if (secim == 3)
            {
                Carpma(sayi1, sayi2);
            }
            else if (secim == 4)
            { 
                Bolme(sayi1, sayi2);
            }
            else
            {
                Console.WriteLine("Hatalı giriş yaptınız");
            }

        }
    }
}
