(define (A x y)
  (cond ((= y 0) 0)
	((= x 0) (* 2 y))
	((= y 1) 2)
	(else (A (- x 1)
		 (A x (- y 1))))))
;; 下列表达式的值
;; (A 1 10)
;; Value: 1024
;; (A 2 4)
;; Value: 65536
;; (A 3 3)
;; Value: 65536

;; 请考虑下面的过程，其中A就是上面定义的过程：
(define (f n) (A 0 n))
(define (g n) (A 1 n))
(define (h n) (A 2 n))
(define (k n) (* 5 n n))
;; 请给出过程f，g和h对给定整数值n所计算的函数的数学定义。例如，(k n)计算的是5n^2
;; 答案见1-10.org
