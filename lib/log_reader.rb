class LogReader

  def run(file)
    return puts "File doesn't exist!" if file.nil? || !File.exists?(file)
  end

end
