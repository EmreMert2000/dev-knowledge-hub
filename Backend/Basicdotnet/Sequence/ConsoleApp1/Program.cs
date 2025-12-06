using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp1
{
    internal class Program
    {
      public static  int Topla(int n)
        {
            if (n == 0) return 0;
            return n + Topla(n - 1);
        }
        static void Main(string[] args)
        {

            Console.WriteLine(Topla(5));
            Console.ReadLine();

        }
     
    }
}
