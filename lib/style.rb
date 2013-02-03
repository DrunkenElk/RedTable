# -*- encoding : utf-8 -*-
require 'fileutils'

class Style

  def self.apply!(style)

    source = "#{ Rails.root }/app/bootswatch/#{ style }/"
    destination = "#{ Rails.root }/app/assets/stylesheets/bootswatch/"

    ["variables.less", "bootswatch.less"].each do |f|
      FileUtils.cp(source + f, destination + f)
    end
  end

end
