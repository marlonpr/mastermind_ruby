def paloma(x)
    result = ""
    x.times{result += "/"}
    result
end

def cruz(x)
    result = ""
    x.times{result += "x"}
    result
end

paloma = 0
cruz = 0
pin0 = [2,3,3,4]
p pin0
answer = [2,2,2,2]
pin2 = []
array = [1,2,3,4,5,6]
n = 5
i = -1
j = 0
data = 0
data2 = 0
times = 0
times2 = 0
times3 = 0

while n > 0  

  number = rand(5)
  if array[number] > 0
    number = 1 if n == 5
    times.times {pin2 << data}
    times2.times {pin2 << data2}
    times3 = times + times2
    (4 - times3).times {pin2 << array[number]}
    p pin2
    pin = pin0.dup
    

    pin2.each_with_index do |x, idx|
      if x == pin[idx]
        paloma += 1 
        i += 1
        pin[idx] = 'x'
        pin2[idx] = 'y'
        answer[i] = x
        data = x
      end
    end



    pin2.each_with_index do |x, idx|
      if pin.include? x
        cruz += 1 
        answer[i] = x
        pin[pin.index(x)] = 0
        data2 = x
      end
    end

    print paloma(paloma)
    puts cruz(cruz)

    times = paloma
    times2 = cruz
    pin2 = []
    paloma = 0
    cruz = 0
    
    #pin2 = answer.dup
    array[number] = 0    
    #j = 1

  n -= 1
  p i
  end
  
end
p answer

