using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Diziler
{
    internal class Program
    {
        static void Main(string[] args)
        {
            //diziler(Array) : aynı türden verilerin saklandığı değişkenler .Referans tiplidir.
            //bir dizinin alt elemanlarıda dizielerden oluşursa bun açok boyutlu dizi deniz.
            //düzenli ve düzensiz çok boyutlu diziler vardır.

            int[] sayilar = { 10, 20, 60, 50, 40 };//Dizi uzunluğu elemansayısıdır.

            int[] sayilar2 = new int[4];
            sayilar2[0] = 30;

            //Soru: kullanıcının girdiği elaman sayısı kadar bir dizi tanımlanıp gene kullanıcının girsiği sayılar bu diziye değerr olarak atansın
            //Console.WriteLine("kaç sayı giriceksiniz");
            //byte uzunluk=Convert.ToByte(Console.ReadLine());
            //int[] liste=new int[uzunluk];

            //for (int i = 0;i<uzunluk;i++)
            //{
            //    Console.WriteLine((i+1)+" . sayıyı giriniz");
            //    liste[i]=Convert.ToInt32(Console.ReadLine());
            //}
            //Console.WriteLine("*******");
            //foreach (var item in liste)
            //{
            //    Console.WriteLine(item);
            //}

            //Düzenli(matris) dizi. Elemanları eşit miktarda eleman sayısına sahip dizilerden oluşan dizilerdir.
            int[,] ogrenciler = { {1,90}, {2,80}, {3,100}, {4,60} };
            Console.WriteLine("1.Öğrenci no:" + ogrenciler[0,0]);
            Console.WriteLine("1. öğrenci not" + ogrenciler[0,1]);
            Console.WriteLine("3.öğrenci not" + ogrenciler[2,1]);

            //Düzensiz diziler. Elamnları dizilerden oluşan fakat eleman dizilerin uzunluklarının farklı oldduğu dizilerdir
            int[][] ogrenciler2 = new int[4][];
            ogrenciler2[0] =new int[]{1,20,80};
            ogrenciler2[1] = new int[] { 2,25 };
            ogrenciler2[2] = new int[] { 3, 18, 100, 80 };

            //c# ta koleksiyonlar. birden fazla veriyi düzenki ve esnek bir şekilde saklamızı sağlayan yapılardır. dizilerden farklı olarak dinamiktirler
            //tüm koleksiyonlar IEnumerable arayüzünü uygular. Yani Foreach ile dolaşılabilir.
            //Nezaman hangi koleksiyon kullanılır.
            //ArrayList: Veri sayısı değişkense ve dizi yeterli değilse. Arraylist farklı tiplerde veriyi aynı anda tutabilir. herşeyi objeck olarak saklarlar. Generic değildirler
           

            //ArrayList
            ArrayList sinif= new ArrayList();
            sinif.Add("ali");
            sinif.Add(80);
            sinif.Add('E');
            Console.WriteLine(sinif[0]);
            Console.WriteLine(sinif[1]);


            //List<T> kullanımı:tanımlama yapıldığı türde değer alırlar. Generic tirler
            List<int> sayilarList = new List<int> {10,20,30 };
            sayilarList.Add(50);
            sayilarList.Add(10);
            Console.WriteLine("Lİst listeleme");
            foreach (var item in sayilarList)
            {
                Console.WriteLine(item);
            }

            //Dictionary<Tkey,TValue> kullanımı:Anahtar-değer çiftlerini tutarlar.koleksiyon elemanları anahtarları ile işlenirler.
            Dictionary<int,string> ogrencilerDct= new Dictionary<int,string>();
            ogrencilerDct.Add(101, "Ali");
            ogrencilerDct.Add(102, "Veli");
            ogrencilerDct.Add(103, "Ömer");
            Console.WriteLine("Dictionary listeleme");
            Console.WriteLine(ogrencilerDct[101]);
            foreach (var item in ogrencilerDct)
            {
                Console.WriteLine(item);
            }
            //HashSet<T>kullanımı: Tekrar eden verileri saklamazlar
            HashSet<int> benzersizSayilar= new HashSet<int>{4,6,7};
            benzersizSayilar.Add(4);
            benzersizSayilar.Add(10);
            Console.WriteLine("HAshset listeleme");
            foreach (var item in benzersizSayilar)
            {
                Console.WriteLine(item);
            }

            //Queue<T>(kuyruk)- "İlk gelen ilk çıkar"(FIFO)
            Queue<string> kuyruk=new Queue<string>();
            kuyruk.Enqueue("ali");
            kuyruk.Enqueue("veli");
            kuyruk.Enqueue("Ömer");
            Console.WriteLine("queue listeleme");
            foreach (var item in kuyruk)
            {
                Console.WriteLine(item);
            }
            kuyruk.Dequeue();

            Console.WriteLine("queue listeleme");
            foreach (var item in kuyruk)
            {
                Console.WriteLine(item);
            }
            //Stack<Yığın>- "Son giren ilk çıkar"(LIFO)
            Stack<string> kitapyigini=new Stack<string>();
            kitapyigini.Push("kitap 1");
            kitapyigini.Push("kitap 2");
            kitapyigini.Push("kitap 3");
            Console.WriteLine("Stack listeleme");
            foreach (var item in kitapyigini)
            {
                Console.WriteLine(item);
            }

            kitapyigini.Pop();
            
            Console.WriteLine("Stack listeleme");
            foreach (var item in kitapyigini)
            {
                Console.WriteLine(item);
            }
            Console.WriteLine("********");
            string son=kitapyigini.Pop();
            Console.WriteLine(son);
        


        }
    }
}
