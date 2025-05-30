# Scope changes occur with othe 3 keywords in Ruby: `class`, `module`, and `def`.
# Module and classes share the same scope for instance methods, but they have different scopes for class methods and class instance variables.



module MyModule
  puts self # MyModule

  @my_module_instance_var = "Instance variable in MyModule scope"

  def module_instance_method
    @instance_var = "@instance_var set in module"
  end

  def self.my_module_class_method
      [@class_instance_var, @my_module_instance_var]
  end
end

class MyClass
  
  include MyModule

  puts self # MyClass

  @class_instance_var = "Instnace variable in MyClass scope"


  def initialize
     @instance_var = "@instance_var set in MyClass initializer"
  end

  def self.my_class_method
    puts self # MyClass
    [@class_instance_var, @module_instance_var]
  end

end
obj = MyClass.new  # #<MyClass:0x0000000121fbc8c8 @instance_var="@instance_var set in MyClass initializer">
obj.module_instance_method # "@instance_var set in module"
MyClass.my_class_method # ["Instnace variable in MyClass scope", nil]
MyModule.my_module_class_method # [nil, "Instance variable in MyModule scope"] 
obj.instance_variable_get(:@instance_var) # => "@instance_var set in module"

# A lot of metaprogramming in Ruby is about changing the scope of the code that is being executed.