str = "current_stock\n10,Glass\n2,Water bottle\n30,Pen,full\n0,Lamp,out of stock\nstock_update\n2,Lamp\n15,Glass\n8,Lemon\n3,Pen"
mark = 0
storage = []
str.each_line do |line|
  if mark == 1
    storage_new = []
    storage.each do |st_line|
      if (st_line.split(',')[1].chomp == line.split(',')[1].chomp) && (st_line.split(',')[2] != "full\n")
        elem = st_line.split(',')[0].to_i + line.split(',')[0].to_i
        storage_new << "#{elem},#{st_line.split(',')[1].chomp}"
      else
        storage_new << st_line
      end
    end
    storage = storage_new
  end
  mark = 1 if line.chomp == "stock_update"
  storage << line if (line.chomp != "current_stock") && (mark == 0)

end

puts storage
