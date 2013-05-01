(define a '(1 2 3 4))
(define (drop-last sample)
  (if (null? (cdr sample))
	  '()
	  (cons (car sample) (drop-last (cdr sample)))))
(begin
  (display (drop-last a))
  (newline))

