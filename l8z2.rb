class Jawna
  def initialize(w)
    @slowo=w
  end
  def zaszyfruj(k)
    szyfr=String.new
    0.upto(@slowo.length-1) do |i|
      szyfr<<@slowo[i]+k
    end
    Zaszyfrowane.new(szyfr)
  end
  def to_s
    @slowo
  end
end

class Zaszyfrowane
  def initialize(w)
    @szyfr=w
  end
  def odszyfruj(k)
    slowo=String.new
    0.upto(@szyfr.length-1) do |i|
      slowo<<@szyfr[i]-k
    end
    Jawna.new(slowo)
  end
  def to_s
    @szyfr
  end
end

slowo=Jawna.new('Ala ma kota')
puts slowo.to_s
szyfr=slowo.zaszyfruj(3)
puts szyfr.to_s
puts szyfr.odszyfruj(3).to_s