class Funkcja
  def initialize(b)
    @fun=b
  end
  def value(x)
    @fun.call(x)
  end
  def zerowe(a,b,e)
    zerowe=Array.new
    while a<=b do
      zerowe<<a if @fun.call(a)==0
      a+=e
    end
    zerowe
  end
  def pole(a,b)
    n=20
    s=st=0
    dx=(b-a).to_f/n
    1.upto(n) do |i|
      x=a+i*dx
      st+=@fun.call(x-dx/2)
      s+=@fun.call(x) if i!=n
    end
    s=dx/6*(@fun.call(a)+@fun.call(b)+2*s+4*st)
  end
  def poch(x)
    h=0.01
    f1=(@fun.call(x+h)-@fun.call(x))/h
    while true
      h/=2
      f2=(@fun.call(x+h)-@fun.call(x))/h
      break if (f2-f1).abs<1e-7
      f1=f2
    end
    sprintf("%.6f",f2) # I'm sorry :(
  end
  def rysuj(a,b)
		min=max=@fun.call(a)
		(a+1).upto(b) do |i|
			if (c=@fun.call(i))<min then
				min=c
			elsif c>=max then
				max=c
			end
		end
		if max>0 then
			n=max+min
		else
			n=max-min
		end
		if a>0 then
			m=b+a
		else
			m=b-a
		end
		points=Array.new(n+1)
		points.map!{Array.new(m+1)}
		0.upto(max) do |i|
			0.upto(b) do |j|
				points[i][j]=0
			end
		end
		c=@fun.call(a)
		points[c][a]=1
		(a+1).upto(b) do |i|
			d=@fun.call(i)
			g=(c-d).abs/2+c
			c.upto(g) do |j|
				points[j][i-1]=1
			end
			g.upto(d) do |j|
				points[j][i]=1
			end
			points[d][i]=1
			c=d
		end
		max.downto(0) do |i|
			0.upto(b) do |j|
				if points[i][j]==1 then
					printf("#")
				else
					printf(" ")
				end
			end
			printf("\n")
		end
  end
end

f=Funkcja.new(lambda {|x| -2*x*x+x+1})
puts "Wartosc w punkcie 3:",f.value(3),"Miejsca zerowe:",f.zerowe(-4,4,0.5)
f2=Funkcja.new(lambda {|x| (x-1)*(x-1)})
f3=Funkcja.new(lambda {|x| x*x+2*x})
puts "Pochodna:",f2.poch(0),"Pole:",f3.pole(0,5)
puts "Szkic wykresu:"
f4=Funkcja.new(lambda {|x| x + 2})
f4.rysuj(1,5)
