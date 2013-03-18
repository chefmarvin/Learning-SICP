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
  (f-iter 0 n))
(define (f-iter start n)
  (cond ((< n 3) n)
		(() )
		(+ (f-iter (- start 1) n)
		   (* 2 (f-iter (- start 2) n))
		   (* 3 (f-iter (- start 3) n))))

;;  (if (< n 3)
;;	  n
;;	  (+ (f-iter )
;;		 (* 2 (f-iter ))
;;		 (* 3 (f-iter )))))
(begin
  (display (f (read)))
  (newline))
