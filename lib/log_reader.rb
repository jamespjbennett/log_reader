class LogReader

  def initialize(file)
    return puts "File doesn't exist!" if file.nil? || !File.exists?(file)
    return puts "File is not a log file!" if !file.path.include?(".log")
    @file = file
    @log_parser = LogParser.new(file)
  end

  def run

  end

end
