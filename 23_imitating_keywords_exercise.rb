
# Examples: lambda puts require gem raise attr_reader validates
# Can be done in 2 ways

# - Add a method to Kernel module
# - Define top level method

# top level

def string?(obj)
  obj.class == String
end

string?("abc")

class MyClass
  string? "foo"
  
	  def is_string?
	    string? "foo"
	  end
	  
end

MyClass.new.foo

module Kernel
  def foo(arg)
    "Kernel#foo(arg)"
  end
end


class MyClass
  
	  def call_foo
	    foo(32)
	  end
	  
end


local_var = %i[sleep eat_bamboo play]

# Define class
Panda = Class.new do
	local_var.each do |method_name|
		attr_accessor method_name
	end
end

# [:play=, :sleep, :sleep=, :eat_bamboo=, :eat_bamboo, :play]
Panda.instance_methods(false)

fox_methods = [:hunt, :sleep, :eat, :play]
Fox = Class.new do
	# can you spot what's wrong here?
	# Fox.instance_methods(false) 
	fox_methods.each do |var|
		def var
			instance_variable_get(:"@#{var}")
		end
	end
end


# Define methods

# - `def`
# - `define_method`
# - `define_singleton_method`
# - `MyClass.define_singleton_method`

# instance methods
Fox.define_method(:foobar) {}

# Singleton methods

class << Fox
   puts self.class # Class
   # Fox is an instance of a Class, so we can use instance methods on the 
   # eigen class
   
   define_method :nom_nom do |arg_food|
		 "Fox eats #{arg_food}"
	 end
  end
end



TODO:
# 1. Define own `my_attribute_reader` 
class Dog < Animal
	my_attribute_reader :name, :age

end



# 2. make simplified methods for `validates` , `belongs_to`

class Dog < MyApplicationRecord
	belongs_to :owner
end

