
is_correct = False

a = 0
b = 0
c = 0

while not is_correct:
    a = float(input('Enter first side: '))
    b = float(input('Enter second side: '))
    c = float(input('Enter third side: '))

    if a <= 0 or b <= 0 or c <= 0:
        print("Values must be positive.")
    else:
        is_correct = True

s = (a + b + c) / 2

area = (s*(s-a)*(s-b)*(s-c)) ** 0.5

print(f"The area of the triangle is {area}")
