class Array
  def my_map
    # arr = []
    if block_given?
      self.size.times do |i|
        self[i] = yield(self[i])
      end
      return self
    else
      return self
    end

  end
  def my_each
    if block_given?
      self.size.times do |i|
        yield(self[i])
      end
      return self
    else
      return self.to_enum
    end
  end
end

# puts [1, 2, 3].my_map { |x| x+1 }
[5, 2, 3].my_each do |x|
  puts x
end

