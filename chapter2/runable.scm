#!/usr/bin/guile -s
!#
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 矩形的表示
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (make-point x y)
  (cons x y))
(define (x-point point)
  (car point))
(define (y-point point)
  (cdr point))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 构造线段用到点的选择函数
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (make-segment point1 point2)
  (cons point1 point2))
(define (start-segment x)
  (car x))
(define (end-segment x)
  (cdr x))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 计算线段的长需要线段的选择函数和点的选择函数
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (length segment)
  (define (square x)
	(* x x))
  (define (sqrt x)
	(define (good-enough? guess x)
	  (< (abs (- ((lambda (x) (* x x))
				  guess) x)) 0.001))
	(define (improve guess x)
	  ((lambda (a b) (/ (+ a b) 2.0))
	   guess (/ x guess)))
	(define (sqrt-iter guess x)
	  (if (good-enough? guess x)
		  guess
		  (sqrt-iter (improve guess x) x)))
	(sqrt-iter 1.0 x))
  (sqrt (+ (square (- (x-point (start-segment segment))
					  (x-point (end-segment segment))))
		   (square (- (y-point (start-segment segment))
					  (y-point (end-segment segment)))))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 构造矩形需要线段和点的构造函数和选择函数
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (make-rectangle x1 y1 x2 y2 x3 y3 x4 y4)
  (let ((gou (length (make-segment (make-point x1 y1)
								   (make-point x2 y2))))
		(gu (length (make-segment (make-point x1 x2)
								  (make-point x3 y3))))
		(xuan (length (make-segment (make-point x1 x2)
									(make-point x4 y4)))))
	(cond ((= gou (max gou gu xuan)) (cons gu xuan))
		  ((= gu (max gou gu xuan)) (cons gou xuan))
		  (else (cons gou gu)))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 计算周长和面积的函数，接受矩形作为参数，返回周长或面积
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (area rectangle)
  (* (car rectangle)
	 (cdr rectangle)))
(define (perimeter rectangle)
  (* (+ (car rectangle) (cdr rectangle))
	 2))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 使用面积和周长函数进行计算
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(begin
  (display (area (make-rectangle 0 0 0 2 4 2 4 0)))
  (newline)
  (display (perimeter (make-rectangle 0 0 0 2 4 2 4 0)))
  (newline))
