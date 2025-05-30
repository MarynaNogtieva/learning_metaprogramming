
# We learned that our classes are instances of the `Class` class.
# Singleton (i.e Eigen) class => that’s because your class can have only one instance of Class class.

MyDog = Class.new
# Your class’s class is called "eigenclass" or "singleton class".
# You can access class’s eigenclass using class << ClassName syntax.


class << MyDog
  puts self
end


MyDog.singleton_class # => #<Class:MyDog>

# Just like instances of our classes can have variables and methods.
# your singleton class can have its own methods and variables.
# This is mecause your Cow class is an instance of the Class class, just like my_cow is an instance of the Cow class.


class Cow
  def initialize
    @color = "brown"
  end

  def introduce
    puts "I am a #{self.class} and my color is #{@color}."
  end
end

my_cow = Cow.new
my_cow.introduce # => "I am a Cow and my color is brown."

class << Cow
  attr_accessor :breeds_class_instance_var
  def all_breeds
    @breeds_class_instance_var ||= ["Holstein", "Hereford", "Brown Swiss"]
  end

  def sound
    "Moo"
  end
end

Cow.breeds_class_instance_var # => nil
Cow.all_breeds # => ["Holstein", "Hereford", "Brown Swiss"]
Cow.breeds_class_instance_var # => ["Holstein", "Hereford", "Brown Swiss"]

# Just remember Cow = Class.new is just like my_cow = Cow.new

# Class methods (also known as static methods) in Ruby are actually regular instance methods defined in the class's eigenclass. When you call `Cow.all_breeds`, you're simply calling an instance method named `all_breeds` that's defined in an instance of the `Class` class. This instance represents your custom class and is referenced by the `Cow` constant.

# An important distinction: Class instance methods and class methods operate in separate scopes. Instance methods can only access instance variables, while class methods can only access class instance variables. Because they exist in different scopes, they cannot share variables or methods.

class Cow
  class << self
    attr_accessor :breeds_class_instance_var
    def all_breeds
      @breeds_class_instance_var ||= ["Holstein", "Hereford", "Brown Swiss"]
    end

    def sound
      puts "I have access to @breeds_class_instance_var #{@breeds_class_instance_var}"
      puts "I don't have access to @color #{@color}" 
     
      "Moo"
    end
  end

  attr_accessor :color
  def initialize
    @color = "brown"
  end

  def introduce
    puts "I don't have access to @breeds_class_instance_var #{@breeds_class_instance_var}" 
    puts "I am a #{self.class} and my color is #{@color}."
  end
end

my_cow = Cow.new
my_cow.color # => "brown"
Cow.breeds_class_instance_var # => nil
Cow.all_breeds # => ["Holstein", "Hereford", "Brown Swiss"]
my_cow.introduce # => "I don't have access to @breeds_class_instance_var" "I am a Cow and my color is brown."
Cow.sound # I have access to @breeds_class_instance_var ["Holstein", "Hereford", "Brown Swiss"],I don't have access to @color, # => "Moo"






# Another example of using eigenclass to add methods to a class:
# class Dog
#   def bark
#     "Woof!"
#   end
# end

# # Accessing the eigenclass of Dog
# eigenclass_of_dog = class << Dog; self; end

# # Adding a method to the eigenclass
# eigenclass_of_dog.class_eval do
#   def special_bark
#     "Woof! Woof!"
#   end
# end

# # Testing the new method
# puts Dog.special_bark # => "Woof! Woof!"

# # Checking the class hierarchy
# puts Dog.class # => Class
# puts Dog.superclass # => Object
# puts Dog.singleton_class # => #<Class:Dog>