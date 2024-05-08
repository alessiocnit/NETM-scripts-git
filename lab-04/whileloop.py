def gauss_sum(n):
	return n*(n+1)/2

#Main program

results = []

i = 0

#Cycle using range
while i<=5:
	results.append(gauss_sum(i))
	print("--- Gauss sum of", i, "is:", gauss_sum(i)) 
	i += 1

print("--- Gauss sum of first 5 integers:", results)

#An infinite while loop, exiting with "break"
while True:
	print("--> Inside the infinite while loop... !")
	i += 1
	if i == 50:
		print("Exiting cycle using BREAK after 50 iterations")
		break

#Cycle with continue
while i <= 100:
	i += 1
	if i == 97:
		print("---> I'm not printing 97")
		continue
	print("---> Printing:", i)


