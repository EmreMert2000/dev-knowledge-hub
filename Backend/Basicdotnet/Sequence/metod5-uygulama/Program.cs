using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace metod5_uygulama
{
    internal class Program
    { 
        public static void islem(string ad,char cinsiyet,int dogumyili)
        {
            int yas = 2025 - dogumyili;
            if (cinsiyet=='E' || cinsiyet=='e')
            {
                if(yas>=50)
                {
                    Console.WriteLine("sayın "+ad+ " Başvurunuz kabul edildei");
                }
                else
                {
                    Console.WriteLine("sayın " + ad + " Başvurunuz kabuledilemdi");
                }
            }
            else if(cinsiyet=='K'||cinsiyet=='k')
            {
                if (yas >= 40)
                {
                    Console.WriteLine("sayın " + ad + " Başvurunuz kabul edildei");
                }
                else
                {
                    Console.WriteLine("sayın " + ad + " Başvurunuz kabuledilemdi");
                }
            }
            else
            {
                Console.WriteLine("Cinsiyet bilgisi hatalı");
            }
        }

        static void Main(string[] args)
        {
            //soru: kullanıcıdan ad cinsiyet ve doğum yılı bilgisini alıp
            //yaş hesaplaması yapan bir metod oluşturalım bu metod eğer cinsiyeti erkekn ve yaşıda 50 den büyükse başvurusu kabul edildi değilse kabul edilemdi
            //cinsiyet kadın ise yaşı 40 dan büyük ise başvuru kabul eden uygulama
            Console.WriteLine("Adınız: ");
            string ad=Console.ReadLine();

            Console.WriteLine("Cinsiyet E/K");
            char cinsiyet=Convert.ToChar(Console.ReadLine());
            Console.WriteLine("Doğum yılı");
            int yil=Convert.ToInt32(Console.ReadLine());
            islem(ad, cinsiyet, yil);
            islem("serap", 'k', 1982);


        }
    }
}
