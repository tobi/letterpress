#!/usr/bin/env ruby
#
# Find dictionary of words contained in a game of letterpress
#
# reads lines from standard in and returns 
# the lines that match all passed in characters
# 
# cat /usr/share/dict/words | ./solve.rb ayfdinzhscmggnziexbeopnai
#

letters = ARGV[0].chars.to_a
matches = []

STDIN.each_line do |line|
  word = line.to_s.strip.downcase
  left = letters.dup

  ok = true 
  

  found = word.chars.each do |c| 
    if left.delete(c) == nil      
      break false
    end
  end

  matches.push(word) if found
end 

matches.sort { |a,b| b.length <=> a.length }.each { |word| puts word } 