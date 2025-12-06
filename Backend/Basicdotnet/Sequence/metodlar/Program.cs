using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace metodlar
{
    internal class Program
    {

        //geriye döndürmeyen parametresiz metod
        public static void Toplama()
        {
            int x = 5;
            int y = 15;
           // int sonuc = x + y;
            Console.WriteLine("sonuc: "+(x+y));
        }
        //geriye değer döndürmeyen parametreli metot
        public static void Toplama2(int sayi1,int sayi2)
        {
            Console.WriteLine("sonuc"+(sayi1+sayi2));
        }

        //geriye değer döndüren parametresiz metot
        public static int Toplama3()
        {
            Console.WriteLine("birinci sayı giriniz");
            int x=Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("ikinci sayı giriniz");
            int y = Convert.ToInt32(Console.ReadLine());
            //int sonuc = x + y;
            //return sonuc;
            return x + y;
        }
        //geriye değer döndüren parametreli metod
        public static int Toplama4(int sayi1,int sayi2)
        {
            //int sonuc = sayi1 + sayi2;
            //return sonuc;
            return sayi1 + sayi2;
        }

        static void Main(string[] args)
        {
            Toplama();
            Toplama2(10, 20);
            Toplama2(20, 50);
            //int sonuc= Toplama3();
            //Console.WriteLine(sonuc);
            //Console.WriteLine(100+Toplama3());
            //Console.WriteLine(Toplama3());
            Console.WriteLine(Toplama4(50,60));
            Console.WriteLine("sayı giriniz");
            int x=Convert.ToInt32((Console.ReadLine()));
            Console.WriteLine("sayı giriniz");
            int y = Convert.ToInt32((Console.ReadLine()));
            Console.WriteLine(Toplama4(x, y));
            Console.WriteLine(Toplama4(x, Toplama3()));

        }
    }
}
