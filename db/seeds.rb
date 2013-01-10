# -*- encoding : utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

data = {
  "Тематика" => [
    {:shortcut=>"app", :name=>"мобильные приложения"},
    {:shortcut=>"bo", :name=>"книги"},
    {:shortcut=>"c", :name=>"комиксы и мультфильмы"},
    {:shortcut=>"di", :name=>"столовая"},
    {:shortcut=>"em", :name=>"другие страны и туризм"},
    {:shortcut=>"ew", :name=>"выживание"},
    {:shortcut=>"fa", :name=>"мода и стиль"},
    {:shortcut=>"fiz", :name=>"физкультура"},
    {:shortcut=>"fl", :name=>"иностранные языки"},
    {:shortcut=>"gd", :name=>"gamedev"},
    {:shortcut=>"hi", :name=>"история"},
    {:shortcut=>"hw", :name=>"железо"},
    {:shortcut=>"me", :name=>"медицина"},
    {:shortcut=>"mg", :name=>"магия"},
    {:shortcut=>"mu", :name=>"музыка"},
    {:shortcut=>"ne", :name=>"животные и природа"},
    {:shortcut=>"po", :name=>"политика и новости"},
    {:shortcut=>"pr", :name=>"программирование"},
    {:shortcut=>"psy", :name=>"психология"},
    {:shortcut=>"ra", :name=>"радиотехника"},
    {:shortcut=>"re", :name=>"религия и философия"},
    {:shortcut=>"s", :name=>"программы"},
    {:shortcut=>"sf", :name=>"научная фантастика"},
    {:shortcut=>"sci", :name=>"наука"},
    {:shortcut=>"sn", :name=>"паранормальные явления"},
    {:shortcut=>"sp", :name=>"спорт"},
    {:shortcut=>"spc", :name=>"космос"},
    {:shortcut=>"un", :name=>"образование"},
    {:shortcut=>"w", :name=>"оружие"}
  ],
  "Техника" => [
    {:shortcut=>"au", :name=>"автомобили и транспорт"},
    {:shortcut=>"bi", :name=>"велосипеды"},
    {:shortcut=>"mo", :name=>"мотоциклы"},
    {:shortcut=>"t", :name=>"техника"},
    {:shortcut=>"tr", :name=>"транспорт и авиация"},
    {:shortcut=>"wm", :name=>"военная техника"}
  ],
  "Творчество" => [
    {:shortcut=>"de", :name=>"дизайн"},
    {:shortcut=>"diy", :name=>"хобби"},
    {:shortcut=>"dom", :name=>"домострой"},
    {:shortcut=>"f", :name=>"flash & gif"},
    {:shortcut=>"izd", :name=>"издательство"},
    {:shortcut=>"mus", :name=>"музыканты"},
    {:shortcut=>"o", :name=>"мазня"},
    {:shortcut=>"pa", :name=>"живопись"},
    {:shortcut=>"p", :name=>"фото"},
    {:shortcut=>"td", :name=>"трёхмерная графика"},
    {:shortcut=>"trv", :name=>"путешествия"},
    {:shortcut=>"wp", :name=>"обои и высокое разрешение"}
  ],
  "Игры" => [
    {:shortcut=>"bg", :name=>"настольные игры"},
    {:shortcut=>"cg", :name=>"консоли"},
    {:shortcut=>"gb", :name=>"азартные игры"},
    {:shortcut=>"mc", :name=>"minecraft"},
    {:shortcut=>"mmo", :name=>"MMO"},
    {:shortcut=>"vg", :name=>"видеоигры"},
    {:shortcut=>"wr", :name=>"текстовые ролевые игры"},
    {:shortcut=>"tes", :name=>"the elder scrolls"},
    {:shortcut=>"wh", :name=>"warhammer"}
  ],
  "Японская культура" => [
    {:shortcut=>"a", :name=>"аниме"},
    {:shortcut=>"aa", :name=>"аниме арт"},
    {:shortcut=>"fd", :name=>"фэндом"},
    {:shortcut=>"ja", :name=>"японская культура"},
    {:shortcut=>"ma", :name=>"манга"},
    {:shortcut=>"rm", :name=>"rozen maiden"},
    {:shortcut=>"to", :name=>"touhou"},
    {:shortcut=>"vn", :name=>"визуальные новеллы"},
    {:shortcut=>"pvc", :name=>"коллекционные фигурки"}
  ],
  "Взрослым" => [
    {:shortcut=>"fg", :name=>"трапы"},
    {:shortcut=>"fur", :name=>"фурри"},
    {:shortcut=>"g", :name=>"девушки"},
    {:shortcut=>"ga", :name=>"геи"},
    {:shortcut=>"h", :name=>"хентай"},
    {:shortcut=>"ho", :name=>"прочий хентай"},
    {:shortcut=>"ls", :name=>"лоликон"},
    {:shortcut=>"per", :name=>"извращения"},
    {:shortcut=>"sex", :name=>"секс и отношения"}
  ],
  "Разное" =>  [
    {:shortcut=>"abu", :name=>"абу"},
    {:shortcut=>"b", :name=>"бред"},
    {:shortcut=>"d", :name=>"Дискуссии о борде"},
    {:shortcut=>"fag", :name=>"FAGS"},
    {:shortcut=>"soc", :name=>"общение"},
    {:shortcut=>"r", :name=>"просьбы"},
    {:shortcut=>"cp", :name=>"копипаста"},
    {:shortcut=>"int", :name=>"international"}
  ]
}

Section.destroy_all
Board.destroy_all
imageboard = Imageboard.instance

data.each do |section, boards|
  section = imageboard.sections.create!(name: section)
  boards.each do |board|
    section.boards.create!(shortcut: board[:shortcut], name: board[:name].capitalize)
  end
end
