;; 用new-if改写平方根程序
(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
		(else else-clause)))

(define (sqrt x)
  (define (good-enough? guess x)
	(< (abs (- ((lambda (x) (* x x))
				guess) x)) 0.001))
  (define (improve guess x)
	(define (average x y)
	  (/ (+ x y) 2))
	(average guess (/ x guess)))
  (define (sqrt-iter guess x)
	(if (good-enough? guess x)
;;	(new-if (good-enough? guess x)
		guess
		(sqrt-iter (improve guess x) x)))

  (sqrt-iter 1.0 x))
(begin
  (display (sqrt (read)))
  (newline))

;; 不能求解的原因
;; 新定义的new-if需要应用序求值，所以每个条件分支都要进行apply
