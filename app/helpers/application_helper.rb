module ApplicationHelper
  def format_date(date)
    date.strftime('%B %e, %Y')
  end

  def full_title(page_title = '')
    base_title = "SwapStubs"
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end
end
