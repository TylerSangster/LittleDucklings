module PageHelper
  def page_title
    if params[:action] == "lake"
      "Little Ducklings Lake"
    elsif params[:action] == "pond"
      "Little Ducklings Pond"
    else
      "Little Ducklings"
    end
  end

  def nav_color
    if params[:action] == "lake"
      "lake-nav"
    elsif params[:action] == "pond"
      "pond-nav"
    else
      "littleducklings-nav"
    end
  end
end
