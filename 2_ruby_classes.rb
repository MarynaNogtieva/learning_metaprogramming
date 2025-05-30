# Class definitions are runnable code

# - There’s no class definition like in Java
# - In Ruby it’s just an ordinary code
#     - class definition in Ruby is just ordinary Ruby code. There is nothing special about them. Only difference is that `class` construct is changing the current scope (the value of `self`)
3.class => Integer
3.class.class => Class
3.class.class.class => Class
3.class.superclass=> Numeric 




$GLOBAL_VAR_BOOL = false
class TestClass
  puts "The code running in class"
  puts self # TestClass
  # puts abc # `<class:TestClass>': undefined local variable or method `abc' for class TestClass (NameError)
  2.times { puts "Hello!" }
  
  def my_special_method
     puts "in a #special_method"
  end if $GLOBAL_VAR_BOOL #(defined or not depeds on the bool var)
end
# => The code running in class
# => Hello!
# => Hello!
# TestClass.my_special_method
#  undefined method `my_special_method' for class TestClass (NoMethodError)

# class definition in Ruby is just ordinary Ruby code that runs top to bottom.
#  There is nothing special about them. Only difference is that class construct is changing the current scope (the value of self)

# Classes are objects too

# wrapbook(dev)> self
# => main
# wrapbook(dev)> self.class
# => Object



# Open classes
class Array
  def am_i_reversed?
    puts "now you are"
    reverse
  
  end
end

# [1,2,3].am_i_reversed?
# now you are
# => [3, 2, 1]

# Open classes are classes that can be modified at runtime.
# In Ruby, all classes are open classes, which means you can add methods to them at any time.

