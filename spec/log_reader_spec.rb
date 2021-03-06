require_relative '../lib/log_reader'
require 'pry'

RSpec.describe "LogReader" do
  describe 'validations' do
    it 'should return if the provided file does not exist' do
      expected_output = "File doesn't exist!\n"
      expect{LogReader.new.run "/fake/file_path" }.to output(expected_output).to_stdout
    end
    it 'should return if the provided file is not a log file' do
      tempfile = Tempfile.new([ 'foobar', '.txt' ])
      expected_output = "File is not a log file!\n"
      expect{LogReader.new.run tempfile.path }.to output(expected_output).to_stdout
    end
  end
end
