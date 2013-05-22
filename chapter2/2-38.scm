;; SICP Practice: 2-38
(define (fold-right op initial sequence)
  (if (null? sequence)
	  initial
	  (op (car sequence)
		  (fold-right op initial (cdr sequence)))))

(define (fold-left op initial sequence)
  (define (iter result rest)
	(if (null? result)
		result
		(iter (op result (car rest))
			  (cdr rest))))
  (iter initial sequence))

(begin
  (display (fold-right / 1 (list 1 2 3)))
  (newline)
  (display (fold-left / 1 (list 1 2 3)))
  (newline)
  (display (fold-right list '() (list 1 2 3)))
  (newline)
  (display (fold-left list '() (list 1 2 3)))
  (newline))
