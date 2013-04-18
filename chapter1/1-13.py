# -*- coding:utf-8 -*-
## 求证 Fib(n) = φ^n - γ^n / (sqrt(5))
## φ = (1 + sqrt(5)) / 2
import sys
import math

def fib(n):
	domain = [0, 1, 1]
	if n > 2:
		for x in range(3, n + 1):
			domain.append(domain[x - 1] + domain[x - 2])
	return domain[n]

def target(n):
	phi = (1 + math.sqrt(5)) / 2
	result = (phi ** n) / (math.sqrt(5))
	return result

if __name__ == '__main__':
	## param = int(sys.argv[1])
	param = int(raw_input())
	fib_result = fib(param)
	target_result = target(param)
	print fib_result
	print target_result
	print abs(fib_result - target_result)
