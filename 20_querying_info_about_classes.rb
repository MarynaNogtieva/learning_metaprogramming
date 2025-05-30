module Mammals
end

class Animal  
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
lion.class # Lion
obj = lion.class # Lion
obj.name # "Lion"

Lion.ancestors.inspect # [Lion, Animal, Object, Kernel, BasicObject]
Lion.included_modules.inspect # [Mammals, Kernel, BasicObject]
Lion.singleton_class? # false
Lion.singleton_class.singleton_class? # true
Lion.include?(Mammals) # true

lion.instance_of?(Animal) # false
lion.instance_of?(Lion) # true 
lion.instance_of?(Mammals) # false


lion.is_a?(Animal) # true
lion.is_a?(Lion) # true 
lion.is_a?(Mammals) # true