require_relative '../lib/log_parser'
require_relative '../lib/log_presenter'

class LogReader

  def run(file)
    return puts "File doesn't exist!" if file.nil? || !File.exists?(file)
    return puts "File is not a log file!" if !file.include?(".log")
    @log_parser = LogParser.new(file)
    @log_parser.populate_sorted_data_object
    LogPresenter.new(@log_parser.sorted_data_object).run
  end

end
