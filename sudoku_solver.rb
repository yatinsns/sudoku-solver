#!/usr/bin/env ruby

class SodukoSolver
  def initialize(config)
    @@config = config.split(//)
  end

  def is_same_row(i, j)
    (i / 9) == (j / 9)
  end

  def is_same_column(i, j)
    (i % 9) == (j % 9)
  end

  def is_same_3x3_box(i, j)
    ((i / 27) == (j / 27)) && ((i % 9) / 3 == (j % 9) / 3)
  end

  def is_in_relation(i, j)
    is_same_row(i, j) || is_same_column(i, j) || is_same_3x3_box(i, j)
  end
 
  def solve
    hash = Hash.new

    81.times do |index|
      next if @@config[index].to_i != 0

      81.times do |new_index|
        hash[@@config[new_index]] = 1 if is_in_relation(index, new_index)
      end

      (1..9).each do |option|
        next if hash.has_key? option.to_s

        @@config[index] = option.to_s
        solve
      end
      return @@config[index]=0
    end

    show
  end

  def show
    horizontal_separator = "+-----------------------+"
    vertical_separator = "|"

    puts horizontal_separator
    81.times.each do |num|
      if num % 3 == 0 
        print vertical_separator, " "
      end
      print "#{@@config[num]} "
      if num % 9 == 8
        puts vertical_separator
        puts horizontal_separator 
      end
    end
  end
end

def main
  soduko_solver = SodukoSolver.new("000700390090500000300240800700900200000000000003007008004026007000005060026001000")
  puts "Solving..."
  soduko_solver.solve
end

main if __FILE__ == $0
