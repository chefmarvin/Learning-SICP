;; 证明题
;; sqrt
(define (sqrt x)
	(define (good-enough? guess x)
	  (< (abs (- ((lambda (x) (* x x))    ;; square
				  guess) x)) 0.001))
	(define (improve guess x)
	  ((lambda (a b) (/ (+ a b) 2.0))    ;; average
	   guess (/ x guess)))
	(define (sqrt-iter guess x)
	  (if (good-enough? guess x)
		  guess
		  (sqrt-iter (improve guess x) x)))
	(sqrt-iter 1.0 x))

;; fibonacci
(define (fib n)
  (define (fib-iter a b count)
	(if (= count 0)
		b
		(fib-iter (+ a b) a (- count 1))))
  (fib-iter 1 0 n))

(define (target n)
  ;; theta
  (define theta (/ (+ 1 (sqrt 5)) 2))
  ;; n-times
  (define (n-times x n)
	(define (n-iter x counter n)
	  (if (> counter n)
		  1
		  (* x (n-iter x (+ counter 1) n))))
	(n-iter x 1 n))
  (/ (n-times theta n) (sqrt 5)))

(begin
  (define param (read))
  (define fib-result 0)
  (define target-result 0)

  (set! fib-result (fib param))
  (set! target-result (target param))

  (display fib-result)
  (newline)
  (display target-result)
  (newline)
  (display (abs (- fib-result target-result)))
  (newline))
