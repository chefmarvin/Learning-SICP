;; SICP Practice: 2-3
(define (make-point x y)
  (cons x y))
(define (x-point point)
  (car point))
(define (y-point point)
  (cdr point))

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
(define (make-rectangle length width)
  (cons length width))
(define (len-rectangle rectangle)
  (length (car rectangle)))
(define (wid-rectangle rectangle)
  (length (cdr rectangle)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 计算周长和面积的函数，接受矩形作为参数，返回周长或面积
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (area rectangle)
  (* (len-rectangle rectangle)
     (wid-rectangle rectangle)))
(define (perimeter rectangle)
  (* (+ (len-rectangle rectangle)
	(wid-rectangle rectangle))
     2))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 使用面积和周长函数进行计算
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(begin
  (define sample
    (make-rectangle (make-segment (make-point 0 0)
				  (make-point 0 3.46410161513748))
		    (make-segment (make-point 0 0)
				  (make-point 2 0))))
  (display (area sample))
  (newline)
  (display (perimeter sample))
  (newline))
