class LogPresenter

  def initialize(log_data)
    @log_data =log_data
  end

  def page_view_sort
    @log_data.sort{|a,b| b[1][:page_visit_count] <=> a[1][:page_visit_count]}.to_h
  end

  def uniq_page_view_sort
    @log_data.sort{|a,b| b[1][:unique_page_visits] <=> a[1][:unique_page_visits]}.to_h
  end

end
