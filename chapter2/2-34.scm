;; SICP Practice: 2-34
;; 累积器
(define (accumulate op initial sequence)
  (if (null? sequence)
	  initial
	  (op (car sequence)
		  (accumulate op initial (cdr sequence)))))

(define (horner-eval x coefficient-sequence)
  (accumulate (lambda (this-coeff higher-terms) <??>)
			  0
			  coefficient-sequence))

(begin
  (display ())
  (newline))
