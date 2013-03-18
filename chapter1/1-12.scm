;; 计算杨辉三角scheme树型递归版
(define (pascal line id)
  (if (or (= id 1) (= id line))
	  1
	  (+ (pascal (- line 1) id)
		 (pascal (- line 1) (- id 1)))))
(display (pascal (read) (read)))
