using System;

class Buffer<T>
{
    public class fail : Exception
    {
        public fail()
        {
            Console.WriteLine("Buffer overflow. :)");
        }
    }

    T[] buf;
    int size;
    int head;
    int tail;

    public Buffer(int s)
    {
        size = s;
        buf = new T[size];
        tail = head = 0;
        for (int i = 0; i < size; ++i)
            buf[i] = default(T);
    }
    public static bool operator +(Buffer<T> b,T e)
    {
        if (b.head - b.tail >= b.size)
            return false;
        b.buf[b.head++ % b.size] = e;
        return true;
    }
    public T Elem
    {
        get
        {
            if (tail >= head)
                throw (new fail());
            T e = buf[tail % size];
            buf[tail++ % size] = default(T);
            return e;
        }
    }
    public int Capacity
    {
        get { return head - tail; }
    }
}

class Run
{
    public static void Main()
    {
        Buffer<int> b = new Buffer<int>(10);
        for (int i = 0; i < 10; ++i)
        {
            bool f = b + i;
        }
        Console.WriteLine("Capacity: " + b.Capacity + " Element: " + b.Elem + " Capacity again: " + b.Capacity);
        for (int i = 0; i < 10; ++i)
        {
            Console.WriteLine("Capacity: " + b.Capacity + " Element: " + b.Elem);
        }
        Console.ReadKey();
    }
}
