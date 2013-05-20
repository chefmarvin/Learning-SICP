;; SICP Practice: 2-34
;; 注意自底向上的设计
;; 累积器
(define (accumulate op initial sequence)
  (if (null? sequence)
	  initial
	  (op (car sequence)
		  (accumulate op initial (cdr sequence)))))

;; 过滤器
(define (filter predicate sequence)
  (cond ((null? sequence) '())
		((predicate (car sequence))
		 (cons (car sequence)
			   (filter predicate (cdr sequence))))
		(else (filter predicate (cdr sequence)))))

;; 多项式系数在序列 coefficient-sequence 中
(define (horner-eval x coefficient-sequence)    ;; 参数是 x 和系数列表
  ;; 操作是乘 x 加下一个系数
  (accumulate (lambda (this-coeff higher-terms)    ;; 2 个系数
				(+ (* this-coeff x)
				   (filter ()
						   coefficient-sequence)))
			  0
			  coefficient-sequence))

(begin
  ;; 结果应该是 79
  (display (horner-eval 2 '(1 3 0 5 0 1)))
  (newline))
