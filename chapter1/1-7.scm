;; 改进的牛顿法求平方根程序
(define (sqrt x)
  (define delta 0)
  ;; 猜测值的变化率小于一个阈值时
  (define (good-enough? guess x)
    (define (square x)
      (* x x))
    (< (abs (/ delta guess)) 0.00001))
  (define (improve guess x)
    (define (average x y)
      (/ (+ x y) 2))
    (average guess (/ x guess)))
  (define (sqrt-iter guess x)
    (define tmp (improve guess x))
    (set! delta (abs (- tmp guess)))
    (if (good-enough? guess x)
	guess
	(sqrt-iter tmp x)))
  (sqrt-iter 1.0 x))

(begin
  (define result (sqrt (read)))
  (display result)
  (newline)
  (display (* result result))
  (newline))
