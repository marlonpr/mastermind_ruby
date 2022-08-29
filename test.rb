def ev2
  pin.each_with_index do |x, idx|
    if pin.include? pin2[idx]
      puts 'include'
      pin[pin.index(pin2[idx])] = 'x'
    end
  end
end

def evaluate
  n = 4
  answer = []
  array = [1, 2, 3, 4, 5, 6]
  
  
  while n > 0
    j = ''
    k = ''
    number = rand(5)
    if array[number] > 0
      pin2 = []
      #4.times { pin2 << array[number] }
      i = 0
      pin = [2,6,2,6]
      pin2 = [6,6,6,6] if n == 4
      pin2 = [2,2,2,2] if n == 2
      p pin2
      p answer
      answer.each_with_index { |x, idx| pin2[idx] = x}       
      p pin
      p pin2
      puts n
      pin.each_with_index do |x, idx|
        if x == pin2[idx]
          answer[answer.length] = pin2[idx]
          i += 1
          k += 'k'          
          n -= 1
          puts pin2[idx]
          pin[idx] = 0
          unless array.index(pin2[idx]).nil?
            array[array.index(pin2[idx])] = 0
          end
          puts n
        end        
      end
      pin.each_with_index do |x, idx| 
        if pin.include? pin2[idx]
          j += 'j'
          pin[idx] = 0
        end
      end 

      p j  
      p k
      array[array.index(pin2.last)] = 0 if i.zero? && !array.index(pin2.last).nil?
      p array
    end
  end
  p answer
  
  p k + j
end

evaluate



