# When you use object.some_method, Ruby looks for that method in the following order:
# 1. The object's singleton class (if it has one)
# 2. The object's class
# 3. The included modules in reverse order
# 4. The class'' superclass
# 5. The included modules in the superclass in reverse order
# 6. The `Object` class
# 7. The `Kernel` module
# 8. The `BasicObject` class

# This is known as the method lookup path, and it determines how Ruby finds methods when you call them on an object.
# 
# You can check the method lookup path for any object using the `ancestors` method:
module M
   def greet
      puts "Hello from module M"
   end
end
module M2
  def greet2
    puts "Hello from module M2"
  end
end

class A
  include M
  include M2
  def greet
    puts "Hello from class A"
  end
end

class B < A
end

obj = B.new
puts obj.greet # Hello from class A

def obj.greet
  puts "Hello from object"
end

puts obj.greet # Hello from object

# The method lookup path for `obj` is:
puts obj.class.ancestors.inspect
# Output: [B, A, M2, M, .., Object, Kernel, BasicObject]


class Test
  include M
  prepend M2
  def greet
    puts "Hello from class A"
  end
end
obj = Test.new
#  obj.class.ancestors.inspect
# Output: [M2, Test, M, Object, Kernel, BasicObject]
