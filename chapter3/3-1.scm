;; SICP Practice: 3-1
(define (make-accumulator base)
  (lambda (num)
	(set! base (+ base num))
	base))

(define A (make-accumulator 5))

(begin
  (display (A 10))
  (newline)
  (display (A 10))
  (newline))
