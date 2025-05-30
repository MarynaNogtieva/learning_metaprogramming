class Animal
  def speak
    "Animal speaks"
  end
end

# Classes are objects themselves, they are instancess of a class called Class
my_animal = Animal.new # all of our classes are instancess of the Class class that has .new method defined
my_animal.class # => Animal
my_animal.class.class # => Class


# add visualization of the class hierarchy


# You can define a class in one of this way.
class Dog; end

Dog = Class.new do
end

# when you assign an instance of a class to a constant, Ruby interpreter will give this Class instance a name of a constant (Cat)
# Classes names are simple constants
# You can assign an instance of `Class` class to any constant (`Const = Class.new`) and Ruby will treat it as if you were creating a class with that constant name (`class Const; end`)

Cat = Class.new 
Cat.name # => "Cat"
Cat.class # => Class

cat = Cat.new
cat.name # => nil
cat.class # => Cat

MyCat = cat
cat.name #=> "MyCat"
cat.class # => Class
MyCat.class # => Class



# The instances of our classes can have methods, variables, etc
# Our classes also can have methods, variables, etc

class MyCat
  puts self # MyCat

  # entering eighen class
  class << self
    puts self # #<Class:MyCat>
    
    # class method
    def purr
      # def is changing a scope to the instance of the current class
      # the instance of the singleton class MyCat
      puts self # MyCat
      @purr = "purr... in the class method"
    end
  end

  def self.purr2
    @purr
  end

  def purr
    puts self # #<MyCat:0x000000016ced81f0>
    @purr
  end
end


def MyCat.purr3
  puts self # MyCat
  @purr = "purr3... in the class method"
  @meow = "meow... in the class method"
end


cat_obj = MyCat.new # => #<MyCat:0x000000016ced81f0>
cat_obj.purr => nil