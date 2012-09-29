using System;

class Elem<T>
{
    T value;
    Elem<T> prev;
    Elem<T> next;
    public Elem() { }
    public Elem(T value)
    {
        this.value = value;
    }
    public Elem(T value, Elem<T> next)
    {
        this.value = value;
        this.next = next;
    }
    public Elem(Elem<T> prev, T value)
    {
        this.value = value;
        this.prev = prev;
    }
    public T Value()
    {
        return this.value;
    }
    public Elem<T> Prev
    {
        get { return this.prev; }
        set { this.prev = value; }
    }
    public Elem<T> Next
    {
        get { return this.next; }
        set { this.next = value; }
    }
}

public class Lista<T>
{
    Elem<T> first = new Elem<T>();
    Elem<T> last = new Elem<T>();
    int count = 0;

    void init(T value)
    {
        Elem<T> e = new Elem<T>(value);
        first = e;
        last = e;
    }
    public void AddToBeginning(T value)
    {
        if (count++ == 0)
        {
            init(value);
        }
        else
        {
            Elem<T> e = new Elem<T>(value, first);
            first.Prev = e;
            first = e;
        }
    }
    public void AddToEnd(T value)
    {
        if (count++ == 0)
        {
            init(value);
        }
        else
        {
            Elem<T> e = new Elem<T>(last, value);
            last.Next = e;
            last = e;
        }
    }
    public void DeleteFirst()
    {
        if (!IsEmpty())
        {
            first = first.Next;
            if (count-- != 1)
                first.Prev = null;
        }
    }
    public void DeleteLast()
    {
        if (!IsEmpty())
        {
            last = last.Prev;
            if (count-- != 1)
                last.Next = null;
        }
    }
    public bool IsEmpty()
    {
        return count == 0;
    }
    public T Top()
    {
        return first.Value();
    }
    public T Bottom()
    {
        return last.Value();
    }
}