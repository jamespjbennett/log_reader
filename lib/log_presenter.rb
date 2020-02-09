class LogPresenter

  def initialize(log_data)
    @log_data =log_data
  end

  def page_view_sort
    @log_data.sort{|a,b| b[1][:page_visit_count] <=> a[1][:page_visit_count]}.to_h
  end

  def present_page_view_sort_stats
    page_view_sort.each{|url, stats| puts "#{url} #{stats[:page_visit_count]} visits"}
  end

  def uniq_page_view_sort
    @log_data.sort{|a,b| b[1][:unique_page_visits].length <=> a[1][:unique_page_visits].length}.to_h
  end

  def present_uniq_page_view_sort_stats
    uniq_page_view_sort.each{|url, stats| puts "#{url} #{stats[:unique_page_visits].length} unique views"}
  end

end
