#Compute triangle area using Heron's formula
def heron_area(edge_a, edge_b, edge_c):
    s = (edge_a + edge_b + edge_c) / 2
    area = (s*(s-edge_a)*(s-edge_b)*(s-edge_c)) ** 0.5
    return area

#Main program
is_correct = False

a = 0
b = 0
c = 0

while not is_correct:
    a = float(input('Enter first side: '))
    b = float(input('Enter second side: '))
    c = float(input('Enter third side: '))

    if a<=0 or b<=0 or c<=0:
        print("Values must be positive.")
    else:
        is_correct = True

area = heron_area(a, b, c)

print(f"The area of the triangle is {area}")

