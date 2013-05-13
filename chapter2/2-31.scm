;; SICP Practice: 2-31
(define (square-tree tree)
  (tree-map square tree))

(define (tree-map action tree)
  (map (lambda (sub-tree)
		 (if (pair? sub-tree)
			 (tree-map action sub-tree)
			 (action sub-tree)))
	   tree))

(define (square x)
  (* x x))

(begin
  (define sample (list 1
					   (list 2 (list 3 4) 5)
					   (list 6 7)))
  (display (square-tree sample))
  (newline))
