;; 证明题
;; sqrt
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

;; fibonacci
(define (fib n)
  (define (fib-iter a b count)
	(if (= count 0)
		b
		(fib-iter (+ a b) a (- count 1))))
  (fib-iter 1 0 n))

;; theta
(define theta (/ (+ 1 (sqrt 5)) 2))
;; (begin
;;   (display theta)
;;   (newline))

;; n-times
(define (n-times x n)
  (if (= n 0)
	  1
	  (* x (n-times x (- n 1)))))

;; (begin
;;   (display (n-times 2 30))
;;   (newline))

(define (target n)
  (/ (n-times theta n) (sqrt 5)))

(begin
  (define param (read))
  (display (fib param))
  (newline)
  (display (target param))
  (newline)
  (display (abs (- (fib param) (target param))))
  (newline))
