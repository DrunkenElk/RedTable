# -*- encoding : utf-8 -*-
# style:change['spacelab']
namespace :style do
  desc <<-EOS 
    Change bootswatch style:
    amelia cerulean cosmo cyborg journal simplex 
    slate spacelab spruce superhero united
  EOS

  task :change, [:style] => [:environment] do |t, args|
    puts "Copy files..."
    Style::apply!(args[:style])
    puts "Finish."
  end
end
