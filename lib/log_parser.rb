require 'pry'

# CLASS TO TAKE THE PROVIDED LOG FILE AND CONVERT INTO DATA OBJECT
class LogParser

  attr_reader :sorted_data_object

  def initialize(file)
    return puts "File doesn't exist!" if !file
    @file = file
    @log_array_data = get_log_array_data
    @sorted_data_object = {}
  end

  def get_log_array_data
    @file.read.split("\n")
  end

  def get_url(line)
    line.match(/(\/(\w*))+/).to_s
  end

  def get_ip(line)
    line.match(/\b(?:[0-9]{1,3}\.){3}[0-9]{1,3}\b/).to_s
  end

  def populate_sorted_data_object
    uniq_urls_to_reference.each do |uniq_url|
      @sorted_data_object[uniq_url] = {}
      @sorted_data_object[uniq_url][:page_visit_count] = occurances_of_page_visit(uniq_url).count
      @sorted_data_object[uniq_url][:unique_page_visits] = unique_page_visits(uniq_url)
    end
  end

  def uniq_urls_to_reference
    @log_array_data.map{|log_datum| get_url(log_datum)}.uniq
  end

  def log_with_data_split
    @log_array_data.map{|log_datum| {url: get_url(log_datum), ip: get_ip(log_datum)}}
  end

  def occurances_of_page_visit(url)
    log_with_data_split.select{|log_datum| log_datum[:url] == url}
  end

  def unique_page_visits(url)
    occurances_of_page_visit(url).map{|log_datum| log_datum[:ip]}.uniq
  end


end
