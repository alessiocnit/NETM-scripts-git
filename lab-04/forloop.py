def gauss_sum(n):
	return n*(n+1)/2

#Main program

results = []

#Cycle using range
for i in range(0,5):
	results.append(gauss_sum(i)) 

print("--- Gauss sum of first 5 integers:", results)

#Cycling without indexing
for value in results:
	print("--> Gauss sum of:", value, "to the power of 2: ", value*value)

#Cycling with enumerate
print("--- This way count is a tuple:")
for count in enumerate(results):
        print(count)

#Cycling with enumerate
print("--- This way count is the index:")
for count, value in enumerate(results):
	print(count)

#Cycling with enumerate
for count, value in enumerate(results):
	print("--# Gauss sum of:", results[count], "to the power of 2: ", value*value)


