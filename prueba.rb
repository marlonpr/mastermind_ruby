require 'colorize'

user0 = [1,2,3,4]
p user0
puts "------------ \n"
possible = [1,2,3,4,5,6]
ciclo = 0
i = -1
rigth_position = 0
wrong_position = 0
clue = 0
c = 0


tried_numbers = []
discovered_numbers = []
try = []
try_arr = []
#ciclo.negative? ||

until  rigth_position > 3

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
    if clue != 1 && clue != 2 && clue != 3 && clue != 4
      actual_try.shuffle! while try_arr.include? actual_try
      try_arr << actual_try.dup
      puts 'hello'
    end
    if clue == 4
      actual_try.shuffle! while try_arr.include? actual_try
      actual_try.shuffle! until actual_try[0] == discovered_numbers[1] 
      try_arr << actual_try.dup
      puts 'hi'
    end
    if clue == 3
      actual_try.shuffle! while try_arr.include? actual_try
      actual_try.shuffle! while actual_try[0] == discovered_numbers[0] || actual_try[0] == discovered_numbers[1]
      try_arr << actual_try.dup
      puts 'que rollo'
    end
    if clue == 2
      actual_try.shuffle! while try_arr.include? actual_try
      actual_try.shuffle! until actual_try[0] == discovered_numbers[0] 
      try_arr << actual_try.dup
      puts 'que rock'
    end
    if clue == 1
      c += 1
      puts 'hola'
      try = actual_try.dup if c == 1
      if c == 1
        actual_try = try.dup
        actual_try[0], actual_try[3] = actual_try[3], actual_try[0]
        try_arr << actual_try.dup 
      end
      if c == 2
        actual_try = try.dup
        actual_try[1], actual_try[2] = actual_try[2], actual_try[1]
        actual_try[2], actual_try[3] = actual_try[3], actual_try[2]
        try_arr << actual_try.dup
      end
      if c == 3
        actual_try = try.dup
        actual_try[1], actual_try[3] = actual_try[3], actual_try[1]
        actual_try[2], actual_try[3] = actual_try[3], actual_try[2]
        try_arr << actual_try.dup
      end
      if c == 4
        actual_try = try.dup
        actual_try[0], actual_try[3] = actual_try[3], actual_try[0]
        actual_try[2], actual_try[3] = actual_try[3], actual_try[2]
        try_arr << actual_try.dup
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
      if discovered_numbers.length == 2 && discovered_numbers[0] == discovered_numbers[1] && clue != 1 && clue != 2
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
  clue = 4 if discovered_numbers.length == 2 && wrong_position == 2 && rigth_position.zero? && clue != 1 && clue != 2 && clue != 3 && clue != 4
  clue = 3 if discovered_numbers.length == 2 && wrong_position == 1 && rigth_position == 1 && clue != 1 && clue != 2 && clue != 3 && clue != 4
  clue = 3 if discovered_numbers.length == 3 && wrong_position == 1 && rigth_position == 2 && clue != 1 && clue != 2 && clue != 3 && clue != 4
  clue = 2 if discovered_numbers.length == 3 && wrong_position.zero? && rigth_position == 3 && clue != 1 && clue != 2 && clue != 3 && clue != 4
  clue = 2 if discovered_numbers.length == 2 && wrong_position.zero? && rigth_position == 2 && clue != 1 && clue != 2 && clue != 3 && clue != 4
  ciclo += 1
  rigth_position.times { print '● '.colorize(color: :light_green) }
  wrong_position.times { print '○ '.colorize(color: :light_white) }
  puts ''
end
