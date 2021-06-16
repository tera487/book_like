module ApplicationHelper
  def tab_title
    if @title.present?
      "#{@title} - Book_like"
    else
      "Book_like"
    end
    
  end
end
