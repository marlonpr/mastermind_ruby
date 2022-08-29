require 'colorize'

# Mastermind game
class Game
  attr_accessor :p1_selector, :pin_to_match

  def initialize
    set_p1_selector
    set_p1_pin if @p1_selector == 1
  end

  def set_p1_selector
    puts "Would you like to be the code MAKER or code BREAKER? \n

    Press '1' to be the code MAKER \n
    Press '2' to be the code BREAKER"
    @p1_selector = gets.chomp.to_i
    return if @p1_selector == 1 || @p1_selector == 2

    puts 'Invalid selector, try again'.red
    set_p1_selector
  end

  def set_p1_pin
    i = 0
    puts "Please enter a 4-digit 'master code' for the computer to break."
    @p1_pin = gets.chomp
    set_p1_pin if @p1_pin.length != 4 && @p1_pin.to_i != 0
    @p1_pin = @p1_pin.split('')
    p @p1_pin
    @pin_to_match = []
    @pin_to_match
    @p1_pin.each_with_index do |x, idx|
      if x == pin_to_match[idx]
        puts 'ok'
        i += 1
        if i == 4
          puts 'match'
        end
      end
    end
  end
end

a = Game.new
