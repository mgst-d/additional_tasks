# frozen_string_literal: true

class StudentFile
  attr_reader :filename

  def initialize(filename)
    @filename = filename
  end

  def lines
    File.readlines(path)
  end

  def append
    # not implemented
  end

  private

  def directory
    File.dirname(__FILE__)
  end

  def path
    File.join(directory, filename)
  end
end

class Line
  attr_reader :row

  def initialize(row)
    @row = row
  end

  def to_h
    name, nickname, email = formatted_row
    { name: name, nickname: nickname, email: email }
  end

  private

  def parsed_row
    row.split('|')
  end

  def formatted_row
    parsed_row.map(&:strip)
  end
end

def parse_student_file!
  students_file = StudentFile.new('students.txt')
  students_file.lines.each do |raw_data|
    puts Line.new(raw_data).to_h
  end
end

def with_logging
  puts 'Process started'
  yield if block_given?
  puts 'Process finished'
end

with_logging do
  parse_student_file!
end
