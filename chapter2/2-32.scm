;; SICP Practice: 2-32
(define (subsets s)
  (if (null? s)
	  (list '())
	  (let ((rest (subsets (cdr s))))
		(append rest (map (lambda () ())
						  rest)))))

(begin
  (display (subsets '(1 2 3)))
  (newline))
