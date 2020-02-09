require 'pry'

class LogParser

  def initialize(file)
    return puts "File doesn't exist!" if !file
    @file = file
    @sorted_data_object = {}
  end

  def log_array_data
    @file.read.split("\n")
  end

  def get_url(line)
    line.match(/(\/(\w*))+/).to_s
  end

  def get_ip(line)
    line.match(/\b(?:[0-9]{1,3}\.){3}[0-9]{1,3}\b/).to_s
  end

  def populate_sorted_data_object

    # log_array.each do |log_datum|
    #   url = get_url(log_datum)
    #   ip = get_ip(log_datum)
    #   if data_exists_for_url(url)
    #     increment_view_stats_for_url(url, ip)
    #   else
    #     initialize_view_stats_for_url(url, ip)
    #   end
    # end
  end

  def uniq_urls_to_reference
    log_array_data.map{|log_datum| get_url(log_datum)}.uniq
  end


end
