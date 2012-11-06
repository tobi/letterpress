#!/usr/bin/env ruby
#
# Find words containing all the latters passed in
# 
# cat /usr/share/dict/words | ./solve.rb ayfdinzhscmggnziexbeopnai | ./narrow.rb abc
#

letters = ARGV[0].chars.to_a

STDIN.each_line do |line|
  word = line.to_s.strip.downcase
  left = letters.dup 

  word.chars.each do |c| 
    left.delete(c)
  end

  puts word if left.empty?
end 
