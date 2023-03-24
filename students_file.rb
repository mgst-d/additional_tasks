
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
