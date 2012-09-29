using System;

class Godzina
{
    int h = 0;
    int m = 0;
    int s = 0;

    public Godzina() { }
    public Godzina(int hour, int minute, int second)
    {
        dodaj(hour * 3600 + minute * 60 + second);
    }
    public void dodaj(int sec)
    {
        int tmp = s + sec;
        s = tmp % 60;
        m +=((tmp / 60) % 60);
        h += ((tmp / 3600) % 60);
        if (h >= 24)
        {
            h = 0;
            m = 0;
            s = 0;
            dodaj(tmp - 86400);
        }
    }
    public void dodaj(Godzina g)
    {
        dodaj(g.h * 3600 + g.m * 60 + g.s);
    }
    public static int operator -(Godzina g1, Godzina g2)
    {
        return (g1.h * 3600 + g1.m * 60 + g1.s) - (g2.h * 3600 + g2.m * 60 + g2.s);
    }
    public int Sekundy
    {
        get { return h * 3600 + m * 60 + s; }
    }
    public string Czas
    {
        get { return h.ToString() + ":" + m.ToString() + ":" + s.ToString(); }
    }
}

class Data
{
    int y = 1582;
    int m = 10;
    int d = 15;

    public Data() { }
    public Data(int year, int month, int day)
    {
        if (year > 1582 || (year == 1582 && (month > 10 || (month == 10 && day > 15))))
        {
            y = year;
            m = month;
            d = day;
        }
    }
    bool isLeapYear
    {
        get { return (y % 4 == 0 && y % 100 != 0) || y % 400 == 0; }
    }
    int daysInMonth(int m)
    {
        if (m == 1 || m == 3 || m == 5 || m == 7 || m == 8 || m == 10 || m == 12)
            return 31;
        else if (m == 4 || m == 6 || m == 9 || m == 11)
            return 30;
        else if (isLeapYear)
            return 29;
        else
            return 28;
    }
    public void dodaj(int days)
    {
        d += days;
        while (d > daysInMonth(m))
        {
            d -= daysInMonth(m);
            if (m == 12)
            {
                m = 1;
                y++;
            }
            else
                m++;
        }
    }
    static double toJulian(Data d)
    {
        int a = 4716 + d.y + ((d.m + 9) / 12);
        return (1729279.5 + 367 * d.y + (275 * d.m / 9) - (7 * a / 4) + d.d) + 38 - (3 * (((a + 83) / 100) + 1) / 4);
    }
    public static int operator -(Data d1, Data d2)
    {
        double l1 = toJulian(d1);
        double l2 = toJulian(d2);
        if (l1 > l2)
            return Convert.ToInt32(l1 - l2);
        else
            return Convert.ToInt32(l2 - l1);
    }
    public int Dni
    {
        get
        {
            int r = d;
            for (int i = 1; i < m; ++i)
            {
                r += daysInMonth(i);
            }
            return r;
        }
    }
    public string Date
    {
        get { return y.ToString() + "." + m.ToString() + "." + d.ToString(); }
    }
}

class Run
{
    public static void Main()
    {
        Godzina g = new Godzina();
        g.dodaj(88800);
        Console.WriteLine("Czas: " + g.Czas);
        Godzina g2 = new Godzina();
        g2.dodaj(120);
        int ss = g - g2;
        int sss = g.Sekundy;
        Console.WriteLine("Roznica: " + ss + " Sekundy: " + sss + " Sekundy2: " + g2.Sekundy);
        Godzina g3 = new Godzina(23, 40, 0);
        Console.WriteLine(g3.Czas);
        Data d = new Data();
        d.dodaj(700);
        Data d2 = new Data();
        d2.dodaj(14000);
        int fh = d - d2;
        Console.WriteLine("Data: " + d.Date + " Roznica: " + fh + " Dzien: " + d.Dni);
        Data d3 = new Data(2000, 10, 16);
        Console.WriteLine(d3.Date);
        Console.ReadKey();
    }
}
