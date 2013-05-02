;; SICP Practice: 2-21
;; method #1
(define (square-list-1 items)
  (map (lambda (x) (* x x)) items))
;; method #2
(define (square-list-2 items)
  (if (null? items)
	  '()
	  (cons ((lambda (x) (* x x)) (car items)) (square-list-2 (cdr items)))))

(begin
  (display (square-list-1 (list 1 2 3 4)))
  (newline)
  (display (square-list-2 (list 1 2 3 4)))
  (newline))
