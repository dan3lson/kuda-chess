module ApplicationHelper
  # Returns the full header on a per-page basis
  def full_header(page_header)
    default_header = "Kuda"
    if page_header.empty?
      default_header
    else
      "#{page_header}"
    end
  end
end
