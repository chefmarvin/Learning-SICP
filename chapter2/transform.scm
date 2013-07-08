;; transform.scm
(define (transform statement)
  (let ((operater (car statement))
	(head (cadr statement))
	(tail (cddr statement)))
    (map (lambda (x)
	   (cond ((symbol? x) x)
		 ((number? x) x)
		 (else (append (list operater) x))))
	 statement)))

(define sample-1
  '(+ 1 (* 3 4 (+ 2 3 4 5)) 3))
(define sample-2
  '(+ 1 3))
(define sample-3
  '(+ 1 2 3))
(define sample-4
  '(+ 1 (+ 2 3)))
(define sample-5
  '(+ 1 (+ 2 3) (* 3 4)))

(begin
  (display (transform sample-1))
  (newline)
  (display (transform sample-2))
  (newline)
  (display (transform sample-3))
  (newline)
  (display (transform sample-4))
  (newline)
  (display (transform sample-5))
  (newline))
