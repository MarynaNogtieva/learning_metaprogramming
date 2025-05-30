Class.superclass # -> Module

# [:subclasses, :descendants, :allocate, :class_attribute, :attached_object, :json_creatable?, :superclass, :new]
Class.instance_methods - Module.instance_methods # -> allocate, new, superclass 

module Abc
end

Abc.class # Module
Module.class # Class


