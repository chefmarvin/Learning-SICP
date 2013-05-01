#!/usr/bin/guile -s
!#
;;; SICP Practice: 2-6
(define zero
  (lambda (f)
	(lambda (x) x)))

(define (add-1 n)
  (lambda (f)
	(lambda (x) (f ((n f) x)))))

(define one
  (lambda (f)
	(lambda (f) ())))

(define two
  (lambda (f) ()))

(define +
  (lambda (f) ()))

(begin
  (display ((lambda (x) (* x x)) 2))
  (newline))
