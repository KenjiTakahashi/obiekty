using System;

class Run
{
    public static void Main()
    {
        Ngleton ngleton1 = Ngleton.Instance();
        ngleton1.name = "1";
        Ngleton ngleton2 = Ngleton.Instance();
        ngleton2.name = "2";
        Ngleton ngleton3 = Ngleton.Instance();
        ngleton3.name = "3";
        Ngleton ngleton4 = Ngleton.Instance();
        ngleton4.name = "4";
        Ngleton ngleton5 = Ngleton.Instance();
        ngleton5.name = "5";
        Ngleton ngleton6;
        for (int i = 0; i < 12; ++i)
        {
            if (i % 5 == 0)
                Console.WriteLine("\n");
            ngleton6 = Ngleton.Instance();
            Console.WriteLine(ngleton6.name);
        }
        Console.ReadKey();
    }
}