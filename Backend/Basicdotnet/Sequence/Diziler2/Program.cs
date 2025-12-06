using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Diziler2
{
    internal class Program
    {
        static void Main(string[] args)
        {
            int[] sayilar = { 10, 20, 40, 10, 50, 30 };
            Console.WriteLine(sayilar.Length);
            Array.Sort(sayilar);
            Array.Reverse(sayilar);
            Array.Clear(sayilar,0,3);
            Console.WriteLine(Array.IndexOf(sayilar, 40));
            if (Array.IndexOf(sayilar,50)==-1)
            {
                Console.WriteLine("sayı yok");
            }
            else
            {
                Console.WriteLine("sayi var");
            }
                foreach (int i in sayilar)
                {
                    Console.WriteLine(i);
                }

            ArrayList notlar= new ArrayList();
            notlar.Add(100);
            notlar.Add(80);
            notlar.Add(70);
            notlar.Add(100);
            Console.WriteLine("******");
            Console.WriteLine(notlar.IndexOf(100));
            Console.WriteLine(notlar.LastIndexOf(100));

            notlar.Remove(100);
            notlar.RemoveAt(2);
            //notlar.Clear();
            notlar.Sort();
            notlar.Reverse();
            
            
            
            






        }
    }
}
