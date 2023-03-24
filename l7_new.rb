class Animal
  attr_reader :printer

  def initialize(printer)
    @printer = printer
  end

  def hello
    printer.show 'hello'
  end
end

class Puts
  def show(text)
    puts text
  end
end

Animal.new(Puts.new).hello