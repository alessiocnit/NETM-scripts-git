a = "my string"
b = 'another way to define strings'
c = "a string 'within' a string"
d = 'another way to define a string "within" a string'
e = "this character \" escapes"
f = "use \\ to represent a backslash in a string" 

s = a + " is " + d

print("1 - ", a)
print("2 - ", b)
print("3 - ", c)
print("4 - ", d)
print("5 - ", e)
print("6 - ", f)
print("7 - ", s)

#Find a substring 
print("--- Is the word 'define' present in string 2?", b.find("define"))
print("--- Is the word 'network' present in string 2?", b.find("network"))
