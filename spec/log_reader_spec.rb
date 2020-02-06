RSpec.describe "LogReader" do
  describe 'validations' do
    it 'should return if the provided file does not exist' do
      expected_output = "File doesn't exist!"
      expect(LogReader.new.run "/fake/file_path").to output(expected_output).to_stdout
    end
    it 'should return if the provided file is not a log file'
  end
end
