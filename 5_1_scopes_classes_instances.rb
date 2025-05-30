# Scope changes occur with othe 3 keywords in Ruby: `class`, `module`, and `def`.
class Lion

  puts self # Lion

  @my_class_instance_var = "Instance variable in Lion class scope"

  class << self
    # entering the singleton class of Lion
    puts self # #<Class:Lion>

    def my_another_class_method
      # scope has changed to the instance of the singleton class
      # the instace of <Class:Lion> is Lion
      puts self # Lion
      
      my_class_method # calling the class method, because self is the same in my_class_method (Lion)
      # Can't call instance method from class method, you need to get a ref to the instance first
      my_instance_method # => undefined method `my_instance_method' for Lion:Class (NoMethodError)
    end

  end

  def self.my_class_method
     # scope has changed to the instance of the singleton class
      # the instace of <Class:Lion> is Lion
      puts self # Lion
      puts @my_class_instance_var # => "Instance variable in Lion class scope"
      puts @my_instance_var # => nil
    
  end

  def initialize
    @my_instance_var = "Instance variable in Lion instance scope"
  end

  def my_instance_method
    # scope has changed to the instance of the Lion class
    puts self # #<Lion:0x000000012fbd7718>
    puts @my_class_instance_var # => nil
    puts @my_instance_var # => "Instance variable in Lion instance scope" 
  end

 def my_instance_method2
    # can call instance method from instance method because they have the same scope (self is #<Lion:0x000000012fbd7718>)
    my_instance_method 


    # This will not work because self is now the instance of the Lion class, not the singleton class
    # you need to call the class methodd explicitly Lion.my_class_method or self.class.my_class_method
    my_class_method # => undefined method `my_class_method' for #<Lion:0x000000012fbd7718> (NoMethodError)

  end 
 end
end


# A lot of metaprogramming in Ruby is about changing the scope of the code that is being executed.