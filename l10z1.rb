class Kolekcja
  def initialize
    @tab = Array.new
  end
  def add(elem)
    @tab.insert(@tab.length ,elem)
  end
  def length
    @tab.length
  end
  def get(i)
    @tab[i]
  end
  def delete
    @tab.delete_at(@tab.length - 1)
  end
  def swap(a, b)
    @tab[a], @tab[b] = @tab[b], @tab[a]
  end
  def to_s
    tab_s = "["
    (@tab.length).times do |i|
       tab_s += " " + @tab[i].to_s
    end
    tab_s += " ]"    
  end
end

class Sortowanie
  def sort1(kol)
     for j in 0..(kol.length - 1)
       for i in 0..(kol.length - 2)
         if (kol.get(i) > kol.get(i + 1))
           kol.swap(i, i + 1)
         end
       end
     end
     kol
   end
  def sort2(kol)
    for j in 0..(kol.length - 1)
      min = j;
        for i in j..(kol.length - 1)
          if(kol.get(i) < kol.get(min))
            min = i
          end
        end
      kol.swap(min, j)
    end
  end
end
kol1 = Kolekcja.new
2000.times {kol1.add(rand)}
kol2 = Kolekcja.new
2000.times {kol2.add(rand)}

sort = Sortowanie.new
start=Time.now
sort.sort1(kol1)
puts Time.now-start
start=Time.now
sort.sort2(kol2)
puts Time.now-start
