a = [1, 2, 3, 4, 5, 6, 7, 8]
b = (1, 2, 3, 4, 5, 6, 7, 8)

print("a - This is a list: ", a)
print("b - This is a tuple: ", b)

print("--- This is a sublist of a:", a[0:4])
print("--- This is a subtuple of b:", b[4:7])

print("--- Is 10 contained in a? ", 10 in a)
print("--- Is 4 contained in a? ", 4 in a)

a[5] = 18
print("--- An element has been replaced in a: ", a)

c = a.pop(2)
print("--- The element", c , "has been removed from a: ", a)

a.append(12)
print("--- The element 12 has been appended to a: ", a)

a.remove(7)
print("--- The element", 7, " has been removed from a: ", a)

#Try to modify the tuple will generate an error...
b[5] = 18

