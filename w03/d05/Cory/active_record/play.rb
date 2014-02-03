require "active_record"
require "pry"

ActiveRecord::Base.establish_connection(
  :adapter => "postgresql",
  :host => "localhost",
  :username => "coryhaber",
  :password => "",
  :database => "playground"
  )

# Musicals
# - title
# - composer
# - lyricist
# - year

# CLI
# List, Read (Indiv, Musicals), Update, Create, Destroy

class Musical < ActiveRecord::Base
  has_many :songs
end

class Song < ActiveRecord::Base
  belongs_to :musical
end

# binding.pry
begin

  puts "c to create"
  puts "l to list"
  puts "u to update"
  puts "a to find out about a show"
  puts "d to delete a show"
  puts "q to end"
  menu = gets.chomp

  case menu

  when "c"
    puts "What's the title? "
    title = gets.chomp
    puts "Who is the composer? "
    composer = gets.chomp
    puts "Who is the lyricist? "
    lyricist = gets.chomp
    puts "What was the year? "
    year = gets.chomp.to_i
    Musical.create(title: title, composer: composer, lyricist: lyricist, year: year)
  when "l"
  # list goes here
  list = Musical.all.compact
  # binding.pry
  list.each do |musical|
    puts "#{musical.title}"
  end
when "u"
  puts "what musical would you like to update?"
  choice = gets.chomp
  change = Musical.find_by(title: choice)
  puts "what attribute would you like to update?"
  changed_attribute = gets.chomp.to_sym
  puts "what would you like the new #{changed_attribute} to be?"
  better_info = gets.chomp
  
  change.update({changed_attribute => better_info})

  # case changed_attribute
  # when "title"
  #   change.title = better_info
  # when "composer"
  #   change.composer = better_info
  # when "lyricist"
  #   change.lyricist = better_info
  # when "year"
  #   change.year = better_info.to_i
  # end
  # change.save

when "a"
  puts "what musical do you want information about?"
  choice = gets.chomp
  info = Musical.find_by(title: choice)
  puts "#{info.title} was released in #{info.year}, it was composed by #{info.composer} and the lyrics were written by #{info.lyricist}."

when "d"
  puts "what musical do you want to exterminate?"
  choice = gets.chomp
  delete = Musical.find_by(title: choice)
  delete.destroy
end
end while menu != "q"


