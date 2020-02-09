class LogReader

  def initialize(file)
    return puts "File doesn't exist!" if file.nil? || !File.exists?(file)
    return puts "File is not a log file!" if !file.path.include?(".log")
    @file = file
    @log_parser = LogParser.new(file)
  end

  def run
    @log_parser.populate_sorted_data_object
    LogPresenter.new(@log_parser.sorted_data_object).run
  end

end
