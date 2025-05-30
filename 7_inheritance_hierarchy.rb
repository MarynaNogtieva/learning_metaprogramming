# Inheritance hirarchy
class Parent
end

class Child < Parent
end

Child.superclass # Parent
Parent.superclass # Object
Object.superclass # BasicObject
BasicObject.superclass # nil

# All classes are inherrited from Object clss (String, Array)

module Foo
end

module Bar
end

module Meh
end

class MyClass
	include Foo
	include Bar
	extend Meh
end

MyClass.superclass # Objec
MyClass.ancestors # [MyClass, Bar, Foo, Object, Kernel, BasicObject]

# extend includes module into a classes eigenclass
mce = class << MyClass # change to the eigengclass and return the scope and assign
				self
		 end

mce.ancestors # [#<Class:MyClass>, Meh, #<Class:Object>, <Class:BasicObject>, Class, Module, Object, BasicObject]
MyClass.singleton_class.ancestors

module A
end

module B
	include A
end

B.ancestors # [:B, :A]