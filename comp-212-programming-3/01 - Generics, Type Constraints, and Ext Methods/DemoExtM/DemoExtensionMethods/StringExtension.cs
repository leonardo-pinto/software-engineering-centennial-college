using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace DemoExtensionMethods
{
    public static class StringExtension
    {
        public static string CapitalizeFirstChararcter(this string strpara)
        {
            StringBuilder capitalizedString = new StringBuilder();

            string[] allWords = strpara.Split(null);
            foreach (string item in allWords)
            {
                capitalizedString.Append(Regex.Replace(item, @"^\w", mbox => mbox.Value.ToUpper())
                    + " ");
            }

            return capitalizedString.ToString();
        }
    }
}
