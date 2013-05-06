;; 最小元的判断
(define (atom-list? items)
  (if (not (list? items))
	  (error "Parameter is not a list" items)
	  (if (null? items)
		  #t
		  (if (list? (car items))
			  #f
			  (atom-list? (cdr items))))))

(begin
  (display (atom-list? '(1 (1 2))))
  (newline)
  (display (atom-list? (cons 1 2)))
  (newline))
