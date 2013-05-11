;; SICP Practice: 2-29
(define (make-mobile left right)
  (list left right))
;;  (cons left right))
(define (make-branch length structure)
;;  (list length structure))
  (cons length structure))

(define (left-branch items)
  (car items))
(define (right-branch items)
  (cond ((list? items) (cadr items))
  	(else (cdr items))))
(define (branch-length items)
  (car items))
(define (branch-structure items)
  (cond ((list? items) (cadr items))
		(else (cdr items))))
(define (total-weight items)
  (+ (branch-structure (left-branch items))
	 (branch-structure (right-branch items))))
(define (balance? items)
  (if (= (* (branch-length (left-branch items))
			(branch-structure (left-branch items)))
		 (* (branch-length (right-branch items))
			(branch-structure (right-branch items))))
	  #t
	  #f))

(begin
  (define sample
	(make-mobile (make-branch 3 4)
				 (make-branch 2 6)))
  ;; b
  (display (total-weight sample))
  (newline)
  ;; c
  (display (balance? sample))
  (newline))
