import sys

a = int(sys.argv[1])
b = int(sys.argv[2])
c = int(sys.argv[3])

s = (a + b + c ) / 2

area = (s*(s-a)*(s-b)*(s-c)) ** 0.5

print(f"The area of the triangle is {area}")

