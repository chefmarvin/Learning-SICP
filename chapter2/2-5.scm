;;; SICP Practice: 2-5
(define (exp a n)
  (define (exp-iter a n counter)
	(if (= counter 0)
		1
		(* a (exp-iter a n (- counter 1)))))
  (exp-iter a n n))

(define (cons x y)
  (lambda (m) (m x y)))
(define (car z)
  (z (lambda (p q) (exp 2 p))))
(define (cdr z)
  (z (lambda (p q) (exp 3 q))))

(begin
  (display (car (cons 2 3)))
  (newline)
  (display (cdr (cons 2 3)))
  (newline))
