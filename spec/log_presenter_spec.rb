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
    @log_parser.populate_sorted_data_object
    @parsed_log_data = @log_parser.instance_variable_get(:@sorted_data_object)
    @log_presenter = LogPresenter.new(@parsed_log_data )
  end


  describe 'ordering by page views' do
    it 'should return a hash' do
      expect(@log_presenter.page_view_sort.class).to eq(Hash)
    end
  end
end
