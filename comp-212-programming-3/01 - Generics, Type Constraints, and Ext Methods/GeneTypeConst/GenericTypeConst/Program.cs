using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DemoGenericTypeConstraints
{
    class Program
    {
        static void Main(string[] args)
        {
            string s1 = "target";
            System.Text.StringBuilder sb = new System.Text.StringBuilder("target");
            string s2 = sb.ToString();
            OpEqualsTest<string>(s1, s2);

            Object num1 = 10;
            Object num2 = 10;
            OpEqualsTest<Object>(num1, num2);
            Console.ReadKey();

            Dimensions d1 = new Dimensions(10,20);
            Dimensions d2 = new Dimensions(20, 30);

            OpEqualsTest<Dimensions>(d1, d2);
        }

        public static void OpEqualsTest<T>(T s, T t) where T : class
        {
            //System.Console.WriteLine(s == t);
        }
      
    }
}
