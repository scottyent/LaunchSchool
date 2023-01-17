#18— What are some of the characteristics of instance variables?

# They are meant to be defined and hold the state inside an object, and cannot
# be accessed from oustide of that object.

# There needs to be a way to access them, with setters or getters either by shortcut
# (attr_accessor) or by defining a full getter or setter method.

# You need to use self. or @ in order to reference an instance variable when setting
# it to a new value.

# Instance variable values are not inheritable and are individual for each
# instance of the object. Each gets their own copy initialized from the class.

# Instane variables are scoped to the object, and available to all methods
# within the class. This prevents us from having to pass in instance variables
# and can instead just directly reference them.

# You do not need to initialize an instance variable, if you attempt to call one
# and it is not initialized, it will just return nil

