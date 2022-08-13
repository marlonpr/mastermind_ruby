require 'colorize'
require 'perfect-shape'

print "  1  ".colorize(:color => :light_white, :background => :light_blue)
print "     2  ".colorize(:color => :light_white, :background => :cyan)
puts "     3  ".colorize(:color => :light_white, :background => :magenta)
print "  4  ".colorize(:color => :light_white, :background => :light_red)
print "     5  ".colorize(:color => :light_white, :background => :yellow)
puts "     6  ".colorize(:color => :light_white, :background => :green)




shape = PerfectShape::Line.new(points: [[0, 0], [100, 100]]) # start point and end point

shape.contain?(50, 50) # => true
shape.contain?([50, 50]) # => true
shape.contain?(50, 51) # => false
shape.contain?([50, 51]) # => false
shape.contain?(50, 51, distance_tolerance: 5) # => true
shape.contain?([50, 51], distance_tolerance: 5) # => true

p shape