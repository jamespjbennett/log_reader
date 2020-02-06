class LogParser

  def initialize(file)
    return puts "File doesn't exist!" if !file
    @file = file
    @sorted_data_object = {}
  end

end
