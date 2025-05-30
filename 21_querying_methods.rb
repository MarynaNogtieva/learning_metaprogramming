module Mammals
  def mammal_module_method
    "This is a method from the Mammals module"
  end
end

class Animal  
  def animal_method
    "This is an animal method"
  end
end

class Lion < Animal
  include Mammals
  
  def roar
    "Roar!"
  end
end

class Tiger < Animal
  include Mammals
end


lion = Lion.new
def lion.singleton_method
  "this is a singleton method"
end

lion.methods - Object.methods # [:singleton_method, :roar, :mammal_module_method, :animal_method]
lion.methods(false) # [:singleton_method]
lion.singleton_methods # [:singleton_method]
Lion.instance_methods #  "[:roar, :mammal_module_method, :animal_method,...:==, :!=, :instance_eval, :instance_exec, :__id__"
Lion.instance_methods(false) # [:roar]
Lion.method_defined?(:roar) # true
Lion.method_defined?(:animal_method) # true
Lion.method_defined?(:mammal_module_method) # true

lion.respond_to?(:roar) # true
lion.respond_to?(:mammal_module_method) # true
lion.respond_to?(:meow) # false
lion.singleton_class.instance_methods(false) # [:singleton_method]
