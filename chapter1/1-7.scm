;; 改进的牛顿法求平方根程序
(define (sqrt x)
  (define (good-enough? guess x)
	(define (square x)
	  (* x x))
	(< (abs (- (square guess) x)) 0.001))
  (define (improve guess x)
	(define (average x y)
	  (/ (+ x y) 2))
	(average guess (/ x guess)))
  (define (sqrt-iter guess x)
	(if (good-enough? guess x)
		guess
		(sqrt-iter (improve guess x) x)))
  (sqrt-iter 1.0 x))

(begin
  (define result (sqrt (read)))
  (display result)
  (newline)
  (display (* result result))
  (newline))
