module ApplicationHelper

  def full_title(page_title)
    base_title = "Links Shortener"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def logged_in?
    not request.authorization.nil?
  end

end
