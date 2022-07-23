using System;
using System.Collections;
using System.Collections.Generic;

namespace Problem_Solving
{
    class Program
    {
        static void Main(string[] args)
        {
            string[] A1 = { "Watermelon", "Apple", "Mango", "Guava", "Banana"};
            string[] A2 = { "Orange", "Kiwi", "Apple", "Watermelon" };

            Console.WriteLine("Hello World!");
            foreach (var item in UniqueFruits(A1,A2))
            {
                if(item.Value == 1)
                Console.WriteLine($" {item.Key}");
            }
            Console.ReadKey();
        }


        static Dictionary<string,int>  UniqueFruits(string[] firstArray,string[] secoundArray)
        {
            string[] MergeArray = new string[firstArray.Length + secoundArray.Length];

            var Dict = new Dictionary<string, int>();
            Array.Copy(firstArray, MergeArray, firstArray.Length);
            Array.Copy(secoundArray, 0, MergeArray, firstArray.Length, secoundArray.Length);
            Array.Sort(MergeArray);
            foreach (string item in MergeArray)
            {

                if (Dict.ContainsKey(item)) 
                    Dict[item]++;
                else Dict[item] = 1;
            }

            return Dict;
        }


           }
}


