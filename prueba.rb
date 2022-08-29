user0 = [1,2,3,4]
possible = [1,2,3,4,5,6]
#first_try = possible.sample
#actual_try = Array.new(4, first_try)
rigth_position = 0
wrong_position = 0
ciclo = 4

tried_numbers = []
#discovered_numbers = []

while ciclo > 0
  user = user0.dup    
  first_try = (possible - tried_numbers).sample
  actual_try = Array.new(4, first_try)
  actual_try = [1,1,2,2] if ciclo == 3
  p actual_try
  user.each_with_index do |current_number, idx|
    if actual_try.include? current_number
      actual_try.each_with_index do |actual_element, actual_idx|
        if actual_element == current_number && actual_idx == idx
          rigth_position += 1
          user[idx] = 0
        end
      end
    end
    tried_numbers.push actual_try[idx]
  end
  actual_try.each do |actual_element|
    if user.include? actual_element
      wrong_position += 1
      user[user.index actual_element] = 0
    end
  end
  ciclo -= 1
end

puts rigth_position
puts wrong_position
p (possible - tried_numbers)

