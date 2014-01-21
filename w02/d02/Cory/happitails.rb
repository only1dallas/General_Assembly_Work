####################
#####Animal Class
####################

class Animal
  def initialize(name, species)
    @name = name
    @species = species
    @toys = []
  end
  def name
    return @name
  end
  def species
    return @species
  end
  def toys
    return @toys
  end
end

####################
#####Client Class
####################

class Client
  def initialize(name, age)
    @name = name
    @age = age
    @animals = []
  end
  def name
    return @name
  end
  def age
    return @age
  end
  def animals
    return @animals
  end
end

####################
#####Shelter Class
####################

class Shelter
  def initialize(name)
    @name = name
    @animals = []
    @clients = []
  end
  def name
    return @name
  end
  def animals
    return @animals
  end
  def clients
    return @clients
  end
end







