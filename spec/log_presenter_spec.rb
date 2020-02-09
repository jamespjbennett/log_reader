require_relative '../lib/log_reader'
require_relative '../lib/log_presenter'
require 'pry'

RSpec.describe "LogPresenter" do
  before(:each) do
    @tempfile = Tempfile.new([ 'foobar', '.log' ])
    @tempfile.write("/help_page/1 126.318.035.038\n/help_page/1 126.318.035.038\n/help_page/1 126.318.035.039\n/help_page/1 126.318.035.039\n/help_page/1 126.318.035.039\n/contact 184.123.665.067\n/contact 184.123.665.068\n/contact 184.123.665.069\n/contact 184.123.665.069\n/home 184.123.665.065\n/home 184.123.665.065\n/home 184.123.665.065\n/about/2 444.701.448.104\n/about/2 444.701.448.105")
    @tempfile.read
    @tempfile.rewind
    @log_parser = LogParser.new(@tempfile)
    @log_parser.populate_sorted_data_object
    @parsed_log_data = @log_parser.instance_variable_get(:@sorted_data_object)
    @log_presenter = LogPresenter.new(@parsed_log_data )
  end


  describe 'ordering by page views' do
    before(:each) do
      @sorted_by_page_view = @log_presenter.page_view_sort
      @present_sorted_by_page_view = @log_presenter.present_page_view_sort_stats
    end

    it 'should return a hash' do
      expect(@sorted_by_page_view.class).to eq(Hash)
    end


    it 'should sort by page views' do
      expect(@sorted_by_page_view.keys.first).to eq("/help_page/1")
      expect(@sorted_by_page_view.keys.last).to eq("/about/2")
    end

    it 'should print out formatted ordering of log lage view stats' do
      expected_output = "/help_page/1 5 visits\n/contact 4 visits\n/home 3 visits\n/about/2 2 visits"
      expect{@present_sorted_by_page_view}.to output(expected_output).to_stdout
    end
  end

  describe 'ordering by unique page views' do
    before(:each) do
      @sorted_by_uniq_page_view = @log_presenter.uniq_page_view_sort
    end
    it 'should return a hash' do
      expect(@sorted_by_uniq_page_view.class).to eq(Hash)
    end

    it 'should sort by uniq page views' do
      expect(@sorted_by_uniq_page_view.keys.first).to eq("/contact")
      expect(@sorted_by_uniq_page_view.keys.last).to eq("/home")
    end

  end


end
