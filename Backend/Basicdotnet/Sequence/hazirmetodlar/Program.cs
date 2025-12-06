using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace hazirmetodlar
{
    internal class Program
    {
        static void Main(string[] args)
        {
            //string  metodlar

            string metin = "   Bugün hava çok güzel hava çok iyi ";

            string sonuc = metin.Substring(0, 5);
            Console.WriteLine(sonuc);

           sonuc= metin.Replace("çok","very");
            Console.WriteLine(sonuc);
            Console.WriteLine(metin.ToLower());
            Console.WriteLine(metin.ToUpper());
            Console.WriteLine(metin.Length);
            Console.WriteLine(metin.Trim().Length);

            string[] kelimeler = metin.Trim().Split(' ');
            foreach (var item in kelimeler)
            {
                Console.WriteLine(item);
            }

            if(metin.Contains("hava"))
            {
                Console.WriteLine("kelime var");
            }
            else
            {
                Console.WriteLine("kelime yok");
            }

            Console.WriteLine(metin.IndexOf("hava"));

            Console.WriteLine(metin.ToLower().Trim().StartsWith("bugün"));
            Console.WriteLine(metin.Trim().EndsWith("iyi"));
            Console.WriteLine(String.Equals(metin, "bugün hava güzel"));
            Console.WriteLine(String.Concat(metin,"merahba"));
            //Math sınıfı üzerinden matematiksel fonksiyonlar

            int x = -5;
            int y = 10;
            int z = 25;
            float t= 5.175f;
            float v = 5.675f;

            Console.WriteLine(Math.Abs(x));//mutlak
            Console.WriteLine(Math.Min(x,y));
            Console.WriteLine(Math.Max(x, y));
            Console.WriteLine(Math.Pow(y,2));
            Console.WriteLine(Math.Sqrt(z));
            Console.WriteLine(Math.Round(t));
            Console.WriteLine(Math.Round(v));
            Console.WriteLine(Math.Ceiling(t));
            Console.WriteLine(Math.Ceiling(v));
            Console.WriteLine(Math.Floor(t));
            Console.WriteLine(Math.Floor(v));

            //Tarih Saat Fonksiyonlar--DateTime TimeSpan

            DateTime dTarihi = new DateTime(1982, 2, 1);

            Console.WriteLine(dTarihi);
            DateTime simdi =DateTime.Now;
            Console.WriteLine(simdi);
            Console.WriteLine(DateTime.Now);
            Console.WriteLine(DateTime.Today);

            DateTime yarin = DateTime.Today.AddDays(1).AddYears(1);
            Console.WriteLine(yarin);

            TimeSpan aradakifark = DateTime.Today.Subtract(dTarihi);
            Console.WriteLine(aradakifark);

            int gun = DateTime.Now.Day;
            Console.WriteLine(gun);
            int yil = dTarihi.Year;
            Console.WriteLine(DateTime.Today.Year-dTarihi.Year);

            //  int sonuc=;DateTime.Compare(DateTime.Now, dTarihi)
            Console.WriteLine("sonuc:"+DateTime.Compare(dTarihi,DateTime.Now));

            TimeSpan zaman = new TimeSpan(1, 30, 10);//Zaman farkı bilgisi tutmak
            Console.WriteLine(DateTime.Now.Add(zaman));

            Console.WriteLine(DateTime.Now.ToString());
            
        }

    }
}
