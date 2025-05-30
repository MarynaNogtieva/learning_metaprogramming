
# Evrything is an object in Ruby
# Usually Ruby code is evaluated within the Object class 

class Object
  def my_main
	  def foo
		  "calling #foo method"
	  end
	  
	  puts foo
	  puts self # my_main #<Object:0x00000001318b3bc0>
		puts self.class # Object
	  
  end
end

Object.new.my_main


# Blocks are not objects but can be converted in the instances of the Proc class