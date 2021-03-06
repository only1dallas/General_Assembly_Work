require 'active_record'
require 'pry'
require 'pg'

conn= PG.connect( :dbname => 'playground')
conn.close


ActiveRecord::Base.establish_connection(
  :adapter => "postgresql",
  :host => "localhost",
  :username => 'itorresverdugo',
  :password => "",
  :database => "playground"
  )

# musicals
# - title
# List, Read, (indiv, musicals) Update, Create, Destroy 

class Musical < ActiveRecord::Base
  has_many :songs
  self.validates(:title, { presence: true })
  self.before_validation(:i_am_called_before)
  self.after_validation(:i_am_called_after)

  def i_am_called_before
    puts "before validation"
  end
  def i_am_called_after
    puts "after validation"
  end
end

class Song < ActiveRecord::Base
  belongs_to :musical
  has_many :performances
  has_many :characters, :through => :performances
end

class Character < ActiveRecord::Base
  has_many :performances
  has_many :songs, :through => :performances
end

class Performance < ActiveRecord::Base
  belongs_to :song 
  belongs_to :character
  # make sure theres only one performance for each character / song
  self.validates( :song_id {uniqueness: { scope: :character_id } })
  # activerecord finds the character class and uses it for association behaviors
end

  choice = 0 
  while choice != 6


    puts "-------------------------------------"
    puts "            MENU OPTIONS"
    puts ""
    puts " (1) List All Musicals"
    puts " (2) Info on a specific Musical"
    puts " (3) Update a Musical"
    puts " (4) Create a new Musical"
    puts " (5) Destory a Musical"
    puts " (6) Quit"
    puts ""
    puts "-------------------------------------"

    puts "What would you like to do? "
    choice = gets.chomp.to_i

    if choice == 1
      Musical.all.each {|musical| puts musical.title}

    elsif choice == 2
      Musical.all.each {|musical| puts musical.title}
      print "Enter Musical to view:"
      response = gets.chomp
      selection = Musical.find_by(title: response)
      puts "#{selection.title}, #{selection.composer}, #{selection.lyricist}, #{selection.year}"

    elsif choice == 3
      Musical.all.each {|musical| puts musical.title}
      print "Enter musical to update: "
      response = gets.chomp
      selection = Musical.find_by(title: response)
      puts "Enter a new name: "
      name = gets.chomp
      puts "Enter a new composer: "
      composer = gets.chomp
      puts "Enter a new lyricist: "
      lyricist = gets.chomp
      puts "Enter a new year: "
      year = gets.chomp
      selection.update(title: name, composer: composer, lyricist: lyricist, year: year)

    elsif choice == 4
      puts "Enter a new name: "
      name = gets.chomp
      puts "Enter a new composer: "
      composer = gets.chomp
      puts "Enter a new lyricist: "
      lyricist = gets.chomp
      puts "Enter a new year: "
      year = gets.chomp
      new_creation = Musical.create(title: name, composer: composer, lyricist: lyricist, year: year)

    elsif choice == 5
      Musical.all.each {|musical| puts musical.title}
      print "Enter musical to delete: "
      response = gets.chomp
      selection = Musical.find_by(title: response)
      selection.destroy
      puts "MUSICAL IS DESTORYED!!!!"
    end

  end


  def get_info
    selection = Musical.find_by(title: response)
    puts "Enter a new name: "
    name = gets.chomp
    puts "Enter a new composer: "
    composer = gets.chomp
    puts "Enter a new lyricist: "
    lyricist = gets.chomp
    puts "Enter a new year: "
    year = gets.chomp
    return "title: #{name}, composer: #{composer}, lyricist: #{lyricist}, year: #{year}"
  end







