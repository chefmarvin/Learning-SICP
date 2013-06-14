;; SICP Practice: 2-28
(define (fringe items)
  (if (not (null? items))
      (if (not (pair? items))
	  (append (list items))
	  (append (fringe (car items))
		  (fringe (cdr items))))
      (append '())))

(begin
  (define x (list (list 1 2) (list 3 4)))
  (display (fringe x))
  (newline)
  (display (fringe (list x x)))
  (newline))
