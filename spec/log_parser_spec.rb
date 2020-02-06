require_relative '../lib/log_parser'

RSpec.describe "LogParser" do

  describe "initialize" do
    it 'should initialize with an empty object instance variable' do
      tempfile = Tempfile.new([ 'foobar', '.log' ])
      expect(LogParser.new(tempfile).instance_variable_get(:@sorted_data_object)).to eq({})
    end

    it 'should initialize with a provided file instance variable' do
      tempfile = Tempfile.new([ 'foobar', '.log' ])
      expect(LogParser.new(tempfile).instance_variable_get(:@file)).to eq(tempfile)
    end

    it 'should fail to initialize without a file' do
      expected_output = "File doesn't exist!\n"
      expect{LogParser.new(nil)}.to output(expected_output).to_stdout
    end
  end

  it 'should convert the file into an array'
  it 'should identify the url in each line'
  it 'should identify the ip address in each line'
  it 'should counts unique web address occurances'
  it 'should count unique web address occurances'
end
