def the_lift(queues, capacity)
  parking = [0]
  value = []
  puts "start #{queues.inspect}"
  begin
    emp = true
    queues.each_with_index do |floor, i|
      mark = 0
      floor_rebuild = []
      value_rebuild = []

      
      value.each_with_index do |client, j|
        emp = false
        if client == i
          
          parking << i if mark == 0
          mark = 1
          
        elsif client != i
          value_rebuild << client
          
        end
      end
      value = value_rebuild
      
      floor.each_with_index do |item, j|
        emp = false
        puts "before #{value.length}"
        if (item > i) && (value.length < capacity)
          parking << i if mark == 0 && parking[parking.length - 1] != i
          value << item
          puts "after #{value.length}"
          mark = 1
        else
          floor_rebuild << item
        end

      end
      queues[i] = floor_rebuild
      

    end
    
    puts queues.inspect

    queues.reverse.each_with_index do |floor, i|
      mark = 0
      floor_rebuild = []
      value_rebuild = []

      value.each_with_index do |client, j|
        emp = false
        if client == (queues.length - i - 1)

          parking << (queues.length - i - 1) if mark == 0
          mark = 1
        else
          value_rebuild << client
        end
      end

      value = value_rebuild
      floor.each_with_index do |item, j|
        # puts parking.inspect
        emp = false

        if item < (queues.length - i - 1) && value.length < capacity
          parking << queues.length - i - 1 if mark == 0 && parking[parking.length - 1] != queues.length - i - 1
          value << item
          mark = 1
          # puts parking.inspect
        else
          floor_rebuild << item
        end

      end
      queues[queues.length - i - 1] = floor_rebuild


  
    end

    puts "value #{value.inspect}"
  end while emp == false


  parking[parking.length] = 0 if parking[parking.length - 1] != 0
  puts queues.inspect
  parking.inspect
end

puts the_lift([[], [], [0,5,5,4], [], [4], [2], []], 2)