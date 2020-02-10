require_relative '../lib/log_parser'

RSpec.describe "LogParser" do

  before(:each) do
    @tempfile = Tempfile.new([ 'foobar', '.log' ])
    @invalid_file = Tempfile.new([ 'foobarfail', '.log' ])
    @tempfile.write("/help_page/1 126.318.035.038\n/help_page/1 126.318.035.039\n/help_page/1 126.318.035.039\n/contact 184.123.665.067\n/contact 184.123.665.067\n/home 184.123.665.067\n/about/2 444.701.448.104")
    @invalid_file.write("/help_page/1 126.318.035.038\nINVALID MESSAGE 45.5.3")
    @tempfile.read
    @invalid_file.read
    @tempfile.rewind
    @invalid_file.rewind
    @log_parser = LogParser.new(@tempfile.path)
    @log_parser_with_invalid_data= LogParser.new(@invalid_file.path)
    @url_array = ["/help_page/1", "/help_page/1", "/help_page/1", "/contact", "/contact",  "/home", "/about/2"]
    @ip_array = ["126.318.035.038", "126.318.035.039", "126.318.035.039", "184.123.665.067", "184.123.665.067", "184.123.665.067", "444.701.448.104"]
  end

  describe "initialize" do
    it 'should initialize with an empty object instance variable' do
      expect(@log_parser.instance_variable_get(:@sorted_data_object)).to eq({})
    end

    it 'should initialize with a provided file instance variable' do
      expect(@log_parser.instance_variable_get(:@file).path).to eq(@tempfile.path)
    end

    it 'should fail to initialize without a file' do
      expected_output = "File doesn't exist!\n"
      expect{LogParser.new(nil)}.to output(expected_output).to_stdout
    end
  end


  describe 'converting to array' do
    it 'should convert the file into an array' do
       expect(@log_parser.instance_variable_get(:@log_array_data).class).to eq(Array)
    end

    it 'should produce an array with a length of 4' do
       expect(@log_parser.instance_variable_get(:@log_array_data).length).to eq(7)
    end

    it 'should not populate a line with any nil values if valid values arent recognized' do
      expect(@log_parser_with_invalid_data.instance_variable_get(:@log_array_data).length).to eq(1)
    end

    it 'should not return an error if there are no valid lines to parse' do

    end
  end

  describe 'converting array data into a readable array of hashes' do
    it 'should convert log data into an array of hashes' do
      expect(@log_parser.log_with_data_split.map(&:class).uniq).to eq([Hash])
    end
  end

  describe 'extracting data from each log line' do
    it 'should identify the url in each line' do
      extracted_array = @log_parser.instance_variable_get(:@log_array_data)
      @url_array.each_with_index do |url, index|
        expect(@log_parser.get_url(extracted_array[index])).to eq(url)
      end

    end

    it 'should identify the ip address in each line' do
      extracted_array = @log_parser.instance_variable_get(:@log_array_data)
      @ip_array.each_with_index do |ip, index|
        expect(@log_parser.get_ip(extracted_array[index])).to eq(ip)
      end
    end

  end


  describe 'generating sorted data object' do
    context "with valid data" do
      before(:each) do
        @log_parser.populate_sorted_data_object
        @sorted_data_object = @log_parser.instance_variable_get(:@sorted_data_object)
      end

      it 'should populate sorted data object with the log file data' do
        expect(@sorted_data_object).not_to eq({})
      end
      it 'should count unique web address occurances' do
        expect(@sorted_data_object["/help_page/1"][:page_visit_count]).to eq(3)
        expect(@sorted_data_object["/contact"][:page_visit_count]).to eq(2)
        expect(@sorted_data_object["/home"][:page_visit_count]).to eq(1)
      end
      it 'should count unique ip address occurances' do
        expect(@sorted_data_object["/help_page/1"][:unique_page_visits].length).to eq(2)
        expect(@sorted_data_object["/contact"][:unique_page_visits].length).to eq(1)
        expect(@sorted_data_object["/home"][:unique_page_visits].length).to eq(1)
      end
    end

  end

end
