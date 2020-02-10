require_relative '../lib/log_parser'
require_relative '../lib/log_presenter'

class LogReader

  def initialize(uniq_page_view_presenter = UniqPageViewPresenter.new, total_page_view_presenter = TotalPageViewPresenter.new)
    @uniq_page_view_presenter = uniq_page_view_presenter
    @total_page_view_presenter = total_page_view_presenter
  end

  def run(file)
    return puts "File doesn't exist!" if file.nil? || !File.exists?(file)
    return puts "File is not a log file!" if !file.include?(".log")
    @log_parser = LogParser.new(file)
    @log_parser.populate_sorted_data_object
    @total_page_view_presenter.run(@log_parser.sorted_data_object)
    @uniq_page_view_presenter.run(@log_parser.sorted_data_object)
  end

end
