using System;

sealed public class Ngleton
{
    Ngleton() { }
    static int number = 0;
    static int size = 0;
    const int cons = 5;
    static Ngleton[] instance=new Ngleton[cons];
    public string name;
    public static Ngleton Instance()
    {
        if (size < cons)
            instance[size++] = new Ngleton();
        else if (number >= cons)
            number = 0;
        return instance[number++];
    }
}
