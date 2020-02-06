require_relative '../lib/log_parser'

RSpec.describe "LogParser" do

  before(:each) do
    @tempfile = Tempfile.new([ 'foobar', '.log' ])
    @tempfile.write("/help_page/1 126.318.035.038\n/help_page/1 126.318.035.039\n/help_page/1 126.318.035.040\n/contact 184.123.665.067\n/contact 184.123.665.065\n/home 184.123.665.067\n/about/2 444.701.448.104")
    @tempfile.read
    @tempfile.rewind
    @log_parser = LogParser.new(@tempfile)
    @url_array = ["/help_page/1", "/help_page/1", "/help_page/1", "/contact", "/contact",  "/home", "/about/2"]
    @ip_array = ["126.318.035.038", "126.318.035.039", "126.318.035.040", "184.123.665.067", "184.123.665.065", "184.123.665.067", "444.701.448.104"]
  end

  describe "initialize" do
    it 'should initialize with an empty object instance variable' do
      expect(@log_parser.instance_variable_get(:@sorted_data_object)).to eq({})
    end

    it 'should initialize with a provided file instance variable' do
      expect(@log_parser.instance_variable_get(:@file)).to eq(@tempfile)
    end

    it 'should fail to initialize without a file' do
      expected_output = "File doesn't exist!\n"
      expect{LogParser.new(nil)}.to output(expected_output).to_stdout
    end
  end


  describe 'converting to array' do
    it 'should convert the file into an array' do
       expect(@log_parser.convert_to_array.class).to eq(Array)
    end

    it 'should produce an array with a length of 4' do
       expect(@log_parser.convert_to_array.length).to eq(7)
    end
  end

  describe 'extracting data from each log line' do
    it 'should identify the url in each line' do
      extracted_array = @log_parser.convert_to_array
      @url_array.each_with_index do |url, index|
        expect(@log_parser.get_url(extracted_array[index])).to eq(url)
      end

    end

    it 'should identify the ip address in each line' do
      extracted_array = @log_parser.convert_to_array
      @ip_array.each_with_index do |ip, index|
        expect(@log_parser.get_ip(extracted_array[index])).to eq(ip)
      end
    end

  end


  it 'should counts unique web address occurances'
  it 'should count unique web address occurances'
end
