#!/usr/bin/guile -s
!#
(define (make-point x y)
  (cons x y))
(define (x-point point)
  (car point))
(define (y-point point)
  (cdr point))

(define (make-segment point1 point2)
  (cons point1 point2))
(define (start-segment x)
  (car x))
(define (end-segment x)
  (cdr x))

(define (make-rectangle length width)
  (cons length width))
(define (len-rectangle rectangle)
  (car rectangle))
(define (wid-rectangle rectangle)
  (cdr rectangle))

;; this is the test function
(define (somewhat s m)
  (cons s m))

;; (define rectangle-sample
;;   (make-rectangle (make-segment (make-point 0 0)
;; 								(make-point 0 2))
;; 				  (make-segment (make-point 0 0)
;; 								(make-point 4 0))))

(begin
  ;; testcase 1
  (display (cons (cons (cons 0 0)
					   (cons 0 2))
				 (cons (cons 0 0)
					   (cons 4 0))))
  (newline)
  ;; testcase 2
  (display ((lambda (x y) (cons x y))
			((lambda (x y) (cons x y))
			 ((lambda (x y) (cons x y))
			  0 0)
			 ((lambda (x y) (cons x y))
			  0 2))
			((lambda (x y) (cons x y))
			 ((lambda (x y) (cons x y))
			  0 0)
			 ((lambda (x y) (cons x y))
			  4 0))))
  (newline)
  ;; testcase 3
  (display (somewhat (somewhat (somewhat 0 0)
							   (somewhat 0 2))
					 (somewhat (somewhat 0 0)
							   (somewhat 4 0))))
  (newline)
  ;; testcase 4  
  (display (make-rectangle (make-segment (make-point 0 0)
										 (make-point 0 2))
						   (make-segment (make-point 0 0)
										 (make-point 4 0))))
  (newline))
