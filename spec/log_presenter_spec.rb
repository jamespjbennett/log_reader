require_relative '../lib/log_reader'
require_relative '../lib/log_presenter'
require 'pry'

RSpec.describe "LogPresenter" do
  before(:each) do
    @tempfile = Tempfile.new([ 'foobar', '.log' ])
    @tempfile.write("/help_page/1 126.318.035.038\n/help_page/1 126.318.035.039\n/help_page/1 126.318.035.039\n/contact 184.123.665.067\n/contact 184.123.665.067\n/home 184.123.665.067\n/about/2 444.701.448.104")
    @tempfile.read
    @tempfile.rewind
    @log_parser = LogParser.new(@tempfile)
    @parsed_log_data = @log_parser.populate_sorted_data_object 
  end
end
