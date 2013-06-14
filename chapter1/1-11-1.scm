;; 递归计算f(x)
(define (f n)
  (if (< n 3)
      n
      (+ (f (- n 1))
	 (* 2 (f (- n 2)))
	 (* 3 (f (- n 3))))))
(begin
  (display (f (read)))
  (newline))
