# -*- encoding : utf-8 -*-
module ApplicationHelper
  # Format text for display.                                                                    
  def format(text)
    sanitize(markdown(text))
  end

  # Process text with Markdown.                                                                 
  def markdown(text)
    RDiscount.new(text).to_html if text.present?
  end
end
