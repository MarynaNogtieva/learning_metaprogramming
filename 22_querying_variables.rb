$global_variable = "I am a global variable"
TOP_LEVEL_CONSTANT = "I am a top-level constant"  



class Animal  
  @@parent_class_variable = "I am a class variable in Animal class"
  PARENT_CONSTANT = "I am a constant in Animal class"
  @parent_singletonclass_instance_variable = "I am a singleton class instance variable in Animal class"

end

module Mammals
  def mammal_module_method
    "This is a method from the Mammals module"
  end
end

class Lion < Animal
  @@child_class_variable = "I am a class variable in Lion class"
  CHILD_CONSTANT = "I am a constant in Lion class"
  @child_singletonclass_instance_variable = "I am a singleton class instance variable in Lion class"

  class << self
    @class_instance_variable_in_eigenclass = "I am a class instance variable in Lion's eigenclass"
  end

  def initialize
    @child_instance_variable = "I am an instance variable in Lion class"
  end

  class InnerClass
  end
end




obj = Lion.new

obj.instance_variables #  [:@child_instance_variable]
obj.instance_variable_defined?(:@child_instance_variable) # true
Animal.instance_variables # [:@parent_singletonclass_instance_variable]
Lion.instance_variables # [:@child_singletonclass_instance_variable]

Animal.class_variables # [:@@parent_class_variable]
Lion.class_variables # [:@@parent_class_variable, :@@child_class_variable]
Animal.class_variable_defined?(:@@parent_class_variable) # true
Lion.class_variable_defined?(:@@parent_class_variable) # true
Lion.class_variable_defined?(:@@child_class_variable) # true

global_variables
local_variables #  [:obj, :_]

Lion.constants # [:CHILD_CONSTANT, :InnerClass, :PARENT_CONSTANT]

obj.instance_variable_get(:@child_instance_variable) # "I am an instance variable in Lion class"
obj.instance_variable_set(:@new_instance_variable, "I am a new instance variable") # "I am a new instance variable"
obj.instance_variable_get(:@new_instance_variable) # "I am a new instance variable"

Lion.class_variable_get(:@@parent_class_variable) # "I am a class variable in Animal class"
Lion.class_variable_set(:@@new_class_variable, "I am a new class variable") # "I am a new class variable"
Lion.class_variable_get(:@@new_class_variable) # "I am a new class variable"

Lion.const_get(:CHILD_CONSTANT) # "I am a constant in Lion class"
Lion.const_set(:NEW_CONSTANT, "I am a new constant") # "I am a new constant"
Lion.const_get(:NEW_CONSTANT) # "I am a new constant"

# Accessing singleton class instance variables
Lion.singleton_class.instance_variable_get(:@class_instance_variable_in_eigenclass) # "I am a class instance variable in Lion's eigenclass"

