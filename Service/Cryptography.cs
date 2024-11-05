using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace Service
{
    public class Cryptography
    {
        public static string Hash(string value)
        {
            SHA1CryptoServiceProvider sh = new SHA1CryptoServiceProvider();
            sh.ComputeHash(ASCIIEncoding.ASCII.GetBytes(value));
            byte[] re = sh.Hash;
            StringBuilder sb = new StringBuilder();
            foreach (byte i in re)
            {
                sb.Append(i.ToString("x2"));
            }
            return sb.ToString();
        }
    }
}
