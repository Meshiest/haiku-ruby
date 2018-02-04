#!/usr/bin/ruby
$dict = 7.times.map{[]}

# Build our dictionary of words based on the number of asterisks
open("dict.txt").read.split("\n").each{ |w|
  $dict[w.count ?*] <<= w.gsub(?*, '') 
}

# Generates an array of words with `num` syllables
def sylLine num
  return [] unless num > 0
  n = rand [7,num].min
  return sylLine(num - n - 1) << [$dict[n].sample] 
end

# Prints out a haiku
puts (sylLine 5) * ' ' + ?,,
  (sylLine 7) * ' ' + ?,,
  (sylLine 5) * ' '
