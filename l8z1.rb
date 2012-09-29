class Fixnum
  def prime?
    prime=true
    2.upto(Math.sqrt(self)) do |i|
      if self%i==0
        prime=false
        break
      end
    end
    prime
  end
  def slownie
    slowa=['zero','jeden','dwa','trzy','cztery','piec','szesc','siedem','osiem','dziewiec']
    cyfry=self.to_s.split('')
    if cyfry[0]=='-'
      slowo="minus"
    else
      slowo=slowa[Integer(cyfry[0])]
    end
    1.upto(cyfry.length-1) do |i|
      slowo+=' '+slowa[Integer(cyfry[i])]
    end
    slowo
  end
  def doskonala
    suma=0
    (self-1).downto(1) do |i|
      suma+=i if self%i==0
    end
    suma==self
  end
  def ack(y)
    if self==0
      y+1
    elsif y==0
      (self-1).ack(1)
    else
      (self-1).ack(self.ack(y-1))
    end
  end
end

puts 15.prime?
puts 17.prime?
puts 14546532.slownie
puts 6.doskonala
puts 9.doskonala
puts 3.ack(4)