def parse_int(string)
  h1 = {'one' => 1, 'two' => 2, 'three' => 3, 'four' => 4, 'five' => 5, 'six' => 6, 'seven' => 7,
    'eight' => 8, 'nine' => 9, 'ten' => 10, 'eleven' => 11, 'twelve' => 12, 'thirteen' => 13, 'fourteen' => 14,
    'fifteen' => 15, 'sixteen' => 16, 'seventeen' => 17, 'eighteen' => 18, 'nineteen' => 19, 'twenty' => 20,
    'thirty' => 30, 'forty' => 40, 'fifty' => 50, 'sixty' => 60, 'seventy' => 70, 'eighty' => 80, 'ninety' => 90, 'zero' => 0,
    'hundred' => 100, 'thousand' => 1000, 'million' => 1000000 }
  h2 = [ 100, 1000, 1000000 ]
  digit = []
  s = string.split(' ')
  s.delete('and') if s.include?('and')
  s.map do |item|
    if item.include? ('-')
      sum = 0
      item.split('-').map do |element|
        sum = sum + h1[element]
      end
      digit << sum
    end
    digit << h1[item] if h1.has_key?(item)
  end
  sum = 0
  j = 0
  a = digit.reverse
  puts a.inspect
  a.each_with_index.map do |item, i|
    puts item
    j = 1 + j if item == 1000
    if !h2.include?(item)
      if i > 0 && a[i-1] == 100 && j > 0
        sum = sum + (item * a[i-1] * 1000)
      else 
        sum = sum + (item * a[i-1]) if i > 0
      end
      sum = sum + item if i == 0
    end
    
    puts sum
  end
  sum
#   s.each_with_index do |item, i|
#     if item.include? ('-')
#       sum = 0
#       item.split('-').map do |element|
#         sum = sum + h1[element]
#       end
#     else
#       sum =
#     end
#     if h1.has_key?(item) && h2.has_key?(s[i-1]) && (s[i-3] == 'thousand' && i > 2)
#       digit = digit + (h1[item] * h2[s[i-1]] * 1000)
#     else
#       if h1.has_key?(item) && h2.has_key?(s[i-1])
#         digit = digit + (h1[item] * h2[s[i-1]])
#       end
#     end

#     if h1.has_key?(item) && !h2.has_key?(s[i-1])
#       digit = digit + h1[item]
#     end
#     puts digit
#   end
#   puts digit
end

puts parse_int 'six hundred twenty-six thousand three hundred fifty-nine'