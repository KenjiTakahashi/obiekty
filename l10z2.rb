class Element
  def initialize(wart)
    @wartosc = wart
    @nastepny = @poprzedni = nil
   end
  def wartosc
    @wartosc
  end
  def ust_wart(wart)
    @wartosc = wart
  end
  def nastepny
     @nastepny
  end
  def ustaw_poprz(elem)
    @poprzedni = elem
  end
  def ustaw_nast(elem)
    @nastepny = elem
  end
  def to_s
    if @nastepny != nil
      @wartosc.to_s + " " + @nastepny.to_s
    else
      @wartosc.to_s + "]"
    end
  end
end

class Kolekcja
  def initialize
    @ilosc = 0
    @pierwszy = @ostatni = nil
  end
  def glowa
    @pierwszy
  end
  def dodaj(wart)
    tmp = Element.new(wart)
    if @ilosc == 0
      @pierwszy = @ostatni = tmp
    elsif @ilosc == 1
      if wart < @pierwszy.wartosc
        @pierwszy = tmp
      else
        @ostatni = tmp
      end
      @pierwszy.ustaw_nast(@ostatni)
      @ostatni.ustaw_poprz(@pierwszy)
    else
      if wart <= @pierwszy.wartosc
        tmp.ustaw_nast(@pierwszy)
        @pierwszy.ustaw_poprz(tmp)
        @pierwszy = tmp
      elsif wart >= @ostatni.wartosc
        tmp.ustaw_poprz(@ostatni)
        @ostatni.ustaw_nast(tmp)
        @ostatni = tmp
      else
        z = true
        nast = @pierwszy
        while z
          if ( wart >= nast.wartosc && wart <= nast.nastepny.wartosc)
            temp = nast.nastepny
            nast.ustaw_nast(tmp)
            temp.ustaw_poprz(tmp)
            tmp.ustaw_nast(temp)
            tmp.ustaw_poprz(nast)
            z = false
          else
            nast = nast.nastepny
          end
        end
      end     
    end
    @ilosc += 1
  end
  def dlugosc
    @ilosc
  end
  def wartosc(i)
    nast = @pierwszy
    k = 0
    while k < i - 1
      nast = nast.nastepny
      k += 1
    end
    nast.wartosc
 end
  def to_s
    "[" + @pierwszy.to_s
  end
end

class Wyszukiwanie
  def liniowe(wart, kol)
    nast = kol.glowa
    k = 1
    while k <= kol.dlugosc
      if wart == nast.wartosc
        return k
      else
        k += 1
        nast = nast.nastepny
      end
    end
  end
  def binarne(wart, kol)
    a = 1
    b = kol.dlugosc
    while a <= b
      c  = (a + b) / 2
      if kol.wartosc(c) == wart
        return c
      elsif wart<kol.wartosc(c)
        b = c - 1
      else
        a = c + 1
      end
    end
  end
end

kol = Kolekcja.new
kol.dodaj(7)
kol.dodaj(5)
kol.dodaj(2)
kol.dodaj(3)
kol.dodaj(6)

puts kol.to_s

wysz = Wyszukiwanie.new
puts wysz.binarne(7, kol)
