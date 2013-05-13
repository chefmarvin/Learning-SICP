;; SICP Practice: 2-30
;; square-tree use car and cdr
(define (square-tree items)
  (cond ((null? items) '())
		((not (pair? items)) ((lambda (x) (* x x)) items))
		(else (cons (square-tree (car items))
					(square-tree (cdr items))))))

(begin
  (define sample (list 1
					   (list 2 (list 3 4) 5)
					   (list 6 7)))
  (display (square-tree sample))
  (newline))
