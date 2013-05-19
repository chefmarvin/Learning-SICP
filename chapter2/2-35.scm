;; SICP Practice: 2-35
;; 累积器
(define (accumulate op initial sequence)
  (if (null? sequence)
	  initial
	  (op (car sequence)
		  (accumulate op initial (cdr sequence)))))

(define (count-leaves t)
  (accumulate +
			  0
			  (map (lambda (sub-tree)
					 (cond ((not (pair? sub-tree)) 1)
						   ((and (pair? sub-tree) (not (list? sub-tree))) 2)
						   (else (count-leaves sub-tree))))
				   t)))

(begin
  (display (count-leaves '(1 2 (3 7 0) 8 (3 . 4) 8 2)))
  (newline))
