;; SICP Practice: 2-23
(define (foreach action object)
  (if (not (null? object))
	  (begin (action (car object))
			 (foreach action (cdr object)))
	  0))

(begin
  (display (foreach (lambda (x) (newline) (display x))
					 (list 57 321 78)))
  (newline))
