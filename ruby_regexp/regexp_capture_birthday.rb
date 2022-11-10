#!/Users/trangtungn/.rbenv/shims/ruby -w
# frozen_string_literal: true

print 'Enter Birthday (YYYY-MM-DD), ex 1974-08-11: '
date = gets.chop
/(\d{4})-(\d{2})-(\d{2})/.match date
puts "Year: #{Regexp.last_match(1)} \n Month: #{Regexp.last_match(2)} \n Date: #{Regexp.last_match(3)}"

print 'Enter Birthday (YYYY-MM-DD), ex: 1974 -  08 - 11: '
date = gets.chop
/\s*(\d{4})\s*-\s*(\d{2})\s*-\s*(\d{2})\s*/.match date
puts "Year: #{Regexp.last_match(1)} \n Month: #{Regexp.last_match(2)} \n Date: #{Regexp.last_match(3)}"

puts 'Nested captures are capture within a capture'
/(a(c(b)))/.match 'This sting contains acb so it has match'
p Regexp.last_match(1), Regexp.last_match(2), Regexp.last_match(3)

puts 'Anchors'
puts 'the ^ sign is a anchor that represents beginning of the line'
puts 'wherease $ represents ending of the line'
p(/^.+$/.match("Boom \n Thata"))

p 'Anchors \A stands for start of a string and \z that stands for end of a string'
p(/\ASomething/.match('Something is better than nothing'))
p(/\ASomething/.match('Everybody says Something is better than nothing'))
p(/nothing\z/.match('Everybody says Something is better than nothing'))
p(/nothing\z/.match("Everybody says Something is better than nothing\n"))

p 'and Z matches a string with a line ending(\n) character.'
p(/nothing\Z/.match("Everybody says Something is better than nothing\n"))

p 'Assertions'
p '(?=Copperfield) looks forward for Copperfield.'
p(/\w+\s+(?=Copperfield)/.match('David Copperfield'))
p '(?! ) is a negative assertion.'
p(/\w+\s+(?!Copperfield)/.match('Joan Copperfield'))

p '(?<= and ): look back assertion'
p(/(?<=David)\s+\w+/.match('David Munsamy'))
p '(?~ ): negative look backward'
p(/(?<!David)\s+\w+/.match('All in all Munsamy'))

p 'Ignoring Cases'
p(/abc/i.match('There is ABC in string'))
p 'Ignore Spaces'
p(/ab c/x.match('There is abc in string'))
