class LogParser

  def initialize(file)
    return puts "File doesn't exist!" if !file
    @file = file
    @sorted_data_object = {}
  end

  def convert_to_array
    @file.read.split("\n")
  end

end
