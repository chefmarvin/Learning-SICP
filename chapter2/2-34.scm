;; SICP Practice: 2-34
;; Thanks to huangz: http://sicp.readthedocs.org/en/latest/chp2/34.html
;; 累积器
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
	  (accumulate op initial (cdr sequence)))))

;; 多项式系数在序列 coefficient-sequence 中
(define (horner-eval x coefficient-sequence)    ;; 参数是 x 和系数列表
  ;; 操作是乘 x 加下一个系数
  (accumulate (lambda (this-coeff higher-terms)    ;; 2 个系数
		(+ this-coeff
		   (* x higher-terms)))
	      0
	      coefficient-sequence))

(begin
  ;; 结果应该是 79
  (display (horner-eval 2 '(1 3 0 5 0 1)))
  (newline))
