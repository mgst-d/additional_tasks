def solution(input, markers)
  arr = []
  
  input.each_line do |line|
    a = []
    line.each_char do |item|
      
      i = 0
      markers.each do |marker|
        i = 1 if item == marker
      end
      i == 0 ? a << item : break
    end
    arr << a.join.strip
  end

  arr.join('\n')

end

puts solution("apples, plums % and bananas\npears\noranges !applesauce", ["%", "!"])