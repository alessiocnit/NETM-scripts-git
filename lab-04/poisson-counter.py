import random
import math

_lambda = 2
_num_total_arrivals = 1000
_num_arrivals = 0
_arrival_time = 0
_num_arrivals_in_unit_time = []
_time_tick = 10
_time_threshold = _time_tick

print('EVENT ID - RANDOM_N - INTER_ARRIVAL_TIME - EVENT_ARRIVAL_TIME')

for i in range(_num_total_arrivals):
	#Get the next probability value from Uniform(0,1)
	p = random.random()

	#Plug it into the inverse of the CDF of Exponential(_lamnbda)
	_inter_arrival_time = -math.log(1.0 - p)/_lambda

	#Add the inter-arrival time to the running sum
	_arrival_time = _arrival_time + _inter_arrival_time

	#Increment the number of arrival per unit time
	_num_arrivals = _num_arrivals + 1

	if _arrival_time > _time_threshold:
		_num_arrivals_in_unit_time.append(_num_arrivals)
		_num_arrivals = 0
		_time_threshold = _time_threshold + _time_tick

	#print it all out
	index = str("{0:0=2d}".format(i))
	pstr = str("{:.4f}".format(p))
	istr = str("{:.4f}".format(_inter_arrival_time))
	astr = str("{:.4f}".format(_arrival_time))

	print(index + ' ------- ' + pstr + ' --- ' + istr + ' ------------- ' + astr)

print('\nNumber of arrivals in successive unit length intervals of', _time_tick, 'seconds ===>')
print(_num_arrivals_in_unit_time)

print('\nMean arrival rate for sample (theoretical): ', _time_tick * _lambda)
print('\nMean arrival rate for sample (statistical): ', str(sum(_num_arrivals_in_unit_time)/len(_num_arrivals_in_unit_time)))

