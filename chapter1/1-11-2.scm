;; 迭代计算f(x)
;; 0 => 0
;; 1 => 1
;; 2 => 2
;; 3 => 4 = 2 + 2 * 1 = 2 + 2
;; 4 => 11 = 4 + 2 * 2 + 3 * 1 = 4 + 4 + 3
;; 5 => 25 = 11 + 2 * 4 + 3 * 2 = 11 + 8 + 6
;; 6 => 59 = 25 + 2 * 11 + 3 * 4 = 25 + 22 + 12
;; ...
(define (f n)
  (define (f-iter target num3 num2 num1 counter)
	(if (< target 3)
		target
		(if (= counter target)
			(+ num1 (* 2 num2) (* 3 num3))
			(f-iter target num2 num1 (+ num1 (* 2 num2) (* 3 num3)) (+ counter 1)))))
  (f-iter n 0 1 2 3))
(begin
  (display (f (read)))
  (newline))
