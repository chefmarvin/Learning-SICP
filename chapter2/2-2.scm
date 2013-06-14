;; 线段的表示
;; 构造函数
(define (make-segment point1 point2)
  (cons point1 point2))
(define (make-point x y)
  (cons x y))
;; 选择函数
(define (start-segment x)
  (car x))
(define (end-segment x)
  (cdr x))
(define (x-point point)
  (car point))
(define (y-point point)
  (cdr point))
(define (midpoint-segment segment)
  (cons
   (/ (+ (x-point (start-segment segment))
	 (x-point (end-segment segment)))
      2)
   (/ (+ (y-point (start-segment segment))
	 (y-point (end-segment segment)))
      2)))

(define point-A
  (make-segment (make-point 3 5)
		(make-point 17 -1)))
(begin
  (display (midpoint-segment point-A))
  (newline))
