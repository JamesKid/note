# Define and invoke function.
def sum(a,b):
	return a+b

func = sum 
r = func(5,6)
print r 


# Defines function with default arument
def add(a,b=2):
	return a+b 
r=add(1)
print r 
r=add(1,5)
print r
