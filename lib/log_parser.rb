require 'pry'

class LogParser

  def initialize(file)
    return puts "File doesn't exist!" if !file
    @file = file
    @sorted_data_object = {}
  end

  def convert_to_array
    @file.read.split("\n")
  end

  def get_url(line)
    line.match(/(\/(\w*))+/).to_s
  end

  def get_ip(line)
    line.match(/\b(?:[0-9]{1,3}\.){3}[0-9]{1,3}\b/).to_s
  end

  def populate_sorted_data_object
    log_array = convert_to_array
    log_array.each do |log_datum|
      url = get_url(log_datum)
      ip = get_ip(log_datum)
      if @sorted_data_object[url]
        @sorted_data_object[url][:page_visit_count] += 1
        unique_page_visits = @sorted_data_object[url][:unique_page_visits]
        unique_page_visits.push(ip) if !unique_page_visits.index(ip)
      else
        @sorted_data_object[url] = {}
        @sorted_data_object[url][:page_visit_count] = 1
        @sorted_data_object[url][:unique_page_visits] = [ip]
      end
    end
  end


end
