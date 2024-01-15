using System.Collections;

static class StringClass
{
    public static bool IsGreaterThanTenChars(this String str1)
    {
        return str1.Length > 10;
    }
}

public class GenericExample
{
    public static void DisplayArray(int[] arr)
    {
        foreach (int value in arr)
        {
            Console.Write($"{value} ");
        }
        Console.WriteLine();
    }

    // generic class
    public class GenericClass<K, V>
    {
        public K Key;
        public V Value;

        public GenericClass(K key, V value)
        {
            Key = key;
            Value = value;

        }
    }

    public static void GenericDisplay<T>(T[] arr) where T:struct
    {
        foreach (T value in arr)
        {
            Console.Write($"{value} ");
        }
        Console.WriteLine();
    }

    public static void Main(string[] args)
    {
        int[] integers = { 1, 2, 3, 4 };
        string[] words = { "Leonardo", "Amell" };
        DisplayArray(integers);
        GenericDisplay(integers);
        //GenericDisplay(words);

        // generic collections
        List<int> integersList = [1, 2, 3,];

        // non-generic collections
        ArrayList arrayList = [];
        // The performance of ArrayList is worse in comparison to List
        // due to boxing/unboxing


        int a = 1;
        // boxing
        Object obj = a;

        // unboxing
        int b = (int) obj;

        // generic classes
        GenericClass<int, String> genericClass = new GenericClass<int, string>(30, "Leonardo");

        Dictionary<int, int> myDict = new Dictionary<int, int> { { 1, 2 } };

        // IComparable<T>

        // where T:struct for value types
        // where T:class for reference types


        // Extension methods
        String str = "Leonardo";
        Console.WriteLine(str.IsGreaterThanTenChars());


    }
}