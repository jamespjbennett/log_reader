class LogPresenter

  def run(log_data)
    sorted_data = sort_data(log_data)
    present(sorted_data)
  end

end


class UniqPageViewPresenter < LogPresenter

  def sort_data(log_data)
    log_data.sort{|a,b| b[1][:unique_page_visits].length <=> a[1][:unique_page_visits].length}.to_h
  end

  def present(sorted_data)
    sorted_data.each{|url, stats| puts "#{url} #{stats[:unique_page_visits].length} unique views"}
  end
end

class TotalPageViewPresenter < LogPresenter

  def sort_data(log_data)
    log_data.sort{|a,b| b[1][:page_visit_count] <=> a[1][:page_visit_count]}.to_h
  end

  def present(sorted_data)
    sorted_data.each{|url, stats| puts "#{url} #{stats[:page_visit_count]} visits"}
  end
end
