# frozen_string_literal: true

directory = File.dirname(__FILE__)
path = File.join(directory, 'students.txt')

def parse_student_line(line)
  line.split('|')
end

def format_data(parsed_data)
  parsed_data.map(&:strip)
end
def parse_student_file!(path)
  File.readlines(path).each do |student_line|
    name, nick, email = format_data(parse_student_line(student_line))
    data = { name: name, nick: nick, email: email }
    puts data
  end
end
def with_logging
  puts "Process started"
  yield if block_given?
  puts "Process finished"
end

with_logging do
  parse_student_file!(path)
end