;; inc，dec定义不准确
;; inc把参数减1的值赋给参数
;; dec把参数加1的值赋给参数

;; a减到0为止
;; (+ 3 4)
;; ()
(define (+ a b)
  (if (= a 0)
	  b
	  (inc (+ (dec a) b))))
;; a减到0为止
;; (+ 3 4)
;; (+ 2 5)
;; (+ 1 6)
;; (+ 0 7)
(define (+ a b)
  (if (= a 0)
	  b
	  (+ (dec a) (inc b))))
