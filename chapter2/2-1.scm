#!/usr/bin/guile -s
!#
;; 有理数的加减乘除和判等
;; 构造序对
(define (make-rat n d)
  (define (gcd x y)
	(if (= y 0)
		x
		(gcd y (remainder x y))))
  (define (check a b)
	(if (= b 0)
		(error "0 can't be a dividend.")
		(cond ((and (positive? a) (positive? b)) (cons a b))
		  ((and (positive? a) (negative? b)) (cons (- a) (- b)))
		  ((and (negative? a) (positive? b)) (cons a b))
		  (else (cons a b)))))
  (let ((g (gcd n d)))
	(check (/ n g) (/ d g))))
;; 解析序对
(define (numer x)
  (car x))
;; 解析序对
(define (denom x)
  (cdr x))
;; 打印序对
(define (print-rat x)
  (display (numer x))
  (display "/")
  (display (denom x))
  (newline))
;; 有理数加
(define (add-rat x y)
  (make-rat (+ (* (numer x) (denom y))
			   (* (numer y) (denom x)))
			(* (denom x) (denom y))))
;; 有理数减
(define (sub-rat x y)
  (make-rat (- (* (numer x) (denom y))
			   (* (numer y) (denom x)))
			(* (denom x) (denom y))))
;; 有理数乘
(define (mul-rat x y)
  (make-rat (* (numer x) (numer y))
			(* (denom x) (denom y))))
;; 有理数除
(define (div-rat x y)
  (make-rat (* (numer x) (denom y))
			(* (denom x) (numer y))))
;; 有理数判等
(define (equal-rat? x y)
  (= (* (numer x) (denom y))
	 (* (numer y) (denom x))))
;;定义一个有理数
;; 1/2
(define one-half
  (make-rat -1 2))
;; 1/3
(define one-third
  (make-rat 1 3))
;; 2/4
(define another-one-half
  (make-rat 2 4))

(begin
  (print-rat one-half)
  (print-rat (add-rat one-half one-third))
  (print-rat (mul-rat one-half one-third))
  (print-rat (add-rat one-third one-third))
  ;; (print-rat (make-rat 2 0))
  ;; (print-rat (make-rat -2 0))
  (print-rat (make-rat 0 -2))
  (print-rat (make-rat 0 2))
  (if (equal-rat? one-half another-one-half)
	  (display "equal\n")
	  (display "not equal\n")))
