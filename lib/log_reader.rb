class LogReader

  def run(file)
    return puts "File doesn't exist!" if file.nil? || !File.exists?(file)
    return puts "File is not a log file!" if !file.path.include?(".log")
  end

end
