;; SICP Practice: 3-2
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
		guess
		(sqrt-iter (improve guess x) x)))
  (sqrt-iter 1.0 x))

(define (make-monitored foo)
  (define times 0)
  (define foo-marker
	(lambda ()
	  (set! times (+ times 1))
	  foo))
  (define (dispatch m)
	(cond ((eq? m 'how-many-calls?) times)
		  (else ((foo-marker) m))))
  dispatch)

(define s (make-monitored sqrt))

(begin
  (display (s 'how-many-calls?))
  (newline)
  (display (s 100))
  (newline)
  (display (s 'how-many-calls?))
  (newline)
  (display (s 9))
  (newline)
  (display (s 'how-many-calls?))
  (newline))
