# frozen_string_literal: true

input_data = '10,Glass\n2,Water bottle\n30,Pen,full\n0,Lamp,out of stock'
stock_update = '2,Lamp\n15,Glass\n8,Lemon\n3,Pen'
a = input_data.split('\n').map { |item| item.split(',') }
# .map{|item| item.split(',')}.inspect
b = stock_update.split('\n').map { |item| item.split(',') }
update_data = []
a.each do |item|
  update_data << item
  b.each do |update_item|
    next unless item[1] == update_item[1] && item[2] != 'full'

    update_data.last[0] = item[0].to_i + update_item[0].to_i
    if update_data.last[2] == 'out of stock' && (update_data.last[0] != 0 || update_data.last[0] != '0')
      update_data.last.delete_at(2)
    end
  end
end
i = 0
b.each do |item|
  update_data.each do |update|
    i = 1 if item[1] == update[1]
  end
  update_data << item if i.zero?
  i = 0
end
update_data.each { |item| puts item.join(',') }
gets
