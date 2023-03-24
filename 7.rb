def last_digit(lst)
  def step(o, s)
    с = 1
    0.upto(s-1) { c = ((c * o).modulo(100)) }
    return c
  end
  a = 0
  if lst == []
    return 1
    exit
  end
  lst.reverse.each_with_index do |item, i|
    a = item if i == 0
    a = step(item, a) if i > 0
  end
  a - (((a / 10).to_i) * 10)
end

puts last_digit([937640, 767456, 981242])

# function modular_pow(base, exponent, modulus) is
#     if modulus = 1 then
#         return 0
#     c := 1
#     for e_prime = 0 to exponent-1 do
#         c := (c * base) mod modulus
#     return c