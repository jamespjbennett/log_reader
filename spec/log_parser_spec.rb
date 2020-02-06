require_relative '../lib/log_parser'

RSpec.describe "LogParser" do

  describe "initialize" do
    it 'should initialize with an empty object' do
      expect(LogParser.new.instance_variable_get(:@sorted_data_object)).to eq({})
    end
  end

  it 'should convert the file into an array'
  it 'should identify the url in each line'
  it 'should identify the ip address in each line'
  it 'should counts unique web address occurances'
  it 'should count unique web address occurances'
end
