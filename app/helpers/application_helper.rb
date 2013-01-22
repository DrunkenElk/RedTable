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

  #check role
  def role?(role)
    current_user && current_user.role?(role)
  end
end
