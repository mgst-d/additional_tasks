require './students_file.rb'
require './line.rb'
module Logger
  def log(logging_type, text)
    case logging_type
    when :stdout
      puts text
    when :file
      File.open('./log.txt', 'a') { |f| f.write("#{text}\n"); f.close }
    else
      puts 'No logger defined'
    end
  end
end

class Parser
  include Logger
  attr_reader :filename

  def initialize(filename, log_to: :stdout)
    @filename = filename
    @logging_type = log_to
  end

# include Line
  def run
    log @logging_type, 'Process initiated'
    parse_student_file!
    log @logging_type, 'Process finished'
  end

  private

  def parse_student_file!
    students_file = StudentFile.new(@filename)
    students_file.lines.each do |raw_data|
      puts Line.new(raw_data).to_h
    end
  end

end

Parser.new('students.txt', log_to: :file).run
