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
