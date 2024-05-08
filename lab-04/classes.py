class Example:
	c_var = 40

	def __init__(self, value=0):
		self.var = value

	def sum(self, value):
		return self.var + value

#Main program

ex1 = Example()
ex2 = Example(10)

print("ex1.var:", ex1.var)
print("ex1.c_var:", ex1.c_var)
print("ex2.var:", ex2.var)
print("ex2.c_var:", ex2.c_var)
print("Example.var:", Example.c_var)

print("ex1.var + 18:", ex1.sum(18));
print("ex2.var + 18:", ex2.sum(18));

