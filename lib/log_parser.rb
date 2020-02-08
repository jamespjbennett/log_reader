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
      if @sorted_data_object[url]
        @sorted_data_object[url][:page_visit_count] += 1
      else
        @sorted_data_object[url] = {}
        @sorted_data_object[url][:page_visit_count] = 1
      end
    end 
  end


end
