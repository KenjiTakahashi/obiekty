using System;

class Run
{
    public static void Main()
    {
        Lista<string> l = new Lista<string>();
        l.AddToBeginning("test1");
        l.AddToBeginning("test2");
        l.AddToBeginning("test3");
        Console.WriteLine(l.Top() + l.Bottom() + "\n");
        l.AddToEnd("endTest");
        Console.WriteLine(l.Top() + l.Bottom());
        Console.ReadKey();
    }
}
