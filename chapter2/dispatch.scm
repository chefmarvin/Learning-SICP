;; @author: Young Lee
;; @filename: dispatch.scm
;; @fileinfo:
(define signal "0x04")

;; '(message action)
(define action-table
  '(("0x01" (lambda (x) (+ x 2)))
	("0x02" (lambda (x) (- x 2)))
	("0x03" (lambda (x) (* x 2)))
	("0x04" (lambda (x) (/ x 2)))
	("0x05" (lambda (x) (* x x)))))

(define (disatch)
  ())

(begin
  (display ())
  (newline))
