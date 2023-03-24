def mix(s1, s2)
  h1 = {}
  h2 = {}
  max1 = 0
  max2 = 0
  s = ''
  s1.each_char do |item|
    if item == item[/[a-z]/]
      h1[item] = 1 + h1[item].to_i
      max1 = h1[item] if max1 < h1[item]
    end
  end
  s2.each_char do |item|
    if item == item[/[a-z]/]
      h2[item] = 1 + h2[item].to_i
      max2 = h2[item] if max2 < h2[item]
    end
  end
# puts h1.inspect
# puts h2.inspect
  max = max1 if max1 >= max2
  max = max2 if max2 >= max1
  
  max.downto(2) do |i|
    item1 = []
    item2 = []
    h1.each do |k, v|
      if i == v
        item1 << k
      end
    end
    h2.each do |k, v|
      if i == v
        item2 << k
      end
    end
    # puts item1.inspect
    # puts item2.inspect
    together = []
    item1.each do |el1|
      item2.each do |el2|
        if el1 == el2
          # s1 = "#{el1}" * i
          # s = s + "=:" + s1
          together << el1
          # h1[el1] = 1
          # h2[el1] = 1
        end
      end
    end

    together.each do |el|
      item1.delete(el)
      item2.delete(el)
    end
    # puts item1.inspect
    # puts item2.inspect
    item1.sort.each do |el1|
      s1 = "#{el1}" * i
      h1[el1] = 1
      h2[el1] = 1
      if s == ''
        s = s + "1:" + s1
      else
        s = s + "/1:" + s1
      end
    end
    item2.sort.each do |el1|
      s1 = "#{el1}" * i
      h1[el1] = 1
      h2[el1] = 1
      if s == ''
        s = s + "2:" + s1
      else
        s = s + "/2:" + s1
      end
    end
    together.sort.each do |el|
      s1 = "#{el}" * i
      if s == ''
        s = s + "=:" + s1
      else
        s = s + "/=:" + s1
      end
    end
  end

  s
end
puts mix("my&friend&Paul has heavy hats! &", "my friend John has many many friends &")