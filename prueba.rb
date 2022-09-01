require 'colorize'

user0 = [3,1,3,1]
p user0
puts "------------ \n"
possible = [1,2,3,4,5,6]
ciclo = 8
i = -1
rigth_position = 0
wrong_position = 0
clue = 0
c = 0


tried_numbers = []
discovered_numbers = []
try = []

until ciclo.negative? || rigth_position > 3

  puts ciclo
  user = user0.dup
  first_try = (possible - tried_numbers).sample
  discovered_numbers[3] = discovered_numbers[2] if discovered_numbers.length == 3 && rigth_position + wrong_position == 4
  actual_try = Array.new(4 - discovered_numbers.length, first_try)
  length = actual_try.length
  discovered_numbers.each_with_index do |number, idx|
    actual_try[length + idx] = number
  end

  actual_try.reverse! if rigth_position + wrong_position != 4
  if rigth_position + wrong_position == 4
    if clue == 1
      c += 1
      if c == 1
        try = actual_try.dup
        actual_try[0], actual_try[3] = actual_try[3], actual_try[0] 
      end
      if c == 2
        actual_try = try
        actual_try[1], actual_try[2] = actual_try[2], actual_try[1]
        actual_try[2], actual_try[3] = actual_try[3], actual_try[2]
      end
    end
  end

  p actual_try
  rigth_position = 0
  wrong_position = 0
  user.each_with_index do |current_number, idx|
    tried_numbers.push actual_try[idx]
    if actual_try.include? current_number
      actual_try.each_with_index do |actual_element, actual_idx|
        if discovered_numbers[actual_idx].nil?
          if actual_element == current_number && actual_idx == idx
            rigth_position += 1
            user[idx] = 0
            i += 1
            discovered_numbers[i] = actual_element
          end
          next
        end
        if actual_element == current_number && actual_idx == idx
          rigth_position += 1
          user[idx] = 0
        end
      end
      if discovered_numbers.length == 2 && discovered_numbers[0] == discovered_numbers[1] && clue != 1
        clue = 1 
      end
    end
  end
  actual_try.each_with_index do |actual_element, actual_idx|
    if discovered_numbers[actual_idx].nil?
      if user.include? actual_element
        wrong_position += 1
        user[user.index actual_element] = 0
        i += 1
        discovered_numbers[i] = actual_element
        puts actual_element
      end
      next
    end
    if user.include? actual_element
      wrong_position += 1
      user[user.index actual_element] = 0
    end
  end
  ciclo -= 1
  rigth_position.times { print '● '.colorize(color: :light_green) }
  wrong_position.times { print '○ '.colorize(color: :light_white) }
  puts ''
end
