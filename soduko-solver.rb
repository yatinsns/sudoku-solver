#!/usr/bin/env ruby

class SodukoSolver
  def initialize(config)
    @@config = config.split(//)
  end

  def show
    horizontal_separator = "+-----------------------+"
    vertical_separator = "|"

    puts horizontal_separator
    81.times.each do |num|
      if num % 3 == 0 
        print vertical_separator, " "
      end
      print "#{@@config[num -1]} "
      if num % 9 == 8
        puts vertical_separator
        puts horizontal_separator 
      end
    end
  end
end

def main
  soduko_solver = SodukoSolver.new("000700390090500000300240800700900200000000000003007008004026007000005060026001000")
  soduko_solver.show
end

main if __FILE__ == $0
