#!/usr/bin/guile -s
!#
(begin
  (display (car (cons (cons (cons 1 2) (cons 3 4)) (cons (cons 7 8) (cons 9 6)))))
  (newline)
  (display (cdr (cons (cons (cons 1 2) (cons 3 4)) (cons (cons 7 8) (cons 9 6)))))
  (newline)
  (display (cons (cons (cons 1 2) (cons 3 4)) (cons (cons 7 8) (cons 9 6))))
  (newline))

;; new cons, car, cdr
(define (cons x y)
  (define (dispatch m)
	(cond ((= 0 m) x)
		  ((= 1 m) y)
		  (else (error "error"))))
  dispatch)
(define (car z)
  (z 0))
(define (cdr z)
  (z 1))

(begin
  (display (car (cons 1 2)))
  (newline))
