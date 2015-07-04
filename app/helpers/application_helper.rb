module ApplicationHelper
  def full_title(title)
    if title.empty?
      title = "Kuda"
    else
      title
    end
  end

  def full_header(header)
    if header.empty?
      header = "Kuda"
    else
      header
    end
  end
end
