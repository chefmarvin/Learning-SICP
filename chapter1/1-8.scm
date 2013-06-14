;; 求立方根
(define (cubic-root x)
  (cubic-iter 1.0 x))
(define (cubic-iter guess x)
  (if (good-enough? guess x)
      guess
      (cubic-iter (improve guess x) x)))
(define (good-enough? guess x)
  (< (abs (- (* guess guess guess) x)) 0.001))
;; 由上一个guess得到更好的guess
(define (improve guess x)
  (/ (+ (* 2 guess) (/ x (* guess guess))) 3))
(begin
  (display (cubic-root (read)))
  (newline))
